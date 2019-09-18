Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E503E6EE93
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2019 09:59:22 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Wed, 18 Sep 2019 12:59:19 +0300
Message-Id: <20190918095919.12423-1-mika.kahola@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_prime: Fix compiler warning
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
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Rml4IGNvbXBpbGVyIHdhcm5pbmcgYWJvdXQKCi4uL3Rlc3RzL2ttc19wcmltZS5jOiBJbiBmdW5j
dGlvbiDigJhzZXR1cF9kaXNwbGF54oCZOgouLi90ZXN0cy9rbXNfcHJpbWUuYzo3NDoyOiB3YXJu
aW5nOiBJU08gQzkwIGZvcmJpZHMgbWl4ZWQgZGVjbGFyYXRpb25zIGFuZCBjb2RlIFstV2RlY2xh
cmF0aW9uLWFmdGVyLXN0YXRlbWVudF0KICBpZ3Rfb3V0cHV0X3QgKm91dHB1dCA9IGlndF9nZXRf
c2luZ2xlX291dHB1dF9mb3JfcGlwZShkaXNwbGF5LCBwaXBlKTsKClNpZ25lZC1vZmYtYnk6IE1p
a2EgS2Fob2xhIDxtaWthLmthaG9sYUBpbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX3ByaW1lLmMg
fCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfcHJpbWUuYyBiL3Rlc3RzL2ttc19wcmltZS5jCmluZGV4
IDE3NTk5NTczLi4zMjQxYzUxNCAxMDA2NDQKLS0tIGEvdGVzdHMva21zX3ByaW1lLmMKKysrIGIv
dGVzdHMva21zX3ByaW1lLmMKQEAgLTY5LDkgKzY5LDExIEBAIHN0YXRpYyBib29sIGhhc19wcmlt
ZV9leHBvcnQoaW50IGZkKQogc3RhdGljIGlndF9vdXRwdXRfdCAqc2V0dXBfZGlzcGxheShpbnQg
aW1wb3J0ZXJfZmQsIGlndF9kaXNwbGF5X3QgKmRpc3BsYXksCiAJCQkJICAgZW51bSBwaXBlIHBp
cGUpCiB7CisJaWd0X291dHB1dF90ICpvdXRwdXQ7CisKIAlpZ3RfZGlzcGxheV9yZXF1aXJlKGRp
c3BsYXksIGltcG9ydGVyX2ZkKTsKIAlpZ3Rfc2tpcF9vbihwaXBlID49IGRpc3BsYXktPm5fcGlw
ZXMpOwotCWlndF9vdXRwdXRfdCAqb3V0cHV0ID0gaWd0X2dldF9zaW5nbGVfb3V0cHV0X2Zvcl9w
aXBlKGRpc3BsYXksIHBpcGUpOworCW91dHB1dCA9IGlndF9nZXRfc2luZ2xlX291dHB1dF9mb3Jf
cGlwZShkaXNwbGF5LCBwaXBlKTsKIAogCWlndF9yZXF1aXJlX2Yob3V0cHV0LCAiTm8gY29ubmVj
dG9yIGZvdW5kIGZvciBwaXBlICVzXG4iLAogCQkgICAgICBrbXN0ZXN0X3BpcGVfbmFtZShwaXBl
KSk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
