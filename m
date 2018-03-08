Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E066E6E8AC
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Mar 2018 14:52:49 +0000 (UTC)
References: <20180226175920.15815-1-lionel.g.landwerlin@intel.com>
 <20180226175920.15815-2-lionel.g.landwerlin@intel.com>
 <193ab3f3-5d1f-41b1-9b36-c8112b7c54ca@linux.intel.com>
 <66da2e97-fdcd-3b65-65b1-099ef74ab5bd@intel.com>
 <152052029992.18139.484286988595424085@mail.alporthouse.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <fd9ffc8c-d017-ec80-f717-505e4e24cbf7@intel.com>
Date: Thu, 8 Mar 2018 14:52:45 +0000
MIME-Version: 1.0
In-Reply-To: <152052029992.18139.484286988595424085@mail.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v5 2/3] tests: add i915 query tests
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
To: Chris Wilson <chris@chris-wilson.co.uk>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gMDgvMDMvMTggMTQ6NDQsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIExpb25lbCBM
YW5kd2VybGluICgyMDE4LTAzLTA4IDE0OjMxOjE2KQo+PiBPbiAwOC8wMy8xOCAxMToyMiwgVHZy
dGtvIFVyc3VsaW4gd3JvdGU6Cj4+PiBJbnRlcmVzdGluZyBxdWVzdGlvbiBob3cgd2Ugd2FudCB0
byBuYW1lIHRoaXMgdGVzdC4gV2UgZG9uJ3QgaGF2ZSBhbnkKPj4+IGk5MTVfIHByZWZpeCB0ZXN0
cywgYnV0IGZvciBpbnN0YW5jZSB0aGVyZSBpcyBkcnZfZ2V0cGFyYW1zX2Jhc2ljLAo+Pj4gc3Vn
Z2VzdGluZyB0aGlzIGNvdWxkIGJlIGNhbGxlZCBkcnZfcXVlcnlfaW9jdGwgb3Igc29tZXRoaW5n
Pwo+Pj4KPj4+IE9wZW4gZm9yIGRpc2N1c3Npb24gSSBndWVzcy4KPj4gSSd2ZSBiZWVuIGNvbnNp
ZGVyaW5nIHJlbmFtaW5nIHBlcmYuYyAodGhhdCdzIGEgcHJldHR5IGNvbmZ1c2luZyBvbmUuLi4p
Cj4+Cj4+IE9uZSBjb3VsZCBhcmd1ZSB0aGF0IGlmIElHVCB0ZXN0cyBtb3JlIHRoYW4gaW50ZWwg
ZGV2aWNlcywgd2Ugc2hvdWxkCj4+IGhhdmUgYSBkcml2ZXIgcHJlZml4IChJIHNlZSB2YzQgaGFz
KS4KPiBZZXMuIE1vdmUgYWxsIG9mIHRoZSBpOTE1LmtvIHNwZWNpZmljIHRlc3RzIHRvIHRlc3Rz
L2k5MTUvCj4KPiBGb3IgYnVpbGQgc3lzdGVtIHNpbXBsaWNpdHksIEknZCBhZHZvY2F0ZSBrZWVw
aW5nIGdlbmVyaWMgdGVzdHMKPiBzZXBhcmF0ZSBmcm9tIGRyaXZlciBzcGVjaWZpYyB0ZXN0cy4g
U28ga21zX2ZsaXAgd291bGQgaGF2ZSBrbXMvIGFuZAo+IGk5MTUvIHBvcnRpb25zLCBldGMuCj4K
PiAoQW5kIHRvb2xzL2k5MTU7IGJlbmNobWFya3MvaTkxNSBldGMpCj4KPj4+PiArwqDCoMKgIGl0
ZW1zX3B0ciA9IG1tYXAoMCwgNDA5NiwgUFJPVF9XUklURSwgTUFQX1BSSVZBVEUgfCBNQVBfQU5P
TiwKPj4+PiAtMSwgMCk7Cj4+Pj4gK8KgwqDCoCBpdGVtc19wdHJbMF0ucXVlcnlfaWQgPSBEUk1f
STkxNV9RVUVSWV9UT1BPTE9HWV9JTkZPOwo+Pj4+ICvCoMKgwqAgaTkxNV9xdWVyeV9pdGVtKGZk
LCBpdGVtc19wdHIsIDEpOwo+Pj4+ICvCoMKgwqAgaWd0X2Fzc2VydChpdGVtc19wdHJbMF0ubGVu
Z3RoID49IHNpemVvZihzdHJ1Y3QKPj4+PiBkcm1faTkxNV9xdWVyeV90b3BvbG9neV9pbmZvKSk7
Cj4+Pj4gK8KgwqDCoCBtdW5tYXAoaXRlbXNfcHRyLCA0MDk2KTsKPj4+PiArwqDCoMKgIGk5MTVf
cXVlcnlfaXRlbV9lcnIoZmQsIGl0ZW1zX3B0ciwgMSwgRUZBVUxUKTsKPj4+IEFub3RoZXIgZ29v
ZCB0ZXN0IHdvdWxkIGJlIHBhc3NpbmcgaW4gYSByZWFkIG9ubHkgbWFwcGluZyBhbmQgY2hlY2tp
bmcKPj4+IGZvciBFRkFVTFQgd2hlbiBsZW5ndGggd3JpdGViYWNrIGZhaWxzLgo+PiBIbS4uLiBo
b3cgdG8gZG8geW91IHdyaXRlIHNvbWV0aGluZyBzZW5zaWJsZSBpbnRvIGEgcmVhZCBvbmx5IG1h
cHBpbmcgc28KPj4gdGhhdCB0aGUga2VybmVsIHdvdWxkIGF0IGxlYXN0IHRyeSB0byB3cml0ZSB0
byBpdD8gOikKPiBwdHIgPSBtbWFwKHN6KTsKPiBtZW1zZXQocHRyLCAweGM1LCBzeik7Cj4gbXBy
b3RlY3QocHRyLCBzeiwgUFJPVF9SRUFEKTsKPgo+IFNvIHlvdSBjYW4gc2V0dXAgYSB2YWxpZCBi
bG9iIHRyaWNraW5nIHRoZSBrZXJuZWwgdG8gd3JpdGUgYmFjayB0byBpdAo+IGFuZCBzZW5kIHVz
IGFuIEVGQVVMVC4KPiAtQ2hyaXMKPgoKVGhhbmtzIEkgZW5kZWQgdXAgYW5zd2VyaW5nIG15IG93
biBxdWVzdGlvbsKgIDopCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
