Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7C85B6F5A1
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jan 2019 09:06:40 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Fri, 11 Jan 2019 10:05:30 +0100
Message-Id: <20190111090532.19235-20-paul.kocialkowski@bootlin.com>
In-Reply-To: <20190111090532.19235-1-paul.kocialkowski@bootlin.com>
References: <20190111090532.19235-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 19/21] lib/igt_chamelium: Hook-in
 checkerboard comparison method in helpers
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
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBpbnRyb2R1Y2VzIHRoZSBjaGVja2VyYm9hcmQgY2hhbWVsaXVtIGNoZWNraW5nIHR5cGUg
YW5kIGhvb2tzIHRoZQpjYWxsIHRvIHRoZSBhc3NvY2lhdGVkIGlndF9mcmFtZSBtYXRjaGluZyBo
ZWxwZXIgaW4gdGhlIGZyYW1lIG1hdGNoCmNoYW1lbGl1bSBoZWxwZXIuCgpTaWduZWQtb2ZmLWJ5
OiBQYXVsIEtvY2lhbGtvd3NraSA8cGF1bC5rb2NpYWxrb3dza2lAYm9vdGxpbi5jb20+Ci0tLQog
bGliL2lndF9jaGFtZWxpdW0uYyB8IDQgKysrLQogbGliL2lndF9jaGFtZWxpdW0uaCB8IDEgKwog
MiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9saWIvaWd0X2NoYW1lbGl1bS5jIGIvbGliL2lndF9jaGFtZWxpdW0uYwppbmRleCAxNzMy
MWEyY2VmODkuLjczMTI1OWYyZjE5NiAxMDA2NDQKLS0tIGEvbGliL2lndF9jaGFtZWxpdW0uYwor
KysgYi9saWIvaWd0X2NoYW1lbGl1bS5jCkBAIC0xMTI3LDYgKzExMjcsOSBAQCB2b2lkIGNoYW1l
bGl1bV9hc3NlcnRfZnJhbWVfbWF0Y2hfb3JfZHVtcChzdHJ1Y3QgY2hhbWVsaXVtICpjaGFtZWxp
dW0sCiAJY2FzZSBDSEFNRUxJVU1fQ0hFQ0tfQU5BTE9HOgogCQltYXRjaCA9IGlndF9jaGVja19h
bmFsb2dfZnJhbWVfbWF0Y2gocmVmZXJlbmNlLCBjYXB0dXJlKTsKIAkJYnJlYWs7CisJY2FzZSBD
SEFNRUxJVU1fQ0hFQ0tfQ0hFQ0tFUkJPQVJEOgorCQltYXRjaCA9IGlndF9jaGVja19jaGVja2Vy
Ym9hcmRfZnJhbWVfbWF0Y2gocmVmZXJlbmNlLCBjYXB0dXJlKTsKKwkJYnJlYWs7CiAJZGVmYXVs
dDoKIAkJaWd0X2Fzc2VydChmYWxzZSk7CiAJfQpAQCAtMTE1NSw3ICsxMTU4LDYgQEAgdm9pZCBj
aGFtZWxpdW1fYXNzZXJ0X2ZyYW1lX21hdGNoX29yX2R1bXAoc3RydWN0IGNoYW1lbGl1bSAqY2hh
bWVsaXVtLAogCWNhaXJvX3N1cmZhY2VfZGVzdHJveShjYXB0dXJlKTsKIH0KIAotCiAvKioKICAq
IGNoYW1lbGl1bV9hbmFsb2dfZnJhbWVfY3JvcDoKICAqIEBjaGFtZWxpdW06IFRoZSBDaGFtZWxp
dW0gaW5zdGFuY2UgdG8gdXNlCmRpZmYgLS1naXQgYS9saWIvaWd0X2NoYW1lbGl1bS5oIGIvbGli
L2lndF9jaGFtZWxpdW0uaAppbmRleCAwNDJhYzAxOWNjZGIuLmQ2MTU5MzA3ZjI0MCAxMDA2NDQK
LS0tIGEvbGliL2lndF9jaGFtZWxpdW0uaAorKysgYi9saWIvaWd0X2NoYW1lbGl1bS5oCkBAIC00
Miw2ICs0Miw3IEBAIHN0cnVjdCBjaGFtZWxpdW1fZmJfY3JjX2FzeW5jX2RhdGE7CiAKIGVudW0g
Y2hhbWVsaXVtX2NoZWNrIHsKIAlDSEFNRUxJVU1fQ0hFQ0tfQU5BTE9HLAorCUNIQU1FTElVTV9D
SEVDS19DSEVDS0VSQk9BUkQsCiAJQ0hBTUVMSVVNX0NIRUNLX0NSQywKIH07CiAKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
