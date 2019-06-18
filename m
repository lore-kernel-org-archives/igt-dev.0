Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986C46E14A
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2019 12:55:28 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Tue, 18 Jun 2019 15:55:43 +0300
Message-Id: <20190618125543.646-2-simon.ser@intel.com>
In-Reply-To: <20190618125543.646-1-simon.ser@intel.com>
References: <20190618125543.646-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_chamelium: fix read from
 uninitialized value in flatline audio test
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
Cc: martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

c3RyZWFrIGlzbid0IGluaXRpYWxpemVkLCB3aGljaCBtYWtlcyB0aGUgdGVzdCBmYWlsIGluIHRo
ZSBjYXNlIGluIHdoaWNoIGl0J3MKbm90IHplcm8gYnkgY2hhbmNlLiBUaGlzIGJ1ZyBoYXMgYmVl
biBzZWVuIGluIHByb2R1Y3Rpb27ihKIuCgpTaWduZWQtb2ZmLWJ5OiBTaW1vbiBTZXIgPHNpbW9u
LnNlckBpbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX2NoYW1lbGl1bS5jIHwgMSArCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfY2hhbWVsaXVt
LmMgYi90ZXN0cy9rbXNfY2hhbWVsaXVtLmMKaW5kZXggOTQ0MzhlOWFlMGZjLi4zNzgwMjRkOGZk
MDUgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19jaGFtZWxpdW0uYworKysgYi90ZXN0cy9rbXNfY2hh
bWVsaXVtLmMKQEAgLTEyMzcsNiArMTIzNyw3IEBAIHN0YXRpYyBib29sIHRlc3RfYXVkaW9fZmxh
dGxpbmUoc3RydWN0IGF1ZGlvX3N0YXRlICpzdGF0ZSkKIAlyZWN2ID0gTlVMTDsKIAlyZWN2X2xl
biA9IDA7CiAJYW1wX3N1Y2Nlc3MgPSBmYWxzZTsKKwlzdHJlYWsgPSAwOwogCXdoaWxlICghYW1w
X3N1Y2Nlc3MgJiYgc3RhdGUtPm1zZWMgPCBBVURJT19USU1FT1VUKSB7CiAJCWF1ZGlvX3N0YXRl
X3JlY2VpdmUoc3RhdGUsICZyZWN2LCAmcmVjdl9sZW4pOwogCi0tIAoyLjIyLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
