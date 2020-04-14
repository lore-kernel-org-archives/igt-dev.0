Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9E88961D
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2020 09:28:26 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <14063C7AD467DE4B82DEDB5C278E8663FFFE2240@FMSMSX108.amr.corp.intel.com>
References: <20200413182525.1581-1-ashutosh.dixit@intel.com>
 <14063C7AD467DE4B82DEDB5C278E8663FFFE2240@FMSMSX108.amr.corp.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158685650224.24284.2994445661079380369@build.alporthouse.com>
Date: Tue, 14 Apr 2020 10:28:22 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] igt/gem_shrink: Fix reversed logic when
 mmap fails
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Ruhl,
 Michael J" <michael.j.ruhl@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBSdWhsLCBNaWNoYWVsIEogKDIwMjAtMDQtMTMgMTk6Mjc6NDIpCj4gPi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4gPkZyb206IERpeGl0LCBBc2h1dG9zaCA8YXNodXRvc2guZGl4
aXRAaW50ZWwuY29tPgo+ID5TZW50OiBNb25kYXksIEFwcmlsIDEzLCAyMDIwIDI6MjUgUE0KPiA+
VG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPkNjOiBDaHJpcyBXaWxzb24gPGNo
cmlzQGNocmlzLXdpbHNvbi5jby51az47IFJ1aGwsIE1pY2hhZWwgSgo+ID48bWljaGFlbC5qLnJ1
aGxAaW50ZWwuY29tPgo+ID5TdWJqZWN0OiBbUEFUQ0ggaS1nLXRdIGlndC9nZW1fc2hyaW5rOiBG
aXggcmV2ZXJzZWQgbG9naWMgd2hlbiBtbWFwIGZhaWxzCj4gPgo+ID5DYW4ndCB0b3VjaCB0aGUg
bWVtb3J5IGlmIG1tYXAgcmV0dXJucyBNQVBfRkFJTEVELgo+ID4KPiA+djI6IHMvKGNoYXIgKikt
MSkvTUFQX0ZBSUxFRC8gKE1pa2UgUnVobCkKPiAKPiDwn5iKCj4gCj4gUmV2aWV3ZWQtYnk6IE1p
Y2hhZWwgSi4gUnVobCA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPgo+IAo+ID5GaXhlczogOWNm
ZjNiZTEyNygiaWd0L2dlbV9zaHJpbms6IFJlZHVjZSBvb20gc3BhbSIpCj4gPlNpZ25lZC1vZmYt
Ynk6IEFzaHV0b3NoIERpeGl0IDxhc2h1dG9zaC5kaXhpdEBpbnRlbC5jb20+Cj4gPi0tLQo+ID4g
dGVzdHMvaTkxNS9nZW1fc2hyaW5rLmMgfCAyICstCj4gPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dl
bV9zaHJpbmsuYyBiL3Rlc3RzL2k5MTUvZ2VtX3Nocmluay5jCj4gPmluZGV4IDExYWE5ZWZjMS4u
ZTQzNDYxM2ViIDEwMDY0NAo+ID4tLS0gYS90ZXN0cy9pOTE1L2dlbV9zaHJpbmsuYwo+ID4rKysg
Yi90ZXN0cy9pOTE1L2dlbV9zaHJpbmsuYwo+ID5AQCAtMjc0LDcgKzI3NCw3IEBAIHN0YXRpYyB2
b2lkIGxlYWsoaW50IGZkLCB1aW50NjRfdCBhbGxvYykKPiA+ICAgICAgIHB0ciA9IG1tYXAoTlVM
TCwgYWxsb2MsIFBST1RfUkVBRCB8IFBST1RfV1JJVEUsCj4gPiAgICAgICAgICAgICAgICAgIE1B
UF9BTk9OIHwgTUFQX1BSSVZBVEUgfCBNQVBfUE9QVUxBVEUsCj4gPiAgICAgICAgICAgICAgICAg
IC0xLCAwKTsKPiA+LSAgICAgIGlmIChwdHIgIT0gKGNoYXIgKiktMSkKPiA+KyAgICAgIGlmIChw
dHIgPT0gTUFQX0ZBSUxFRCkKPiA+ICAgICAgICAgICAgICAgcmV0dXJuOwoKSSBoYWQgdG8gZG91
YmxlIGNoZWNrIHRoYXQgaW4gYSBmdW5jdGlvbiBjYWxsZWQgbGVhaygpIHdlIHdlcmVuJ3QKYWN0
dWFsbHkgd2FpdGluZyBmb3IgdGhlIGZhaWx1cmUuIEJ1dCBubywgdGhpcyBmdW5jdGlvbiBhbGxv
Y2F0ZXMgYW5kCm1ha2VzIHN1cmUgdGhhdCBpdCBpcyBwb3B1bGF0ZWQgYW5kIGZhdWx0ZWQsIHRo
ZW4gbGVha3MgaXQuCgpSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxz
b24uY28udWs+Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
