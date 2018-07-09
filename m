Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon,  9 Jul 2018 11:28:47 +0100
Message-Id: <20180709102847.15553-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH i-g-t] igt/gem_render_copy: Check for GEM before
 running
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Z2VtX3JlbmRlcl9jb3B5IHJlcXVpcmVzIGEgd29ya2luZyBHUFUgc28gY2hlY2sgZmlyc3QuCgpT
aWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLS0t
CiB0ZXN0cy9nZW1fcmVuZGVyX2NvcHkuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMvZ2VtX3JlbmRlcl9jb3B5LmMgYi90ZXN0cy9nZW1f
cmVuZGVyX2NvcHkuYwppbmRleCA4MzczY2Q3MzguLjIzOGU3MGU5NyAxMDA2NDQKLS0tIGEvdGVz
dHMvZ2VtX3JlbmRlcl9jb3B5LmMKKysrIGIvdGVzdHMvZ2VtX3JlbmRlcl9jb3B5LmMKQEAgLTUy
OSw2ICs1MjksNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAJaWd0X2ZpeHR1
cmUgewogCQlkYXRhLmRybV9mZCA9IGRybV9vcGVuX2RyaXZlcl9yZW5kZXIoRFJJVkVSX0lOVEVM
KTsKIAkJZGF0YS5kZXZpZCA9IGludGVsX2dldF9kcm1fZGV2aWQoZGF0YS5kcm1fZmQpOworCQlp
Z3RfcmVxdWlyZV9nZW0oZGF0YS5kcm1fZmQpOwogCiAJCWRhdGEuYnVmbWdyID0gZHJtX2ludGVs
X2J1Zm1ncl9nZW1faW5pdChkYXRhLmRybV9mZCwgNDA5Nik7CiAJCWlndF9hc3NlcnQoZGF0YS5i
dWZtZ3IpOwotLSAKMi4xOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXYK
