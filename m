Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB92489159
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Apr 2019 23:06:35 +0000 (UTC)
References: <20190408225200.33606-1-antonio.argenziano@intel.com>
 <20190408225200.33606-2-antonio.argenziano@intel.com>
 <155476443995.17365.16333654173903753945@skylake-alporthouse-com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <94db7da0-21f4-b21d-8178-0b454445adcc@intel.com>
Date: Mon, 8 Apr 2019 16:06:35 -0700
MIME-Version: 1.0
In-Reply-To: <155476443995.17365.16333654173903753945@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/i915/gem_fd_exhaustion.c:
 Expect ENFILE when fds run out
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAwOC8wNC8xOSAxNjowMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgQW50b25p
byBBcmdlbnppYW5vICgyMDE5LTA0LTA4IDIzOjUyOjAwKQo+PiBDaGFuZ2UgdGhlIHRlc3QgdG8g
ZXhwZWN0IGdlbV9jcmVhdGUgdG8gcmV0dXJuIEVORklMRSB3aGVuIHdlIHJ1biBvdXQgb2YKPj4g
ZmRzLgo+Pgo+PiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4+
IENjOiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KPj4gU2lnbmVkLW9m
Zi1ieTogQW50b25pbyBBcmdlbnppYW5vIDxhbnRvbmlvLmFyZ2Vuemlhbm9AaW50ZWwuY29tPgo+
PiAtLS0KPj4gICB0ZXN0cy9pOTE1L2dlbV9mZF9leGhhdXN0aW9uLmMgfCAxMSArKysrKystLS0t
LQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+
Cj4+IGRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9mZF9leGhhdXN0aW9uLmMgYi90ZXN0cy9p
OTE1L2dlbV9mZF9leGhhdXN0aW9uLmMKPj4gaW5kZXggMjM2MDJiOTguLjgzZDBlOTI2IDEwMDY0
NAo+PiAtLS0gYS90ZXN0cy9pOTE1L2dlbV9mZF9leGhhdXN0aW9uLmMKPj4gKysrIGIvdGVzdHMv
aTkxNS9nZW1fZmRfZXhoYXVzdGlvbi5jCj4+IEBAIC00OCwxNSArNDgsMTYgQEAgaWd0X3NpbXBs
ZV9tYWluCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgbGVhayA9IG9wZW4oIi9kZXYv
bnVsbCIsIE9fUkRPTkxZKTsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGhh
bmRsZTsKPj4gICAKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgaWYgKF9fZ2VtX2NyZWF0ZShm
ZCwgNDA5NiwgJmhhbmRsZSkgPT0gMCkKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBnZW1fY2xvc2UoZmQsIGhhbmRsZSk7Cj4+IC0KPj4gICAgICAgICAgICAgICAgICAgICAgICAg
IGlmIChsZWFrIDwgMCkgewo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZ3Rf
aW5mbygiZmQgZXhoYXVzdGlvbiBhZnRlciAlaSByb3VuZHMuXG4iLCBpKTsKPj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBpZ3RfYXNzZXJ0KF9fZ2VtX2NyZWF0ZShmZCwgNDA5NiwK
Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAmaGFuZGxlKSA8IDApOwo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlndF9h
c3NlcnRfZXEoX19nZW1fY3JlYXRlKGZkLCA0MDk2LAo+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZoYW5kbGUpLCAtRU5GSUxFKTsKPiAK
PiBJdCBjYW4gYWxzbyBqdXN0IGZhaWwgYnkgcnVubmluZyBvdXQgb2YgbWVtb3J5LCBhbmQgbWVt
b3J5IHNheXMgRU1GSUxFLgoKcmV0ID0gX19nZW1fY3JlYXRlKCk7CnJldCA9PSBFTkZJTEUgfHwg
cmV0ID09IEVNRklMRT8gT3IgaXMgdGhlcmUgc29tZXRoaW5nIHdlIGNvdWxkIGNoZWNrIApiZWZv
cmVoYW5kIHNvIHdlIGtub3cgd2hhdCB0byBleHBlY3Q/CgpBbnRvbmlvCgo+IC1DaHJpcwo+IApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1h
aWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
