Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA6289121
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Apr 2019 23:00:51 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190408225200.33606-2-antonio.argenziano@intel.com>
References: <20190408225200.33606-1-antonio.argenziano@intel.com>
 <20190408225200.33606-2-antonio.argenziano@intel.com>
Message-ID: <155476443995.17365.16333654173903753945@skylake-alporthouse-com>
Date: Tue, 09 Apr 2019 00:00:39 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/i915/gem_fd_exhaustion.c:
 Expect ENFILE when fds run out
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTktMDQtMDggMjM6NTI6MDApCj4gQ2hhbmdl
IHRoZSB0ZXN0IHRvIGV4cGVjdCBnZW1fY3JlYXRlIHRvIHJldHVybiBFTkZJTEUgd2hlbiB3ZSBy
dW4gb3V0IG9mCj4gZmRzLgo+IAo+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNv
bi5jby51az4KPiBDYzogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogQW50b25pbyBBcmdlbnppYW5vIDxhbnRvbmlvLmFyZ2Vuemlhbm9AaW50
ZWwuY29tPgo+IC0tLQo+ICB0ZXN0cy9pOTE1L2dlbV9mZF9leGhhdXN0aW9uLmMgfCAxMSArKysr
KystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9mZF9leGhhdXN0aW9uLmMgYi90ZXN0
cy9pOTE1L2dlbV9mZF9leGhhdXN0aW9uLmMKPiBpbmRleCAyMzYwMmI5OC4uODNkMGU5MjYgMTAw
NjQ0Cj4gLS0tIGEvdGVzdHMvaTkxNS9nZW1fZmRfZXhoYXVzdGlvbi5jCj4gKysrIGIvdGVzdHMv
aTkxNS9nZW1fZmRfZXhoYXVzdGlvbi5jCj4gQEAgLTQ4LDE1ICs0OCwxNiBAQCBpZ3Rfc2ltcGxl
X21haW4KPiAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgbGVhayA9IG9wZW4oIi9kZXYvbnVs
bCIsIE9fUkRPTkxZKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBoYW5kbGU7
Cj4gIAo+IC0gICAgICAgICAgICAgICAgICAgICAgIGlmIChfX2dlbV9jcmVhdGUoZmQsIDQwOTYs
ICZoYW5kbGUpID09IDApCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnZW1fY2xv
c2UoZmQsIGhhbmRsZSk7Cj4gLQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChsZWFrIDwg
MCkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWd0X2luZm8oImZkIGV4aGF1
c3Rpb24gYWZ0ZXIgJWkgcm91bmRzLlxuIiwgaSk7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBpZ3RfYXNzZXJ0KF9fZ2VtX2NyZWF0ZShmZCwgNDA5NiwKPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZoYW5kbGUpIDwgMCk7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZ3RfYXNzZXJ0X2VxKF9fZ2VtX2Ny
ZWF0ZShmZCwgNDA5NiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICZoYW5kbGUpLCAtRU5GSUxFKTsKCkl0IGNhbiBhbHNvIGp1c3QgZmFp
bCBieSBydW5uaW5nIG91dCBvZiBtZW1vcnksIGFuZCBtZW1vcnkgc2F5cyBFTUZJTEUuCi1DaHJp
cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
