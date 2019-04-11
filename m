Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190411130101.GA2333@intel.intel>
References: <20190408161533.2421-6-andi.shyti@intel.com>
 <20190411122654.1680-1-tvrtko.ursulin@linux.intel.com>
 <155498592365.22467.8220615834316531843@skylake-alporthouse-com>
 <20190411130101.GA2333@intel.intel>
Message-ID: <155499004582.22467.3989945936737043582@skylake-alporthouse-com>
Date: Thu, 11 Apr 2019 14:40:45 +0100
Subject: Re: [igt-dev] [Intel-gfx] [RFT i-g-t 6/6] test: perf_pmu: use the
 gem_engine_topology library
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
To: Andi Shyti <andi.shyti@intel.com>
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbmRpIFNoeXRpICgyMDE5LTA0LTExIDE0OjAxOjAxKQo+IE9uIFRodSwgQXByIDEx
LCAyMDE5IGF0IDAxOjMyOjAzUE0gKzAxMDAsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IFF1b3Rp
bmcgVHZydGtvIFVyc3VsaW4gKDIwMTktMDQtMTEgMTM6MjY6NTQpCj4gPiA+IEZyb206IEFuZGkg
U2h5dGkgPGFuZGkuc2h5dGlAaW50ZWwuY29tPgo+ID4gPiAKPiA+ID4gUmVwbGFjZSB0aGUgbGVn
YWN5IGZvcl9lYWNoX2VuZ2luZSogZGVmaW5lcyB3aXRoIHRoZSBvbmVzCj4gPiA+IGltcGxlbWVu
dGVkIGluIHRoZSBnZW1fZW5naW5lX3RvcG9sb2d5IGxpYnJhcnkuCj4gPiA+IAo+ID4gPiBVc2Ug
d2hlbmV2ZXIgcG9zc2libGUgZ2VtX2VuZ2luZV9jYW5fc3RvcmVfZHdvcmQoKSB0aGF0IGNoZWNr
cwo+ID4gPiBjbGFzcyBpbnN0ZWFkIG9mIGZsYWdzLgo+ID4gPiAKPiA+ID4gTm93IHRoZSBfX2Zv
cl9lYWNoX2VuZ2luZV9jbGFzc19pbnN0YW5jZSBhbmQKPiA+ID4gZm9yX2VhY2hfZW5naW5lX2Ns
YXNzX2luc3RhbmNlIGFyZSB1bnVzZWQsIHJlbW92ZSB0aGVtLgo+ID4gPiAKPiA+ID4gU3VnZ2Vz
dGVkLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBBbmRpIFNoeXRpIDxhbmRpLnNoeXRpQGludGVsLmNvbT4KPiA+ID4gQ2M6
IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBsaW51eC5pbnRlbC5jb20+Cj4gPiA+IFJl
dmlld2VkLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+ID4g
Cj4gPiBJIHNlZSBhIGxvdCBvZiBuZXcgZ2VtX2NvbnRleHRfY3JlYXRlKCksIGJ1dCBub3QgZ2Vt
X3JlcXVpcmVfY29udGV4dHMoKS4KPiAKPiBnZW1fcmVxdWlyZV9jb250ZXh0cygpIHNob3VsZCBn
byBvbiB0b3Agb2YgZW5naW5lX3RvcG9sb2d5LgoKZW5naW5lX3RvcG9sb2d5IHNob3VsZG4ndCBy
ZXF1aXJlIGNvbnRleHRzIHBlciBzZSwgYXMgd2Ugc2hvdWxkIGJlIGFibGUKdG8gcXVpdGUgaGFw
cGlseSBtb2RpZnkgdGhlIGVuZ2luZSBtYXAgZm9yIFBpbmV2aWV3LiBUbyB3aGF0IHB1cnBvc2Us
CndlIGRvIG5vdCBhc2shCgpKdXN0IGJlIGNhcmVmdWwgeW91IGRvbid0IGxlZ2FjeSB0ZXN0cy4K
LUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
