Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC30A897E8
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2019 15:25:39 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s15so25700344wra.12
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2019 08:25:39 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Date: Wed, 24 Apr 2019 17:25:07 +0200
Message-Id: <20190424152511.4304-2-tomeu.vizoso@collabora.com>
In-Reply-To: <20190424152511.4304-1-tomeu.vizoso@collabora.com>
References: <20190424152511.4304-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/5] lib: Check for -ETIME, not ETIME
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
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
List-ID: <igt-dev@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogVG9tZXUgVml6b3NvIDx0b21ldS52aXpvc29AY29sbGFib3JhLmNvbT4K
LS0tCiBsaWIvaWd0X3N5bmNvYmouYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3Rfc3luY29iai5jIGIvbGli
L2lndF9zeW5jb2JqLmMKaW5kZXggZDkxMTRjYThjNGM4Li4wZmRkYjk3YWZmY2QgMTAwNjQ0Ci0t
LSBhL2xpYi9pZ3Rfc3luY29iai5jCisrKyBiL2xpYi9pZ3Rfc3luY29iai5jCkBAIC0yMjMsNyAr
MjIzLDcgQEAgc3luY29ial93YWl0KGludCBmZCwgdWludDMyX3QgKmhhbmRsZXMsIHVpbnQzMl90
IGNvdW50LAogCXdhaXQucGFkID0gMDsKIAogCXJldCA9IF9fc3luY29ial93YWl0KGZkLCAmd2Fp
dCk7Ci0JaWYgKHJldCA9PSBFVElNRSkKKwlpZiAocmV0ID09IC1FVElNRSkKIAkJcmV0dXJuIGZh
bHNlOwogCiAJaWd0X2Fzc2VydF9lcShyZXQsIDApOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdApp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
