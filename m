Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1B18919D
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Aug 2018 13:13:58 +0000 (UTC)
From: Katarzyna Dec <katarzyna.dec@intel.com>
Date: Wed, 29 Aug 2018 15:13:49 +0200
Message-Id: <20180829131349.9702-1-katarzyna.dec@intel.com>
Subject: [igt-dev] [PATCH i-g-t] lib/igt_sysfs: Return errno from
 igt_sysfs_printf
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

TGV0J3MgYWRkIHJldHVybmluZyBlcnJubyBvbiBmYWlsdXJlIGluc3RlYWQgb2YgLTEuCgpTaWdu
ZWQtb2ZmLWJ5OiBLYXRhcnp5bmEgRGVjIDxrYXRhcnp5bmEuZGVjQGludGVsLmNvbT4KQ2M6IERh
bmllbGUgQ2VyYW9sbyBTcHVyaW8gPGRhbmllbGUuY2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+Ci0t
LQogbGliL2lndF9zeXNmcy5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9zeXNmcy5jIGIvbGliL2ln
dF9zeXNmcy5jCmluZGV4IDhlZmU4ODliLi42Y2M3YmE0NCAxMDA2NDQKLS0tIGEvbGliL2lndF9z
eXNmcy5jCisrKyBiL2xpYi9pZ3Rfc3lzZnMuYwpAQCAtNDE3LDcgKzQxNyw3IEBAIGludCBpZ3Rf
c3lzZnNfdnByaW50ZihpbnQgZGlyLCBjb25zdCBjaGFyICphdHRyLCBjb25zdCBjaGFyICpmbXQs
IHZhX2xpc3QgYXApCiAgKiBwcmludGYoKSB3cmFwcGVyIGZvciBzeXNmcy4KICAqCiAgKiBSZXR1
cm5zOgotICogTnVtYmVyIG9mIGNoYXJhY3RlcnMgd3JpdHRlbiwgbmVnYXRpdmUgdmFsdWUgb24g
ZXJyb3IuCisgKiBOdW1iZXIgb2YgY2hhcmFjdGVycyB3cml0dGVuLCBlcnJubyBvbiBlcnJvci4K
ICAqLwogaW50IGlndF9zeXNmc19wcmludGYoaW50IGRpciwgY29uc3QgY2hhciAqYXR0ciwgY29u
c3QgY2hhciAqZm10LCAuLi4pCiB7CkBAIC00MjcsNiArNDI3LDggQEAgaW50IGlndF9zeXNmc19w
cmludGYoaW50IGRpciwgY29uc3QgY2hhciAqYXR0ciwgY29uc3QgY2hhciAqZm10LCAuLi4pCiAJ
dmFfc3RhcnQoYXAsIGZtdCk7CiAJcmV0ID0gaWd0X3N5c2ZzX3ZwcmludGYoZGlyLCBhdHRyLCBm
bXQsIGFwKTsKIAl2YV9lbmQoYXApOworCWlmIChyZXQgPCAwKQorCQlyZXR1cm4gZXJybm87CiAK
IAlyZXR1cm4gcmV0OwogfQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXYK
