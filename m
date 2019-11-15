Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF4C6E5E8
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2019 13:15:32 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri, 15 Nov 2019 15:15:20 +0200
Message-Id: <20191115131520.9872-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20191115131520.9872-1-ville.syrjala@linux.intel.com>
References: <20191115131520.9872-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/4] tests/kms_invalid_mode: Allow the test
 on !i915
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
ZSBvbmx5IGk5MTUgc3BlY2lmaWMgc3VidGVzdHMgaXMgdGhlIG1heCBkb3RjbG9jayBjaGVjaywK
c28gbGV0J3MgYWRkIHRoZSBpOTE1IGNoZWNrIHRoZXJlIGFuZCBzd2l0Y2ggZnJvbSBEUklWRVJf
SU5URUwKdG8gRFJJVkVSX0FOWSBzbyB0aGF0IHRoZSBvdGhlciBzdWJ0ZXN0cyBjYW4gcnVuIGV2
ZXJ5d2hlcmUuCgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFA
bGludXguaW50ZWwuY29tPgotLS0KIHRlc3RzL2ttc19pbnZhbGlkX21vZGUuYyB8IDUgKysrKy0K
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS90ZXN0cy9rbXNfaW52YWxpZF9tb2RlLmMgYi90ZXN0cy9rbXNfaW52YWxpZF9tb2RlLmMK
aW5kZXggOWI5NGI5ZmFjZTRhLi42ZGU3MGExNDg1YWQgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19p
bnZhbGlkX21vZGUuYworKysgYi90ZXN0cy9rbXNfaW52YWxpZF9tb2RlLmMKQEAgLTE3NCw2ICsx
NzQsOSBAQCBzdGF0aWMgaW50IGk5MTVfbWF4X2RvdGNsb2NrKGRhdGFfdCAqZGF0YSkKIAljaGFy
ICpzOwogCWludCBtYXhfZG90Y2xvY2sgPSAwOwogCisJaWYgKCFpc19pOTE1X2RldmljZShkYXRh
LT5kcm1fZmQpKQorCQlyZXR1cm4gMDsKKwogCWlndF9kZWJ1Z2ZzX3JlYWQoZGF0YS0+ZHJtX2Zk
LCAiaTkxNV9mcmVxdWVuY3lfaW5mbyIsIGJ1Zik7CiAJcyA9IHN0cnN0cihidWYsICJNYXggcGl4
ZWwgY2xvY2sgZnJlcXVlbmN5OiIpOwogCWlndF9hc3NlcnQocyk7CkBAIC0yMjMsNyArMjI2LDcg
QEAgaWd0X21haW4KIAlpZ3RfZml4dHVyZSB7CiAJCWlndF9za2lwX29uX3NpbXVsYXRpb24oKTsK
IAotCQlkYXRhLmRybV9mZCA9IGRybV9vcGVuX2RyaXZlcl9tYXN0ZXIoRFJJVkVSX0lOVEVMKTsK
KwkJZGF0YS5kcm1fZmQgPSBkcm1fb3Blbl9kcml2ZXJfbWFzdGVyKERSSVZFUl9BTlkpOwogCQlp
Z3RfcmVxdWlyZV9pbnRlbChkYXRhLmRybV9mZCk7CiAKIAkJa21zdGVzdF9zZXRfdnRfZ3JhcGhp
Y3NfbW9kZSgpOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXY=
