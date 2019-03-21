Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516A76E0D1
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2019 13:55:46 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Thu, 21 Mar 2019 15:57:14 +0200
Message-Id: <20190321135714.30854-1-mika.kahola@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: Minimum width and
 height for planar YUV formats on i915 devices
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

VXNlIG1pbmltdW0gb2YgMTZ4MTYgc2l6ZSBmb3IgaTkxNSBkZXZpY2VzIG9ubHkgYXMgb3RoZXIg
SFcncyBtYXkgaGF2ZSBkaWZmZXJlbnQgbGltaXRhdGlvbnMuClRoZSBkZWZhdWx0IGlzIDh4OC4K
ClN1Z2dlc3RlZC1ieTogVmlsbGUgU3lyamFsYSA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5j
b20+ClNpZ25lZC1vZmYtYnk6IE1pa2EgS2Fob2xhIDxtaWthLmthaG9sYUBpbnRlbC5jb20+Ci0t
LQogdGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19wbGFuZV9z
Y2FsaW5nLmMgYi90ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jCmluZGV4IDAxZjVmN2M5Li4xMGM4
NTJkNSAxMDA2NDQKLS0tIGEvdGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYworKysgYi90ZXN0cy9r
bXNfcGxhbmVfc2NhbGluZy5jCkBAIC0xNDksNyArMTQ5LDcgQEAgc3RhdGljIHZvaWQgY2hlY2tf
c2NhbGluZ19waXBlX3BsYW5lX3JvdChkYXRhX3QgKmQsIGlndF9wbGFuZV90ICpwbGFuZSwKIAog
CS8qIGNyZWF0ZSBidWZmZXIgaW4gdGhlIHJhbmdlIG9mICBtaW4gYW5kIG1heCBzb3VyY2Ugc2lk
ZSBsaW1pdC4qLwogCXdpZHRoID0gaGVpZ2h0ID0gODsKLQlpZiAoaXNfcGxhbmFyX3l1dl9mb3Jt
YXQocGl4ZWxfZm9ybWF0KSkKKwlpZiAoaXNfaTkxNV9kZXZpY2UoZC0+ZHJtX2ZkKSAmJiBpc19w
bGFuYXJfeXV2X2Zvcm1hdChwaXhlbF9mb3JtYXQpKQogCQl3aWR0aCA9IGhlaWdodCA9IDE2Owog
CWlndF9jcmVhdGVfY29sb3JfZmIoZGlzcGxheS0+ZHJtX2ZkLCB3aWR0aCwgaGVpZ2h0LAogCQkg
ICAgICAgcGl4ZWxfZm9ybWF0LCB0aWxpbmcsIDAuMCwgMS4wLCAwLjAsICZkLT5mYlswXSk7Ci0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
