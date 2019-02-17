Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sun, 17 Feb 2019 14:35:49 +0000
Message-Id: <20190217143556.9482-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 1/8] i915/gem_eio: Check that context
 create fails when wedged
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Mika Kuoppala <mika.kuoppala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

TG9jayBkb3duIHRoZSBuZXcgdUFCSSB0aGF0IERSTV9JT0NUTF9JOTE1X0dFTV9DT05URVhUX0NS
RUFURSByZXR1cm5zCi1FSU8gd2hlbiB3ZWRnZWQuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxz
b24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KQ2M6IE1pa2EgS3VvcHBhbGEgPG1pa2Eua3Vv
cHBhbGFAaW50ZWwuY29tPgotLS0KIHRlc3RzL2k5MTUvZ2VtX2Vpby5jIHwgMTQgKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGVz
dHMvaTkxNS9nZW1fZWlvLmMgYi90ZXN0cy9pOTE1L2dlbV9laW8uYwppbmRleCBhYzg1YTJlZmYu
LjNjNTQ4MjBjOSAxMDA2NDQKLS0tIGEvdGVzdHMvaTkxNS9nZW1fZWlvLmMKKysrIGIvdGVzdHMv
aTkxNS9nZW1fZWlvLmMKQEAgLTExOCw2ICsxMTgsMTcgQEAgc3RhdGljIHZvaWQgdGVzdF90aHJv
dHRsZShpbnQgZmQpCiAJdHJpZ2dlcl9yZXNldChmZCk7CiB9CiAKK3N0YXRpYyB2b2lkIHRlc3Rf
Y29udGV4dF9jcmVhdGUoaW50IGZkKQoreworCXVpbnQzMl90IGN0eDsKKworCXdlZGdlX2dwdShm
ZCk7CisKKwlpZ3RfYXNzZXJ0X2VxKF9fZ2VtX2NvbnRleHRfY3JlYXRlKGZkLCAmY3R4KSwgLUVJ
Tyk7CisKKwl0cmlnZ2VyX3Jlc2V0KGZkKTsKK30KKwogc3RhdGljIHZvaWQgdGVzdF9leGVjYnVm
KGludCBmZCkKIHsKIAlzdHJ1Y3QgZHJtX2k5MTVfZ2VtX2V4ZWNidWZmZXIyIGV4ZWNidWY7CkBA
IC04MDcsNiArODE4LDkgQEAgaWd0X21haW4KIAlpZ3Rfc3VidGVzdCgidGhyb3R0bGUiKQogCQl0
ZXN0X3Rocm90dGxlKGZkKTsKIAorCWlndF9zdWJ0ZXN0KCJjb250ZXh0LWNyZWF0ZSIpCisJCXRl
c3RfY29udGV4dF9jcmVhdGUoZmQpOworCiAJaWd0X3N1YnRlc3QoImV4ZWNidWYiKQogCQl0ZXN0
X2V4ZWNidWYoZmQpOwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2ludGVsLWdmeA==
