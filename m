Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from 13.mo1.mail-out.ovh.net (13.mo1.mail-out.ovh.net
 [178.33.253.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF1689650
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2019 00:50:51 +0000 (UTC)
Received: from player728.ha.ovh.net (unknown [10.109.160.39])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id A8BCD166EE3
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2019 02:32:36 +0200 (CEST)
From: Andi Shyti <andi@etezian.org>
Date: Fri, 12 Apr 2019 03:32:07 +0300
Message-Id: <20190412003210.18762-4-andi@etezian.org>
In-Reply-To: <20190412003210.18762-1-andi@etezian.org>
References: <20190412003210.18762-1-andi@etezian.org>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v20 3/6] lib: igt_gt: add eb flags to class helper
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
dC4KClN1Z2dlc3RlZC1ieTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNv
bT4KU2lnbmVkLW9mZi1ieTogQW5kaSBTaHl0aSA8YW5kaS5zaHl0aUBpbnRlbC5jb20+ClJldmll
d2VkLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgotLS0KIGxp
Yi9pZ3RfZ3QuYyB8IDE4ICsrKysrKysrKysrKysrKysrKwogbGliL2lndF9ndC5oIHwgIDIgKysK
IDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3Rf
Z3QuYyBiL2xpYi9pZ3RfZ3QuYwppbmRleCA1OTk5NTI0MzI2ZDAuLjhjZDU4ZjdhZmJmZCAxMDA2
NDQKLS0tIGEvbGliL2lndF9ndC5jCisrKyBiL2xpYi9pZ3RfZ3QuYwpAQCAtNDEsNiArNDEsNyBA
QAogI2luY2x1ZGUgImludGVsX3JlZy5oIgogI2luY2x1ZGUgImludGVsX2NoaXBzZXQuaCIKICNp
bmNsdWRlICJpZ3RfZHVtbXlsb2FkLmgiCisjaW5jbHVkZSAiaTkxNS9nZW1fZW5naW5lX3RvcG9s
b2d5LmgiCiAKIC8qKgogICogU0VDVElPTjppZ3RfZ3QKQEAgLTU4Niw2ICs1ODcsMjMgQEAgY29u
c3Qgc3RydWN0IGludGVsX2V4ZWN1dGlvbl9lbmdpbmUyIGludGVsX2V4ZWN1dGlvbl9lbmdpbmVz
MltdID0gewogCXsgfQogfTsKIAoraW50IGdlbV9lYl90b19jbGFzcyh1bnNpZ25lZCBpbnQgZmxh
Z3MpCit7CisJc3dpdGNoIChmbGFncyAmIDB4M2YpIHsKKwkJY2FzZSBJOTE1X0VYRUNfREVGQVVM
VDoKKwkJY2FzZSBJOTE1X0VYRUNfUkVOREVSOgorCQkJcmV0dXJuIEk5MTVfRU5HSU5FX0NMQVNT
X1JFTkRFUjsKKwkJY2FzZSBJOTE1X0VYRUNfQkxUOgorCQkJcmV0dXJuIEk5MTVfRU5HSU5FX0NM
QVNTX0NPUFk7CisJCWNhc2UgSTkxNV9FWEVDX0JTRDoKKwkJCXJldHVybiBJOTE1X0VOR0lORV9D
TEFTU19WSURFTzsKKwkJY2FzZSBJOTE1X0VYRUNfVkVCT1g6CisJCQlyZXR1cm4gSTkxNV9FTkdJ
TkVfQ0xBU1NfVklERU9fRU5IQU5DRTsKKwkJZGVmYXVsdDoKKwkJCWlndF9hc3NlcnQoMCk7CisJ
fQorfQorCiB1bnNpZ25lZCBpbnQKIGdlbV9jbGFzc19pbnN0YW5jZV90b19lYl9mbGFncyhpbnQg
Z2VtX2ZkLAogCQkJICAgICAgIGVudW0gZHJtX2k5MTVfZ2VtX2VuZ2luZV9jbGFzcyBjbGFzcywK
ZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZ3QuaCBiL2xpYi9pZ3RfZ3QuaAppbmRleCA1MmIyZjFlYTk1
YTUuLmIxMzA2MmVmN2QzMyAxMDA2NDQKLS0tIGEvbGliL2lndF9ndC5oCisrKyBiL2xpYi9pZ3Rf
Z3QuaApAQCAtOTksNiArOTksOCBAQCBleHRlcm4gY29uc3Qgc3RydWN0IGludGVsX2V4ZWN1dGlv
bl9lbmdpbmUyIHsKIAlib29sIGlzX3ZpcnR1YWw7CiB9IGludGVsX2V4ZWN1dGlvbl9lbmdpbmVz
MltdOwogCitpbnQgZ2VtX2ViX3RvX2NsYXNzKHVuc2lnbmVkIGludCBmbGFncyk7CisKIHVuc2ln
bmVkIGludAogZ2VtX2NsYXNzX2luc3RhbmNlX3RvX2ViX2ZsYWdzKGludCBnZW1fZmQsCiAJCQkg
ICAgICAgZW51bSBkcm1faTkxNV9nZW1fZW5naW5lX2NsYXNzIGNsYXNzLAotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1h
aWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
