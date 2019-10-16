Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46FE6E082
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Oct 2019 11:13:58 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 16 Oct 2019 14:13:52 +0300
Message-Id: <20191016111352.5212-4-petri.latvala@intel.com>
In-Reply-To: <20191016111352.5212-1-petri.latvala@intel.com>
References: <20191016111352.5212-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/4] runner: Don't add timestamps when
 cannot exec a test
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

V2hlbiBhZGRpbmcgdGltZXN0YW1wcyB0byB3aGF0ZXZlciBydW5uZXIgcHJpbnRzLCB0aGUgZXJy
b3IgcHJpbnQKIkNhbm5vdCBleGVjdXRlICRiaW5hcnkiIHdhcyBtaXN0YWtlbmx5IGFsc28gc3Rh
bXBlZC4gVGhhdCdzIG5vdApnZXR0aW5nIHByaW50ZWQgYnkgdGhlIHJ1bm5lciwgaXQncyBnZXR0
aW5nIHByaW50ZWQgYnkgInRoZSB0ZXN0CmV4ZWN1dGVkIi4KClNpZ25lZC1vZmYtYnk6IFBldHJp
IExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgotLS0KIHJ1bm5lci9leGVjdXRvci5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvcnVubmVyL2V4ZWN1dG9yLmMgYi9ydW5uZXIvZXhlY3V0b3IuYwppbmRleCAy
YmI4MjgyNy4uYmE1OGZiMTcgMTAwNjQ0Ci0tLSBhL3J1bm5lci9leGVjdXRvci5jCisrKyBiL3J1
bm5lci9leGVjdXRvci5jCkBAIC0xMDMyLDcgKzEwMzIsNyBAQCBleGVjdXRlX3Rlc3RfcHJvY2Vz
cyhpbnQgb3V0ZmQsIGludCBlcnJmZCwKIAl9CiAKIAlleGVjdihhcmd2WzBdLCBhcmd2KTsKLQll
cnJmKCJDYW5ub3QgZXhlY3V0ZSAlc1xuIiwgYXJndlswXSk7CisJZnByaW50ZihzdGRlcnIsICJD
YW5ub3QgZXhlY3V0ZSAlc1xuIiwgYXJndlswXSk7CiAJZXhpdChJR1RfRVhJVF9JTlZBTElEKTsK
IH0KIAotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
