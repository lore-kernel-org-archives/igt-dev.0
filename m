Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 274226E6C6
 for <igt-dev@lists.freedesktop.org>; Thu, 24 May 2018 14:24:53 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Thu, 24 May 2018 16:24:43 +0200
Message-Id: <651b910e65c6b95c3984a038e6b9e17399379a17.1527171699.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <cover.ab4e8068ec3bcd788fed734e68f4dac210fe2a3d.1527171699.git-series.maxime.ripard@bootlin.com>
References: <cover.ab4e8068ec3bcd788fed734e68f4dac210fe2a3d.1527171699.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <cover.ab4e8068ec3bcd788fed734e68f4dac210fe2a3d.1527171699.git-series.maxime.ripard@bootlin.com>
References: <cover.ab4e8068ec3bcd788fed734e68f4dac210fe2a3d.1527171699.git-series.maxime.ripard@bootlin.com>
Subject: [igt-dev] [PATCH v3 04/11] fb: Add more formats
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, eben@raspberrypi.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

V2UncmUgZ29pbmcgdG8gbmVlZCBzb21lIERSTSBmb3JtYXRzLCBhbmQgd2UncmUgZ29pbmcgdG8g
bmVlZCB0aGUgaWd0X2ZiCmNvZGUgdG8gaGFuZGxlIHRoZW0uIFNpbmNlIGl0IHJlbGllcyBvbiB0
aGUgZm9ybWF0X2Rlc2Mgc3RydWN0dXJlIHRvIG1hcAp0aGUgRFJNIGZvdXJjYyB0byB0aGUgcGl4
bWFuIGFuZCBjYWlybyBmb3JtYXRzLCB3ZSBuZWVkIHRvIGFkZCB0aGVzZSBuZXcKZm9ybWF0cyB0
byB0aGF0IHN0cnVjdHVyZS4KClNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZS5y
aXBhcmRAYm9vdGxpbi5jb20+Ci0tLQogbGliL2lndF9mYi5jIHwgOCArKysrKysrLQogMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2xp
Yi9pZ3RfZmIuYyBiL2xpYi9pZ3RfZmIuYwppbmRleCBlNWU2NmY3ZGY3ZjUuLjdhZTNkYmNhYjVm
MSAxMDA2NDQKLS0tIGEvbGliL2lndF9mYi5jCisrKyBiL2xpYi9pZ3RfZmIuYwpAQCAtNzAsMTAg
KzcwLDE2IEBAIHN0YXRpYyBzdHJ1Y3QgZm9ybWF0X2Rlc2Nfc3RydWN0IHsKIAlpbnQgcGxhbmVz
OwogCWludCBwbGFuZV9icHBbNF07CiB9IGZvcm1hdF9kZXNjW10gPSB7CisJREYoQVJHQjE1NTUs
CUlOVkFMSUQsCWExcjVnNWI1LAkxNiwgMTYpLAorCURGKFhSR0IxNTU1LAlJTlZBTElELAl4MXI1
ZzViNSwJMTYsIDE2KSwKIAlERihSR0I1NjUsCVJHQjE2XzU2NSwJcjVnNmI1LAkJMTYsIDE2KSwK
LQkvL0RGKFJHQjg4OCwJSU5WQUxJRCwJcjhnOGI4LAkJMjQsIDI0KSwKKwlERihCR1I1NjUsCUlO
VkFMSUQsCWI1ZzZyNSwJCTE2LCAxNiksCisJREYoQkdSODg4LAlJTlZBTElELAliOGc4cjgsCQky
NCwgMjQpLAorCURGKFJHQjg4OCwJSU5WQUxJRCwJcjhnOGI4LAkJMjQsIDI0KSwKIAlERihYUkdC
ODg4OCwJUkdCMjQsCQl4OHI4ZzhiOCwJMzIsIDI0KSwKKwlERihYQkdSODg4OCwJSU5WQUxJRCwJ
eDhiOGc4cjgsCTMyLCAyNCksCiAJREYoWFJHQjIxMDEwMTAsCVJHQjMwLAkJeDJyMTBnMTBiMTAs
CTMyLCAzMCksCisJREYoQUJHUjg4ODgsCUlOVkFMSUQsCWE4YjhnOHI4LAkzMiwgMzIpLAogCURG
KEFSR0I4ODg4LAlBUkdCMzIsCQlhOHI4ZzhiOCwJMzIsIDMyKSwKIAlERihOVjEyLAlSR0IyNCwJ
CWludmFsaWQsCTMyLCAtMSwgMiwgezgsIDE2fSksCiB9OwotLSAKZ2l0LXNlcmllcyAwLjkuMQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1h
aWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
