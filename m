Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 834A4892EE
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jun 2019 09:09:04 +0000 (UTC)
Date: Thu, 6 Jun 2019 12:08:59 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20190606090859.gee5mrtmuqe6q76a@ahiler-desk1.fi.intel.com>
References: <20190605074514.7375-1-arkadiusz.hiler@intel.com>
 <20190605074514.7375-3-arkadiusz.hiler@intel.com>
 <155981156814.19464.10436939737901611130@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <155981156814.19464.10436939737901611130@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] Makefile: Do not nest new gem tests
 in i915 directory
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBKdW4gMDYsIDIwMTkgYXQgMDk6NTk6MjhBTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgQXJrYWRpdXN6IEhpbGVyICgyMDE5LTA2LTA1IDA4OjQ1OjE0KQo+ID4g
JCBkaWZmIDwoc2VkICJzLyAvXG4vZyIgbWVzb24tdGVzdC1saXN0LnR4dCB8IGdyZXAgLXYgJ3Zj
NFx8djNkXHxwYW5mcm9zdCcgfCBzb3J0KSA8KHNlZCAicy8gL1xuL2ciIGF1dG90b29scy10ZXN0
LWxpc3QudHh0IHwgc29ydCkKPiA+IDMwZDI5Cj4gPiA8IGdlbV9jdHhfY2xvbmUKPiA+IDMyZDMw
Cj4gPiA8IGdlbV9jdHhfZW5naW5lcwo+ID4gMzZkMzMKPiA+IDwgZ2VtX2N0eF9zaGFyZWQKPiA+
IDEzN2QxMzMKPiA+IDwgZ2VtX3ZtX2NyZWF0ZQo+ID4gMTQ1YTE0MiwxNDYKPiA+ID4gaTkxNS9n
ZW1fY3R4X2Nsb25lCj4gPiA+IGk5MTUvZ2VtX2N0eF9lbmdpbmVzCj4gPiA+IGk5MTUvZ2VtX2N0
eF9zaGFyZWQKPiA+ID4gaTkxNS9nZW1fZXhlY19iYWxhbmNlcgo+ID4gPiBpOTE1L2dlbV92bV9j
cmVhdGUKPiA+IAo+ID4gTGV0J3MgbWFrZSB0aGlzIGNvbnNpc3RlbnQgd2l0aCBtZXNvbiBhbmQg
YWxsIHRoZSBvdGhlciBnZW0gdGVzdHMgd2UKPiA+IGhhdmUuCj4gCj4gUGxlYXNlLCBuby4gUGxl
YXNlLCBjYW4gSSBoYXZlIG15IHRlc3RzIGJhY2s/IEFuZCBhbGwgdGhlIG90aGVycyB5b3UKPiBt
b3ZlZCBhd2F5Pwo+IC1DaHJpcwoKU3VyZSwgSSBhbSBhbGwgdXAgZm9yIHRoYXQsIGJ1dCBieSBk
b2luZyBzbyBtZWFucyBubyBzZW5zaWJsZSByZXN1bHRzCmZyb20gQ0kgdW50aWwgc3R1ZmYgZ2V0
cyBmaXhlZCB0aGVyZS4gQXMgSSBoYXZlIHN0YXRlZCB3ZSBhcmUgYWxtb3N0CnRoZXJlLCBJIHRo
aW5rIHRoYXQgdGhlIHZpcyBodG1scyBhbmQgbGlua3MgaXMgdGhlIHZlcnkgbGFzdCBiaXQuCgpM
ZXQncyBiZSBjb25zaXN0ZW50IGZvciBub3cgYW5kIGhhdmUgcmVzdWx0cy4gV2Ugd2lsbCBuZWVk
IHRvIGhhdmUgYQpmbGFnIGRheSB3aGVuIHdlIGluc3RhbGwgdGhlbSB1bmRlciBpOTE1Ly4gVGhp
cyB3aWxsIHJlcXVpcmUKY29vcmRpbmF0aW9uIGZyb20gTWFydGluIHRvIGdldCB0aGUgZmlsdGVy
aW5nIHJpZ2h0LgoKSnVzdCB0byBiZSBjbGVhciAtIHRoaXMgaGFzIG5vdGhpbmcgdG8gZG8gd2l0
aCBtZXNvbi4KCi0tIApDaGVlcnMsCkFyZWsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2
