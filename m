Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id D83A689561
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Oct 2018 12:39:22 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Thu,  4 Oct 2018 14:38:56 +0200
Message-Id: <6d15afb4a4ec08afe0d1ae3c0c297c041246b89c.1538656497.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <cover.aee5e066f8e9fa68d4d763fee64c7b2d195cb34b.1538656497.git-series.maxime.ripard@bootlin.com>
References: <cover.aee5e066f8e9fa68d4d763fee64c7b2d195cb34b.1538656497.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <cover.aee5e066f8e9fa68d4d763fee64c7b2d195cb34b.1538656497.git-series.maxime.ripard@bootlin.com>
References: <cover.aee5e066f8e9fa68d4d763fee64c7b2d195cb34b.1538656497.git-series.maxime.ripard@bootlin.com>
Subject: [igt-dev] [PATCH v8 03/16] fb: Add RGB888 format
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

VGhlIFJHQjg4OCBmb3JtYXQgaXMgdGhlIG9uZSB1c2VkIGFzIHRoZSBzaGFkb3cgYnVmZmVyIHVz
ZWQgd2hlbiBhIGNhaXJvCnN1cmZhY2UgaXMgcmVxdWVzdGVkIGZvciBhIGZvcm1hdCB0aGF0IENh
aXJvIGNhbm5vdCBoYW5kbGUuCgpTaW5jZSB3ZSdyZSBnb2luZyB0byBtb3ZlIHRoYXQgYnVmZmVy
IHJlcHJlc2VudGF0aW9uIHRvIGEgc3RydWN0IGlndF9mYiwKbGV0J3MgYWRkIHRoZSBSR0I4ODgg
Zm9ybWF0IHRvIHRoZSBsaXN0IG9mIGZvcm1hdHMgdGhhdCBpZ3RfZmIga25vd3MgYWJvdXQuCgpT
aWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgot
LS0KIGxpYi9pZ3RfZmIuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZmIuYyBiL2xpYi9pZ3RfZmIuYwppbmRleCBhYWE5MGJm
NzRhOWEuLjgwNWE3YjczNzk4MSAxMDA2NDQKLS0tIGEvbGliL2lndF9mYi5jCisrKyBiL2xpYi9p
Z3RfZmIuYwpAQCAtNzIsNiArNzIsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmb3JtYXRfZGVz
Y19zdHJ1Y3QgewogCSAgLmNhaXJvX2lkID0gQ0FJUk9fRk9STUFUX1JHQjE2XzU2NSwKIAkgIC5u
dW1fcGxhbmVzID0gMSwgLnBsYW5lX2JwcCA9IHsgMTYsIH0sCiAJfSwKKwl7IC5uYW1lID0gIlJH
Qjg4OCIsIC5kcm1faWQgPSBEUk1fRk9STUFUX1JHQjg4OCwKKwkgIC5jYWlyb19pZCA9IENBSVJP
X0ZPUk1BVF9JTlZBTElELAorCSAgLm51bV9wbGFuZXMgPSAxLCAucGxhbmVfYnBwID0geyAyNCwg
fSwKKwl9LAogCXsgLm5hbWUgPSAiWFJHQjg4ODgiLCAuZGVwdGggPSAyNCwgLmRybV9pZCA9IERS
TV9GT1JNQVRfWFJHQjg4ODgsCiAJICAuY2Fpcm9faWQgPSBDQUlST19GT1JNQVRfUkdCMjQsCiAJ
ICAubnVtX3BsYW5lcyA9IDEsIC5wbGFuZV9icHAgPSB7IDMyLCB9LAotLSAKZ2l0LXNlcmllcyAw
LjkuMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
