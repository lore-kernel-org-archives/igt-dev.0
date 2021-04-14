Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A0089954
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Apr 2021 02:28:08 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Wed, 14 Apr 2021 05:27:50 +0300
Message-Id: <20210414022754.31710-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20210414022754.31710-1-ville.syrjala@linux.intel.com>
References: <20210414022754.31710-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/8] tools/intel_watermark: Reduce the
 number of planes for rkl/adls/adlp
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCk1v
ZGVybiBwbGF0Zm9ybXMgaGF2ZSBqdXN0IDUgdW5pdmVyc2FsIHBsYW5lcyArIGN1cnNvciBwZXIg
cGlwZS4uCgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGlu
dXguaW50ZWwuY29tPgotLS0KIHRvb2xzL2ludGVsX3dhdGVybWFyay5jIHwgOCArKysrKystLQog
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS90b29scy9pbnRlbF93YXRlcm1hcmsuYyBiL3Rvb2xzL2ludGVsX3dhdGVybWFyay5jCmlu
ZGV4IDRhNTc2NGI1OTY3Ny4uZmYzNzNmZGIwYzZkIDEwMDY0NAotLS0gYS90b29scy9pbnRlbF93
YXRlcm1hcmsuYworKysgYi90b29scy9pbnRlbF93YXRlcm1hcmsuYwpAQCAtMTM1LDcgKzEzNSw5
IEBAIHN0YXRpYyBpbnQgc2tsX251bV9wbGFuZXModWludDMyX3QgZCwgaW50IHBpcGUpCiB7CiAJ
aW50IGdlbiA9IGludGVsX2dlbihkKTsKIAotCWlmIChnZW4gPj0gMTEpCisJaWYgKGdlbiA+PSAx
MyB8fCBJU19BTERFUkxBS0VfUyhkKSB8fCBJU19ST0NLRVRMQUtFKGQpKQorCQlyZXR1cm4gNjsK
KwllbHNlIGlmIChnZW4gPj0gMTEpCiAJCXJldHVybiA4OwogCWVsc2UgaWYgKGdlbiA9PSAxMCB8
fCBJU19HRU1JTklMQUtFKGQpKQogCQlyZXR1cm4gNTsKQEAgLTE0OSw3ICsxNTEsOSBAQCBzdGF0
aWMgaW50IHNrbF9tYXhfcGxhbmVzKHVpbnQzMl90IGQpCiB7CiAJaW50IGdlbiA9IGludGVsX2dl
bihkKTsKIAotCWlmIChnZW4gPj0gMTEpCisJaWYgKGdlbiA+PSAxMyB8fCBJU19BTERFUkxBS0Vf
UyhkKSB8fCBJU19ST0NLRVRMQUtFKGQpKQorCQlyZXR1cm4gNjsKKwllbHNlIGlmIChnZW4gPj0g
MTEpCiAJCXJldHVybiA4OwogCWVsc2UgaWYgKGdlbiA9PSAxMCB8fCBJU19HRU1JTklMQUtFKGQp
IHx8IElTX0JST1hUT04oZCkpCiAJCXJldHVybiA1OwotLSAKMi4yNi4zCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdApp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
