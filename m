Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9A76E3A0
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2019 14:57:38 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri,  8 Mar 2019 16:57:27 +0200
Message-Id: <20190308145728.18573-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20190308145728.18573-1-ville.syrjala@linux.intel.com>
References: <20190308145728.18573-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] tools/intel_vbt_decode: Check the
 number of bytes dumped for the mipi seq operation
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkNy
b3NzIGNoZWNrIHRoZSByZXR1cm4gdmFsdWUgZnJvbSB0aGUgbWlwaSBzZXEgZHVtcCBmdW5jdGlv
biBhbmQgdGhlCnNpemUgb2YgdGhlIG9wZXJhdGlvbiBkZWNsYXJlZCBpbiB0aGUgc2VxdWVuY2Ug
KGZvciB2Mysgc2VxdWVuY2UgYmxvY2spLgoKU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiB0b29scy9pbnRlbF92YnRfZGVj
b2RlLmMgfCA5ICsrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2ludGVsX3ZidF9kZWNvZGUuYyBiL3Rvb2xz
L2ludGVsX3ZidF9kZWNvZGUuYwppbmRleCAyYzcxZjA4NDZjMTUuLjU3NDIwODFlYTI5YSAxMDA2
NDQKLS0tIGEvdG9vbHMvaW50ZWxfdmJ0X2RlY29kZS5jCisrKyBiL3Rvb2xzL2ludGVsX3ZidF9k
ZWNvZGUuYwpAQCAtMTI4Niw3ICsxMjg2LDE0IEBAIHN0YXRpYyBjb25zdCB1aW50OF90ICpkdW1w
X3NlcXVlbmNlKGNvbnN0IHVpbnQ4X3QgKmRhdGEsIHVpbnQ4X3Qgc2VxX3ZlcnNpb24pCiAJCQlv
cGVyYXRpb25fc2l6ZSA9ICpkYXRhKys7CiAKIAkJaWYgKG1pcGlfZWxlbV9kdW1wKSB7Ci0JCQlk
YXRhID0gbWlwaV9lbGVtX2R1bXAoZGF0YSwgc2VxX3ZlcnNpb24pOworCQkJY29uc3QgdTggKm5l
eHQ7CisKKwkJCW5leHQgPSBtaXBpX2VsZW1fZHVtcChkYXRhLCBzZXFfdmVyc2lvbik7CisJCQlp
ZiAob3BlcmF0aW9uX3NpemUpCisJCQkJZGF0YSArPSBvcGVyYXRpb25fc2l6ZTsKKwkJCWVsc2UK
KwkJCQlkYXRhID0gbmV4dDsKKwkJCWFzc2VydChuZXh0ID09IGRhdGEpOwogCQl9IGVsc2UgaWYg
KG9wZXJhdGlvbl9zaXplKSB7CiAJCQkvKiBXZSBoYXZlIHNpemUsIHNraXAuICovCiAJCQlkYXRh
ICs9IG9wZXJhdGlvbl9zaXplOwotLSAKMi4xOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXY=
