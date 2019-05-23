Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC01589E2B
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2019 12:27:38 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 23 May 2019 15:27:01 +0300
Message-Id: <20190523122727.6932-10-petri.latvala@intel.com>
In-Reply-To: <20190523122727.6932-1-petri.latvala@intel.com>
References: <20190523122727.6932-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 10/36] i915/gem_pwrite_pread: Nuke custom
 main function
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIG9iamVjdCBzaXplIHBhcmFtZXRlciwgcHJldmlvdXNseSBnb3R0ZW4gZnJvbSBhcmd2WzFd
LCBpcyBub3cgdGhlCnBhcmFtZXRlciAtcy4KClNpZ25lZC1vZmYtYnk6IFBldHJpIExhdHZhbGEg
PHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgotLS0KIHRlc3RzL2k5MTUvZ2VtX3B3cml0ZV9wcmVh
ZC5jIHwgMjQgKysrKysrKysrKysrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5z
ZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9w
d3JpdGVfcHJlYWQuYyBiL3Rlc3RzL2k5MTUvZ2VtX3B3cml0ZV9wcmVhZC5jCmluZGV4IGY5MWZj
N2M0Li4zYTU4ZWFlNiAxMDA2NDQKLS0tIGEvdGVzdHMvaTkxNS9nZW1fcHdyaXRlX3ByZWFkLmMK
KysrIGIvdGVzdHMvaTkxNS9nZW1fcHdyaXRlX3ByZWFkLmMKQEAgLTI1MiwxOCArMjUyLDMwIEBA
IHN0YXRpYyBjb25zdCBjaGFyICpieXRlc19wZXJfc2VjKGNoYXIgKmJ1ZiwgZG91YmxlIHYpCiAK
IHVpbnQzMl90ICp0bXAsIHNyYywgZHN0OwogaW50IGZkOworaW50IG9iamVjdF9zaXplID0gMDsK
IAotaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQorc3RhdGljIGludCBvcHRfaGFuZGxl
cihpbnQgb3B0LCBpbnQgb3B0X2luZGV4LCB2b2lkICpkYXRhKQoreworCXN3aXRjaCAob3B0KSB7
CisJY2FzZSAncyc6CisJCW9iamVjdF9zaXplID0gYXRvaShvcHRhcmcpOworCQlicmVhazsKKwlk
ZWZhdWx0OgorCQlyZXR1cm4gSUdUX09QVF9IQU5ETEVSX0VSUk9SOworCX0KKworCXJldHVybiBJ
R1RfT1BUX0hBTkRMRVJfU1VDQ0VTUzsKK30KKworY29uc3QgY2hhciAqaGVscF9zdHIgPSAiICAt
c1x0T2JqZWN0IHNpemUgaW4gYnl0ZXNcbiI7CisKK2lndF9tYWluX2FyZ3MoInM6IiwgTlVMTCwg
aGVscF9zdHIsIG9wdF9oYW5kbGVyLCBOVUxMKQogewotCWludCBvYmplY3Rfc2l6ZSA9IDA7CiAJ
dWludDMyX3QgYnVmWzIwXTsKIAlpbnQgY291bnQ7CiAKLQlpZ3Rfc3VidGVzdF9pbml0KGFyZ2Ms
IGFyZ3YpOwogCWlndF9za2lwX29uX3NpbXVsYXRpb24oKTsKIAotCWlmIChhcmdjID4gMSkKLQkJ
b2JqZWN0X3NpemUgPSBhdG9pKGFyZ3ZbMV0pOwogCWlmIChvYmplY3Rfc2l6ZSA9PSAwKQogCQlv
YmplY3Rfc2l6ZSA9IE9CSkVDVF9TSVpFOwogCW9iamVjdF9zaXplID0gKG9iamVjdF9zaXplICsg
MykgJiAtNDsKQEAgLTQwNSw2ICs0MTcsNCBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFy
Z3YpCiAKIAkJY2xvc2UoZmQpOwogCX0KLQotCWlndF9leGl0KCk7CiB9Ci0tIAoyLjE5LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
