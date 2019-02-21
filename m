Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20190221101944.19711-1-chris@chris-wilson.co.uk>
 <c904bd88-a4d1-f474-6bb9-e88c1e1587eb@intel.com>
 <155076549435.25312.16357292185690203854@skylake-alporthouse-com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <09191a48-9291-44c4-c2b5-c4411ba61522@intel.com>
Date: Thu, 21 Feb 2019 08:16:17 -0800
MIME-Version: 1.0
In-Reply-To: <155076549435.25312.16357292185690203854@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/2] lib: Only require we
 have i915.reset module parameter for allow-hang
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
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAyMS8wMi8xOSAwODoxMSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgQW50b25p
byBBcmdlbnppYW5vICgyMDE5LTAyLTIxIDE2OjA4OjA0KQo+Pgo+Pgo+PiBPbiAyMS8wMi8xOSAw
MjoxOSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+Pj4gVG8gY29udHJvbCBoYW5nIGRldGVjdGlvbiwg
d2UgbWFuaXB1bGF0ZSB0aGUgaTkxNS5yZXNldCBtb2R1bGUKPj4+IHBhcmFtZXRlci4gSG93ZXZl
ciwgdG8gYmUgbmljZSB3ZSBzaG91bGQgU0tJUCBpZiB3ZSBjYW5ub3QgbW9kaWZ5IHRoZQo+Pj4g
cGFyYW1ldGVyIGFzIG9wcG9zZWQgdG8gb3V0cmlnaHQgRkFJTGluZy4KPj4+Cj4+PiBSZWZlcmVu
Y2VzOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDg4OTEK
Pj4+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVr
Pgo+Pj4gLS0tCj4+PiAgICBsaWIvaWd0X2d0LmMgfCA0ICsrLS0KPj4+ICAgIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBh
L2xpYi9pZ3RfZ3QuYyBiL2xpYi9pZ3RfZ3QuYwo+Pj4gaW5kZXggNjQ2Njk2NzI3Li5jOThhNzU1
M2IgMTAwNjQ0Cj4+PiAtLS0gYS9saWIvaWd0X2d0LmMKPj4+ICsrKyBiL2xpYi9pZ3RfZ3QuYwo+
Pj4gQEAgLTE3Niw4ICsxNzYsOCBAQCBpZ3RfaGFuZ190IGlndF9hbGxvd19oYW5nKGludCBmZCwg
dW5zaWduZWQgY3R4LCB1bnNpZ25lZCBmbGFncykKPj4+ICAgICAgICBpZiAoIWlndF9jaGVja19i
b29sZWFuX2Vudl92YXIoIklHVF9IQU5HX1dJVEhPVVRfUkVTRVQiLCBmYWxzZSkpCj4+PiAgICAg
ICAgICAgICAgICBpZ3RfcmVxdWlyZShoYXNfZ3B1X3Jlc2V0KGZkKSk7Cj4+PiAgICAKPj4+IC0g
ICAgIGlndF9hc3NlcnQoaWd0X3N5c2ZzX3NldF9wYXJhbWV0ZXIKPj4+IC0gICAgICAgICAgICAg
ICAgKGZkLCAicmVzZXQiLCAiJWQiLCBJTlRfTUFYIC8qIGFueSByZXNldCBtZXRob2QgKi8pKTsK
Pj4+ICsgICAgIGlndF9yZXF1aXJlKGlndF9zeXNmc19zZXRfcGFyYW1ldGVyCj4+PiArICAgICAg
ICAgICAgICAgICAoZmQsICJyZXNldCIsICIlZCIsIElOVF9NQVggLyogYW55IHJlc2V0IG1ldGhv
ZCAqLykpOwo+Pgo+PiBIb3cgY29tZSB3ZSB3ZXJlIG5vdCBhYmxlIHRvIHdyaXRlIHRoYXQgcGFy
YW1ldGVyPyBJc24ndCB0aGF0IHN5c2ZzCj4+IGFsd2F5cyB0aGVyZT8KPiAKPiBOby4gSXQgY2Fu
IGJlIGNvbXBpbGVkIG91dC4KClJpZ2h0Li4uCgpSZXZpZXdlZC1ieTogQW50b25pbyBBcmdlbnpp
YW5vIDxhbnRvbmlvLmFyZ2Vuemlhbm9AaW50ZWwuY29tPgoKPiAtQ2hyaXMKPiAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
