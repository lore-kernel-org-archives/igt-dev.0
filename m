Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECD16E2F9
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2019 10:03:43 +0000 (UTC)
Date: Fri, 22 Mar 2019 12:03:42 +0200
From: Andi Shyti <andi.shyti@intel.com>
Message-ID: <20190322100342.GB1557@intel.intel>
References: <20190321160528.4131-1-andi.shyti@intel.com>
 <20190321160528.4131-5-andi.shyti@intel.com>
 <6b531677-8e74-c51c-535a-bb5e1c1f2ac7@linux.intel.com>
 <155324155883.26447.7921522281863006035@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <155324155883.26447.7921522281863006035@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH v15 4/5] lib/i915: add gem_engine_topology
 library and for_each loop definition
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
Cc: IGT dev <igt-dev@lists.freedesktop.org>, Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

PiA+ID4gKwo+ID4gPiArICAgICBlMi0+Y2xhc3MgICAgPSBjbGFzczsKPiA+ID4gKyAgICAgZTIt
Pmluc3RhbmNlID0gaW5zdGFuY2U7Cj4gPiA+ICsgICAgIGUyLT5mbGFncyAgICA9IGZsYWdzOwo+
ID4gPiArCj4gPiA+ICsgICAgIGlmIChjbGFzcyA8IDAgJiYgaW5zdGFuY2UgPCAwKSB7Cj4gPiA+
ICsgICAgICAgICAgICAgZTItPm5hbWUgPSB2aXJ0dWFsX25hbWU7Cj4gPiA+ICsgICAgIH0gZWxz
ZSB7Cj4gPiA+ICsgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGludGVsX2V4ZWN1dGlvbl9lbmdp
bmUyICpfX2UyOwo+ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgX19mb3JfZWFjaF9zdGF0aWNf
ZW5naW5lKF9fZTIpCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBpZiAoX19lMi0+Y2xhc3Mg
PT0gY2xhc3MgJiYgX19lMi0+aW5zdGFuY2UgPT0gaW5zdGFuY2UpCj4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgZTIt
Pm5hbWUgPSBfX2UyLT5uYW1lID8gX19lMi0+bmFtZSA6IHVua25vd25fbmFtZTsKPiA+IAo+ID4g
SSd2ZSBub3cgc3RhcnRlZCB0byB3b3JyeSBhYm91dCBob3cgd2lsbCBDSS9idWdsb2cgaGFuZGxl
IHVzIGZvcmdldHRpbmcgCj4gPiB0byBleHBhbmQgdGhlIHN0YXRpYyBsaXN0LiAoTW9yZSB0aGFu
IG9uZSBzdWJ0ZXN0IG9mIGEgc2FtZSBuYW1lIGZvciAKPiA+ICJ0ZXN0LSRlbmdpbmVfbmFtZSIg
b25lcz8pIERvIHdlIHdhbnQgYW5kIGlndF93YXJuIG9uIHVua25vd24gZW5naW5lcyB0byAKPiA+
IG1ha2UgaXQgbW9yZSB2aXNpYmxlPyBPciBldmVuIGp1c3QgY3Jhc2g/Cj4gCj4gU2V0IGZsYWdz
IHRvIC0xdWxsLiBUaGF0IHNob3VsZCBjYXVzZSBFSU5WQUwgZm9yZXZlciBvbmUgaG9wZXMuCj4g
Cj4gV2Ugc2hvdWxkbid0IGdldCBhbnkgdGVzdCAoYXRtKSB3aXRoIHVua25vd24gYXMgd2Ugb25s
eSB1c2UgdGhlIHN0YXRpYwo+IHRhYmxlIGZvciB0ZXN0IGdlbmVyYXRpb24uIEZvciBydW50aW1l
IHRlc3QgZGlzY292ZXJ5LCB3ZSBjYW4gYXBwbHkgdGhlCj4gZmlsdGVyIG9mIGRvZXMgdGhpcyBl
bmdpbmUgYWN0dWFsbHkgZXhpc3QuCgptYWtlIHNlbnNlLCB3ZSBjb3VsZCBjaGVjayBpdCB3aXRo
IGdlbV9oYXNfcmluZygpIGFuZCBpZiBpdCBkb2Vzbid0CmV4aXN0IHByaW50IGEgd2FybmluZyBh
bmQgZGlzY2FyZCBpdC4KCj4gPiBJIHJlbWVtYmVyZWQgaG93IGF0IG9uZSBwb2ludCBJIGhhZCAi
SVNfUEhZU0lDQUwiIGFzIGEgZmxhZyBpbiBlbmdpbmUgcXVlcnkuCj4gPiAKPiA+IE9yIHdlIG1h
a2UgdGhpcyBoZXJlIG1vcmUgZXhwbGljaXQgYnkgYmVpbmcgIklTX1ZJUlRVQUwiIGFuZCBpbnZl
cnQgdGhlIAo+ID4gdGVzdCBpbiB0aGUgY2FsbGVyPwo+IAo+IEF5ZS4gSSB0aGluayB5b3UgYXJl
IHJpZ2h0IGhlcmUsIGFuZCB3ZSBuZWVkIHRvIHB1dCBhIGNhcHMgZmllbGQgaW50bwo+IHRoZSBl
bmdpbmVfZGF0YSAoZmlsbGVkIGluIGJ5IGk5MTVfcXVlcnkgZm9yIHZhbGlkIGNsYXNzZXMgYW5k
IGRlZmF1bHQKPiB0byAhcGh5cyBmb3IgaW52YWxpZCBzbG90cykuCgp3aGF0IGRvIHlvdSBtZWFu
IGV4YWN0bHk/CgpBbmRpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
