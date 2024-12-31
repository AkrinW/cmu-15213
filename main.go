package main

import (
	"fmt"
	"io"
	"net/http"
	"os"
	"path"
	"strings"

	"github.com/PuerkitoBio/goquery"
)

func main() {
	// 目标网页 URL
	url := "https://www.cs.cmu.edu/~213/schedule.html"

	// 获取网页内容
	resp, err := http.Get(url)
	if err != nil {
		fmt.Printf("获取网页失败: %v\n", err)
		return
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		fmt.Printf("HTTP 请求失败: %d\n", resp.StatusCode)
		return
	}

	// 使用 goquery 解析 HTML
	doc, err := goquery.NewDocumentFromReader(resp.Body)
	if err != nil {
		fmt.Printf("解析 HTML 失败: %v\n", err)
		return
	}

	// 查找所有 PDF 链接
	doc.Find("a").Each(func(i int, s *goquery.Selection) {
		href, exists := s.Attr("href")
		if exists && strings.HasSuffix(strings.ToLower(href), ".pdf") {
			// 如果链接是相对路径，则补全为绝对路径
			pdfURL := href
			if !strings.HasPrefix(href, "http") {
				pdfURL = fmt.Sprintf("%s/%s", strings.TrimSuffix(url, "schedule.html"), strings.TrimPrefix(href, "/"))

			}
			// 下载 PDF
			downloadPDF(pdfURL)
		}
	})
}

func downloadPDF(url string) {
	fmt.Printf("正在下载: %s\n", url)

	// 发起 HTTP 请求
	resp, err := http.Get(url)
	if err != nil {
		fmt.Printf("下载失败: %v\n", err)
		return
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		fmt.Printf("下载失败，HTTP 状态码: %d\n", resp.StatusCode)
		return
	}

	// 创建文件
	fileName := path.Base(url)
	file, err := os.Create(fileName)
	if err != nil {
		fmt.Printf("创建文件失败: %v\n", err)
		return
	}
	defer file.Close()

	// 保存文件
	_, err = io.Copy(file, resp.Body)
	if err != nil {
		fmt.Printf("保存文件失败: %v\n", err)
		return
	}

	fmt.Printf("下载完成: %s\n", fileName)
}
