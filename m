Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCA8890EE
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Apr 2019 21:36:20 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon,  8 Apr 2019 22:36:02 +0100
Message-Id: <20190408213602.31554-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib: Use nr_open not file-max for setting
 fd rlimit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UGV0cmkgcG9pbnRlZCBvdXQgdGhhdCB0aGUgbWF4aW11bSBhbGxvd2VkIG51bWJlciBvZiBmaWxl
cyBwZXIgcHJvY2VzcwppcyBucl9vcGVuLCBub3QgdGhlIHN5c3RlbSBjYXAgb2YgZmlsZS1tYXgu
CgpTdWdnZXN0ZWQtYnk6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgpT
aWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KQ2M6
IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPgpDYzogUGV0cmkgTGF0
dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Ci0tLQogbGliL2lndF9hdXguYyB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2xpYi9pZ3RfYXV4LmMgYi9saWIvaWd0X2F1eC5jCmluZGV4IDI2NmFhODMyMS4uMDJmNGRl
ZmI2IDEwMDY0NAotLS0gYS9saWIvaWd0X2F1eC5jCisrKyBiL2xpYi9pZ3RfYXV4LmMKQEAgLTE1
OTUsNyArMTU5NSw3IEBAIGJvb2wgaWd0X2FsbG93X3VubGltaXRlZF9maWxlcyh2b2lkKQogCXN0
cnVjdCBybGltaXQgcmxpbTsKIAl1bnNpZ25lZCBub2ZpbGVfcmxpbSA9IDEwMjQqMTAyNDsKIAot
CUZJTEUgKmZpbGUgPSBmb3BlbigiL3Byb2Mvc3lzL2ZzL2ZpbGUtbWF4IiwgInIiKTsKKwlGSUxF
ICpmaWxlID0gZm9wZW4oIi9wcm9jL3N5cy9mcy9ucl9vcGVuIiwgInIiKTsKIAlpZiAoZmlsZSkg
ewogCQlpZ3RfYXNzZXJ0KGZzY2FuZihmaWxlLCAiJXUiLCAmbm9maWxlX3JsaW0pID09IDEpOwog
CQlpZ3RfaW5mbygiU3lzdGVtIGxpbWl0IGZvciBvcGVuIGZpbGVzIGlzICV1XG4iLCBub2ZpbGVf
cmxpbSk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dg==
