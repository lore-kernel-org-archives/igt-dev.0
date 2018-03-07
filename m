Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8032C6E020
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Mar 2018 14:40:36 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20180307121759.29106-1-chris@chris-wilson.co.uk>
 <10aabb30-9332-0f23-8936-4b2b69924942@linux.intel.com>
In-Reply-To: <10aabb30-9332-0f23-8936-4b2b69924942@linux.intel.com>
Message-ID: <152043363042.17960.3054812213936788355@mail.alporthouse.com>
Date: Wed, 07 Mar 2018 14:40:30 +0000
Subject: Re: [igt-dev] [PATCH igt] lib: Use C99 initialisers to clear
 context parameters
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wMy0wNyAxNDozNjozNCkKPiAKPiBPbiAwNy8w
My8yMDE4IDEyOjE3LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiB2YWxncmluZCBjb21wbGFpbnMg
d2UgZmVlZCB1bmluaXRpYWxpc2VkIHN0YWNrIGludG8gdGhlIENPTlRFWFRfU0VUUEFSQU0KPiA+
IGlvY3RsLiBJdCBpcyB1bnVzZWQgYnkgdGhlIGtlcm5lbCwgYnV0IHZhbGdyaW5kIGRvZXNuJ3Qg
a25vdyB0aGF0IGFuZAo+ID4gaXQncyBlYXN5IGVub3VnaCB0byBjbGVhciB0aGUgc3RydWN0IHRv
IHByZXZlbnQgdGhlIHdhcm5pbmcuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNv
biA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+ID4gLS0tCj4gPiAgIGxpYi9pZ3RfZ3QuYyB8
IDI5ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
MiBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2xp
Yi9pZ3RfZ3QuYyBiL2xpYi9pZ3RfZ3QuYwo+ID4gaW5kZXggNzk5Y2ExYWUuLjE2OGM1YTA3IDEw
MDY0NAo+ID4gLS0tIGEvbGliL2lndF9ndC5jCj4gPiArKysgYi9saWIvaWd0X2d0LmMKPiA+IEBA
IC0xMjYsMTEgKzEyNiwxMCBAQCB2b2lkIGlndF9yZXF1aXJlX2hhbmdfcmluZyhpbnQgZmQsIGlu
dCByaW5nKQo+ID4gICAKPiA+ICAgc3RhdGljIHVuc2lnbmVkIGNvbnRleHRfZ2V0X2JhbihpbnQg
ZmQsIHVuc2lnbmVkIGN0eCkKPiA+ICAgewo+ID4gLSAgICAgc3RydWN0IGRybV9pOTE1X2dlbV9j
b250ZXh0X3BhcmFtIHBhcmFtOwo+ID4gLQo+ID4gLSAgICAgcGFyYW0ucGFyYW0gPSBJOTE1X0NP
TlRFWFRfUEFSQU1fQkFOTkFCTEU7Cj4gPiAtICAgICBwYXJhbS52YWx1ZSA9IDA7Cj4gPiAtICAg
ICBwYXJhbS5zaXplID0gMDsKPiA+ICsgICAgIHN0cnVjdCBkcm1faTkxNV9nZW1fY29udGV4dF9w
YXJhbSBwYXJhbSA9IHsKPiA+ICsgICAgICAgICAgICAgLmN0eF9pZCA9IGN0eCwKPiAKPiBXaGVy
ZSB3YXMgdGhpcyBhc3NpZ25tZW50IGJlZm9yZT8gV2FzIGl0IGFsbCBicm9rZW4gYXMgd2VsbCBh
cyB1cHNldHRpbmcgCj4gVmFsZ3JpbmQ/CgpJdCBleGlzdGVkIG9ubHkgaW4gdGhlIGNhbGxlcnMg
aW1hZ2luYXRpb24uIEJyb2tlbiBpcyBhbgpvdmVyc3RhdGVtZW50LCBzaW5jZSBubyBvbmUgdmFy
aWVkIGZyb20gdGhlIGRlZmF1bHRzLCBpLmUuIHRoZSBjYWxsZXIKaGFzIHRvIG1peCBpbiB1c2lu
ZyBQQVJBTV9CQU5OQUJMRSB3aXRoIGlndF9oYW5nX2N0eC4KLUNocmlzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
