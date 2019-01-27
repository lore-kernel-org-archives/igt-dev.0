Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sun, 27 Jan 2019 12:49:02 +0000
Message-Id: <20190127124902.10139-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_eio: Check for allow-hang prior to
 issuing a reset
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Q2hlY2sgdGhhdCB3ZSBhcmUgYWxsb3dlZCB0byBoYW5nL3Jlc2V0IHRoZSBHUFUgYmVmb3JlIHdl
IGFjdHVhbGx5IGRvIHNvCmZvciB0aGUgZmlyc3QgdGltZS4KClNpZ25lZC1vZmYtYnk6IENocmlz
IFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotLS0KIHRlc3RzL2k5MTUvZ2VtX2Vp
by5jIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9laW8uYyBiL3Rlc3RzL2k5MTUv
Z2VtX2Vpby5jCmluZGV4IDUyNTBhNDE0Yy4uMDkwNTljMzExIDEwMDY0NAotLS0gYS90ZXN0cy9p
OTE1L2dlbV9laW8uYworKysgYi90ZXN0cy9pOTE1L2dlbV9laW8uYwpAQCAtNzQ1LDE0ICs3NDUs
MTQgQEAgaWd0X21haW4KIAkJZmQgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX0lOVEVMKTsKIAkJ
aWd0X2RldmljZV9kcm9wX21hc3RlcihmZCk7CiAKLQkJaWd0X3JlcXVpcmUoaTkxNV9yZXNldF9j
b250cm9sKHRydWUpKTsKLQkJaWd0X2ZvcmNlX2dwdV9yZXNldChmZCk7Ci0JCWlndF9pbnN0YWxs
X2V4aXRfaGFuZGxlcihleGl0X2hhbmRsZXIpOwotCiAJCWdlbV9zdWJtaXNzaW9uX3ByaW50X21l
dGhvZChmZCk7CiAJCWlndF9yZXF1aXJlX2dlbShmZCk7CiAKIAkJaWd0X2FsbG93X2hhbmcoZmQs
IDAsIDApOworCisJCWlndF9yZXF1aXJlKGk5MTVfcmVzZXRfY29udHJvbCh0cnVlKSk7CisJCWln
dF9mb3JjZV9ncHVfcmVzZXQoZmQpOworCQlpZ3RfaW5zdGFsbF9leGl0X2hhbmRsZXIoZXhpdF9o
YW5kbGVyKTsKIAl9CiAKIAlpZ3Rfc3VidGVzdCgidGhyb3R0bGUiKQotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
