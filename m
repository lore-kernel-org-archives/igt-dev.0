Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4BD89E33
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jul 2020 15:36:15 +0000 (UTC)
Message-ID: <50492daddce8f221cc68fd8f59b2b6d72ff6f78a.camel@intel.com>
From: Carlos Santa <carlos.santa@intel.com>
Date: Thu, 23 Jul 2020 08:35:28 -0700
In-Reply-To: <20200723073203.GS20883@platvala-desk.ger.corp.intel.com>
References: <20200721181522.20042-1-carlos.santa@intel.com>
 <20200722075603.GR20883@platvala-desk.ger.corp.intel.com>
 <20200722114504.GC6112@intel.com>
 <20200723073203.GS20883@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] tests: add missing braces around initializer
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
To: Petri Latvala <petri.latvala@intel.com>, Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCAyMDIwLTA3LTIzIGF0IDEwOjMyICswMzAwLCBQZXRyaSBMYXR2YWxhIHdyb3RlOgo+
IE9uIFdlZCwgSnVsIDIyLCAyMDIwIGF0IDAyOjQ1OjA0UE0gKzAzMDAsIFZpbGxlIFN5cmrDpGzD
pCB3cm90ZToKPiA+IE9uIFdlZCwgSnVsIDIyLCAyMDIwIGF0IDEwOjU2OjAzQU0gKzAzMDAsIFBl
dHJpIExhdHZhbGEgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgSnVsIDIxLCAyMDIwIGF0IDExOjE1OjIx
QU0gLTA3MDAsIENhcmxvcyBTYW50YSB3cm90ZToKPiA+ID4gPiBJbiBzb21lIHNhbmRib3hlcyB0
aGUgdG9vbGNoYWluIGNvbXBsYWlucyBhYm91dCBtaXNzaW5nIGJyYWNlcwo+ID4gPiA+IGFyb3Vu
ZCBpbml0aWFsaXplciwgaG93ZXZlciwgYWRkaW5nIGFuIGV4dHJhIHBhaXIgb2YgYnJhY2VzCj4g
PiA+ID4gZml4ZXMgaXQsIHNlZSBiZWxvdzoKPiA+ID4gPiAKPiA+ID4gPiAuLi90ZXN0cy9rbXNf
cGxhbmVfY3Vyc29yLmM6IEluIGZ1bmN0aW9uICdfX3JlYWxfbWFpbl8zMDInOgo+ID4gPiA+IC4u
L3Rlc3RzL2ttc19wbGFuZV9jdXJzb3IuYzozMDU6MiBlcnJvcjogbWlzc2luZyBicmFjZXMgYXJv
dW5kCj4gPiA+ID4gaW5pdGlhbGl6ZXIgWy1XZXJyb3I9bWlzc2luZy1icmFjZXNdCj4gPiA+ID4g
CWRhdGFfdCBkYXRhID0geyAwIH07Cj4gPiA+ID4gCj4gPiA+IAo+ID4gPiBBcmdoLCBnY2MuCj4g
PiA+IAo+ID4gPiBDKysgc3VwcG9ydHMgaW5pdGlhbGl6aW5nIHdpdGggZW1wdHkgYnJhY2VzICgg
ZGF0YV90IGRhdGEgPSB7fTsgKQo+ID4gPiBhbmQKPiA+ID4gQyBkb2Vzbid0LAo+ID4gCj4gPiBJ
dCB3b3JrcyBqdXN0IGZpbmUuIFdlIHVzZSBpdCBleHRlbnNpdmVseSBhbGwgb3Zlci4KPiAKPiBI
bW0sIGluZGVlZC4KPiAKPiBBbHRob3VnaCB3ZSdyZSBib3RoIGNvcnJlY3Q7IHRoYXQncyBhIGdj
YyBleHRlbnNpb24uIEkgY2FuJ3QgZmluZCBhbnkKPiBkb2N1bWVudGF0aW9uIGFib3V0IHRoYXQs
IHRoZSBjbG9zZXN0IEkgY2FuIGZpbmQgaXMKPiBodHRwczovL2djYy5nbnUub3JnL2xlZ2FjeS1t
bC9nY2MvMjAxOS0wNy9tc2cwMDA2Ni5odG1sIGV4cGxhaW5pbmcKPiB3aGVyZSBpdCBfcHJvYmFi
bHlfIGNvbWVzIGZyb20uCj4gCj4gQXMgd2UgZXhwbGljaXRseSB1c2Ugc3RkPWdudTExLCB1c2lu
ZyBlbXB0eSBicmFjZSBpbml0aWFsaXphdGlvbgo+IGluc3RlYWQgb2YgeyAwIH0gc291bmRzIGxp
a2UgdGhlIHdheSBmb3J3YXJkIGhlcmUuCj4gCj4gCgpJIGp1c3QgdHJpZWQgd2l0aCBhbiBlbXB0
eSBicmFjZSBhbmQgdGhlIGlzc3VlIGdvZXMgYXdheS4gSSdsbCBzZW5kIHRoZQpwYXRjaCBsYXRl
ciB0b2RheS4KCnRoYW5rcywKCkNhcmxvcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2Cg==
