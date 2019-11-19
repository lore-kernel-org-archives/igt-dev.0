Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F90F6E51B
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2019 11:16:25 +0000 (UTC)
References: <20191119110117.13209-1-venkata.s.dhanalakota@intel.com>
 <20191119110117.13209-2-venkata.s.dhanalakota@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <f577e4e4-c4e2-1a97-0c65-8bd0593bb0c6@linux.intel.com>
Date: Tue, 19 Nov 2019 11:16:22 +0000
MIME-Version: 1.0
In-Reply-To: <20191119110117.13209-2-venkata.s.dhanalakota@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] test/i915: gem_exec_parallel: Fix
 for using context engine map
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
To: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDE5LzExLzIwMTkgMTE6MDEsIFZlbmthdGEgU2FuZGVlcCBEaGFuYWxha290YSB3cm90ZToK
PiBTaW5jZSBlbmdpbmVzIGFyZSBub3cgbG9va2VkIHVwIGJhc2VkIG9uIGNvbnRleHQgZW5naW5l
IG1hcCwKPiBjb250ZXh0IHNob3VsZCBiZSBzZXR1cCB3aXRoIGVuZ2luZXMgYmVmb3JlIHVzaW5n
IGluIGV4ZWNidWYuCj4gCj4gRml4ZXM6IGE5OTk4YzIzIGlndCgiZ2VtX2V4ZWNfcGFyYWxsZWw6
IHVzZSB0aGUgZ2VtX2VuZ2luZV90b3BvbG9neSIpCj4gCj4gQ2M6IEFuZGkgU2h5dGkgPGFuZGku
c2h5dGlAaW50ZWwuY29tPgo+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5j
by51az4KPiBDYzogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGxpbnV4LmludGVsLmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBWZW5rYXRhIFNhbmRlZXAgRGhhbmFsYWtvdGEgPHZlbmthdGEu
cy5kaGFuYWxha290YUBpbnRlbC5jb20+Cj4gLS0tCj4gICB0ZXN0cy9pOTE1L2dlbV9leGVjX3Bh
cmFsbGVsLmMgfCA0ICsrKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fZXhlY19wYXJhbGxl
bC5jIGIvdGVzdHMvaTkxNS9nZW1fZXhlY19wYXJhbGxlbC5jCj4gaW5kZXggOGE0NDgyZTUuLjU2
YjI2Y2Y0IDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfcGFyYWxsZWwuYwo+ICsr
KyBiL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfcGFyYWxsZWwuYwo+IEBAIC0xMjYsOCArMTI2LDEwIEBA
IHN0YXRpYyB2b2lkICp0aHJlYWQodm9pZCAqZGF0YSkKPiAgIAlleGVjYnVmLmZsYWdzIHw9IExP
Q0FMX0k5MTVfRVhFQ19OT19SRUxPQzsKPiAgIAlpZiAodC0+Z2VuIDwgNikKPiAgIAkJZXhlY2J1
Zi5mbGFncyB8PSBJOTE1X0VYRUNfU0VDVVJFOwo+IC0JaWYgKHQtPmZsYWdzICYgQ09OVEVYVFMp
Cj4gKwlpZiAodC0+ZmxhZ3MgJiBDT05URVhUUykgewo+ICAgCQlleGVjYnVmLnJzdmQxID0gZ2Vt
X2NvbnRleHRfY3JlYXRlKGZkKTsKPiArCQlnZW1fY29udGV4dF9zZXRfYWxsX2VuZ2luZXMoZmQs
IGV4ZWNidWYucnN2ZDEpOwo+ICsJfQo+ICAgCj4gICAJZm9yIChpID0gMDsgaSA8IDE2OyBpKysp
IHsKPiAgIAkJb2JqWzBdLmhhbmRsZSA9IHQtPnNjcmF0Y2hbaV07Cj4gCgpSZXZpZXdlZC1ieTog
VHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KClJlZ2FyZHMsCgpUdnJ0
a28KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
