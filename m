Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180816075627.lhi3dtytznjkkngm@platvala-desk.ger.corp.intel.com>
References: <20180816060646.10081-1-chris@chris-wilson.co.uk>
 <20180816075627.lhi3dtytznjkkngm@platvala-desk.ger.corp.intel.com>
Message-ID: <153440643792.16865.3550330401818581650@skylake-alporthouse-com>
Date: Thu, 16 Aug 2018 09:00:37 +0100
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] intel-ci: Exclude pm_rpm
 module-reload from full testing
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBQZXRyaSBMYXR2YWxhICgyMDE4LTA4LTE2IDA4OjU2OjI3KQo+IE9uIFRodSwgQXVn
IDE2LCAyMDE4IGF0IDA3OjA2OjQ2QU0gKzAxMDAsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IFRo
ZSBwbV9ycG0gbW9kdWxlLXJlbG9hZCBleGlzdHMgdG8gZXhlcmNpc2UgYSBycG0gd2FrZXJlZiBs
ZWFrLCBhbmQKPiA+IGFmZmVjdHMgdGhlIHJhbmRvbSBzZWxlY3Rpb24gb2YgdGVzdHMgcnVuIGFm
dGVyIGl0LiBTaW1pbGFyIHRvIHRoZQo+ID4gbm9ybWFsIG1vZHVsZS1yZWxvYWQgdGVzdHMsIGNh
cmUgbXVzdCBiZSB0YWtlbiBpbiBpdHMgZXhlY3V0aW9uIHRvIGF2b2lkCj4gPiBjYXVzaW5nIHNw
dXJpb3VzIGZhaWx1cmVzIGVsc2V3aGVyZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXMg
V2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gPiAtLS0KPiA+ICB0ZXN0cy9pbnRl
bC1jaS9ibGFja2xpc3QudHh0IHwgMSArCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC1jaS9ibGFja2xpc3QudHh0IGIv
dGVzdHMvaW50ZWwtY2kvYmxhY2tsaXN0LnR4dAo+ID4gaW5kZXggYzkzNTU0YTM3Li44OGIyZmUz
MTMgMTAwNjQ0Cj4gPiAtLS0gYS90ZXN0cy9pbnRlbC1jaS9ibGFja2xpc3QudHh0Cj4gPiArKysg
Yi90ZXN0cy9pbnRlbC1jaS9ibGFja2xpc3QudHh0Cj4gPiBAQCAtMTMsNiArMTMsNyBAQCBpZ3RA
ZHJtX21tKEAuKik/Cj4gPiAgIyBmYWlsdXJlcyBpbiB0ZXN0cyBydW4gYWZ0ZXJ3YXJkcy4KPiA+
ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ID4gIGln
dEBkcnZfbW9kdWxlX3JlbG9hZChALiopPwo+ID4gK2lndEBwbV9ycG1AbW9kdWxlLXJlbG9hZAo+
IAo+IAo+IEFzIHdlIGRvbid0IGhhdmUgbWFjaGluZXJ5IGluIHBsYWNlIHlldCB0byBydW4gdGhl
c2UgcmVsb2FkaW5nIHRlc3RzCj4gaW4gc2hhcmRzIGluIGEgY29udHJvbGxlZCBtYW5uZXIsIHNo
b3VsZCB0aGlzIGJlIGFkZGVkIHRvCj4gZmFzdC1mZWVkYmFjayB0byBub3QgbG9zZSB0aGUgY292
ZXJhZ2UgZW50aXJlbHk/CgpJdCBhbHJlYWR5IGlzIGluIGZhc3QtZmVlZGJhY2sgYXdhaXRpbmcg
dXMgbGFuZGluZyB0aGUgd2FrZXJlZiBmaXguIDotcAotQ2hyaXMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
