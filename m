Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0743891CB
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2019 15:44:03 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a9so87939wrp.6
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2019 08:44:03 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 25 Apr 2019 16:43:34 +0100
Message-Id: <20190425154334.31695-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/igt_kms: drop unneeded
 drmModeAtomicSetCursor() call
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
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KCkN1cnJlbnRs
eSB3ZSBhbGxvY2F0ZSBhIHN0YXRlIGFuZCBzZXQgdGhlIHN0YXRlIGN1cnNvciB0byAwLiBUaGUg
bGF0dGVyCmlzIG5vdCBuZWVkZWQgc2luY2UgaXQncyBhbHJlYWR5IHplcm8uCgpTaWduZWQtb2Zm
LWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgotLS0KUGxlYXNl
IHB1c2ggdGhpcyBmb3IgbWUgaWYgcGF0Y2ggbG9va3MgZ29vZC4gIEkgaGF2ZSBjb21taXQgYWNj
ZXNzLCB5ZXQKYW0gcmVhbGx5IHNob3J0IG9uIHRpbWUgYXQgdGhlIG1vbWVudCA6LSgKLS0tCiBs
aWIvaWd0X2ttcy5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2xpYi9pZ3Rfa21zLmMgYi9saWIvaWd0X2ttcy5jCmluZGV4IGRmOWFhZmQyLi5kZTMx
MDA0MiAxMDA2NDQKLS0tIGEvbGliL2lndF9rbXMuYworKysgYi9saWIvaWd0X2ttcy5jCkBAIC0z
Mjc0LDcgKzMyNzQsNiBAQCBzdGF0aWMgaW50IGlndF9hdG9taWNfY29tbWl0KGlndF9kaXNwbGF5
X3QgKmRpc3BsYXksIHVpbnQzMl90IGZsYWdzLCB2b2lkICp1c2VyXwogCWlmIChkaXNwbGF5LT5p
c19hdG9taWMgIT0gMSkKIAkJcmV0dXJuIC0xOwogCXJlcSA9IGRybU1vZGVBdG9taWNBbGxvYygp
OwotCWRybU1vZGVBdG9taWNTZXRDdXJzb3IocmVxLCAwKTsKIAogCWZvcl9lYWNoX3BpcGUoZGlz
cGxheSwgcGlwZSkgewogCQlpZ3RfcGlwZV90ICpwaXBlX29iaiA9ICZkaXNwbGF5LT5waXBlc1tw
aXBlXTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
