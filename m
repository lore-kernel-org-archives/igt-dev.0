Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id C6FBF6E39D
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Apr 2018 07:46:53 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Tue, 24 Apr 2018 09:46:38 +0200
Message-Id: <6ffec1262d760c93811a8dd8230ac446a66068d7.1524555464.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <cover.4467e4f79584ac18248b9664cbe4a81a2a610ecf.1524555464.git-series.maxime.ripard@bootlin.com>
References: <cover.4467e4f79584ac18248b9664cbe4a81a2a610ecf.1524555464.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <cover.4467e4f79584ac18248b9664cbe4a81a2a610ecf.1524555464.git-series.maxime.ripard@bootlin.com>
References: <cover.4467e4f79584ac18248b9664cbe4a81a2a610ecf.1524555464.git-series.maxime.ripard@bootlin.com>
Subject: [igt-dev] [PATCH i-g-t 04/12] fb: Add more formats
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
Cc: eben@raspberrypi.org, Maxime Ripard <maxime.ripard@bootlin.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

V2UncmUgZ29pbmcgdG8gbmVlZCBzb21lIERSTSBmb3JtYXRzIHRoYXQgYXJlIG5vdCBkZWZpbmVk
IGluIHRoZQpmb3JtYXRfZGVzY19zdHJ1Y3QuIE1ha2Ugc3VyZSB3ZSBhZGQgdGhlbS4KClNpZ25l
ZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Ci0tLQog
bGliL2lndF9mYi5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvbGliL2lndF9mYi5jIGIvbGliL2lndF9mYi5jCmluZGV4IDFkZTZmOWY2YzI3
NS4uYzZlNmIwMzc3YWU1IDEwMDY0NAotLS0gYS9saWIvaWd0X2ZiLmMKKysrIGIvbGliL2lndF9m
Yi5jCkBAIC03MCwxMCArNzAsMTQgQEAgc3RhdGljIHN0cnVjdCBmb3JtYXRfZGVzY19zdHJ1Y3Qg
ewogCWludCBwbGFuZXM7CiAJaW50IHBsYW5lX2JwcFs0XTsKIH0gZm9ybWF0X2Rlc2NbXSA9IHsK
KwlERihBUkdCMTU1NSwJSU5WQUxJRCwJYTFyNWc1YjUsCTE2LCAxNiksCisJREYoWFJHQjE1NTUs
CUlOVkFMSUQsCXgxcjVnNWI1LAkxNiwgMTYpLAogCURGKFJHQjU2NSwJUkdCMTZfNTY1LAlyNWc2
YjUsCQkxNiwgMTYpLAorCURGKEJHUjU2NSwJSU5WQUxJRCwJYjVnNnI1LAkJMTYsIDE2KSwKIAkv
L0RGKFJHQjg4OCwJSU5WQUxJRCwJcjhnOGI4LAkJMjQsIDI0KSwKIAlERihYUkdCODg4OCwJUkdC
MjQsCQl4OHI4ZzhiOCwJMzIsIDI0KSwKIAlERihYUkdCMjEwMTAxMCwJUkdCMzAsCQl4MnIxMGcx
MGIxMCwJMzIsIDMwKSwKKwlERihBQkdSODg4OCwJSU5WQUxJRCwJYThiOGc4cjgsCTMyLCAzMiks
CiAJREYoQVJHQjg4ODgsCUFSR0IzMiwJCWE4cjhnOGI4LAkzMiwgMzIpLAogCURGKE5WMTIsCVJH
QjI0LAkJaW52YWxpZCwJMzIsIC0xLCAyLCB7OCwgMTZ9KSwKIH07Ci0tIApnaXQtc2VyaWVzIDAu
OS4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
