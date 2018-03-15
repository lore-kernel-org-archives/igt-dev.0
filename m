Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D4B6E081
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Mar 2018 05:44:53 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Thu, 15 Mar 2018 11:12:22 +0530
Message-Id: <1521092542-1288-1-git-send-email-vidya.srinivas@intel.com>
Subject: [igt-dev] [PATCH i-g-t] [i-g-t] tests/kms_plane_scaling: Change
 minimum fb height for YUV 420 planar
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
Cc: sunil.kamath@intel.com, ville.syrjala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

V2hlbiB0aGUgcGxhbmUgc2NhbGluZyBpcyB1c2VkIHdpdGggWVVWIDQyMCBwbGFuYXIgZm9ybWF0
cywKdGhlIGhlaWdodCBzaG91bGQgYmUgYSBtaW5pbXVtIG9mIDE2IHNjYW5saW5lcyBhcyBwZXIg
QlNwZWMuCk1pbmltdW0gb2YgOCBzY2FubGluZXMgaXMgZm9yIG5vbi1ZVVYgNDIwIHBsYW5hciBm
b3JtYXRzLgpQYXRjaCBjaGFuZ2VzIHRoZSBtaW5pbXVtIGZiIGhlaWdodCBiZWluZyB1c2VkIGlu
IHRoZSB0ZXN0CmluIGNhc2Ugb2YgWVVWIDQyMCBwbGFuYXIgKGN1cnJlbnRseSBkb25lIGZvciBO
VjEyLCBhcwp0aGF0IGlzIHRoZSBvbmx5IHBsYW5hciBmb3JtYXQgc3VwcG9ydGVkKQoKdjI6IEFk
ZHJlc3NlZCByZXZpZXcgY29tbWVudHMgZnJvbSBNYWFydGVuCgpTaWduZWQtb2ZmLWJ5OiBVbWEg
U2hhbmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBWaWR5YSBTcmlu
aXZhcyA8dmlkeWEuc3Jpbml2YXNAaW50ZWwuY29tPgotLS0KIHRlc3RzL2ttc19wbGFuZV9zY2Fs
aW5nLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvdGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYyBiL3Rlc3RzL2ttc19wbGFuZV9zY2FsaW5nLmMK
aW5kZXggNDQwOGU1Yy4uMzZmY2ZjMCAxMDA2NDQKLS0tIGEvdGVzdHMva21zX3BsYW5lX3NjYWxp
bmcuYworKysgYi90ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jCkBAIC0xMzEsNiArMTMxLDggQEAg
c3RhdGljIHZvaWQgY2hlY2tfc2NhbGluZ19waXBlX3BsYW5lX3JvdChkYXRhX3QgKmQsIGlndF9w
bGFuZV90ICpwbGFuZSwKIAogCS8qIGNyZWF0ZSBidWZmZXIgaW4gdGhlIHJhbmdlIG9mICBtaW4g
YW5kIG1heCBzb3VyY2Ugc2lkZSBsaW1pdC4qLwogCXdpZHRoID0gaGVpZ2h0ID0gOTsKKwlpZiAo
cGl4ZWxfZm9ybWF0ID09IERSTV9GT1JNQVRfTlYxMikKKwkJd2lkdGggPSBoZWlnaHQgPSAxNzsK
IAlpZ3RfY3JlYXRlX2NvbG9yX2ZiKGRpc3BsYXktPmRybV9mZCwgd2lkdGgsIGhlaWdodCwKIAkJ
ICAgICAgIHBpeGVsX2Zvcm1hdCwgdGlsaW5nLCAwLjAsIDEuMCwgMC4wLCAmZC0+ZmJbMF0pOwog
CWlndF9wbGFuZV9zZXRfZmIocGxhbmUsICZkLT5mYlswXSk7Ci0tIAoyLjcuNAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
