Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4331E6E2F9
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Mar 2018 14:28:03 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20180309093144.31814-1-lionel.g.landwerlin@intel.com>
 <20180309093144.31814-3-lionel.g.landwerlin@intel.com>
 <d55e9b77-5a45-2220-f221-14fa31e7ebf3@linux.intel.com>
 <139382ee-63c6-5066-e405-65878b54a945@intel.com>
 <e4c2e3c4-a1df-faae-4738-3cd406318662@linux.intel.com>
In-Reply-To: <e4c2e3c4-a1df-faae-4738-3cd406318662@linux.intel.com>
Message-ID: <152060567941.10591.1491315189597724455@mail.alporthouse.com>
Date: Fri, 09 Mar 2018 14:27:59 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v8 3/3] tests: add i915 query tests
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Lionel Landwerlin <lionel.g.landwerlin@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wMy0wOSAxNDoyMTo0NSkKPiAKPiBPbiAwOS8w
My8yMDE4IDE0OjA3LCBMaW9uZWwgTGFuZHdlcmxpbiB3cm90ZToKPiA+IE9uIDA5LzAzLzE4IDEz
OjIzLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToKPiA+Pj4gK8KgwqDCoCAvKiBUZXN0IGEgY291cGxl
IG9mIGludmFsaWQgcG9pbnRlcnMuICovCj4gPj4+ICvCoMKgwqAgaTkxNV9xdWVyeV9pdGVtc19l
cnIoZmQsICh2b2lkICopIFVMT05HX01BWCwgMSwgRUZBVUxUKTsKPiA+Pj4gK8KgwqDCoCBpOTE1
X3F1ZXJ5X2l0ZW1zX2VycihmZCwgKHZvaWQgKikgMCwgMSwgRUZBVUxUKTsKPiA+Pgo+ID4+IEFs
c28gbmVlZCBvbmUgd2hlcmUgc3RydWN0IGRybV9pOTE1X3F1ZXJ5IGl0c2VsZiBpdCBpbnZhbGlk
IG9yIG5vdCAKPiA+PiBtYXBwZWQuCj4gPiAKPiA+IERvZXNuJ3QgdGhlIHRlc3RzIGJlbG93ICh1
bm1hcHBpbmcgdGhlIGl0ZW1zIHBvaW50ZXIpIGNvdmVyIHRoYXQgY2FzZT8KPiAKPiBEb24ndCB0
aGluayBzby4gWW91IG5lZWQgdG8gaGl0IHRoZSBmYWlsdXJlIGluIDoKPiAKPiAraW50IGk5MTVf
cXVlcnlfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwgc3RydWN0IAo+
IGRybV9maWxlICpmaWxlKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAq
ZGV2X3ByaXYgPSB0b19pOTE1KGRldik7Cj4gKyAgICAgICBzdHJ1Y3QgZHJtX2k5MTVfcXVlcnkg
KmFyZ3MgPSBkYXRhOwo+ICsgICAgICAgc3RydWN0IGRybV9pOTE1X3F1ZXJ5X2l0ZW0gX191c2Vy
ICp1c2VyX2l0ZW1fcHRyID0KPiArICAgICAgICAgICAgICAgdTY0X3RvX3VzZXJfcHRyKGFyZ3Mt
Pml0ZW1zX3B0cik7Cj4gCj4gVGhpcyBkZXJlZmVyZW5jZSBoZXJlLiBPciBpcyBEUk0gY29yZSBh
bHJlYWR5IGNvdmVyaW5nIGZvciB0aGF0PyBJIG1lYW4gCj4gdGhlIGZhY3QuLi4KPiAKPiArc3Rh
dGljIGludAo+ICtfX2k5MTVfcXVlcnlfaXRlbXMoaW50IGZkLCBzdHJ1Y3QgZHJtX2k5MTVfcXVl
cnlfaXRlbSAqaXRlbXMsIHVpbnQzMl90IAo+IG5faXRlbXMpCj4gK3sKPiArICAgIHN0cnVjdCBk
cm1faTkxNV9xdWVyeSBxID0gewo+ICsgICAgICAgIC5udW1faXRlbXMgPSBuX2l0ZW1zLAo+ICsg
ICAgICAgIC5pdGVtc19wdHIgPSB0b191c2VyX3BvaW50ZXIoaXRlbXMpLAo+ICsgICAgfTsKPiAr
ICAgIHJldHVybiBfX2k5MTVfcXVlcnkoZmQsICZxKTsKPiAKPiAuLi4gJnEgYWx3YXlzIHBvaW50
cyB0byBnb29kIG1lbW9yeT8KClllcywgaW4gdGhpcyBjYXNlIHN0cnVjdCBkcm1faTkxNV9xdWVy
eSBpcyBhbHJlYWR5IGNoZWNrZWQgYW5kIGNvcGllZCBieQpkcm1faW9jdGwoKSBvbnRvIHRoZSBz
dGFjay9oZWFwLgoKU2Vuc2libGUgc3VnZ2VzdGlvbiBmb3IgYSB0ZXN0IHRob3VnaCwgaXQncyBv
bmUgdGhhdCBpcyByYXJlbHkgY2hlY2tlZC4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldgo=
