Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 58F4B89C17
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Dec 2018 10:08:53 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Tue,  4 Dec 2018 11:08:21 +0100
Message-Id: <20181204100826.15522-6-maxime.ripard@bootlin.com>
In-Reply-To: <cover.c2054fa47f16b6319869fa4a8a2357a3a13e6d6c.1543917797.git-series.maxime.ripard@bootlin.com>
References: <cover.c2054fa47f16b6319869fa4a8a2357a3a13e6d6c.1543917797.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 6/8] igt: fb: Separate YUV allocation from
 the rest
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
Cc: Petri Latvala <petri.latvala@intel.com>, eben@raspberrypi.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

QWxsb2NhdGluZyBZVVYgYnVmZmVycyBpcyBhIGRpZmZlcmVudCBvcGVyYXRpb24gdGhhbiBhbGxv
Y2F0aW5nCmJ1ZmZlcnMgd2l0aCBub24tdHJpdmlhbCBzZXR1cHMuCgpMZXQncyBzZXBhcmF0ZSB0
aGUgWVVWIGJ1ZmZlciBhbGxvY2F0aW9uIHRvIGEgY2FzZSBhbmQgZnVuY3Rpb24gb2YgaXRzCm93
bi4KClNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5j
b20+Ci0tLQogbGliL2lndF9mYi5jIHwgMjAgKysrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGli
L2lndF9mYi5jIGIvbGliL2lndF9mYi5jCmluZGV4IGQ5NjY4OWFhNWZlNi4uZDYyNDJhNjY1MmYx
IDEwMDY0NAotLS0gYS9saWIvaWd0X2ZiLmMKKysrIGIvbGliL2lndF9mYi5jCkBAIC00OTksMTIg
KzQ5OSwzMCBAQCBzdGF0aWMgaW50IGk5MTVfY3JlYXRlX2dlbV9mb3JfZmIoc3RydWN0IGlndF9m
YiAqZmIpCiAJcmV0dXJuIGZiLT5nZW1faGFuZGxlOwogfQogCitzdGF0aWMgaW50IGNyZWF0ZV95
dXZfYm9fZm9yX2ZiKHN0cnVjdCBpZ3RfZmIgKmZiKQoreworCXVpbnQ2NF90IHNpemUgPSBjYWxj
X2ZiX3NpemUoZmIpOworCWludCBmZCA9IGZiLT5mZDsKKworCS8qIHJlc3BlY3QgdGhlIHNpemUg
cmVxdWVzdGVkIGJ5IHRoZSBjYWxsZXIgKi8KKwlpZiAoZmItPnNpemUgPT0gMCkKKwkJZmItPnNp
emUgPSBzaXplOworCisJaWYgKGlzX2k5MTVfZGV2aWNlKGZkKSkKKwkJcmV0dXJuIGk5MTVfY3Jl
YXRlX2dlbV9mb3JfZmIoZmIpOworCisJLyogV2UgY2Fubm90IGFsbG9jYXRlIGFueSBvdGhlciBi
dWZmZXIgdHlwZSAqLworCWlndF9hc3NlcnQodHJ1ZSk7Cit9CisKIC8qIGhlbHBlcnMgdG8gY3Jl
YXRlIG5pY2UtbG9va2luZyBmcmFtZWJ1ZmZlcnMgKi8KIHN0YXRpYyBpbnQgY3JlYXRlX2JvX2Zv
cl9mYihzdHJ1Y3QgaWd0X2ZiICpmYikKIHsKIAlpbnQgZmQgPSBmYi0+ZmQ7CiAKLQlpZiAoZmIt
PnRpbGluZyB8fCBmYi0+c2l6ZSB8fCBmYi0+c3RyaWRlc1swXSB8fCBpZ3RfZm9ybWF0X2lzX3l1
dihmYi0+ZHJtX2Zvcm1hdCkpIHsKKwlpZiAoaWd0X2Zvcm1hdF9pc195dXYoZmItPmRybV9mb3Jt
YXQpKSB7CisJCXJldHVybiBjcmVhdGVfeXV2X2JvX2Zvcl9mYihmYik7CisJfSBlbHNlIGlmIChm
Yi0+dGlsaW5nIHx8IGZiLT5zaXplIHx8IGZiLT5zdHJpZGVzWzBdKSB7CiAJCXVpbnQ2NF90IHNp
emU7CiAKIAkJc2l6ZSA9IGNhbGNfZmJfc2l6ZShmYik7Ci0tIAoyLjE5LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
