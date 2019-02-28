Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <5eded0ef-6b8c-06ff-9be7-00e66eb71076@linux.intel.com>
References: <20190228141828.2567-1-tvrtko.ursulin@linux.intel.com>
 <20190228141828.2567-2-tvrtko.ursulin@linux.intel.com>
 <155136395323.5847.13177410525767591837@skylake-alporthouse-com>
 <5eded0ef-6b8c-06ff-9be7-00e66eb71076@linux.intel.com>
Message-ID: <155136505805.5847.17962504726446132216@skylake-alporthouse-com>
Date: Thu, 28 Feb 2019 14:44:18 +0000
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 2/5] gem_wsim: Round mmap to
 page size
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
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOS0wMi0yOCAxNDo0MToyMykKPiAKPiBPbiAyOC8w
Mi8yMDE5IDE0OjI1LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBRdW90aW5nIFR2cnRrbyBVcnN1
bGluICgyMDE5LTAyLTI4IDE0OjE4OjI1KQo+ID4+IEZyb206IFR2cnRrbyBVcnN1bGluIDx0dnJ0
a28udXJzdWxpbkBpbnRlbC5jb20+Cj4gPj4KPiA+PiBtbWFwKDIpIG1hbmRhdGVzIHNpemUgaXMg
cGFnZSBhbGlnbmVkLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogVHZydGtvIFVyc3VsaW4gPHR2
cnRrby51cnN1bGluQGludGVsLmNvbT4KPiA+PiAtLS0KPiA+PiAgIGJlbmNobWFya3MvZ2VtX3dz
aW0uYyB8IDcgKysrKy0tLQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9iZW5jaG1hcmtzL2dlbV93c2lt
LmMgYi9iZW5jaG1hcmtzL2dlbV93c2ltLmMKPiA+PiBpbmRleCAwYTVhYmMwOGQ4YzIuLjU3Y2Vi
OTgzY2Y4MiAxMDA2NDQKPiA+PiAtLS0gYS9iZW5jaG1hcmtzL2dlbV93c2ltLmMKPiA+PiArKysg
Yi9iZW5jaG1hcmtzL2dlbV93c2ltLmMKPiA+PiBAQCAtNzM3LDYgKzczNyw3IEBAIGluaXRfYmIo
c3RydWN0IHdfc3RlcCAqdywgdW5zaWduZWQgaW50IGZsYWdzKQo+ID4+ICAgewo+ID4+ICAgICAg
ICAgIGNvbnN0IHVuc2lnbmVkIGludCBhcmJfcGVyaW9kID0KPiA+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgZ2V0X2JiX3N6KHctPnByZWVtcHRfdXMpIC8gc2l6ZW9mKHVpbnQzMl90KTsKPiA+
PiArICAgICAgIGNvbnN0IHVuc2lnbmVkIGludCBtbWFwX2xlbiA9IEFMSUdOKHctPmJiX3N6LCA0
MDk2KTsKPiA+PiAgICAgICAgICB1bnNpZ25lZCBpbnQgaTsKPiA+PiAgICAgICAgICB1aW50MzJf
dCAqcHRyOwo+ID4gCj4gPiBZb3Ugb25seSBuZWVkIHRvIGRvIGl0IGZvcgo+ID4gCj4gPiB3dy0+
YmJfc3ogPSBBTElHTihnZXRfYmJfc3ooKSwgNDA5Nik7Cj4gPiAKPiA+IEFsbCBiYXRjaCBsZW5n
dGhzIGFyZSBzdGFydCA9IHd3LT5iYl9zeiAtIGdldF9iYl9zeigpIGFuZCBzbyByZW1haW4KPiA+
IGNvcnJlY3QuIFJpZ2h0Pwo+IAo+IEkgdGhpbmsgc28uIEkgaGF2ZSBvbmUgbW9yZSBhc3NpZ25t
ZW50IHNpdGUgb2Ygdy0+YmJfc3ogaW4gdGhlIHVwY29taW5nIAo+IGNvZGUgc28gaXQgd2FzIDIg
OiAyIGFuZCBJIGZsaXBwZWQgYSBjb2luLiBBY3R1YWxseSBJIHdhbnRlZCB0byBtYWtlIGl0IAo+
IGV4cGxpY2l0IHdoYXQgSSBhbSBmaXhpbmcgLSB0aGUgbW1hcCBzaXplLiBCdXQgbm93IHlvdSds
bCBzYXkgYmF0Y2ggc2l6ZSAKPiBpcyBhbHNvIGltcGxpY2l0bHkgcm91bmRlZC4uIG9oIHdlbGwu
LiBJIHByZWZlciB0aGUgZXhwbGljaXQgcm91bmQgdXAgYXQgCj4gbW1hcCB0aW1lLgoKT2ssClJl
dmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLUNocmlz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
