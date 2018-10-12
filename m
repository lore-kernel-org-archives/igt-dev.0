Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2580888B2B
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Oct 2018 21:28:37 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Fri, 12 Oct 2018 14:28:26 -0700
Message-Id: <20181012212827.30163-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] lib: Skip tests that require fb
 modifiers when KMS is disabled
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
List-ID: <igt-dev@lists.freedesktop.org>

V2hlbiBLTVMgaXMgZGlzYWJsZWQsIGRybUdldENhcCgpIGZvciBEUk1fQ0FQX0FEREZCMl9NT0RJ
RklFUlMoKSB3aWxsCnJldHVybiAtMSBhbmQgc2V0IGVycm5vIGFzIEVPUE5PVFNVUFAsIHRoZSBj
dXJyZW50IGFzc2VydCB3YXMgb25seQpjaGVja2luZyBmb3IgYSBzdWNlc3MgcmVzdWx0IG9yIGlu
dmFsaWQgYXJndW1lbnQgY2F1c2luZwpwcmltZV92Z2VtQGJhc2ljLWZlbmNlLWZsaXAgdGVzdCB0
byBmYWlsIHdoZW4gS01TIGlzIGRpc2FibGVkLgoKQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hy
aXMtd2lsc29uLmNvLnVrPgpTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxq
b3NlLnNvdXphQGludGVsLmNvbT4KLS0tCiBsaWIvaW9jdGxfd3JhcHBlcnMuYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2xpYi9pb2N0bF93cmFwcGVycy5jIGIvbGliL2lvY3RsX3dyYXBwZXJzLmMKaW5kZXggMDkyOWM0
M2YuLmJkYTlhNzY0IDEwMDY0NAotLS0gYS9saWIvaW9jdGxfd3JhcHBlcnMuYworKysgYi9saWIv
aW9jdGxfd3JhcHBlcnMuYwpAQCAtMTY2MSw3ICsxNjYxLDcgQEAgdm9pZCBpZ3RfcmVxdWlyZV9m
Yl9tb2RpZmllcnMoaW50IGZkKQogCQlpbnQgcmV0OwogCiAJCXJldCA9IGRybUdldENhcChmZCwg
RFJNX0NBUF9BRERGQjJfTU9ESUZJRVJTLCAmY2FwX21vZGlmaWVycyk7Ci0JCWlndF9hc3NlcnQo
cmV0ID09IDAgfHwgZXJybm8gPT0gRUlOVkFMKTsKKwkJaWd0X2Fzc2VydChyZXQgPT0gMCB8fCBl
cnJubyA9PSBFSU5WQUwgfHwgZXJybm8gPT0gRU9QTk9UU1VQUCk7CiAJCWhhc19tb2RpZmllcnMg
PSByZXQgPT0gMCAmJiBjYXBfbW9kaWZpZXJzID09IDE7CiAJCWNhcF9tb2RpZmllcnNfdGVzdGVk
ID0gdHJ1ZTsKIAl9Ci0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldgo=
