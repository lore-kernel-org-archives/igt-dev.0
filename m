Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56F789893
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2019 11:15:22 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id i17so1250234pfo.6
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2019 04:15:22 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Mon, 18 Mar 2019 13:15:10 +0200
Message-Id: <1552907710-4345-2-git-send-email-juhapekka.heikkila@gmail.com>
In-Reply-To: <1552907710-4345-1-git-send-email-juhapekka.heikkila@gmail.com>
References: <1552907710-4345-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/igt_kms: reset plane alpha and
 blend in igt_plane_reset()
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
List-ID: <igt-dev@lists.freedesktop.org>

cGxhbmUgYWxwaGEgYW5kIGJsZW5kIHdvdWxkIGFmZmVjdCBvdGhlciB0ZXN0cyBpZiBsZWZ0Cmlu
IHVuZXhwZWN0ZWQgc3RhdGVzCgpTaWduZWQtb2ZmLWJ5OiBKdWhhLVBla2thIEhlaWtraWxhIDxq
dWhhcGVra2EuaGVpa2tpbGFAZ21haWwuY29tPgotLS0KIGxpYi9pZ3Rfa21zLmMgfCA3ICsrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9saWIvaWd0
X2ttcy5jIGIvbGliL2lndF9rbXMuYwppbmRleCBlMWVhY2MxLi5jZGI1YWJhIDEwMDY0NAotLS0g
YS9saWIvaWd0X2ttcy5jCisrKyBiL2xpYi9pZ3Rfa21zLmMKQEAgLTE3ODEsNiArMTc4MSwxMyBA
QCBzdGF0aWMgdm9pZCBpZ3RfcGxhbmVfcmVzZXQoaWd0X3BsYW5lX3QgKnBsYW5lKQogCWlmIChp
Z3RfcGxhbmVfaGFzX3Byb3AocGxhbmUsIElHVF9QTEFORV9ST1RBVElPTikpCiAJCWlndF9wbGFu
ZV9zZXRfcHJvcF92YWx1ZShwbGFuZSwgSUdUX1BMQU5FX1JPVEFUSU9OLCBJR1RfUk9UQVRJT05f
MCk7CiAKKwlpZiAoaWd0X3BsYW5lX2hhc19wcm9wKHBsYW5lLCBJR1RfUExBTkVfUElYRUxfQkxF
TkRfTU9ERSkpCisJCWlndF9wbGFuZV9zZXRfcHJvcF9lbnVtKHBsYW5lLCBJR1RfUExBTkVfUElY
RUxfQkxFTkRfTU9ERSwgIk5vbmUiKTsKKworCWlmIChpZ3RfcGxhbmVfaGFzX3Byb3AocGxhbmUs
IElHVF9QTEFORV9BTFBIQSkpCisJCWlndF9wbGFuZV9zZXRfcHJvcF92YWx1ZShwbGFuZSwgSUdU
X1BMQU5FX0FMUEhBLCAweGZmZmYpOworCisKIAlpZ3RfcGxhbmVfY2xlYXJfcHJvcF9jaGFuZ2Vk
KHBsYW5lLCBJR1RfUExBTkVfSU5fRkVOQ0VfRkQpOwogCXBsYW5lLT52YWx1ZXNbSUdUX1BMQU5F
X0lOX0ZFTkNFX0ZEXSA9IH4wVUxMOwogCXBsYW5lLT5nZW1faGFuZGxlID0gMDsKLS0gCjIuNy40
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
