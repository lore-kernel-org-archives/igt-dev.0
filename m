Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111086F2FF
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jan 2019 12:50:40 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Thu, 10 Jan 2019 14:51:25 +0200
Message-Id: <20190110125125.26374-3-mika.kahola@intel.com>
In-Reply-To: <20190110125125.26374-1-mika.kahola@intel.com>
References: <20190110125125.26374-1-mika.kahola@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2 2/2] tests/kms_cursor_crc: Remove
 unnecessary waits for vblank
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
Cc: stanislav.lisovskiy@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

V2UgZG9uJ3QgbmVlZCB0byB3YWl0IGZvciB2YmxhbmtzIGFueW1vcmUgYXMga2VybmVsIGF0b21p
Y2FsbHkgdGFrZXMKY2FyZSBvZiB0aGVzZS4KCkJ1Z3ppbGxhOiBodHRwczovL2J1Z3MuZnJlZWRl
c2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDMyMzIKU2lnbmVkLW9mZi1ieTogTWlrYSBLYWhv
bGEgPG1pa2Eua2Fob2xhQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfY3Vyc29yX2NyYy5jIHwg
MiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMv
a21zX2N1cnNvcl9jcmMuYyBiL3Rlc3RzL2ttc19jdXJzb3JfY3JjLmMKaW5kZXggODNkYmUwYjcu
LjRmMmY3NzlkIDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfY3Vyc29yX2NyYy5jCisrKyBiL3Rlc3Rz
L2ttc19jdXJzb3JfY3JjLmMKQEAgLTE3MSw3ICsxNzEsNiBAQCBzdGF0aWMgdm9pZCBkb19zaW5n
bGVfdGVzdChkYXRhX3QgKmRhdGEsIGludCB4LCBpbnQgeSkKIAogCWlndF9kaXNwbGF5X2NvbW1p
dChkaXNwbGF5KTsKIAotCWlndF93YWl0X2Zvcl92YmxhbmsoZGF0YS0+ZHJtX2ZkLCBkYXRhLT5w
aXBlKTsKIAlpZ3RfcGlwZV9jcmNfc3RhcnQocGlwZV9jcmMpOwogCWlndF9waXBlX2NyY19nZXRf
c2luZ2xlKHBpcGVfY3JjLCAmY3JjKTsKIApAQCAtMjA1LDcgKzIwNCw2IEBAIHN0YXRpYyB2b2lk
IGRvX3NpbmdsZV90ZXN0KGRhdGFfdCAqZGF0YSwgaW50IHgsIGludCB5KQogCWlndF9wdXRfY2Fp
cm9fY3R4KGRhdGEtPmRybV9mZCwgJmRhdGEtPnByaW1hcnlfZmIsIGNyKTsKIAlpZ3RfZGlzcGxh
eV9jb21taXQoZGlzcGxheSk7CiAKLQlpZ3Rfd2FpdF9mb3JfdmJsYW5rKGRhdGEtPmRybV9mZCwg
ZGF0YS0+cGlwZSk7CiAJaWd0X3BpcGVfY3JjX2dldF9jdXJyZW50KGRhdGEtPmRybV9mZCwgcGlw
ZV9jcmMsICZyZWZfY3JjKTsKIAlpZ3RfYXNzZXJ0X2NyY19lcXVhbCgmY3JjLCAmcmVmX2NyYyk7
CiAJaWd0X3BpcGVfY3JjX3N0b3AocGlwZV9jcmMpOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdApp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
