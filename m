Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83D0897EB
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2019 15:25:44 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id h4so25739976wre.7
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2019 08:25:44 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Date: Wed, 24 Apr 2019 17:25:10 +0200
Message-Id: <20190424152511.4304-5-tomeu.vizoso@collabora.com>
In-Reply-To: <20190424152511.4304-1-tomeu.vizoso@collabora.com>
References: <20190424152511.4304-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/5] lib: Add support for opening panfrost
 devices
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
LS0tCiBsaWIvZHJtdGVzdC5jIHwgNSArKysrLQogbGliL2RybXRlc3QuaCB8IDEgKwogMiBmaWxl
cyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9s
aWIvZHJtdGVzdC5jIGIvbGliL2RybXRlc3QuYwppbmRleCA0YTkyZmI1YzNjNDEuLjA5NWMwYTI5
NDVkMCAxMDA2NDQKLS0tIGEvbGliL2RybXRlc3QuYworKysgYi9saWIvZHJtdGVzdC5jCkBAIC0x
OTgsMTMgKzE5OCwxNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1vZHVsZSB7CiAJY29uc3QgY2hh
ciAqbW9kdWxlOwogCXZvaWQgKCptb2Rwcm9iZSkoY29uc3QgY2hhciAqbmFtZSk7CiB9IG1vZHVs
ZXNbXSA9IHsKKwkvKiBUaGlzIGxpc3QgbmVlZHMgdG8gYmUga2VwdCBpbiBhbHBoYWJldGljYWwg
b3JkZXIgKi8KIAl7IERSSVZFUl9BTURHUFUsICJhbWRncHUiIH0sCiAJeyBEUklWRVJfSU5URUws
ICJpOTE1IiwgbW9kcHJvYmVfaTkxNSB9LAorCXsgRFJJVkVSX1BBTkZST1NULCAicGFuZnJvc3Qi
IH0sCiAJeyBEUklWRVJfVjNELCAidjNkIiB9LAogCXsgRFJJVkVSX1ZDNCwgInZjNCIgfSwKIAl7
IERSSVZFUl9WR0VNLCAidmdlbSIgfSwKIAl7IERSSVZFUl9WSVJUSU8sICJ2aXJ0aW8tZ3B1IiB9
LAotCXsgRFJJVkVSX1ZJUlRJTywgInZpcnRpb19ncHUiIH0sCiAJe30KIH07CiAKQEAgLTM2MSw2
ICszNjIsOCBAQCBzdGF0aWMgY29uc3QgY2hhciAqY2hpcHNldF90b19zdHIoaW50IGNoaXBzZXQp
CiAJCXJldHVybiAidmlydGlvIjsKIAljYXNlIERSSVZFUl9BTURHUFU6CiAJCXJldHVybiAiYW1k
Z3B1IjsKKwljYXNlIERSSVZFUl9QQU5GUk9TVDoKKwkJcmV0dXJuICJwYW5mcm9zdCI7CiAJY2Fz
ZSBEUklWRVJfQU5ZOgogCQlyZXR1cm4gImFueSI7CiAJZGVmYXVsdDoKZGlmZiAtLWdpdCBhL2xp
Yi9kcm10ZXN0LmggYi9saWIvZHJtdGVzdC5oCmluZGV4IDcxZDE5N2YzYTQyOS4uNmM0YzM4OTlj
YjMxIDEwMDY0NAotLS0gYS9saWIvZHJtdGVzdC5oCisrKyBiL2xpYi9kcm10ZXN0LmgKQEAgLTQ0
LDYgKzQ0LDcgQEAKICNkZWZpbmUgRFJJVkVSX1ZJUlRJTwkoMSA8PCAzKQogI2RlZmluZSBEUklW
RVJfQU1ER1BVCSgxIDw8IDQpCiAjZGVmaW5lIERSSVZFUl9WM0QJKDEgPDwgNSkKKyNkZWZpbmUg
RFJJVkVSX1BBTkZST1NUCSgxIDw8IDYpCiAvKgogICogRXhjbHVkZSBEUlZFUl9WR0VNIGZyb20g
RFJJVkVSX0FOWSBzaW5jZSBpZiB5b3UgcnVuIG9uIGEgc3lzdGVtCiAgKiB3aXRoIHZnZW0gYXMg
d2VsbCBhcyBhIHN1cHBvcnRlZCBkcml2ZXIsIHlvdSBjYW4gZW5kIHVwIHdpdGggYQotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
