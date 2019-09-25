Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF4B89817
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Sep 2019 13:09:44 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Wed, 25 Sep 2019 16:09:27 +0300
Message-Id: <20190925130931.29107-7-mika.kahola@intel.com>
In-Reply-To: <20190925130931.29107-1-mika.kahola@intel.com>
References: <20190925130931.29107-1-mika.kahola@intel.com>
Subject: [igt-dev] [PATCH RFC i-g-t 06/10] tests/kms_ccs: Add GEN12 CCS
 media compression format modifiers
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

QWRkIEdFTjEyIENDUyBmb3JtYXQgbW9kaWZpZXJzIGZvciBtZWRpYSBjb21wcmVzc2lvbi4KClNp
Z25lZC1vZmYtYnk6IE1pa2EgS2Fob2xhIDxtaWthLmthaG9sYUBpbnRlbC5jb20+Ci0tLQogdGVz
dHMva21zX2Njcy5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYg
LS1naXQgYS90ZXN0cy9rbXNfY2NzLmMgYi90ZXN0cy9rbXNfY2NzLmMKaW5kZXggY2RlNjI0MTYu
LjZkMmFlODQwIDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfY2NzLmMKKysrIGIvdGVzdHMva21zX2Nj
cy5jCkBAIC03Nyw2ICs3Nyw3IEBAIHN0YXRpYyBjb25zdCB1aW50NjRfdCBjY3NfbW9kaWZpZXJz
W10gPSB7CiAKIHN0YXRpYyBjb25zdCB1aW50NjRfdCBjY3NfZ2VuMTJfbW9kaWZpZXJzW10gPSB7
CiAJTE9DQUxfSTkxNV9GT1JNQVRfTU9EX1lfVElMRURfR0VOMTJfUkNfQ0NTLAorCUxPQ0FMX0k5
MTVfRk9STUFUX01PRF9ZX1RJTEVEX0dFTjEyX01DX0NDUywKIH07CiAKIC8qCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
