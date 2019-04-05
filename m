Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from 7.mo68.mail-out.ovh.net (7.mo68.mail-out.ovh.net
 [46.105.63.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D550F6E5CC
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2019 01:46:01 +0000 (UTC)
Received: from player738.ha.ovh.net (unknown [10.109.160.230])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 2FEB511F017
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2019 03:08:18 +0200 (CEST)
From: Andi Shyti <andi@etezian.org>
Date: Fri,  5 Apr 2019 04:07:35 +0300
Message-Id: <20190405010737.19111-6-andi@etezian.org>
In-Reply-To: <20190405010737.19111-1-andi@etezian.org>
References: <20190405010737.19111-1-andi@etezian.org>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v17 5/7] lib: igt_gt: add eb flags to class helper
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
To: IGT dev <igt-dev@lists.freedesktop.org>
Cc: Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogQW5kaSBTaHl0aSA8YW5kaS5zaHl0aUBpbnRlbC5jb20+Cgp3ZSBoYXZlIGEgImNsYXNz
L2luc3RhbmNlIHRvIGViIGZsYWdzIiBoZWxwZXIgYnV0IG5vdCB0aGUKb3Bwb3NpdGUsIGFkZCBp
dC4KClNpZ25lZC1vZmYtYnk6IEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlAaW50ZWwuY29tPgotLS0K
IGxpYi9pZ3RfZ3QuYyB8IDE2ICsrKysrKysrKysrKysrKysKIGxpYi9pZ3RfZ3QuaCB8ICAyICsr
CiAyIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9saWIvaWd0
X2d0LmMgYi9saWIvaWd0X2d0LmMKaW5kZXggNTk5OTUyNDMyNmQwLi4zN2EwMTBhMDVlY2QgMTAw
NjQ0Ci0tLSBhL2xpYi9pZ3RfZ3QuYworKysgYi9saWIvaWd0X2d0LmMKQEAgLTU4Niw2ICs1ODYs
MjIgQEAgY29uc3Qgc3RydWN0IGludGVsX2V4ZWN1dGlvbl9lbmdpbmUyIGludGVsX2V4ZWN1dGlv
bl9lbmdpbmVzMltdID0gewogCXsgfQogfTsKIAoraW50IGdlbV9lYl90b19jbGFzcyh1bnNpZ25l
ZCBpbnQgZmxhZ3MpCit7CisJc3dpdGNoIChmbGFncyAmIDB4M2YpIHsKKwkJY2FzZSBJOTE1X0VY
RUNfUkVOREVSOgorCQkJcmV0dXJuIEk5MTVfRU5HSU5FX0NMQVNTX1JFTkRFUjsKKwkJY2FzZSBJ
OTE1X0VYRUNfQkxUOgorCQkJcmV0dXJuIEk5MTVfRU5HSU5FX0NMQVNTX0NPUFk7CisJCWNhc2Ug
STkxNV9FWEVDX0JTRDoKKwkJCXJldHVybiBJOTE1X0VOR0lORV9DTEFTU19WSURFTzsKKwkJY2Fz
ZSBJOTE1X0VYRUNfVkVCT1g6CisJCQlyZXR1cm4gSTkxNV9FTkdJTkVfQ0xBU1NfVklERU9fRU5I
QU5DRTsKKwkJZGVmYXVsdDoKKwkJCWlndF9hc3NlcnQoMCk7CisJfQorfQorCiB1bnNpZ25lZCBp
bnQKIGdlbV9jbGFzc19pbnN0YW5jZV90b19lYl9mbGFncyhpbnQgZ2VtX2ZkLAogCQkJICAgICAg
IGVudW0gZHJtX2k5MTVfZ2VtX2VuZ2luZV9jbGFzcyBjbGFzcywKZGlmZiAtLWdpdCBhL2xpYi9p
Z3RfZ3QuaCBiL2xpYi9pZ3RfZ3QuaAppbmRleCA1MmIyZjFlYTk1YTUuLmIxMzA2MmVmN2QzMyAx
MDA2NDQKLS0tIGEvbGliL2lndF9ndC5oCisrKyBiL2xpYi9pZ3RfZ3QuaApAQCAtOTksNiArOTks
OCBAQCBleHRlcm4gY29uc3Qgc3RydWN0IGludGVsX2V4ZWN1dGlvbl9lbmdpbmUyIHsKIAlib29s
IGlzX3ZpcnR1YWw7CiB9IGludGVsX2V4ZWN1dGlvbl9lbmdpbmVzMltdOwogCitpbnQgZ2VtX2Vi
X3RvX2NsYXNzKHVuc2lnbmVkIGludCBmbGFncyk7CisKIHVuc2lnbmVkIGludAogZ2VtX2NsYXNz
X2luc3RhbmNlX3RvX2ViX2ZsYWdzKGludCBnZW1fZmQsCiAJCQkgICAgICAgZW51bSBkcm1faTkx
NV9nZW1fZW5naW5lX2NsYXNzIGNsYXNzLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2lndC1kZXY=
