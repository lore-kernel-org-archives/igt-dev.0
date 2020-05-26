Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7A16E10B
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2020 08:15:03 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 26 May 2020 10:14:49 +0200
Message-Id: <20200526081451.2045-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200526081451.2045-1-zbigniew.kempczynski@intel.com>
References: <20200526081451.2045-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/5] lib/intel_batchbuffer: Change media vme
 function prototype
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

V2UgZG9uJ3QgdXNlIGludGVsX2JhdGNoYnVmZmVyIGFuZCBpZ3RfYnVmIHNvIGZ1bmN0aW9uIHBy
b3RvdHlwZQppcyByZXF1aXJlZCB0byBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBL
ZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4KQ2M6IENocmlzIFdp
bHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotLS0KIGxpYi9pbnRlbF9iYXRjaGJ1ZmZl
ci5oIHwgNyArKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9pbnRlbF9iYXRjaGJ1ZmZlci5oIGIvbGliL2ludGVs
X2JhdGNoYnVmZmVyLmgKaW5kZXggZTdhYzU4ZmEuLjE2MmU3ZjBjIDEwMDY0NAotLS0gYS9saWIv
aW50ZWxfYmF0Y2hidWZmZXIuaAorKysgYi9saWIvaW50ZWxfYmF0Y2hidWZmZXIuaApAQCAtNDAz
LDEwICs0MDMsMTEgQEAgaWd0X2ZpbGxmdW5jX3QgaWd0X2dldF9ncGdwdV9maWxsZnVuYyhpbnQg
ZGV2aWQpOwogaWd0X2ZpbGxmdW5jX3YyX3QgaWd0X2dldF9ncGdwdV9maWxsZnVuY192MihpbnQg
ZGV2aWQpOwogaWd0X2ZpbGxmdW5jX3YyX3QgaWd0X2dldF9tZWRpYV9maWxsZnVuY192MihpbnQg
ZGV2aWQpOwogCi10eXBlZGVmIHZvaWQgKCppZ3Rfdm1lX2Z1bmNfdCkoc3RydWN0IGludGVsX2Jh
dGNoYnVmZmVyICpiYXRjaCwKLQkJCSAgICAgICBjb25zdCBzdHJ1Y3QgaWd0X2J1ZiAqc3JjLAor
dHlwZWRlZiB2b2lkICgqaWd0X3ZtZV9mdW5jX3QpKGludCBpOTE1LAorCQkJICAgICAgIHVpbnQz
Ml90IGN0eCwKKwkJCSAgICAgICBzdHJ1Y3QgaW50ZWxfYnVmICpzcmMsCiAJCQkgICAgICAgdW5z
aWduZWQgaW50IHdpZHRoLCB1bnNpZ25lZCBpbnQgaGVpZ2h0LAotCQkJICAgICAgIGNvbnN0IHN0
cnVjdCBpZ3RfYnVmICpkc3QpOworCQkJICAgICAgIHN0cnVjdCBpbnRlbF9idWYgKmRzdCk7CiAK
IGlndF92bWVfZnVuY190IGlndF9nZXRfbWVkaWFfdm1lX2Z1bmMoaW50IGRldmlkKTsKIAotLSAK
Mi4yNi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
