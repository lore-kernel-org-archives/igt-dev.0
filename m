Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 12 Jul 2018 16:37:08 +0100
Message-Id: <20180712153709.10125-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH i-g-t 1/2] igt/gem_gpgpu_fill: Check for GEM
 before use
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

QXMgd2UgbmVlZCBHRU0gYW5kIHRoZSBHUFUgdG8gZG8gYSBHUEdQVSBmaWxsLCB3ZSBzaG91bGQg
Y2hlY2sgdGhhdCBpdAppcyBvcGVyYWJsZSBiZWZvcmUgdXNpbmcgLS0gc2tpcHBpbmcgcmF0aGVy
IHRoYW4gZmFpbGluZyB3aGVuIHRoZSBkZXZpY2UKaXMgd2VkZ2VkLgoKU2lnbmVkLW9mZi1ieTog
Q2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0tLQogdGVzdHMvZ2VtX2dw
Z3B1X2ZpbGwuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0t
Z2l0IGEvdGVzdHMvZ2VtX2dwZ3B1X2ZpbGwuYyBiL3Rlc3RzL2dlbV9ncGdwdV9maWxsLmMKaW5k
ZXggOGVmMDVhM2YwLi5kZmI1ODE2NTIgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2dlbV9ncGdwdV9maWxs
LmMKKysrIGIvdGVzdHMvZ2VtX2dwZ3B1X2ZpbGwuYwpAQCAtMTA0LDYgKzEwNCw3IEBAIGlndF9z
aW1wbGVfbWFpbgogCiAJZGF0YS5kcm1fZmQgPSBkcm1fb3Blbl9kcml2ZXJfcmVuZGVyKERSSVZF
Ul9JTlRFTCk7CiAJZGF0YS5kZXZpZCA9IGludGVsX2dldF9kcm1fZGV2aWQoZGF0YS5kcm1fZmQp
OworCWlndF9yZXF1aXJlX2dlbShkYXRhLmRybV9mZCk7CiAKIAlkYXRhLmJ1Zm1nciA9IGRybV9p
bnRlbF9idWZtZ3JfZ2VtX2luaXQoZGF0YS5kcm1fZmQsIDQwOTYpOwogCWlndF9hc3NlcnQoZGF0
YS5idWZtZ3IpOwotLSAKMi4xOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXYK
