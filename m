Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268FA6E529
 for <igt-dev@lists.freedesktop.org>; Sat, 16 Mar 2019 09:25:22 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sat, 16 Mar 2019 09:25:05 +0000
Message-Id: <20190316092505.19820-2-chris@chris-wilson.co.uk>
In-Reply-To: <20190316092505.19820-1-chris@chris-wilson.co.uk>
References: <20190316092505.19820-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] i915/pm_rpm: Enable ftrace logging
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

U2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0t
LQogdGVzdHMvaTkxNS9pOTE1X3BtX3JwbS5jIHwgOSArKysrKysrKy0KIDEgZmlsZSBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1
L2k5MTVfcG1fcnBtLmMgYi90ZXN0cy9pOTE1L2k5MTVfcG1fcnBtLmMKaW5kZXggNzU5Yzc2ZWFm
Li5iNWU1ZjYzY2EgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2k5MTUvaTkxNV9wbV9ycG0uYworKysgYi90
ZXN0cy9pOTE1L2k5MTVfcG1fcnBtLmMKQEAgLTQ2LDYgKzQ2LDcgQEAKICNpbmNsdWRlIDxkcm0u
aD4KIAogI2luY2x1ZGUgImlndC5oIgorI2luY2x1ZGUgImlndF9mdHJhY2UuaCIKICNpbmNsdWRl
ICJpZ3Rfa21vZC5oIgogI2luY2x1ZGUgImlndF9zeXNmcy5oIgogI2luY2x1ZGUgImlndF9kZWJ1
Z2ZzLmgiCkBAIC0xOTc1LDggKzE5NzYsMTAgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFy
Z3ZbXSkKIAkvKiBTa2lwIGluc3RlYWQgb2YgZmFpbGluZyBpbiBjYXNlIHRoZSBtYWNoaW5lIGlz
IG5vdCBwcmVwYXJlZCB0byByZWFjaAogCSAqIFBDOCsuIFdlIGRvbid0IHdhbnQgYnVnIHJlcG9y
dHMgZnJvbSBjYXNlcyB3aGVyZSB0aGUgbWFjaGluZSBpcyBqdXN0CiAJICogbm90IHByb3Blcmx5
IGNvbmZpZ3VyZWQuICovCi0JaWd0X2ZpeHR1cmUKKwlpZ3RfZml4dHVyZSB7CisJCWlndF9mdHJh
Y2VfZW5hYmxlKCk7CiAJCWlndF9yZXF1aXJlKHNldHVwX2Vudmlyb25tZW50KCkpOworCX0KIAog
CWlmIChzdGF5KQogCQlpZ3Rfc3VidGVzdCgic3RheSIpCkBAIC0yMTE4LDUgKzIxMjEsOSBAQCBp
bnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogCQlpZ3RfaTkxNV9kcml2ZXJfdW5sb2Fk
KCk7CiAJfQogCisJaWd0X2ZpeHR1cmUgeworCQlpZ3RfZnRyYWNlX2Rpc2FibGUoKTsKKwl9CisK
IAlpZ3RfZXhpdCgpOwogfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXY=
