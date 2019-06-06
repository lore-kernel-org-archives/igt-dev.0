Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09392892CA
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jun 2019 15:34:05 +0000 (UTC)
References: <20190530154222.16804-1-ramalingam.c@intel.com>
 <20190530154222.16804-6-ramalingam.c@intel.com>
 <20190606141701.GE1330@intel.intel>
 <3d9d21b8-1679-433d-1c6e-5a0abc2bbcd2@linux.intel.com>
 <20190606153126.GA5646@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <466b62a9-dace-21df-d69d-b01dc4706cf3@linux.intel.com>
Date: Thu, 6 Jun 2019 16:34:03 +0100
MIME-Version: 1.0
In-Reply-To: <20190606153126.GA5646@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v2 5/5] test/prime_vgem: use the
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
To: Ramalingam C <ramalingam.c@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDA2LzA2LzIwMTkgMTY6MzEsIFJhbWFsaW5nYW0gQyB3cm90ZToKPiBPbiAyMDE5LTA2LTA2
IGF0IDE1OjM4OjM2ICswMTAwLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToKPj4KPj4gT24gMDYvMDYv
MjAxOSAxNToxNywgQW5kaSBTaHl0aSB3cm90ZToKPj4+IEhpIFJhbSwKPj4+Cj4+PiBqdXN0IGEg
bml0cGljawo+Pj4KPj4+PiAtCWV4ZWNidWYuZmxhZ3MgPSByaW5nIHwgZmxhZ3M7Cj4+Pj4gKwll
eGVjYnVmLmZsYWdzID0gZSA/IGUtPmZsYWdzIDogSTkxNV9FWEVDX0RFRkFVTFQ7Cj4+Pgo+Pj4g
QmVjYXVzZSB3ZSBhcmUgbW92aW5nIHRvIHRoZSBuZXcgZW5naW5lIG5hbWluZywgdGhlCj4+PiAi
STkxNV9FWEVDX0RFRkFVTFQiIGVuZ2luZSwgY29uY2VwdHVhbGx5LCBzaG91bGQgbm90IGJlIHVz
ZWQuCj4+Pgo+Pj4gUG9saXRpY2FsbHksIHdpdGggVHZydGtvLCB3ZSBhZ3JlZWQgdGhhdCBoZSBk
ZWZhdWx0IGVuZ2luZSBub3cKPj4+IGlzICJJOTE1X0VOR0lORV9DTEFTU19SRU5ERVIiLCBpdCdz
IG5vdCB0aGUgYmVzdCBhcyBzb2x1dGlvbiwgYnV0Cj4+PiB3b3Jrcy4KPj4KPj4gSSB0b3RhbGx5
IGRvbid0IHJlbWVtYmVyIEkgZXZlciBzdWdnZXN0ZWQgdG8gdXNlIGNsYXNzIG9yIGV2ZW4gaXQg
d2FzCj4+IGRpc2N1c3NlZC4gIDopIERpZG4ndCB3ZSBzYXkgdG8ganVzdCB1c2UgemVybz8KPiBD
YW4ndCB1c2UgSTkxNV9FWEVDX1JFTkRFUiBpbnN0ZWFkIG9mIERFRkFVTFQhPyBiZWNhdXNlIHRo
YXQgd2lsbCBiZQo+IGV4ZWNfZmxhZyBmb3IgcmVuZGVyIGNsYXNzIHJpZ2h0PwoKTm8sIEk5MTVf
RVhFQ19SRU5ERVIgaXMgMSBzbyBpZiB0aGUgY29udGV4dCBoYXMgZW5naW5lIG1hcCBjb25maWd1
cmVkIAp0aGF0IHdpbGwgbWFwIHRvIDJuZCBlbmdpbmUgaW4gdGhlIG1hcCAtIHdoaWNoIGlzIG5v
dCByY3MwLgoKV2UgYXJlIHJlbHlpbmcgaGVyZSBvbiByY3MwIGJlaW5nIGZpcnN0IChpbmRleCAw
KS4gQnV0IHRoYXQgaXMgYWxzbyBub3QgCnJlbGlhYmxlLiBXZSBuZWVkIGEgbG9va3VwIGhlbHBl
ciB0byBiZSBtb3JlIHJvYnVzdCBnb2luZyBmb3J3YXJkLgoKUmVnYXJkcywKClR2cnRrbwoKCj4g
LVJhbQo+Pgo+PiBSZWdhcmRzLAo+Pgo+PiBUdnJ0a28KPj4KPj4+IFRoZSByZXN0IGxvb2tzIGdv
b2QuCj4+Pgo+Pj4gUmV2aWV3ZWQtYnk6IEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlAaW50ZWwuY29t
Pgo+Pj4KPj4+IFRoYW5rcywKPj4+IEFuZGkKPj4+Cj4gCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldg==
