Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20190111103510.20564-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <31f82579-fd8d-0335-0bfb-4f8d0b1c5ef3@linux.intel.com>
Date: Fri, 11 Jan 2019 11:37:25 +0000
MIME-Version: 1.0
In-Reply-To: <20190111103510.20564-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] i915/hangman: Read a dummy byte to
 check sysfs existence
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

Ck9uIDExLzAxLzIwMTkgMTA6MzUsIENocmlzIFdpbHNvbiB3cm90ZToKPiBzeXNmcyBkb2Vzbid0
IGdpdmUgdGhlIGRyaXZlciBhbiBvcGVuKCkgY2FsbGJhY2ssIHNvIHdlIGNhbiBvbmx5IHJlcG9y
dAo+IHRoZSB1bmF2YWlsYWJpbGl0eSBvZiBIVyBvbiB0aGUgZmlyc3QgcmVhZDsgc28gY2hlY2sg
cmVhZCgpIGFmdGVyIGNoZWNraW5nCj4gb3BlbigpLgo+IAo+IEZpeGVzOiA5M2YwYWQ0YjgzNWUg
KCJpOTE1L2hhbmdtYW46IFNraXAgaWYgZGlzYWJsZWQgYnkgdGhlIGtlcm5lbCIpCj4gU2lnbmVk
LW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gLS0tCj4g
ICB0ZXN0cy9pOTE1L2hhbmdtYW4uYyB8IDggKysrKysrKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaTkx
NS9oYW5nbWFuLmMgYi90ZXN0cy9pOTE1L2hhbmdtYW4uYwo+IGluZGV4IGZmYmQwYjA1Ny4uNWY2
M2JmYzRiIDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2k5MTUvaGFuZ21hbi5jCj4gKysrIGIvdGVzdHMv
aTkxNS9oYW5nbWFuLmMKPiBAQCAtNDUsMTQgKzQ1LDIwIEBAIHN0YXRpYyBpbnQgc3lzZnMgPSAt
MTsKPiAgIAo+ICAgc3RhdGljIGJvb2wgaGFzX2Vycm9yX3N0YXRlKGludCBkaXIpCj4gICB7Cj4g
Kwlib29sIHJlc3VsdDsKPiAgIAlpbnQgZmQ7Cj4gICAKPiAgIAlmZCA9IG9wZW5hdChkaXIsICJl
cnJvciIsIE9fUkRPTkxZKTsKPiAgIAlpZiAoZmQgPCAwKQo+ICAgCQlyZXR1cm4gZmFsc2U7Cj4g
ICAKPiArCWlmIChyZWFkKGZkLCAmcmVzdWx0LCBzaXplb2YocmVzdWx0KSkgPCAwKQo+ICsJCXJl
c3VsdCA9IGZhbHNlOwo+ICsJZWxzZQo+ICsJCXJlc3VsdCA9IHRydWU7Cj4gKwo+ICAgCWNsb3Nl
KGZkKTsKPiAtCXJldHVybiB0cnVlOwo+ICsJcmV0dXJuIHJlc3VsdDsKPiAgIH0KPiAgIAo+ICAg
c3RhdGljIHZvaWQgYXNzZXJ0X2VudHJ5KGNvbnN0IGNoYXIgKnMsIGJvb2wgZXhwZWN0KQo+IAoK
UmV2aWV3ZWQtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+CgpS
ZWdhcmRzLAoKVHZydGtvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
