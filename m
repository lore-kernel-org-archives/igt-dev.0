Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl0-x244.google.com (mail-pl0-x244.google.com
 [IPv6:2607:f8b0:400e:c01::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659AF6E24F
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Aug 2018 06:43:43 +0000 (UTC)
Received: by mail-pl0-x244.google.com with SMTP id w3-v6so8312739plq.2
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Jul 2018 23:43:43 -0700 (PDT)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@gmail.com>
Date: Tue, 31 Jul 2018 23:43:23 -0700
Message-Id: <20180801064323.14110-1-dhinakaran.pandiyan@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/psr: Skip if PSR cannot be enabled
 for the current mode.
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UFNSIHRlc3RzIG9uIElDTCBmYWlsIHdhaXRpbmcgZm9yIFBTUiB0byBiZWNvbWUgYWN0aXZlLCB3
aGVyZWFzIHRoZQpkcml2ZXIgZG9lcyBub3QgZW5hYmxlIGl0IG9uIHRoZSBIVyBkdWUgdG8gdW5t
ZXQgdGltaW5nIHJlcXVpcmVtZW50cwpbICA0ODIuNDg1ODczXSBbZHJtOmludGVsX2RwX2NvbXB1
dGVfY29uZmlnIFtpOTE1XV0gUFNSIGNvbmRpdGlvbiBmYWlsZWQ6IFBTUiBzZXR1cCB0aW1lICgz
MzAgdXMpIHRvbyBsb25nCldlIHNob3VsZCBwcm9iYWJseSBicmluZyBiYWNrIHRoZSBrZXJuZWwg
cGF0Y2ggdGhhdCBwcm9ncmFtbWVkIGFuIGFsdGVybmF0ZQptb2RlLCBidXQgc2tpcCB0ZXN0cyBm
b3Igbm93LgoKQ2M6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29t
PgpTaWduZWQtb2ZmLWJ5OiBEaGluYWthcmFuIFBhbmRpeWFuIDxkaGluYWthcmFuLnBhbmRpeWFu
QGludGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfcHNyLmMgfCAxMiArKysrKysrKysrKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
dGVzdHMva21zX3Bzci5jIGIvdGVzdHMva21zX3Bzci5jCmluZGV4IDIxOGIzOTYwLi44OTExOGFk
NCAxMDA2NDQKLS0tIGEvdGVzdHMva21zX3Bzci5jCisrKyBiL3Rlc3RzL2ttc19wc3IuYwpAQCAt
MTkzLDExICsxOTMsMTkgQEAgc3RhdGljIGJvb2wgc2lua19zdXBwb3J0KGRhdGFfdCAqZGF0YSkK
IAljaGFyIGJ1Zls1MTJdOwogCiAJaWd0X2RlYnVnZnNfcmVhZChkYXRhLT5kcm1fZmQsICJpOTE1
X2VkcF9wc3Jfc3RhdHVzIiwgYnVmKTsKLQogCXJldHVybiBkYXRhLT53aXRoX3Bzcl9kaXNhYmxl
ZCB8fAogCQlzdHJzdHIoYnVmLCAiU2lua19TdXBwb3J0OiB5ZXNcbiIpOwogfQogCitzdGF0aWMg
Ym9vbCBtb2RlX3N1cHBvcnQoZGF0YV90ICpkYXRhKQoreworCWNoYXIgYnVmWzUxMl07CisKKwlp
Z3RfZGVidWdmc19yZWFkKGRhdGEtPmRybV9mZCwgImk5MTVfZWRwX3Bzcl9zdGF0dXMiLCBidWYp
OworCXJldHVybiBkYXRhLT53aXRoX3Bzcl9kaXNhYmxlZCB8fAorCQlzdHJzdHIoYnVmLCAiRW5h
YmxlZDogeWVzXG4iKTsKK30KKwogc3RhdGljIGJvb2wgcHNyX3dhaXRfZW50cnlfaWZfZW5hYmxl
ZChkYXRhX3QgKmRhdGEpCiB7CiAJaWYgKGRhdGEtPndpdGhfcHNyX2Rpc2FibGVkKQpAQCAtNDIy
LDYgKzQzMCw4IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAJCWRybV9pbnRl
bF9idWZtZ3JfZ2VtX2VuYWJsZV9yZXVzZShkYXRhLmJ1Zm1ncik7CiAKIAkJZGlzcGxheV9pbml0
KCZkYXRhKTsKKwkJaWd0X3JlcXVpcmVfZihtb2RlX3N1cHBvcnQoJmRhdGEpLAorCQkJICAgICAi
UFNSIG5vdCBlbmFibGVkIGZvciBjdXJyZW50IG1vZGVcbiIpOwogCX0KIAogCWlndF9zdWJ0ZXN0
KCJiYXNpYyIpIHsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2Cg==
