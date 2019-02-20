Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737D589341
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Feb 2019 18:21:33 +0000 (UTC)
From: Caz Yokoyama <caz@caz-nuc.ra.intel.com>
Date: Wed, 20 Feb 2019 01:13:16 +0000
Message-Id: <0cc138314abc390aa0bfc79d5463034da3024530.1550624857.git.caz@caz-nuc.ra.intel.com>
In-Reply-To: <cover.1550624857.git.caz@caz-nuc.ra.intel.com>
References: <cover.1550624857.git.caz@caz-nuc.ra.intel.com>
In-Reply-To: <cover.1550624857.git.caz@caz-nuc.ra.intel.com>
References: <cover.1550624857.git.caz@caz-nuc.ra.intel.com>
Subject: [igt-dev] [igt PATCH 1/1] igt@i915_suspend@shrink faster
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
List-ID: <igt-dev@lists.freedesktop.org>

aWd0QGk5MTVfc3VzcGVuZEBzaHJpbmsgcnVucyAyNSBzZWMgaW5zdGVhZCBvZiA5MCBzZWMgb24g
bXkgTlVDIHdoaWNoIGhhcwoyR0Igb2YgbWVtb3J5LiBUaGUgY2hpbGQgcHJvY2VzcyB3aGljaCBp
cyBjcmVhdGVkIGJ5IGlndF9mb3JrKCkgdXBkYXRlcwpwaW5uYWJsZSBtZW1vcnkgc2l6ZSwgKCpj
YW5fbWxvY2spLiBQYXJlbnQgcHJvY2VzcyBtbG9ja3MgYXQgdGhlIGVuZCBvZgoiZm9yIGxvb3Ai
IHdoZW4gdGhlIGNoaWxkIHByb2Nlc3MgZmluZHMgcGlubmFibGUgbWVtb3J5IHNpemUgaW4gNGti
CmJvdW5kYXJ5LiBUaGlzIHBhdGNoIGFsc28gcmVkdWNlcyB0aGUgY2hhbmNlIG9mIGR5aW5nIGVu
dGlyZSB0ZXN0IHByb2Nlc3MKYmVjYXVzZSB0aGUgcGFyZW50IHByb2Nlc3MgbWNsb2NrcyB0aGUg
bWVtb3J5IHdoZXJlIHdlIGFscmVhZHkga25vdyBpdCBpcwpwaW5uYWJsZS4KClNpZ25lZC1vZmYt
Ynk6IENheiBZb2tveWFtYSA8Y2F6QGNhei1udWMucmEuaW50ZWwuY29tPgotLS0KIGxpYi9pbnRl
bF9vcy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvbGliL2ludGVsX29zLmMgYi9saWIvaW50ZWxfb3MuYwppbmRleCBl
MWUzMWUyMy4uMDc3ZDZjMTMgMTAwNjQ0Ci0tLSBhL2xpYi9pbnRlbF9vcy5jCisrKyBiL2xpYi9p
bnRlbF9vcy5jCkBAIC0yNjUsOCArMjY1LDggQEAgaW50ZWxfZ2V0X3RvdGFsX3Bpbm5hYmxlX21l
bSh2b2lkKQogCQkJfQogCQl9CiAJCV9faWd0X3dhaXRjaGlsZHJlbigpOwotCQlpZ3RfYXNzZXJ0
KCFtbG9jayhjYW5fbWxvY2ssICpjYW5fbWxvY2spKTsKIAl9CisJaWd0X2Fzc2VydCghbWxvY2so
Y2FuX21sb2NrLCAqY2FuX21sb2NrKSk7CiAKIG91dDoKIAlyZXQgPSAqY2FuX21sb2NrOwotLSAK
Mi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
