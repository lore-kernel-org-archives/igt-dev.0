Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C44D89346
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2019 08:55:27 +0000 (UTC)
References: <20190513175613.2507-1-andi.shyti@intel.com>
 <20190513175613.2507-7-andi.shyti@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <5450d776-2002-5f10-3139-7445f2c2cf96@linux.intel.com>
Date: Tue, 14 May 2019 09:55:57 +0100
MIME-Version: 1.0
In-Reply-To: <20190513175613.2507-7-andi.shyti@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH v24 06/14] test: perf_pmu: use the
 gem_engine_topology library
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
To: Andi Shyti <andi.shyti@intel.com>, IGT dev <igt-dev@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

CkhpLAoKT24gMTMvMDUvMjAxOSAxODo1NiwgQW5kaSBTaHl0aSB3cm90ZToKPiBSZXBsYWNlIHRo
ZSBsZWdhY3kgZm9yX2VhY2hfZW5naW5lKiBkZWZpbmVzIHdpdGggdGhlIG9uZXMKPiBpbXBsZW1l
bnRlZCBpbiB0aGUgZ2VtX2VuZ2luZV90b3BvbG9neSBsaWJyYXJ5Lgo+IAo+IFVzZSB3aGVuZXZl
ciBwb3NzaWJsZSBnZW1fZW5naW5lX2Nhbl9zdG9yZV9kd29yZCgpIHRoYXQgY2hlY2tzCj4gY2xh
c3MgaW5zdGVhZCBvZiBmbGFncy4KPiAKPiBOb3cgdGhlIF9fZm9yX2VhY2hfZW5naW5lX2NsYXNz
X2luc3RhbmNlIGFuZAo+IGZvcl9lYWNoX2VuZ2luZV9jbGFzc19pbnN0YW5jZSBhcmUgdW51c2Vk
LCByZW1vdmUgdGhlbS4KPiAKPiBTdWdnZXN0ZWQtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28u
dXJzdWxpbkBpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQW5kaSBTaHl0aSA8YW5kaS5zaHl0
aUBpbnRlbC5jb20+Cj4gQ2M6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBsaW51eC5p
bnRlbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBp
bnRlbC5jb20+Cgpbc25pcF0KCj4gQEAgLTEzMDEsNyArMTMxMiw3IEBAIHRlc3RfZnJlcXVlbmN5
KGludCBnZW1fZmQpCj4gICAJaWd0X3JlcXVpcmUoaWd0X3N5c2ZzX2dldF91MzIoc3lzZnMsICJn
dF9ib29zdF9mcmVxX21oeiIpID09IG1pbl9mcmVxKTsKPiAgIAo+ICAgCWdlbV9xdWllc2NlbnRf
Z3B1KGdlbV9mZCk7IC8qIElkbGUgdG8gYmUgc3VyZSB0aGUgY2hhbmdlIHRha2VzIGVmZmVjdCAq
Lwo+IC0Jc3BpbiA9IHNwaW5fc3luYyhnZW1fZmQsIDAsIEk5MTVfRVhFQ19SRU5ERVIpOwo+ICsJ
c3BpbiA9IHNwaW5fc3luY19mbGFncyhnZW1fZmQsIDAsIEk5MTVfRVhFQ19SRU5ERVIpOwoKWW91
IGRpZG4ndCBuZWVkIHRvIGNoYW5nZSBob3RwbHVnL2ZyZXF1ZW5jeSZpbnRlcnJ1cHRzIHRvIHVz
ZSAKSTkxNV9FWEVDX0RFRkFVTFQ/IERvZXMgaXQgd29yayBvbiBwYXRjaGVzIGtlcm5lbD8gSXQg
ZG9lc24ndCBleGVjdXRlIG9uIAplbmdpbmUgaW5kZXggMSBmcm9tIHRoZSBtYXAsIHdoaWNoIGlz
IG5vdCByY3MwPwoKUmVnYXJkcywKClR2cnRrbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXY=
