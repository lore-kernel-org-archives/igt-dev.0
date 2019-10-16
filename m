Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8C06E954
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Oct 2019 12:03:02 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 16 Oct 2019 15:02:47 +0300
Message-Id: <20191016120247.5804-1-petri.latvala@intel.com>
In-Reply-To: <20191016111352.5212-4-petri.latvala@intel.com>
References: <20191016111352.5212-4-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 4/4] runner: Don't add timestamps when
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

RG9uJ3QgYWRkIHRpbWVzdGFtcHMgd2hlbiBwcmludGluZyB0aGF0IHdlIGNhbm5vdCBleGVjdXRl
IGEgYmluYXJ5CmZyb20gYSBjaGlsZCAocG9zdCBmb3JrLWZhaWxlZC1leGVjdikuIFRpbWVzdGFt
cHMgd2VyZSBtZWFudCBmb3IKcnVubmVyJ3MgZGlyZWN0IG91dHB1dCBvbmx5LCBhbmQgdGhpcyB3
YXMgYWNjaWRlbnRhbGx5IGNvbnZlcnRlZC4KCnYyOiBSZXBocmFzZSBjb21taXQgbWVzc2FnZSAo
QXJlaykKClNpZ25lZC1vZmYtYnk6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwu
Y29tPgpDYzogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPgotLS0K
IHJ1bm5lci9leGVjdXRvci5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcnVubmVyL2V4ZWN1dG9yLmMgYi9ydW5uZXIv
ZXhlY3V0b3IuYwppbmRleCAyYmI4MjgyNy4uYmE1OGZiMTcgMTAwNjQ0Ci0tLSBhL3J1bm5lci9l
eGVjdXRvci5jCisrKyBiL3J1bm5lci9leGVjdXRvci5jCkBAIC0xMDMyLDcgKzEwMzIsNyBAQCBl
eGVjdXRlX3Rlc3RfcHJvY2VzcyhpbnQgb3V0ZmQsIGludCBlcnJmZCwKIAl9CiAKIAlleGVjdihh
cmd2WzBdLCBhcmd2KTsKLQllcnJmKCJDYW5ub3QgZXhlY3V0ZSAlc1xuIiwgYXJndlswXSk7CisJ
ZnByaW50ZihzdGRlcnIsICJDYW5ub3QgZXhlY3V0ZSAlc1xuIiwgYXJndlswXSk7CiAJZXhpdChJ
R1RfRVhJVF9JTlZBTElEKTsKIH0KIAotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXY=
