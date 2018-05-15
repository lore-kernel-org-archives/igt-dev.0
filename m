Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C58F6E1F3
 for <igt-dev@lists.freedesktop.org>; Tue, 15 May 2018 09:22:52 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Tue, 15 May 2018 10:22:42 +0100
Message-Id: <20180515092243.22374-3-lionel.g.landwerlin@intel.com>
In-Reply-To: <20180515092243.22374-1-lionel.g.landwerlin@intel.com>
References: <20180515092243.22374-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] [PATCH i-g-t 3/4] lib: intel: report GT size from the
 database if available
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIHNjaGVtZSBpZiBnZXR0aW5nIHRoZSBHVCBzaXplIGZyb20gdGhlIFBDSS1pZCBkb2Vzbid0
IHdvcmsgYW55bW9yZQpvbiBDb2ZmZWVsYWtlLgoKdjI6IEFzc2VydCB3aGVuIEdUIGlzbid0IGRl
ZmluZWQgb24gZ2VuOCsgfHwgaGFzd2VsbAoKU2lnbmVkLW9mZi1ieTogTGlvbmVsIExhbmR3ZXJs
aW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29tPgpCdWd6aWxsYTogaHR0cHM6Ly9idWdz
LmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA1NDUxCkJ1Z3ppbGxhOiBodHRwczov
L2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDE3NDAKLS0tCiBsaWIvaW50
ZWxfZGV2aWNlX2luZm8uYyB8IDExICsrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2xpYi9pbnRlbF9kZXZpY2VfaW5mby5jIGIvbGliL2lu
dGVsX2RldmljZV9pbmZvLmMKaW5kZXggNWVkZGMzNTkuLjM0Yzg2NTk2IDEwMDY0NAotLS0gYS9s
aWIvaW50ZWxfZGV2aWNlX2luZm8uYworKysgYi9saWIvaW50ZWxfZGV2aWNlX2luZm8uYwpAQCAt
MSw2ICsxLDcgQEAKICNpbmNsdWRlICJpbnRlbF9jaGlwc2V0LmgiCiAjaW5jbHVkZSAiaTkxNV9w
Y2lpZHMuaCIKIAorI2luY2x1ZGUgPGFzc2VydC5oPgogI2luY2x1ZGUgPHN0cmluZ3MuaD4gLyog
ZmZzKCkgKi8KIAogI2RlZmluZSBCSVQoeCkgKDE8PCh4KSkKQEAgLTQyOCw4ICs0MjksMTggQEAg
dW5zaWduZWQgaW50ZWxfZ2VuKHVpbnQxNl90IGRldmlkKQogICovCiB1bnNpZ25lZCBpbnRlbF9n
dCh1aW50MTZfdCBkZXZpZCkKIHsKKwljb25zdCBzdHJ1Y3QgaW50ZWxfZGV2aWNlX2luZm8gKmRl
dmluZm8gPSBpbnRlbF9nZXRfZGV2aWNlX2luZm8oZGV2aWQpOwogCXVuc2lnbmVkIG1hc2sgPSBp
bnRlbF9nZW4oZGV2aWQpOwogCisJLyoKKwkgKiBGcm9tIENvZmZlbGFrZSBvbndhcmRzLCB0aGUg
R1QgaXMgbm8gbG9uZ2VyIGFjY3VyYXRlbHkKKwkgKiBlbmNvZGVkIGluIHRoZSBQQ0ktSUQgYW5k
IHdlIG5lZWQgdG8gdXNlIGEgbG9vayB1cCB0YWJsZS4KKwkgKi8KKwlpZiAoZGV2aW5mby0+Z3Qp
CisJCXJldHVybiBkZXZpbmZvLT5ndCAtIDE7CisKKwlhc3NlcnQoZGV2aW5mby0+Z2VuIDwgOCB8
fCAhZGV2aW5mby0+aXNfaGFzd2VsbCk7CisKIAlpZiAobWFzayA+PSA4KQogCQltYXNrID0gMHhm
OwogCWVsc2UgaWYgKG1hc2sgPj0gNikKLS0gCjIuMTcuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2Cg==
