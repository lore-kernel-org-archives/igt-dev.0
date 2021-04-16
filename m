Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCAC6ECA6
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Apr 2021 17:53:30 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri, 16 Apr 2021 20:53:11 +0300
Message-Id: <20210416175312.25190-6-ville.syrjala@linux.intel.com>
In-Reply-To: <20210416175312.25190-1-ville.syrjala@linux.intel.com>
References: <20210416175312.25190-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/6] tests/kms_flip_scaled_crc: Check that
 the plane supports the format+modifier
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCk9u
IHNvbWUgZ2VuOSBwbGF0Zm9ybXMgcGlwZSBDIGRvZXMgbm90IHN1cHBvcnQgY29tcHJlc3Npb24K
YXQgYWxsLiBTa2lwIHRoZSB0ZXN0IGluIHRoYXQgY2FzZS4KClNpZ25lZC1vZmYtYnk6IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogdGVzdHMva21z
X2ZsaXBfc2NhbGVkX2NyYy5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfZmxpcF9zY2FsZWRfY3JjLmMgYi90ZXN0cy9r
bXNfZmxpcF9zY2FsZWRfY3JjLmMKaW5kZXggZTk0ZjA4M2M1YjlkLi44ODkxOWRlMmY0MjYgMTAw
NjQ0Ci0tLSBhL3Rlc3RzL2ttc19mbGlwX3NjYWxlZF9jcmMuYworKysgYi90ZXN0cy9rbXNfZmxp
cF9zY2FsZWRfY3JjLmMKQEAgLTE0Myw2ICsxNDMsMTIgQEAgc3RhdGljIHZvaWQgdGVzdF9mbGlw
X3RvX3NjYWxlZChkYXRhX3QgKmRhdGEsIHVpbnQzMl90IGluZGV4LCBlbnVtIHBpcGUgcGlwZSwK
IAlpZ3Rfb3V0cHV0X3NldF9waXBlKG91dHB1dCwgcGlwZSk7CiAKIAlwcmltYXJ5ID0gaWd0X291
dHB1dF9nZXRfcGxhbmVfdHlwZShvdXRwdXQsIERSTV9QTEFORV9UWVBFX1BSSU1BUlkpOworCWlm
ICghaWd0X3BsYW5lX2hhc19mb3JtYXRfbW9kKHByaW1hcnksIGRhdGEtPnNtYWxsX2ZiLmRybV9m
b3JtYXQsCisJCQkJICAgICAgZGF0YS0+c21hbGxfZmIubW9kaWZpZXIpIHx8CisJICAgICFpZ3Rf
cGxhbmVfaGFzX2Zvcm1hdF9tb2QocHJpbWFyeSwgZGF0YS0+YmlnX2ZiLmRybV9mb3JtYXQsCisJ
CQkJICAgICAgZGF0YS0+YmlnX2ZiLm1vZGlmaWVyKSkKKwkJcmV0dXJuOworCiAJaWd0X2Rpc3Bs
YXlfY29tbWl0X2F0b21pYygmZGF0YS0+ZGlzcGxheSwgRFJNX01PREVfQVRPTUlDX0FMTE9XX01P
REVTRVQsCiAJCQkJICBOVUxMKTsKIAlpZiAoZGF0YS0+cGlwZV9jcmMpIHsKLS0gCjIuMjYuMwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
