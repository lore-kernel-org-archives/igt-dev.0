Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB8B8922A
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Sep 2018 16:00:50 +0000 (UTC)
From: Jyoti Yadav <jyoti.r.yadav@intel.com>
Date: Wed, 26 Sep 2018 11:59:20 -0400
Message-Id: <1537977563-18878-4-git-send-email-jyoti.r.yadav@intel.com>
In-Reply-To: <1537977563-18878-1-git-send-email-jyoti.r.yadav@intel.com>
References: <1537977563-18878-1-git-send-email-jyoti.r.yadav@intel.com>
Subject: [igt-dev] [PATCH i-g-t v1 3/6] [intel-gfx] tests/pm_dc : Added test
 to validate DC6 state on Gen11 platform. On Gen11 Platform,
 DC6 is achieved with PSR entry.
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
Cc: Jyoti Yadav <jyoti.r.yadav@intel.com>, anusha.srivatsa@intel.com, intel-gfx@lists.freedektop.org
List-ID: <igt-dev@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogSnlvdGkgWWFkYXYgPGp5b3RpLnIueWFkYXZAaW50ZWwuY29tPgotLS0K
IHRlc3RzL3BtX2RjLmMgfCAyMyArKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDIzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0cy9wbV9kYy5jIGIvdGVzdHMv
cG1fZGMuYwppbmRleCBkYjM4Y2NmLi5iNjA5ZmFkIDEwMDY0NAotLS0gYS90ZXN0cy9wbV9kYy5j
CisrKyBiL3Rlc3RzL3BtX2RjLmMKQEAgLTEzMiw2ICsxMzIsMjAgQEAgc3RhdGljIHVpbnQzMl90
IHJlYWRfZGMzX2RjNV9jb3VudGVyKHVpbnQzMl90IGRldl9pZCkKIAlyZXR1cm4gZGMzX2RjNV9j
b3VudDsKIH0KIAorc3RhdGljIHVpbnQzMl90IHJlYWRfZGM1X2RjNl9jb3VudGVyKHVpbnQzMl90
IGRldl9pZCkKK3sKKwl1aW50MzJfdCBkYzVfZGM2X2NvdW50OworCisJaWYgKElTX1NLWUxBS0Uo
ZGV2X2lkKSB8fCBJU19JQ0VMQUtFKGRldl9pZCkpCisJCWRjNV9kYzZfY291bnQgPSBJTlJFRyhT
S0xfQ1NSX0RDNV9EQzZfQ09VTlQpOworCWVsc2UgeworCQlpZ3Rfd2FybigiQ3VycmVudGx5IERD
NiBzdXBwb3J0IGlzIGZvciBJQ0wsIFNLTCBQbGF0Zm9ybSAoJXMpXG4iLAorCQkJX19mdW5jX18p
OworCQlyZXR1cm4gLUVQRVJNOworCX0KKwlyZXR1cm4gZGM1X2RjNl9jb3VudDsKK30KKwogc3Rh
dGljIHZvaWQgdGVzdF9kYzUoZGF0YV90ICpkYXRhKQogewogCXVpbnQzMl90IGRjM19kYzVfY291
bnRlcl9iZWZvcmVfcHNyLCBkYzNfZGM1X2NvdW50ZXJfYWZ0ZXJfcHNyOwpAQCAtMTQ3LDYgKzE2
MSw3IEBAIHN0YXRpYyB2b2lkIHRlc3RfZGM1KGRhdGFfdCAqZGF0YSkKIGludCBtYWluKGludCBh
cmdjLCBjaGFyICphcmd2W10pCiB7CiAJZGF0YV90IGRhdGEgPSB7fTsKKwl1aW50MzJfdCBkYzVf
ZGM2X2NvdW50ZXJfYmVmb3JlX3BzciwgZGM1X2RjNl9jb3VudGVyX2FmdGVyX3BzcjsKIAogCWln
dF9za2lwX29uX3NpbXVsYXRpb24oKTsKIAlpZ3RfZml4dHVyZSB7CkBAIC0xNzAsNiArMTg1LDE0
IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAJCXRlc3RfZGM1KCZkYXRhKTsK
IAkJY2xlYW51cCgmZGF0YSk7CiAJfQorCWlndF9zdWJ0ZXN0KCJEQzZfc3RhdGVfb25fZ2VuMTEi
KSB7CisJCWRjNV9kYzZfY291bnRlcl9iZWZvcmVfcHNyID0gcmVhZF9kYzVfZGM2X2NvdW50ZXIo
ZGF0YS5kZXZpZCk7CisJCXRlc3RfZGM1KCZkYXRhKTsKKwkJZGM1X2RjNl9jb3VudGVyX2FmdGVy
X3BzciA9IHJlYWRfZGM1X2RjNl9jb3VudGVyKGRhdGEuZGV2aWQpOworCQlpZ3RfcmVxdWlyZV9m
KGRjNV9kYzZfY291bnRlcl9hZnRlcl9wc3IgPiBkYzVfZGM2X2NvdW50ZXJfYmVmb3JlX3BzciwK
KwkJCQkiREM2IFN0YXRlIGlzIG5vdCBhY2hpZXZlZFxuIik7CisJCWNsZWFudXAoJmRhdGEpOwor
CX0KIAlpZ3RfZml4dHVyZSB7CiAJCXBzcl9kaXNhYmxlKGRhdGEuZGVidWdmc19mZCk7CiAJCWNs
b3NlKGRhdGEuZGVidWdmc19mZCk7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pZ3QtZGV2Cg==
