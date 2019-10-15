Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E7986E231
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Oct 2019 12:27:17 +0000 (UTC)
Date: Tue, 15 Oct 2019 15:27:13 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20191015122713.GB1208@intel.com>
References: <20191014181315.7430-1-ville.syrjala@linux.intel.com>
 <20191014181315.7430-3-ville.syrjala@linux.intel.com>
 <20191014195733.GC30388@intel.com>
 <20191014202122.GY1208@intel.com>
 <20191014205858.GD30388@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191014205858.GD30388@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tests/kms_tiled_display: Get rid of
 DP stuff
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
To: Manasi Navare <manasi.d.navare@intel.com>
Cc: igt-dev@lists.freedesktop.org, Madhumitha Tolakanahalli Pradeep <madhumitha.tolakanahalli.pradeep@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMDE6NTg6NThQTSAtMDcwMCwgTWFuYXNpIE5hdmFyZSB3
cm90ZToKPiBPbiBNb24sIE9jdCAxNCwgMjAxOSBhdCAxMToyMToyMlBNICswMzAwLCBWaWxsZSBT
eXJqw6Rsw6Qgd3JvdGU6Cj4gPiBPbiBNb24sIE9jdCAxNCwgMjAxOSBhdCAxMjo1NzozM1BNIC0w
NzAwLCBNYW5hc2kgTmF2YXJlIHdyb3RlOgo+ID4gPiBPbiBNb24sIE9jdCAxNCwgMjAxOSBhdCAw
OToxMzoxNVBNICswMzAwLCBWaWxsZSBTeXJqYWxhIHdyb3RlOgo+ID4gPiA+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gPiA+ID4gCj4gPiA+
ID4gVGhlcmUgaXMgbm90aGluZyBEUCBzcGVjaWZpYyBhYm91dCB0aGUgdGlsZSBwcm9wZXJ0eS4g
U28KPiA+ID4gPiByZW1vdmUgYW55IG1lbnRpb24gb2YgRFAgKGFuZCBwb3J0IHN5bmMgd2hpY2gg
aXMgYW4gaTkxNQo+ID4gPiA+IGhhcmR3YXJlIGZlYXR1cmUpLiBMZXQncyBqdXN0IHRhbGsgYWJv
dXQgZ2VubG9ja2VkIENSVENzCj4gPiA+ID4gYW5kIHRpbGVkIGNvbm5lY3RvcnMsIHdoaWNoIGlz
IHByZXR0eSBnZW5lcmljLgo+ID4gPiAKPiA+ID4gQnV0IHdlIGN1cnJlbnRseSBkb250IHN1cHBv
cnQgdGhlIHRyYW5zIHBvcnQgc3luYyBmZWF0dXJlIGZvciBvdGhlcgo+ID4gPiBjb25uZWN0b3Jy
cyBvdGhlciB0aGFuIERQIHNvIHRoZSB0ZXN0IHdpbGwgZmFpbCBzbyBJTU8sIAo+ID4gPiBjdXJy
ZW50bHkgaXQgc2hvdWxkIG9ubHkgcnVuIGZvciBEUCB0aWxlZCBjb25uZWN0b3JzCj4gPiAKPiA+
IFRoYXQncyBhbiBpOTE1IHNwZWNpZmljIGxpbWl0YXRpb24gYW5kIGlmIHlvdSB3YW50IHRvIGNo
ZWNrIGZvciB0aGF0Cj4gPiB0aGVuIHRoZSBjaGVjayBzaG91bGQgYmUgd3JpdHRlbiBhcyAnaWYg
KGlzX2k5MTUgJiYgd2hhdGV2ZXIpJy4KPiA+IAo+ID4gPiAKPiA+ID4gZXZlbiBEUCBNU1QgdHJh
bnMgcG9ydCBzeW5jIG1pZ2h0IGZhaWwgaGF2ZW50IGFkZGVkIHRoaXMgdG8gTVNUIHlldAo+ID4g
Cj4gPiBSaWdodCwgc28gdGhlIGNoZWNrIGlzbid0IGNvcnJlY3QgZXZlbiBvbiBpOTE1IC0+IGJl
dHRlciB0byBqdXN0IG51a2UgaXQuCj4gPgo+IAo+IFNvIHdvdWxkIHlvdSBtb2RpZnkgdGhpcyBw
YXRjaCB0byBhZGQgdGhvc2UgY2hlY2tzIG9yIHdvdWxkIHRoYXQgYmUgYSBmb2xsb3cgdXAgcGF0
Y2g/CgpJIHN0aWxsIGRvbid0IHNlZSB0aGUgcG9pbnQgb2YgYWRkaW5nIGFueSBjaGVja3MuIFRo
ZSB0ZXN0IHdpbGwganVzdApmYWlsIGlmIHRoZSBjcnRjcyBhcmVuJ3QgZ2VubG9ja2VkLCB3aGlj
aCBpcyB0b3RhbGx5IGZpbmUuCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
