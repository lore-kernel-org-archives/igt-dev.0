Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8BD6EC23
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2018 08:04:23 +0000 (UTC)
From: "Lofstedt, Marta" <marta.lofstedt@intel.com>
Date: Thu, 22 Feb 2018 08:04:21 +0000
Message-ID: <CA5F6A4B62957246A95956419746064382B3954F@IRSMSX106.ger.corp.intel.com>
References: <20180222080012.25885-1-marta.lofstedt@intel.com>
 <151928653001.11316.4279831743401474639@mail.alporthouse.com>
In-Reply-To: <151928653001.11316.4279831743401474639@mail.alporthouse.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/3] igt/kms_fbcon_fbt: Handle ENODEV
 when checking i915_edp_psr_status for chipset support
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
To: Chris Wilson <chris@chris-wilson.co.uk>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

VGhhbmtzIENocmlzLCBzb3JyeSBmb3IgcmlwcGluZyBvZmYgeW91ciB3b3JrIQ0KDQo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IENocmlzIFdpbHNvbiBbbWFpbHRvOmNocmlz
QGNocmlzLXdpbHNvbi5jby51a10NCj4gU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDIyLCAyMDE4
IDEwOjAyIEFNDQo+IFRvOiBMb2ZzdGVkdCwgTWFydGEgPG1hcnRhLmxvZnN0ZWR0QGludGVsLmNv
bT47IGlndC0NCj4gZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW2ln
dC1kZXZdIFtQQVRDSCBpLWctdCB2MiAxLzNdIGlndC9rbXNfZmJjb25fZmJ0OiBIYW5kbGUNCj4g
RU5PREVWIHdoZW4gY2hlY2tpbmcgaTkxNV9lZHBfcHNyX3N0YXR1cyBmb3IgY2hpcHNldCBzdXBw
b3J0DQo+IA0KPiBRdW90aW5nIE1hcnRhIExvZnN0ZWR0ICgyMDE4LTAyLTIyIDA4OjAwOjEwKQ0K
PiA+IElmIHRoZSBtYWNoaW5lIGRvZXNuJ3Qgc3VwcG9ydCBQU1IsIGl0IHdpbGwgcmV0dXJuIC1F
Tk9ERVYgZnJvbQ0KPiA+IGk5MTVfZWRwX3Bzcl9zdGF0dXMsIHdoaWNoIHdlIHdhbnQgdG8gaW50
ZXJwcmV0IGFzIHVuc3VwcG9ydGVkLg0KPiA+IFRoaXMgaXMgaW4gbGluZSB3aXRoIHdoYXQgQ2hy
aXMganVzdCBmaXhlZCBmb3IgRkJDLg0KPiA+DQo+ID4gVjI6IENvcHktcGFzdGVkIHRvIHRoZSBj
b3JyZWN0IHBvc2l0aW9uLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTWFydGEgTG9mc3RlZHQg
PG1hcnRhLmxvZnN0ZWR0QGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgdGVzdHMva21zX2ZiY29u
X2ZidC5jIHwgMyArKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiA+
DQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19mYmNvbl9mYnQuYyBiL3Rlc3RzL2ttc19mYmNv
bl9mYnQuYyBpbmRleA0KPiA+IDFiMjM2ZjhiLi5iMDFjNzY5YyAxMDA2NDQNCj4gPiAtLS0gYS90
ZXN0cy9rbXNfZmJjb25fZmJ0LmMNCj4gPiArKysgYi90ZXN0cy9rbXNfZmJjb25fZmJ0LmMNCj4g
PiBAQCAtMTY1LDYgKzE2NSw5IEBAIHN0YXRpYyBib29sIHBzcl9zdXBwb3J0ZWRfb25fY2hpcHNl
dChpbnQgZmQpDQo+ID4gICAgICAgICBjaGFyIGJ1ZlsyNTZdOw0KPiA+DQo+ID4gICAgICAgICBp
Z3RfZGVidWdmc19yZWFkKGZkLCAiaTkxNV9lZHBfcHNyX3N0YXR1cyIsIGJ1Zik7DQo+ID4gKyAg
ICAgICBpZiAoKmJ1ZiA9PSAnXDAnKSAvKiAhSEFTX1BTUiAtPiAtRU5PREVWKi8NCj4gPiArICAg
ICAgICAgICAgICAgcmV0dXJuIGZhbHNlOw0KPiANCj4gUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNv
biA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPiAtQ2hyaXMNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldgo=
