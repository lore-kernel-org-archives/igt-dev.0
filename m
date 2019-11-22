Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191122091407.GI25209@platvala-desk.ger.corp.intel.com>
References: <20191121151930.25464-1-mika.kuoppala@linux.intel.com>
 <20191122091407.GI25209@platvala-desk.ger.corp.intel.com>
Message-ID: <157441441103.2524.18134843549599284090@skylake-alporthouse-com>
Date: Fri, 22 Nov 2019 09:20:11 +0000
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] cve: Add checker for
 cve-2019-0155
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
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>, Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, Joonas Lahtinen <joonas.lahtinen@intel.com>, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBQZXRyaSBMYXR2YWxhICgyMDE5LTExLTIyIDA5OjE0OjA3KQo+IE9uIFRodSwgTm92
IDIxLCAyMDE5IGF0IDA1OjE5OjMwUE0gKzAyMDAsIE1pa2EgS3VvcHBhbGEgd3JvdGU6Cj4gPiBB
ZGQgdnVsbmVyYWJpbGl0eSBjaGVja2VyIGZvciBjdmUtMjAxOS0wMTU1Cj4gPiAKPiA+IHYyOiBz
eW5jLCBiYWlsb3V0IGVhcmx5IGlmIG5vIHBhcnNlciAoQ2hyaXMpCj4gPiAKPiA+IENjOiBDaHJp
cyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiA+IENjOiBKb24gQmxvb21maWVs
ZCA8am9uLmJsb29tZmllbGRAaW50ZWwuY29tPgo+ID4gQ2M6IEpvb25hcyBMYWh0aW5lbiA8am9v
bmFzLmxhaHRpbmVuQGludGVsLmNvbT4KPiA+IFJlZmVyZW5jZXM6IGh0dHA6Ly9jdmUubWl0cmUu
b3JnL2NnaS1iaW4vY3ZlbmFtZS5jZ2k/bmFtZT1DVkUtMjAxOS0wMTU1Cj4gPiBSZWZlcmVuY2Vz
OiBodHRwczovL3d3dy5pbnRlbC5jb20vY29udGVudC93d3cvdXMvZW4vc2VjdXJpdHktY2VudGVy
L2Fkdmlzb3J5L2ludGVsLXNhLTAwMjQyLmh0bWwKPiA+IFNpZ25lZC1vZmYtYnk6IE1pa2EgS3Vv
cHBhbGEgPG1pa2Eua3VvcHBhbGFAbGludXguaW50ZWwuY29tPgo+ID4gLS0tCj4gPiAgTWFrZWZp
bGUuYW0gICAgICAgICAgfCAgIDIgKy0KPiA+ICBjb25maWd1cmUuYWMgICAgICAgICB8ICAgMSAr
Cj4gPiAgY3ZlL01ha2VmaWxlLmFtICAgICAgfCAgMTQgKysKPiA+ICBjdmUvTWFrZWZpbGUuc291
cmNlcyB8ICAgNSArCj4gPiAgY3ZlL2N2ZS0yMDE5LTAxNTUuYyAgfCA0NzAgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIGN2ZS9tZXNvbi5idWlsZCAgICAg
IHwgIDEyICsrCj4gPiAgbWVzb24uYnVpbGQgICAgICAgICAgfCAgIDEgKwo+IAo+IFdoeSBkbyB3
ZSBuZWVkIGEgbmV3IHNvdXJjZSBkaXJlY3RvcnkgYW5kIG5ldyBpbnN0YWxsIGRpcmVjdG9yeSBm
b3IKPiB0aGlzPyBDYW4ndCB0aGlzIGJlIGluIHRvb2xzLz8KCkJlY2F1c2Ugd2Ugd291bGQgbGlr
ZSB0byBjYXJ2ZSBvdXQgYSBuaWNoZSBmb3IgdGhlc2UuIElmIEdvb2dsZSBhc2tzIGZvcgphIHZl
cmlmaWVyIGZvciBldmVyeSBzaW5nbGUgYnVnIHdlIGVuY291bnRlciwgaXQncyBnb2luZyB0byBi
ZSBhIGh1Z2UKZGlyZWN0b3J5LgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2
