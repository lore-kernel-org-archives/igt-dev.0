Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm0-x244.google.com (mail-wm0-x244.google.com
 [IPv6:2a00:1450:400c:c09::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36C76E610
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2018 14:00:26 +0000 (UTC)
Received: by mail-wm0-x244.google.com with SMTP id v71so23145849wmv.2
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2018 06:00:26 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 18 Jan 2018 14:59:55 +0100
Message-Id: <20180118135955.10739-5-daniel.vetter@ffwll.ch>
In-Reply-To: <20180118135955.10739-1-daniel.vetter@ffwll.ch>
References: <20180118135955.10739-1-daniel.vetter@ffwll.ch>
Subject: [igt-dev] [RFC PATCH 5/5] lib/core: report subtests that hit an
	igt_warning as WARNING
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBpcyBhbm90aGVyIHBpZWNlIG9mIHByZXAgd29yayB0byBwdXNoIHRoZSBkZXRlY3Rpb24g
b2YgZG1lc2cKd2FybmluZ3MgaW50byBpZ3QgaXRzZWxmLCBzbyB0aGF0IHdlIGNhbiBjb3JyZWN0
bHkgcmVwb3J0IGRtZXNnCmlzc3VlIG9uIGEgcGVyLXN1YnRlc3QgYmFzaXMgZXZlbiB3aGVuIHJ1
bm5pbmcgdGhlIGVudGlyZSBiaW5hcnkuCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGZmd2xsLmNoPgotLS0KIGxpYi9pZ3RfY29yZS5jIHwgNyArKysrKystCiAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvbGliL2lndF9jb3JlLmMgYi9saWIvaWd0X2NvcmUuYwppbmRleCA2NWIzOTQ1ODFlOGYuLmQ2
MWQzMjI5NWJiMiAxMDA2NDQKLS0tIGEvbGliL2lndF9jb3JlLmMKKysrIGIvbGliL2lndF9jb3Jl
LmMKQEAgLTEwMjEsNiArMTAyMSw3IEBAIHZvaWQgX19pZ3Rfc3VidGVzdF9ncm91cF9yZXN0b3Jl
KGludCBzYXZlKQogc3RhdGljIGJvb2wgc2tpcHBlZF9vbmUgPSBmYWxzZTsKIHN0YXRpYyBib29s
IHN1Y2NlZWRlZF9vbmUgPSBmYWxzZTsKIHN0YXRpYyBib29sIGZhaWxlZF9vbmUgPSBmYWxzZTsK
K3N0YXRpYyBib29sIHdhcm5lZCA9IGZhbHNlOwogCiBzdGF0aWMgdm9pZCBleGl0X3N1YnRlc3Qo
Y29uc3QgY2hhciAqKSBfX2F0dHJpYnV0ZV9fKChub3JldHVybikpOwogc3RhdGljIHZvaWQgZXhp
dF9zdWJ0ZXN0KGNvbnN0IGNoYXIgKnJlc3VsdCkKQEAgLTEwMzcsNiArMTAzOCw3IEBAIHN0YXRp
YyB2b2lkIGV4aXRfc3VidGVzdChjb25zdCBjaGFyICpyZXN1bHQpCiAJaWd0X3Rlcm1pbmF0ZV9z
cGluX2JhdGNoZXMoKTsKIAogCWluX3N1YnRlc3QgPSBOVUxMOworCXdhcm5lZCA9IGZhbHNlOwog
CXNpZ2xvbmdqbXAoaWd0X3N1YnRlc3Rfam1wYnVmLCAxKTsKIH0KIApAQCAtMTEyNiw3ICsxMTI4
LDcgQEAgdm9pZCBpZ3Rfc3VjY2Vzcyh2b2lkKQogewogCXN1Y2NlZWRlZF9vbmUgPSB0cnVlOwog
CWlmIChpbl9zdWJ0ZXN0KQotCQlleGl0X3N1YnRlc3QoIlNVQ0NFU1MiKTsKKwkJZXhpdF9zdWJ0
ZXN0KHdhcm5lZCA/ICJXQVJOSU5HIiA6ICJTVUNDRVNTIik7CiB9CiAKIC8qKgpAQCAtMjEyMCw2
ICsyMTIyLDkgQEAgdm9pZCBpZ3RfdmxvZyhjb25zdCBjaGFyICpkb21haW4sIGVudW0gaWd0X2xv
Z19sZXZlbCBsZXZlbCwgY29uc3QgY2hhciAqZm9ybWF0LAogCWlmIChsaXN0X3N1YnRlc3RzICYm
IGxldmVsIDw9IElHVF9MT0dfV0FSTikKIAkJcmV0dXJuOwogCisJaWYgKGxldmVsID49IElHVF9M
T0dfV0FSTikKKwkJd2FybmVkID0gdHJ1ZTsKKwogCWlmICh2YXNwcmludGYoJmxpbmUsIGZvcm1h
dCwgYXJncykgPT0gLTEpCiAJCXJldHVybjsKIAotLSAKMi4xNC4zCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
