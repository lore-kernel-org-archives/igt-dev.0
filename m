Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm0-x241.google.com (mail-wm0-x241.google.com
 [IPv6:2a00:1450:400c:c09::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FCF6E439
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2018 11:25:25 +0000 (UTC)
Received: by mail-wm0-x241.google.com with SMTP id h74so124014wme.5
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2018 03:25:25 -0800 (PST)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Thu, 15 Feb 2018 11:25:15 +0000
Message-Id: <20180215112515.27434-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/perf_pmu: Log perf timestamp in
 semaphore wait tests
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
To: igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCldlIG5lZWQg
bW9yZSBkYXRhIHRvIGRlYnVnIHNwb3JhZGljIHRlc3QgZmFpbHVyZXMuCgpTaWduZWQtb2ZmLWJ5
OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgotLS0KIHRlc3RzL3Bl
cmZfcG11LmMgfCAxMiArKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvcGVyZl9wbXUuYyBiL3Rlc3Rz
L3BlcmZfcG11LmMKaW5kZXggYTc1MDFjYTVmN2E0Li43ZDljNDJkMTZhMDggMTAwNjQ0Ci0tLSBh
L3Rlc3RzL3BlcmZfcG11LmMKKysrIGIvdGVzdHMvcGVyZl9wbXUuYwpAQCAtNTYxLDcgKzU2MSw3
IEBAIHNlbWFfd2FpdChpbnQgZ2VtX2ZkLCBjb25zdCBzdHJ1Y3QgaW50ZWxfZXhlY3V0aW9uX2Vu
Z2luZTIgKmUsCiAJdW5zaWduZWQgbG9uZyBzbGVwdDsKIAl1aW50MzJfdCAqb2JqX3B0cjsKIAl1
aW50MzJfdCBiYXRjaFsxNl07Ci0JdWludDY0X3QgdmFsWzJdOworCXVpbnQ2NF90IHZhbFsyXSwg
dHNbMl07CiAJaW50IGZkOwogCiAJaWd0X3JlcXVpcmUoaW50ZWxfZ2VuKGludGVsX2dldF9kcm1f
ZGV2aWQoZ2VtX2ZkKSkgPj0gOCk7CkBAIC02MjksMTMgKzYyOSwxNSBAQCBzZW1hX3dhaXQoaW50
IGdlbV9mZCwgY29uc3Qgc3RydWN0IGludGVsX2V4ZWN1dGlvbl9lbmdpbmUyICplLAogCWlndF9h
c3NlcnRfZihpZ3Rfd2FpdChwbXVfcmVhZF9zaW5nbGUoZmQpICE9IHZhbFswXSwgMTAsIDEpLAog
CQkgICAgICJzYW1wbGluZyBmYWlsZWQgdG8gc3RhcnQgd2l0aGluZyAxMG1zIik7CiAKLQl2YWxb
MF0gPSBwbXVfcmVhZF9zaW5nbGUoZmQpOworCXZhbFswXSA9IF9fcG11X3JlYWRfc2luZ2xlKGZk
LCAmdHNbMF0pOwogCXNsZXB0ID0gbWVhc3VyZWRfdXNsZWVwKGJhdGNoX2R1cmF0aW9uX25zIC8g
MTAwMCk7CiAJaWYgKGZsYWdzICYgVEVTVF9UUkFJTElOR19JRExFKQogCQlvYmpfcHRyWzBdID0g
MTsKLQl2YWxbMV0gPSBwbXVfcmVhZF9zaW5nbGUoZmQpOwotCWlndF9kZWJ1Zygic2xlcHQgJS4z
Zm1zLCBzYW1wbGVkICUuM2Ztc1xuIiwKLQkJICBzbGVwdCoxZS02LCAodmFsWzFdIC0gdmFsWzBd
KSoxZS02KTsKKwl2YWxbMV0gPSBfX3BtdV9yZWFkX3NpbmdsZShmZCwgJnRzWzFdKTsKKwlpZ3Rf
ZGVidWcoInNsZXB0ICUuM2ZtcyAocGVyZiAlLjNmbXMpLCBzYW1wbGVkICUuM2Ztc1xuIiwKKwkJ
ICBzbGVwdCAqIDFlLTYsCisJCSAgKHRzWzFdIC0gdHNbMF0pICogMWUtNiwKKwkJICAodmFsWzFd
IC0gdmFsWzBdKSAqIDFlLTYpOwogCiAJb2JqX3B0clswXSA9IDE7CiAJZ2VtX3N5bmMoZ2VtX2Zk
LCBiYl9oYW5kbGUpOwotLSAKMi4xNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXYK
