Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 889C289561
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Oct 2018 12:39:22 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Thu,  4 Oct 2018 14:38:55 +0200
Message-Id: <4c231337f12ae5912139844ae2dee9790ef410e8.1538656497.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <cover.aee5e066f8e9fa68d4d763fee64c7b2d195cb34b.1538656497.git-series.maxime.ripard@bootlin.com>
References: <cover.aee5e066f8e9fa68d4d763fee64c7b2d195cb34b.1538656497.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <cover.aee5e066f8e9fa68d4d763fee64c7b2d195cb34b.1538656497.git-series.maxime.ripard@bootlin.com>
References: <cover.aee5e066f8e9fa68d4d763fee64c7b2d195cb34b.1538656497.git-series.maxime.ripard@bootlin.com>
Subject: [igt-dev] [PATCH v8 02/16] fb: Only set the GEM domain on intel
 platforms
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
Cc: eben@raspberrypi.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIGdlbV9zZXRfZG9tYWluIGNhbGwgdXNlcyBhbiBpOTE1IHNwZWNpZmljIGlvY3RsIHRoYXQg
d2lsbCBmYWlsIG9uCmFueXRoaW5nIGVsc2UuIExldCdzIG1vdmUgdGhhdCBjYWxsIHVuZGVyIGEg
Y2hlY2sgZm9yIHdoZXRoZXIgb3Igbm90IHdlJ3JlCnJ1bm5pbmcgb24gYW4gaW50ZWwgcGxhdGZv
cm0uCgpTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4u
Y29tPgotLS0KIGxpYi9pZ3RfZmIuYyB8IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9mYi5jIGIvbGli
L2lndF9mYi5jCmluZGV4IGYxMzMyMTY5OTE1Zi4uYWFhOTBiZjc0YTlhIDEwMDY0NAotLS0gYS9s
aWIvaWd0X2ZiLmMKKysrIGIvbGliL2lndF9mYi5jCkBAIC0xMzU2LDggKzEzNTYsOSBAQCBzdGF0
aWMgdm9pZCAqbWFwX2JvKGludCBmZCwgc3RydWN0IGlndF9mYiAqZmIpCiB7CiAJdm9pZCAqcHRy
OwogCi0JZ2VtX3NldF9kb21haW4oZmQsIGZiLT5nZW1faGFuZGxlLAotCQkgICAgICAgSTkxNV9H
RU1fRE9NQUlOX0dUVCwgSTkxNV9HRU1fRE9NQUlOX0dUVCk7CisJaWYgKGlzX2k5MTVfZGV2aWNl
KGZkKSkKKwkJZ2VtX3NldF9kb21haW4oZmQsIGZiLT5nZW1faGFuZGxlLAorCQkJICAgICAgIEk5
MTVfR0VNX0RPTUFJTl9HVFQsIEk5MTVfR0VNX0RPTUFJTl9HVFQpOwogCiAJaWYgKGZiLT5pc19k
dW1iKQogCQlwdHIgPSBrbXN0ZXN0X2R1bWJfbWFwX2J1ZmZlcihmZCwgZmItPmdlbV9oYW5kbGUs
IGZiLT5zaXplLAotLSAKZ2l0LXNlcmllcyAwLjkuMQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXYK
