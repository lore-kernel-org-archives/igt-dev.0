Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20180405184757.15907-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <844c34e5-9fe2-1456-1d6f-c7f01ae5e407@linux.intel.com>
Date: Fri, 6 Apr 2018 09:24:41 +0100
MIME-Version: 1.0
In-Reply-To: <20180405184757.15907-1-chris@chris-wilson.co.uk>
Content-Language: en-GB
Subject: Re: [igt-dev] [Intel-gfx] [PATCH igt 1/2] lib: Acquire master for
 pollable spinbatch on gen4/5
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

Ck9uIDA1LzA0LzIwMTggMTk6NDcsIENocmlzIFdpbHNvbiB3cm90ZToKPiBnZW40LzUgcmVxdWly
ZSBhIERSTV9NQVNURVIgdG8gdXNlIE1JX1NUT1JFX0RXLCBtYWtlIGl0IHNvLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IENjOiBU
dnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IC0tLQo+ICAgbGliL2ln
dF9kdW1teWxvYWQuYyB8IDUgKysrKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9kdW1teWxvYWQuYyBi
L2xpYi9pZ3RfZHVtbXlsb2FkLmMKPiBpbmRleCA5OGFiN2FjMi4uYmE5MTdiYTUgMTAwNjQ0Cj4g
LS0tIGEvbGliL2lndF9kdW1teWxvYWQuYwo+ICsrKyBiL2xpYi9pZ3RfZHVtbXlsb2FkLmMKPiBA
QCAtMzEsNiArMzEsNyBAQAo+ICAgCj4gICAjaW5jbHVkZSAiaWd0X2NvcmUuaCIKPiAgICNpbmNs
dWRlICJkcm10ZXN0LmgiCj4gKyNpbmNsdWRlICJpZ3RfZGV2aWNlLmgiCj4gICAjaW5jbHVkZSAi
aWd0X2R1bW15bG9hZC5oIgo+ICAgI2luY2x1ZGUgImlndF9ndC5oIgo+ICAgI2luY2x1ZGUgImlu
dGVsX2NoaXBzZXQuaCIKPiBAQCAtMTQ0LDggKzE0NSwxMCBAQCBlbWl0X3JlY3Vyc2l2ZV9iYXRj
aChpZ3Rfc3Bpbl90ICpzcGluLCBpbnQgZmQsIHVpbnQzMl90IGN0eCwgdW5zaWduZWQgZW5naW5l
LAo+ICAgCj4gICAJCWlndF9hc3NlcnQoIWRlcCk7Cj4gICAKPiAtCQlpZiAoZ2VuID09IDQgfHwg
Z2VuID09IDUpCj4gKwkJaWYgKGdlbiA9PSA0IHx8IGdlbiA9PSA1KSB7Cj4gICAJCQlleGVjYnVm
LT5mbGFncyB8PSBJOTE1X0VYRUNfU0VDVVJFOwo+ICsJCQlpZ3RfcmVxdWlyZShfX2lndF9kZXZp
Y2Vfc2V0X21hc3RlcihmZCkgPT0gMCk7Cj4gKwkJfQo+ICAgCj4gICAJCXNwaW4tPnBvbGxfaGFu
ZGxlID0gZ2VtX2NyZWF0ZShmZCwgNDA5Nik7Cj4gICAKPiAKClJldmlld2VkLWJ5OiBUdnJ0a28g
VXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgoKUmVnYXJkcywKClR2cnRrbwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
