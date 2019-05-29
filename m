Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C78ED6E0DB
 for <igt-dev@lists.freedesktop.org>; Wed, 29 May 2019 12:43:25 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Wed, 29 May 2019 15:45:06 +0300
Message-Id: <20190529124506.7335-1-mika.kahola@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_flip_tiling: Check for mode when
 performing flip with Y/Yf tiling
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
List-ID: <igt-dev@lists.freedesktop.org>

S2VybmVsIGRvZXNuJ3Qgc3VwcG9ydCBZIG9yIFlmIHRpbGluZyBmb3IgaW50ZXJsYWNlZCBtb2Rl
cy4gSW4ga21zX2ZsaXBfdGlsaW5nIHRlc3QgY2FzZQp3ZSBhcmUgbWlzc2luZyBzdWNoIGEgY2hl
Y2suIExldCdzIGFkZCBhIHJlcXVpcmVtZW50IHRoYXQgd2hlbmV2ZXIgd2UgdHJ5IHRvIGRvIGZs
aXAgd2l0aCBZL1lmCnRpbGluZywgd2UgZW5zdXJlIHRoYXQgd2UgaGF2ZSBub24taW50ZXJsYWNl
ZCBtb2RlIHNlbGVjdGVkLgoKQnVnemlsbGE6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcv
c2hvd19idWcuY2dpP2lkPTExMDc3MgoKU2lnbmVkLW9mZi1ieTogTWlrYSBLYWhvbGEgPG1pa2Eu
a2Fob2xhQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfZmxpcF90aWxpbmcuYyB8IDggKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0cy9r
bXNfZmxpcF90aWxpbmcuYyBiL3Rlc3RzL2ttc19mbGlwX3RpbGluZy5jCmluZGV4IGQxZTY2ODdm
Li41ODJhZjUzYyAxMDA2NDQKLS0tIGEvdGVzdHMva21zX2ZsaXBfdGlsaW5nLmMKKysrIGIvdGVz
dHMva21zX2ZsaXBfdGlsaW5nLmMKQEAgLTc1LDYgKzc1LDE0IEBAIHRlc3RfZmxpcF90aWxpbmco
ZGF0YV90ICpkYXRhLCBlbnVtIHBpcGUgcGlwZSwgaWd0X291dHB1dF90ICpvdXRwdXQsIHVpbnQ2
NF90IHRpCiAJaWd0X291dHB1dF9zZXRfcGlwZShvdXRwdXQsIHBpcGUpOwogCiAJbW9kZSA9IGln
dF9vdXRwdXRfZ2V0X21vZGUob3V0cHV0KTsKKworCS8qIEludGVybGFjZWQgbW9kZXMgZG9uJ3Qg
c3VwcG9ydCBZL1lmIHRpbGluZyAqLworCWlmICh0aWxpbmdbMF0gPT0gTE9DQUxfSTkxNV9GT1JN
QVRfTU9EX1lfVElMRUQgfHwKKwkgICAgdGlsaW5nWzBdID09IExPQ0FMX0k5MTVfRk9STUFUX01P
RF9ZZl9USUxFRCB8fAorCSAgICB0aWxpbmdbMV0gPT0gTE9DQUxfSTkxNV9GT1JNQVRfTU9EX1lf
VElMRUQgfHwKKwkgICAgdGlsaW5nWzFdID09IExPQ0FMX0k5MTVfRk9STUFUX01PRF9ZZl9USUxF
RCkKKwkJaWd0X3JlcXVpcmUoIShtb2RlLT5mbGFncyAmIERSTV9NT0RFX0ZMQUdfSU5URVJMQUNF
KSk7CisKIAlwcmltYXJ5ID0gaWd0X291dHB1dF9nZXRfcGxhbmUob3V0cHV0LCAwKTsKIAogCXdp
ZHRoID0gbW9kZS0+aGRpc3BsYXk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldg==
