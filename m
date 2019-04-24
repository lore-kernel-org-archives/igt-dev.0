Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DAA8919C
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2019 20:43:57 +0000 (UTC)
From: "Strasser, Kevin" <kevin.strasser@intel.com>
Date: Wed, 24 Apr 2019 20:43:55 +0000
Message-ID: <51B6C3CD1F10FB47A5702881E0E230A793D63062@ORSMSX101.amr.corp.intel.com>
References: <1554495245-27955-1-git-send-email-kevin.strasser@intel.com>
 <1554495245-27955-2-git-send-email-kevin.strasser@intel.com>
 <20190424200528.GV9857@phenom.ffwll.local> <20190424201906.GI1747@intel.com>
In-Reply-To: <20190424201906.GI1747@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/3] lib: Add halffloat implementation
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
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

VmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+IE9uIFdlZCwgQXByIDI0LCAyMDE5IGF0IDEwOjA1OjI4
UE0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiBPbiBGcmksIEFwciAwNSwgMjAxOSBh
dCAwMToxNDowM1BNIC0wNzAwLCBLZXZpbiBTdHJhc3NlciB3cm90ZToKPiA+ID4gUHJvYmUgZm9y
IGFuZCBtYWtlIGFuIEFQSSBhdmFpbGFibGUgZm9yIHRlc3RzIHRvIHVzZSBmMTZjIGludHJpbnNp
Y3MKPiA+ID4gdG8gZ2VuZXJhdGUgbmVlZGVkIGZwMTYgcGl4ZWwgZGF0YS4KPiA+ID4KPiA+ID4g
QWxzbyBpbXBvcnQgYSBwdXJlIGMgZnAzMiA8LT4gZnAxNiBjb252ZXJzaW9uIGltcGxlbWVudGF0
aW9uIGZyb20KPiA+ID4gTWVzYSAxOC4zLjQsIHdoaWNoIHdpbGwgYWN0IGFzIGEgZmFsbGJhY2sg
d2hlbiBmMTZjIGlzIHVuYXZhaWxhYmxlLgo+ID4gPgo+ID4gPiByZmMyOgo+ID4gPiAtIENoYW5n
ZSBBUEkgdG8gcmVkdWNlIG51bWJlciBvZiBmdW5jdGlvbiBjYWxscyAoTWFhcnRlbikKPiA+ID4K
PiA+ID4gdjE6Cj4gPiA+IC0gTW92ZSBwcmFnbWEgc28gQVZYIGNvZGUgaXNuJ3QgZW1pdHRlZCBm
b3IgZmFsbGJhY2tzIChWaWxsZSkKPiA+ID4gLSBDaGFuZ2UgZWR4IHRvIGVjeCAoVmlsbGUpCj4g
PiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEtldmluIFN0cmFzc2VyIDxrZXZpbi5zdHJhc3NlckBp
bnRlbC5jb20+Cj4gPiA+IFJldmlld2VkLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmph
bGFAbGludXguaW50ZWwuY29tPgo+ID4KPiA+IGJ0dyB0aGlzIGJyb2tlIHRoZSBidWlsZCwgYW5k
IHNvbWVvbmUgZWxzZSBnb3QgdG8gZml4IGl0IHVwIGZvciB5b3U6Cj4gPgo+ID4gY29tbWl0IDEx
ZTEwYmM1NzU1MTZjNTY5Nzg2NDBmY2M2OTdjMjdmMjc3YzY2MGEKPiA+IEF1dGhvcjogU2ltb24g
U2VyIDxzaW1vbi5zZXJAaW50ZWwuY29tPgo+ID4gRGF0ZTogICBXZWQgQXByIDI0IDEwOjAxOjI5
IDIwMTkgKzAzMDAKPiA+Cj4gPiAgICAgbGliL2lndF9oYWxmZmxvYXQ6IGZpeCBjb21waWxhdGlv
biB3aXRoIENsYW5nCj4gCj4gU2luY2Ugd2hlbiBpcyBidWlsZGluZyB3aXRoIGNsYW5nIGEgcmVx
dWlyZW1lbnQ/CgpJIGRpZG4ndCByZWFsaXplIGNsYW5nIHdhcyBhIHJlcXVpcmVtZW50IGVpdGhl
ciwgYnV0IEkgc2hvdWxkJ3ZlIGtub3duCmJldHRlciBhcyBpdCBkb2VzIHNlZW0gdG8gYmUgYSBw
YXR0ZXJuIGFjcm9zcyBmZG8gcHJvamVjdHMuCgpUaGFua3MgZm9yIHRoZSBmaXgsIFNpbW9uIQoK
LUtldmluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
