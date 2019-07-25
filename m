Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53EDE6E82E
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2019 20:36:14 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Thu, 25 Jul 2019 13:33:53 -0700
Message-Id: <20190725203354.6757-4-lucas.demarchi@intel.com>
In-Reply-To: <20190725203354.6757-1-lucas.demarchi@intel.com>
References: <20190725203354.6757-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 4/5] i915/gem_mocs_settings: fix global MOCS on
 gen 11
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

R2VuIDExIHN0aWxsIGhhcyB0aGUgcGVyLWNvbnRleHQgTU9DUyB0YWJsZS4gSXQncyBnZW4gMTIg
YW5kIGxhdGVyIHRoYXQKb25seSBoYXMgYSBnbG9iYWwgTU9DUyB0YWJsZSBhdmFpbGFibGUgc28g
aXQgZG9lc24ndCBtYWtlIHNlbnNlIHRvIHRlc3QKZGlydHlpbmcgaXQgcGVyIGNvbnRleHQuCgpT
aWduZWQtb2ZmLWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4K
LS0tCiB0ZXN0cy9pOTE1L2dlbV9tb2NzX3NldHRpbmdzLmMgfCA1ICsrKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3Rz
L2k5MTUvZ2VtX21vY3Nfc2V0dGluZ3MuYyBiL3Rlc3RzL2k5MTUvZ2VtX21vY3Nfc2V0dGluZ3Mu
YwppbmRleCBlM2RhODUxNS4uOWVjMGIxMjIgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2k5MTUvZ2VtX21v
Y3Nfc2V0dGluZ3MuYworKysgYi90ZXN0cy9pOTE1L2dlbV9tb2NzX3NldHRpbmdzLmMKQEAgLTQ4
MywxMiArNDgzLDEzIEBAIHN0YXRpYyB2b2lkIHJ1bl90ZXN0KGludCBmZCwgdW5zaWduZWQgZW5n
aW5lLCB1bnNpZ25lZCBmbGFncywgdW5zaWduZWQgbW9kZSkKIAl1aW50MzJfdCBjdHhfY2xlYW5f
aWQ7CiAJdWludDMyX3QgY3R4X2RpcnR5X2lkOwogCi0JLyogQXMgbW9jcyBpcyBnbG9iYWwgZm9y
IEdFTjExKywgdHJ5aW5nIHByaXZpbGVnZWQgd3JpdGUgdG8gZGlydHkKKwkvKgorCSAqIEFzIG1v
Y3MgaXMgZ2xvYmFsIGZvciBHRU4xMissIHRyeWluZyBwcml2aWxlZ2VkIHdyaXRlIHRvIGRpcnR5
CiAJICogdGhlIG1vY3MgYW5kIHRlc3RpbmcgY29udGV4dCBzYXZlIGFuZCByZXN0b3JlIG9mIG1v
Y3MgYmV0d2VlbgogCSAqIGNvbnRleHRzIGlzIGJvdW5kIHRvIGZhaWwuCiAJICovCiAJaWYgKGZs
YWdzICYgTU9DU19ESVJUWV9WQUxVRVMpCi0JCWlndF9za2lwX29uKGludGVsX2dlbihpbnRlbF9n
ZXRfZHJtX2RldmlkKGZkKSkgPj0gMTEpOworCQlpZ3Rfc2tpcF9vbihpbnRlbF9nZW4oaW50ZWxf
Z2V0X2RybV9kZXZpZChmZCkpID49IDEyKTsKIAogCWdlbV9yZXF1aXJlX3JpbmcoZmQsIGVuZ2lu
ZSk7CiAKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
