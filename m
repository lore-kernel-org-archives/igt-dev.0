Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5C46ED14
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jun 2021 15:44:29 +0000 (UTC)
Date: Thu, 10 Jun 2021 17:44:23 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210610154423.GP3926@zkempczy-mobl2>
References: <20210609173632.248880-1-jason@jlekstrand.net>
 <20210609173632.248880-38-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210609173632.248880-38-jason@jlekstrand.net>
Subject: Re: [igt-dev] [PATCH i-g-t 37/93] tests/i915/gem_ctx_exec: Stop
 cloning contexts in close_race
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
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBKdW4gMDksIDIwMjEgYXQgMTI6MzY6MjBQTSAtMDUwMCwgSmFzb24gRWtzdHJhbmQg
d3JvdGU6Cj4gTm90aGluZyBpbiB0aGlzIHN1YnRlc3Qgc2V0cyB0aGUgc2V0IG9mIGVuZ2luZXMg
b24gY3R4MCBzbyB0aGVyZSdzIG5vCj4gcG9pbnQgaW4gY2xvbmluZyB0aGVtLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEphc29uIEVrc3RyYW5kIDxqYXNvbkBqbGVrc3RyYW5kLm5ldD4KPiAtLS0KPiAg
dGVzdHMvaTkxNS9nZW1fY3R4X2V4ZWMuYyB8IDUgKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaTkx
NS9nZW1fY3R4X2V4ZWMuYyBiL3Rlc3RzL2k5MTUvZ2VtX2N0eF9leGVjLmMKPiBpbmRleCBhODYx
NmY5NS4uNmRiMmQ1OTggMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvaTkxNS9nZW1fY3R4X2V4ZWMuYwo+
ICsrKyBiL3Rlc3RzL2k5MTUvZ2VtX2N0eF9leGVjLmMKPiBAQCAtMzUxLDcgKzM1MSw3IEBAIHN0
YXRpYyB2b2lkIGNsb3NlX3JhY2UoaW50IGk5MTUpCj4gIAlpZ3RfYXNzZXJ0KGNvbnRleHRzICE9
IE1BUF9GQUlMRUQpOwo+ICAKPiAgCWZvciAoaW50IGNoaWxkID0gMDsgY2hpbGQgPCBuY3B1czsg
Y2hpbGQrKykKPiAtCQljb250ZXh0c1tjaGlsZF0gPSBnZW1fY29udGV4dF9jbG9uZV93aXRoX2Vu
Z2luZXMoaTkxNSwgMCk7Cj4gKwkJY29udGV4dHNbY2hpbGRdID0gZ2VtX2NvbnRleHRfY3JlYXRl
KGk5MTUpOwo+ICAKPiAgCWlndF9mb3JrKGNoaWxkLCBuY3B1cykgewo+ICAJCXNwaW4gPSBfX2ln
dF9zcGluX25ldyhpOTE1LCAuZmxhZ3MgPSBJR1RfU1BJTl9QT0xMX1JVTik7Cj4gQEAgLTQwNSw4
ICs0MDUsNyBAQCBzdGF0aWMgdm9pZCBjbG9zZV9yYWNlKGludCBpOTE1KQo+ICAJCSAqLwo+ICAJ
CWZvciAoaW50IGNoaWxkID0gMDsgY2hpbGQgPCBuY3B1czsgY2hpbGQrKykgewo+ICAJCQlnZW1f
Y29udGV4dF9kZXN0cm95KGk5MTUsIGNvbnRleHRzW2NoaWxkXSk7Cj4gLQkJCWNvbnRleHRzW2No
aWxkXSA9Cj4gLQkJCQlnZW1fY29udGV4dF9jbG9uZV93aXRoX2VuZ2luZXMoaTkxNSwgMCk7Cj4g
KwkJCWNvbnRleHRzW2NoaWxkXSA9IGdlbV9jb250ZXh0X2NyZWF0ZShpOTE1KTsKPiAgCQl9Cj4g
IAkJdXNsZWVwKDEwMDAgKyBoYXJzX3BldHJ1c2thX2Y1NF8xX3JhbmRvbV91bnNhZmUoKSAlIDIw
MDApOwo+ICAJfQo+IC0tIAo+IDIuMzEuMQoKUmV2aWV3ZWQtYnk6IFpiaWduaWV3IEtlbXBjennF
hHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPgoKLS0KWmJpZ25pZXcKCj4gCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBpZ3QtZGV2
IG1haWxpbmcgbGlzdAo+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
