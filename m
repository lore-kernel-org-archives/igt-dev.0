Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C19D89E2C
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2019 12:27:39 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 23 May 2019 15:27:16 +0300
Message-Id: <20190523122727.6932-25-petri.latvala@intel.com>
In-Reply-To: <20190523122727.6932-1-petri.latvala@intel.com>
References: <20190523122727.6932-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 25/36] kms_flip: Nuke custom main function
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

U2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Ci0t
LQogdGVzdHMva21zX2ZsaXAuYyB8IDExICstLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19mbGlw
LmMgYi90ZXN0cy9rbXNfZmxpcC5jCmluZGV4IDhjMTdjOGRhLi5kN2MxZjljZiAxMDA3NTUKLS0t
IGEvdGVzdHMva21zX2ZsaXAuYworKysgYi90ZXN0cy9rbXNfZmxpcC5jCkBAIC0xNDgxLDcgKzE0
ODEsNyBAQCBzdGF0aWMgdm9pZCB0ZXN0X25vbmJsb2NraW5nX3JlYWQoaW50IGluKQogCWNsb3Nl
KGZkKTsKIH0KIAotaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQoraWd0X21haW4KIHsK
IAlzdHJ1Y3QgewogCQlpbnQgZHVyYXRpb247CkBAIC0xNTMwLDggKzE1MzAsNiBAQCBpbnQgbWFp
bihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAJfTsKIAlpbnQgaTsKIAotCWlndF9zdWJ0ZXN0X2lu
aXQoYXJnYywgYXJndik7Ci0KIAlpZ3RfZml4dHVyZSB7CiAJCWRybV9mZCA9IGRybV9vcGVuX2Ry
aXZlcl9tYXN0ZXIoRFJJVkVSX0FOWSk7CiAKQEAgLTE1OTEsMTEgKzE1ODksNCBAQCBpbnQgbWFp
bihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAJCQlydW5fcGFpcih0ZXN0c1tpXS5kdXJhdGlvbiwg
dGVzdHNbaV0uZmxhZ3MpOwogCX0KIAlpZ3Rfc3RvcF9zaWduYWxfaGVscGVyKCk7Ci0KLQkvKgot
CSAqIExldCBkcm1fZmQgbGVhaywgc2luY2UgaXQncyBuZWVkZWQgYnkgdGhlIGRwbXMgcmVzdG9y
ZQotCSAqIGV4aXRfaGFuZGxlciBhbmQgaWd0X2V4aXQoKSB3b24ndCByZXR1cm4uCi0JICovCi0K
LQlpZ3RfZXhpdCgpOwogfQotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXY=
