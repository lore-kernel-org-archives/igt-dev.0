Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D718489A1F
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2019 14:45:48 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id h4so8235396wre.7
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2019 07:45:48 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Date: Fri, 10 May 2019 16:44:56 +0200
Message-Id: <20190510144458.20113-4-tomeu.vizoso@collabora.com>
In-Reply-To: <20190510144458.20113-1-tomeu.vizoso@collabora.com>
References: <20190510144458.20113-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/6] lib: Add support for opening panfrost
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
Cc: Petri Latvala <petri.latvala@intel.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
List-ID: <igt-dev@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogVG9tZXUgVml6b3NvIDx0b21ldS52aXpvc29AY29sbGFib3JhLmNvbT4K
QWNrZWQtYnk6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgotLS0KIGxp
Yi9kcm10ZXN0LmMgfCAzICsrKwogbGliL2RybXRlc3QuaCB8IDEgKwogMiBmaWxlcyBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9saWIvZHJtdGVzdC5jIGIvbGliL2RybXRl
c3QuYwppbmRleCBjZTM4MDRmOWU5ZDEuLjI1ZjIwMzUzMDIzYiAxMDA2NDQKLS0tIGEvbGliL2Ry
bXRlc3QuYworKysgYi9saWIvZHJtdGVzdC5jCkBAIC0yMDYsNiArMjA2LDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBtb2R1bGUgewogfSBtb2R1bGVzW10gPSB7CiAJeyBEUklWRVJfQU1ER1BVLCAi
YW1kZ3B1IiB9LAogCXsgRFJJVkVSX0lOVEVMLCAiaTkxNSIsIG1vZHByb2JlX2k5MTUgfSwKKwl7
IERSSVZFUl9QQU5GUk9TVCwgInBhbmZyb3N0IiB9LAogCXsgRFJJVkVSX1YzRCwgInYzZCIgfSwK
IAl7IERSSVZFUl9WQzQsICJ2YzQiIH0sCiAJeyBEUklWRVJfVkdFTSwgInZnZW0iIH0sCkBAIC0z
NjYsNiArMzY3LDggQEAgc3RhdGljIGNvbnN0IGNoYXIgKmNoaXBzZXRfdG9fc3RyKGludCBjaGlw
c2V0KQogCQlyZXR1cm4gInZpcnRpbyI7CiAJY2FzZSBEUklWRVJfQU1ER1BVOgogCQlyZXR1cm4g
ImFtZGdwdSI7CisJY2FzZSBEUklWRVJfUEFORlJPU1Q6CisJCXJldHVybiAicGFuZnJvc3QiOwog
CWNhc2UgRFJJVkVSX0FOWToKIAkJcmV0dXJuICJhbnkiOwogCWRlZmF1bHQ6CmRpZmYgLS1naXQg
YS9saWIvZHJtdGVzdC5oIGIvbGliL2RybXRlc3QuaAppbmRleCA3MWQxOTdmM2E0MjkuLjZjNGMz
ODk5Y2IzMSAxMDA2NDQKLS0tIGEvbGliL2RybXRlc3QuaAorKysgYi9saWIvZHJtdGVzdC5oCkBA
IC00NCw2ICs0NCw3IEBACiAjZGVmaW5lIERSSVZFUl9WSVJUSU8JKDEgPDwgMykKICNkZWZpbmUg
RFJJVkVSX0FNREdQVQkoMSA8PCA0KQogI2RlZmluZSBEUklWRVJfVjNECSgxIDw8IDUpCisjZGVm
aW5lIERSSVZFUl9QQU5GUk9TVAkoMSA8PCA2KQogLyoKICAqIEV4Y2x1ZGUgRFJWRVJfVkdFTSBm
cm9tIERSSVZFUl9BTlkgc2luY2UgaWYgeW91IHJ1biBvbiBhIHN5c3RlbQogICogd2l0aCB2Z2Vt
IGFzIHdlbGwgYXMgYSBzdXBwb3J0ZWQgZHJpdmVyLCB5b3UgY2FuIGVuZCB1cCB3aXRoIGEKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
