Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A46489254
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2019 07:34:29 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id u57so18286184edm.3
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2019 00:34:29 -0700 (PDT)
Date: Thu, 25 Apr 2019 09:34:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190425073420.GZ9857@phenom.ffwll.local>
References: <1554495245-27955-1-git-send-email-kevin.strasser@intel.com>
 <1554495245-27955-2-git-send-email-kevin.strasser@intel.com>
 <20190424200528.GV9857@phenom.ffwll.local>
 <20190424201906.GI1747@intel.com>
 <51B6C3CD1F10FB47A5702881E0E230A793D63062@ORSMSX101.amr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51B6C3CD1F10FB47A5702881E0E230A793D63062@ORSMSX101.amr.corp.intel.com>
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
To: "Strasser, Kevin" <kevin.strasser@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBBcHIgMjQsIDIwMTkgYXQgMDg6NDM6NTVQTSArMDAwMCwgU3RyYXNzZXIsIEtldmlu
IHdyb3RlOgo+IFZpbGxlIFN5cmrDpGzDpCB3cm90ZToKPiA+IE9uIFdlZCwgQXByIDI0LCAyMDE5
IGF0IDEwOjA1OjI4UE0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiA+IE9uIEZyaSwg
QXByIDA1LCAyMDE5IGF0IDAxOjE0OjAzUE0gLTA3MDAsIEtldmluIFN0cmFzc2VyIHdyb3RlOgo+
ID4gPiA+IFByb2JlIGZvciBhbmQgbWFrZSBhbiBBUEkgYXZhaWxhYmxlIGZvciB0ZXN0cyB0byB1
c2UgZjE2YyBpbnRyaW5zaWNzCj4gPiA+ID4gdG8gZ2VuZXJhdGUgbmVlZGVkIGZwMTYgcGl4ZWwg
ZGF0YS4KPiA+ID4gPgo+ID4gPiA+IEFsc28gaW1wb3J0IGEgcHVyZSBjIGZwMzIgPC0+IGZwMTYg
Y29udmVyc2lvbiBpbXBsZW1lbnRhdGlvbiBmcm9tCj4gPiA+ID4gTWVzYSAxOC4zLjQsIHdoaWNo
IHdpbGwgYWN0IGFzIGEgZmFsbGJhY2sgd2hlbiBmMTZjIGlzIHVuYXZhaWxhYmxlLgo+ID4gPiA+
Cj4gPiA+ID4gcmZjMjoKPiA+ID4gPiAtIENoYW5nZSBBUEkgdG8gcmVkdWNlIG51bWJlciBvZiBm
dW5jdGlvbiBjYWxscyAoTWFhcnRlbikKPiA+ID4gPgo+ID4gPiA+IHYxOgo+ID4gPiA+IC0gTW92
ZSBwcmFnbWEgc28gQVZYIGNvZGUgaXNuJ3QgZW1pdHRlZCBmb3IgZmFsbGJhY2tzIChWaWxsZSkK
PiA+ID4gPiAtIENoYW5nZSBlZHggdG8gZWN4IChWaWxsZSkKPiA+ID4gPgo+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEtldmluIFN0cmFzc2VyIDxrZXZpbi5zdHJhc3NlckBpbnRlbC5jb20+Cj4gPiA+
ID4gUmV2aWV3ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRl
bC5jb20+Cj4gPiA+Cj4gPiA+IGJ0dyB0aGlzIGJyb2tlIHRoZSBidWlsZCwgYW5kIHNvbWVvbmUg
ZWxzZSBnb3QgdG8gZml4IGl0IHVwIGZvciB5b3U6Cj4gPiA+Cj4gPiA+IGNvbW1pdCAxMWUxMGJj
NTc1NTE2YzU2OTc4NjQwZmNjNjk3YzI3ZjI3N2M2NjBhCj4gPiA+IEF1dGhvcjogU2ltb24gU2Vy
IDxzaW1vbi5zZXJAaW50ZWwuY29tPgo+ID4gPiBEYXRlOiAgIFdlZCBBcHIgMjQgMTA6MDE6Mjkg
MjAxOSArMDMwMAo+ID4gPgo+ID4gPiAgICAgbGliL2lndF9oYWxmZmxvYXQ6IGZpeCBjb21waWxh
dGlvbiB3aXRoIENsYW5nCj4gPiAKPiA+IFNpbmNlIHdoZW4gaXMgYnVpbGRpbmcgd2l0aCBjbGFu
ZyBhIHJlcXVpcmVtZW50Pwo+IAo+IEkgZGlkbid0IHJlYWxpemUgY2xhbmcgd2FzIGEgcmVxdWly
ZW1lbnQgZWl0aGVyLCBidXQgSSBzaG91bGQndmUga25vd24KPiBiZXR0ZXIgYXMgaXQgZG9lcyBz
ZWVtIHRvIGJlIGEgcGF0dGVybiBhY3Jvc3MgZmRvIHByb2plY3RzLgo+IAo+IFRoYW5rcyBmb3Ig
dGhlIGZpeCwgU2ltb24hCgpJIGhhdmUgbm8gaWRlYSB3aHkgc29tZW9uZSBwdXQgY2xhbmcgaW50
byB0aGUgY29tbWl0IG1lc3NhZ2UsIGl0J3Mgbm9uLXg4NgpidWlsZHMgdGhhdCBicm9rZS4KCllv
dSBmb2xrcyByZWFsbHkgc2hvdWxkIHJlYWQgdGhlIGdpdGxhYiBDSSBtYWlscywgYW5kIGlmIHlv
dSBkb24ndCBnZXQKdGhlbSwgZmlndXJlICBvdXQgd2h5IC4uLgotRGFuaWVsCi0tIApEYW5pZWwg
VmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5m
ZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
