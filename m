Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F4C6E239
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 20:15:57 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri, 31 Jan 2020 22:15:51 +0200
Message-Id: <20200131201554.12832-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/4] lib/igt_kms: Return the first overlay
 not the last one
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkZv
ciBzb21lIHJlYXNvbiBpZ3RfcGlwZV9nZXRfcGxhbmVfdHlwZSgpIHJldHVybnMgdGhlIGxhc3Qg
b3ZlcmxheQpwbGFuZSBpdCBjYW4gZmluZC4gSSdkIHByZWZlciBpdCB0byBkbyB0aGUgb3Bwb3Np
dGUgc2luY2Ugb24KSW50ZWwgaHcgdGhlIHNldCBvZiBmZWF0dXJlcyBzdXBwb3J0ZWQgYnkgdGhl
IHBsYW5lIGdlbmVyYWxseQpnb2VzIGRvd24gdGhlIGZ1cnRoZXIgdXAgeW91IGdvLgoKU2lnbmVk
LW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4K
LS0tCiBsaWIvaWd0X2ttcy5jIHwgOSArKysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9rbXMuYyBiL2xp
Yi9pZ3Rfa21zLmMKaW5kZXggZDIwZGFhYWQ3NzY0Li42NDVlNmM1NGMwNDEgMTAwNjQ0Ci0tLSBh
L2xpYi9pZ3Rfa21zLmMKKysrIGIvbGliL2lndF9rbXMuYwpAQCAtMjI5Myw5ICsyMjkzLDEyIEBA
IGlndF9wbGFuZV90ICppZ3RfcGlwZV9nZXRfcGxhbmVfdHlwZShpZ3RfcGlwZV90ICpwaXBlLCBp
bnQgcGxhbmVfdHlwZSkKIAkJcGxhbmVfaWR4ID0gcGlwZS0+cGxhbmVfcHJpbWFyeTsKIAkJYnJl
YWs7CiAJY2FzZSBEUk1fUExBTkVfVFlQRV9PVkVSTEFZOgotCQlmb3IoaSA9IDA7IGkgPCBwaXBl
LT5uX3BsYW5lczsgaSsrKQotCQkJaWYgKHBpcGUtPnBsYW5lc1tpXS50eXBlID09IERSTV9QTEFO
RV9UWVBFX09WRVJMQVkpCi0JCQkgICAgcGxhbmVfaWR4ID0gaTsKKwkJZm9yKGkgPSAwOyBpIDwg
cGlwZS0+bl9wbGFuZXM7IGkrKykgeworCQkJaWYgKHBpcGUtPnBsYW5lc1tpXS50eXBlID09IERS
TV9QTEFORV9UWVBFX09WRVJMQVkpIHsKKwkJCQlwbGFuZV9pZHggPSBpOworCQkJCWJyZWFrOwor
CQkJfQorCQl9CiAJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCWJyZWFrOwotLSAKMi4yNC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
