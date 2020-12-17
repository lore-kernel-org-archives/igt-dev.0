Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D36916E426
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Dec 2020 16:27:11 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu, 17 Dec 2020 18:26:50 +0200
Message-Id: <20201217162703.20779-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20201217162703.20779-1-ville.syrjala@linux.intel.com>
References: <20201217162703.20779-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 01/14] tools/intel_display_poller: Fix
 TILEOFF vs. LINOFF for skl+
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCnNr
bCsgKGxpa2UgaHN3L2JkdykgYWx3YXlzIHVzZSB0aGUgVElMRU9GRiByZWdpc3RlciwgYW5kIG5l
dmVyCnRoZSBMSU5PRkYgcmVnaXN0ZXIuIExldCdzIHJlc3BlY3QgdGhhdC4KClNpZ25lZC1vZmYt
Ynk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQog
dG9vbHMvaW50ZWxfZGlzcGxheV9wb2xsZXIuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9pbnRlbF9k
aXNwbGF5X3BvbGxlci5jIGIvdG9vbHMvaW50ZWxfZGlzcGxheV9wb2xsZXIuYwppbmRleCBmNDc5
N2EyMDllOWEuLjE1ZGE4ZTc2ODAwMCAxMDA2NDQKLS0tIGEvdG9vbHMvaW50ZWxfZGlzcGxheV9w
b2xsZXIuYworKysgYi90b29scy9pbnRlbF9kaXNwbGF5X3BvbGxlci5jCkBAIC0xMjgsOSArMTI4
LDkgQEAgc3RhdGljIHVpbnQzMl90IGRzcG9mZnNldF9yZWcodWludDMyX3QgZGV2aWQsIGludCBw
aXBlKQogCWJvb2wgdXNlX3RpbGVvZmY7CiAJaW50IHBsYW5lID0gcGlwZV90b19wbGFuZShkZXZp
ZCwgcGlwZSk7CiAKLQlpZiAoSVNfR0VOMihkZXZpZCkgfHwgSVNfR0VOMyhkZXZpZCkpCisJaWYg
KGludGVsX2dlbihkZXZpZCkgPCA0KQogCQl1c2VfdGlsZW9mZiA9IGZhbHNlOwotCWVsc2UgaWYg
KElTX0hBU1dFTEwoZGV2aWQpIHx8IElTX0JST0FEV0VMTChkZXZpZCkpCisJZWxzZSBpZiAoSVNf
SEFTV0VMTChkZXZpZCkgfHwgSVNfQlJPQURXRUxMKGRldmlkKSB8fCBpbnRlbF9nZW4oZGV2aWQp
ID49IDkpCiAJCXVzZV90aWxlb2ZmID0gdHJ1ZTsKIAllbHNlCiAJCXVzZV90aWxlb2ZmID0gcmVh
ZF9yZWcoUElQRV9SRUcocGxhbmUsIERTUEFDTlRSKSkgJiBESVNQTEFZX1BMQU5FX1RJTEVEOwot
LSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
