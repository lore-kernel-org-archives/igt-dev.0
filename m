Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <151912426405.8969.10590870511403740242@jlahtine-desk.ger.corp.intel.com>
References: <20180220084520.27965-1-chris@chris-wilson.co.uk>
 <20180220084520.27965-8-chris@chris-wilson.co.uk>
 <151912426405.8969.10590870511403740242@jlahtine-desk.ger.corp.intel.com>
Message-ID: <151912450699.4312.11985974853844633493@mail.alporthouse.com>
Date: Tue, 20 Feb 2018 11:01:46 +0000
Subject: Re: [igt-dev] [PATCH igt 08/16] igt/gem_exec_schedule: Replace
 constant 16 with its magic macro
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
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBKb29uYXMgTGFodGluZW4gKDIwMTgtMDItMjAgMTA6NTc6NDQpCj4gUXVvdGluZyBD
aHJpcyBXaWxzb24gKDIwMTgtMDItMjAgMTA6NDU6MTIpCj4gPiBAQCAtMzk4LDcgKzM5OSw3IEBA
IHN0YXRpYyB2b2lkIHByZWVtcHQoaW50IGZkLCB1bnNpZ25lZCByaW5nLCB1bnNpZ25lZCBmbGFn
cykKPiA+ICAgICAgICAgICAgICAgICBpZ3RfYXNzZXJ0KGdlbV9ib19idXN5KGZkLCBzcGluWzBd
LT5oYW5kbGUpKTsKPiA+ICAgICAgICAgfQo+ID4gIAo+ID4gLSAgICAgICBmb3IgKGludCBuID0g
MDsgbiA8IDE2OyBuKyspCj4gPiArICAgICAgIGZvciAoaW50IG4gPSAwOyBuIDwgTUFYX0VMU1Bf
UUxFTjsgbisrKQo+ID4gICAgICAgICAgICAgICAgIGlndF9zcGluX2JhdGNoX2ZyZWUoZmQsIHNw
aW5bbl0pOwo+IAo+IEFSUkFZX1NJWkUoKSBzZWVtcyBtb3JlIGFwcHJvcHJpYXRlIGluIHRoZSBm
b3IgbG9vcHMuIFNlZW1zIGxpa2UgeW91J3ZlCj4gb3B0ZWQgbm90IHRvIHVzZSBpdCBzbyBtdWNo
LCB3aHkgc28/CgpObyBpZGVhLiBOZXh0IHVwIHdpbGwgYmUgd2UgZG9uJ3QgbmVlZCBzbyBtYW55
IGluZGl2aWR1YWwgc3Bpbm5lcnMsIGp1c3QKb25lIHN1Ym1pdHRlZCBtdWx0aXBsZSB0aW1lcyBp
biBkaWZmZXJlbnQgY29udGV4dHMvZW5naW5lcy4KCj4gPiBAQCAtNDUwLDYgKzQ1Myw3IEBAIHN0
YXRpYyB2b2lkIHByZWVtcHRfb3RoZXIoaW50IGZkLCB1bnNpZ25lZCByaW5nKQo+ID4gICAgICAg
ICAgICAgICAgICAgICByZXN1bHQsIChuICsgMSkqc2l6ZW9mKHVpbnQzMl90KSwgbiArIDEsCj4g
PiAgICAgICAgICAgICAgICAgICAgIDAsIEk5MTVfR0VNX0RPTUFJTl9SRU5ERVIpOwo+ID4gIAo+
ID4gKyAgICAgICBpZ3RfZGVidWdmc19kdW1wKGZkLCAiaTkxNV9lbmdpbmVfaW5mbyIpOwo+IAo+
IExvc3QgYW5kIGFmcmFpZCBodW5rIGhlcmU/IFlvdSBjYW4gaGF2ZSBteSBSLWIgZm9yIGl0IGlu
IHNlcGFyYXRlIHBhdGNoLgoKSnVzdCBsb3N0LiBJdCBhaW4ndCBhZnJhaWQgb2Ygbm8gYnVncy4K
LUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
