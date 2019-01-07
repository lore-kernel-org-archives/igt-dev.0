Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE6F6EE0B
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jan 2019 19:11:18 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Mon,  7 Jan 2019 11:10:52 -0800
Message-Id: <20190107191056.22759-4-jose.souza@intel.com>
In-Reply-To: <20190107191056.22759-1-jose.souza@intel.com>
References: <20190107191056.22759-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/8] tests/fbcon_fbt: Allow fbcon to bind
 when running this test
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

OWM0MTE0ZWM1ZDg3IChsaWI6IEFsd2F5cyB1bmJpbmQgdGhlIGZiY29uIGFyb3VuZCBpZ3QpIGJy
b2tlCmZiY29uX2ZidCB0ZXN0IGFzIGZiY29uIGlzIG5vdCBhbGxvd2QgdG8gYmluZCB3aGVuIGV4
ZWN1dGluZyBhbnkgSUdUCnRlc3QsIHNvIGxldHMgYWxsb3cgaXQgYWdhaW4ganVzdCBmb3IgdGhp
cyB0ZXN0LgoKQ2M6IFBhdWxvIFphbm9uaSA8cGF1bG8uci56YW5vbmlAaW50ZWwuY29tPgpDYzog
RGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5jb20+CkNjOiBS
b2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+CkNjOiBDaHJpcyBXaWxzb24gPGNo
cmlzQGNocmlzLXdpbHNvbi5jby51az4KU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBkZSBT
b3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX2ZiY29uX2ZidC5jIHwg
NyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
dGVzdHMva21zX2ZiY29uX2ZidC5jIGIvdGVzdHMva21zX2ZiY29uX2ZidC5jCmluZGV4IDNkYjYw
YzBkLi5mZmM0NDUxOSAxMDA2NDQKLS0tIGEvdGVzdHMva21zX2ZiY29uX2ZidC5jCisrKyBiL3Rl
c3RzL2ttc19mYmNvbl9mYnQuYwpAQCAtMjYsNiArMjYsNyBAQAogCiAjaW5jbHVkZSAiaWd0Lmgi
CiAjaW5jbHVkZSAiaWd0X3Bzci5oIgorI2luY2x1ZGUgImlndF9zeXNmcy5oIgogI2luY2x1ZGUg
PHN5cy90eXBlcy5oPgogI2luY2x1ZGUgPHN5cy9zdGF0Lmg+CiAjaW5jbHVkZSA8ZmNudGwuaD4K
QEAgLTI3NCw2ICsyNzUsMTIgQEAgc3RhdGljIHZvaWQgc2V0dXBfZW52aXJvbm1lbnQodm9pZCkK
IAlkcm1fZmQgPSBkcm1fb3Blbl9kcml2ZXJfbWFzdGVyKERSSVZFUl9JTlRFTCk7CiAJaWd0X3Jl
cXVpcmUoZHJtX2ZkID49IDApOwogCWlndF9hc3NlcnQoY2xvc2UoZHJtX2ZkKSA9PSAwKTsKKwor
CS8qCisJICogaWd0X3N1YnRlc3RfaW5pdF9wYXJzZV9vcHRzKCkgZGlzYWJsZSB0aGUgZmJjb24g
YmluZCwgc28gdG8gdGVzdCBpdAorCSAqIGlzIG5lY2Vzc2FyeSBlbmFibGUgaXQgYWdhaW4KKwkg
Ki8KKwliaW5kX2ZiY29uKHRydWUpOwogfQogCiBzdGF0aWMgdm9pZCB0ZWFyZG93bl9lbnZpcm9u
bWVudCh2b2lkKQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXYK
