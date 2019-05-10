Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 700708989C
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2019 14:45:44 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f204so2406273wme.0
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2019 07:45:44 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Date: Fri, 10 May 2019 16:44:53 +0200
Message-Id: <20190510144458.20113-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/6] lib: Check for -ETIME, not ETIME
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
Cc: Petri Latvala <petri.latvala@intel.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
List-ID: <igt-dev@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogVG9tZXUgVml6b3NvIDx0b21ldS52aXpvc29AY29sbGFib3JhLmNvbT4K
QWNrZWQtYnk6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgotLS0KIGxp
Yi9pZ3Rfc3luY29iai5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9zeW5jb2JqLmMgYi9saWIvaWd0X3N5
bmNvYmouYwppbmRleCBkOTExNGNhOGM0YzguLjBmZGRiOTdhZmZjZCAxMDA2NDQKLS0tIGEvbGli
L2lndF9zeW5jb2JqLmMKKysrIGIvbGliL2lndF9zeW5jb2JqLmMKQEAgLTIyMyw3ICsyMjMsNyBA
QCBzeW5jb2JqX3dhaXQoaW50IGZkLCB1aW50MzJfdCAqaGFuZGxlcywgdWludDMyX3QgY291bnQs
CiAJd2FpdC5wYWQgPSAwOwogCiAJcmV0ID0gX19zeW5jb2JqX3dhaXQoZmQsICZ3YWl0KTsKLQlp
ZiAocmV0ID09IEVUSU1FKQorCWlmIChyZXQgPT0gLUVUSU1FKQogCQlyZXR1cm4gZmFsc2U7CiAK
IAlpZ3RfYXNzZXJ0X2VxKHJldCwgMCk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldg==
