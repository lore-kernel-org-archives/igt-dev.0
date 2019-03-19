Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF8E89762
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Mar 2019 10:58:12 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id i17so3652828pfo.6
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Mar 2019 03:58:12 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Tue, 19 Mar 2019 12:57:58 +0200
Message-Id: <1552993078-16293-2-git-send-email-juhapekka.heikkila@gmail.com>
In-Reply-To: <1552993078-16293-1-git-send-email-juhapekka.heikkila@gmail.com>
References: <1552993078-16293-1-git-send-email-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/igt_kms: reset plane alpha and
 blend in igt_plane_reset()
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

cGxhbmUgYWxwaGEgYW5kIGJsZW5kIHdvdWxkIGFmZmVjdCBvdGhlciB0ZXN0cyBpZiBsZWZ0Cmlu
IHVuZXhwZWN0ZWQgc3RhdGVzCgp2MiAodmlsbGUgc3lyasOkbMOkKTogdXNlICJQcmUtbXVsdGlw
bGllZCIgYXMgZGVmYXVsdCBmb3IKSUdUX1BMQU5FX1BJWEVMX0JMRU5EX01PREUuCgpTaWduZWQt
b2ZmLWJ5OiBKdWhhLVBla2thIEhlaWtraWxhIDxqdWhhcGVra2EuaGVpa2tpbGFAZ21haWwuY29t
PgotLS0KIGxpYi9pZ3Rfa21zLmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9saWIvaWd0X2ttcy5jIGIvbGliL2lndF9rbXMuYwppbmRl
eCBlMWVhY2MxLi5jNzg4MzA4IDEwMDY0NAotLS0gYS9saWIvaWd0X2ttcy5jCisrKyBiL2xpYi9p
Z3Rfa21zLmMKQEAgLTE3ODEsNiArMTc4MSwxMyBAQCBzdGF0aWMgdm9pZCBpZ3RfcGxhbmVfcmVz
ZXQoaWd0X3BsYW5lX3QgKnBsYW5lKQogCWlmIChpZ3RfcGxhbmVfaGFzX3Byb3AocGxhbmUsIElH
VF9QTEFORV9ST1RBVElPTikpCiAJCWlndF9wbGFuZV9zZXRfcHJvcF92YWx1ZShwbGFuZSwgSUdU
X1BMQU5FX1JPVEFUSU9OLCBJR1RfUk9UQVRJT05fMCk7CiAKKwlpZiAoaWd0X3BsYW5lX2hhc19w
cm9wKHBsYW5lLCBJR1RfUExBTkVfUElYRUxfQkxFTkRfTU9ERSkpCisJCWlndF9wbGFuZV9zZXRf
cHJvcF9lbnVtKHBsYW5lLCBJR1RfUExBTkVfUElYRUxfQkxFTkRfTU9ERSwgIlByZS1tdWx0aXBs
aWVkIik7CisKKwlpZiAoaWd0X3BsYW5lX2hhc19wcm9wKHBsYW5lLCBJR1RfUExBTkVfQUxQSEEp
KQorCQlpZ3RfcGxhbmVfc2V0X3Byb3BfdmFsdWUocGxhbmUsIElHVF9QTEFORV9BTFBIQSwgMHhm
ZmZmKTsKKworCiAJaWd0X3BsYW5lX2NsZWFyX3Byb3BfY2hhbmdlZChwbGFuZSwgSUdUX1BMQU5F
X0lOX0ZFTkNFX0ZEKTsKIAlwbGFuZS0+dmFsdWVzW0lHVF9QTEFORV9JTl9GRU5DRV9GRF0gPSB+
MFVMTDsKIAlwbGFuZS0+Z2VtX2hhbmRsZSA9IDA7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
