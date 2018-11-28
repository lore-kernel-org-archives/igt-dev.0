Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D346E01F
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Nov 2018 22:52:44 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 28 Nov 2018 22:52:31 +0000
Message-Id: <20181128225231.29228-2-chris@chris-wilson.co.uk>
In-Reply-To: <20181128225231.29228-1-chris@chris-wilson.co.uk>
References: <20181128225231.29228-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] lib: Only require we have i915.reset
 module parameter for allow-hang
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

VG8gY29udHJvbCBoYW5nIGRldGVjdGlvbiwgd2UgbWFuaXB1bGF0ZSB0aGUgaTkxNS5yZXNldCBt
b2R1bGUKcGFyYW1ldGVyLiBIb3dldmVyLCB0byBiZSBuaWNlIHdlIHNob3VsZCBTS0lQIGlmIHdl
IGNhbm5vdCBtb2RpZnkgdGhlCnBhcmFtZXRlciBhcyBvcHBvc2VkIHRvIG91dHJpZ2h0IEZBSUxp
bmcuCgpSZWZlcmVuY2VzOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNn
aT9pZD0xMDg4OTEKU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxz
b24uY28udWs+Ci0tLQogbGliL2lndF9ndC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZ3QuYyBi
L2xpYi9pZ3RfZ3QuYwppbmRleCBhMjA2MTkyNDYuLjk2ODNiM2U1YSAxMDA2NDQKLS0tIGEvbGli
L2lndF9ndC5jCisrKyBiL2xpYi9pZ3RfZ3QuYwpAQCAtMTcwLDggKzE3MCw4IEBAIGlndF9oYW5n
X3QgaWd0X2FsbG93X2hhbmcoaW50IGZkLCB1bnNpZ25lZCBjdHgsIHVuc2lnbmVkIGZsYWdzKQog
CSAqLwogCWlndF9yZXF1aXJlX2dlbShmZCk7CiAKLQlpZ3RfYXNzZXJ0KGlndF9zeXNmc19zZXRf
cGFyYW1ldGVyCi0JCSAgIChmZCwgInJlc2V0IiwgIiVkIiwgSU5UX01BWCAvKiBhbnkgcmVzZXQg
bWV0aG9kICovKSk7CisJaWd0X3JlcXVpcmUoaWd0X3N5c2ZzX3NldF9wYXJhbWV0ZXIKKwkJICAg
IChmZCwgInJlc2V0IiwgIiVkIiwgSU5UX01BWCAvKiBhbnkgcmVzZXQgbWV0aG9kICovKSk7CiAK
IAlpZiAoIWlndF9jaGVja19ib29sZWFuX2Vudl92YXIoIklHVF9IQU5HIiwgdHJ1ZSkpCiAJCWln
dF9za2lwKCJoYW5nIGluamVjdGlvbiBkaXNhYmxlZCBieSB1c2VyIik7Ci0tIAoyLjIwLjAucmMx
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
