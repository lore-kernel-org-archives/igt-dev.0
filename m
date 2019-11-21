Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: "Tang, CQ" <cq.tang@intel.com>
Date: Thu, 21 Nov 2019 23:56:05 +0000
Message-ID: <1D440B9B88E22A4ABEF89F9F1F81BC29E94A74D9@FMSMSX106.amr.corp.intel.com>
References: <20191113125240.3781-1-chris@chris-wilson.co.uk>
 <20191113125240.3781-5-chris@chris-wilson.co.uk>
 <1D440B9B88E22A4ABEF89F9F1F81BC29E94A5E2E@FMSMSX106.amr.corp.intel.com>
 <157437988036.2524.15103838845430811433@skylake-alporthouse-com>
In-Reply-To: <157437988036.2524.15103838845430811433@skylake-alporthouse-com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 5/9] i915/gem_ctx_isolation:
 Check engine relative registers
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
To: Chris Wilson <chris@chris-wilson.co.uk>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2hyaXMgV2lsc29uIDxj
aHJpc0BjaHJpcy13aWxzb24uY28udWs+DQo+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAyMSwg
MjAxOSAzOjQ1IFBNDQo+IFRvOiBUYW5nLCBDUSA8Y3EudGFuZ0BpbnRlbC5jb20+OyBpbnRlbC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KPiBTdWJqZWN0OiBSRTogW0ludGVsLWdmeF0gW1BBVENIIGktZy10IDUvOV0gaTkxNS9n
ZW1fY3R4X2lzb2xhdGlvbjogQ2hlY2sNCj4gZW5naW5lIHJlbGF0aXZlIHJlZ2lzdGVycw0KPiAN
Cj4gUXVvdGluZyBUYW5nLCBDUSAoMjAxOS0xMS0yMSAyMTowNzoxMykNCj4gPg0KPiA+DQo+ID4g
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogSW50ZWwtZ2Z4IDxpbnRl
bC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZg0KPiA+ID4gT2Yg
Q2hyaXMgV2lsc29uDQo+ID4gPiBTZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDEzLCAyMDE5IDQ6
NTMgQU0NCj4gPiA+IFRvOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gPiBD
YzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiA+IFN1YmplY3Q6IFtJbnRlbC1n
ZnhdIFtQQVRDSCBpLWctdCA1LzldIGk5MTUvZ2VtX2N0eF9pc29sYXRpb246IENoZWNrDQo+ID4g
PiBlbmdpbmUgQEAgLTI0OCw2ICsyMzgsNyBAQCBzdGF0aWMgdm9pZCB0bXBsX3JlZ3MoaW50IGZk
LCAgew0KPiA+ID4gICAgICAgY29uc3QgdW5zaWduZWQgaW50IGdlbl9iaXQgPSAxIDw8DQo+ID4g
PiBpbnRlbF9nZW4oaW50ZWxfZ2V0X2RybV9kZXZpZChmZCkpOw0KPiA+ID4gICAgICAgY29uc3Qg
dW5zaWduZWQgaW50IGVuZ2luZV9iaXQgPSBFTkdJTkUoZS0+Y2xhc3MsIGUtPmluc3RhbmNlKTsN
Cj4gPiA+ICsgICAgIGNvbnN0IHVpbnQzMl90IG1taW9fYmFzZSA9IGdlbV9lbmdpbmVfbW1pb19i
YXNlKGZkLCBlLT5uYW1lKTsNCj4gPg0KPiA+IENocmlzLCBJIHRyaWVkIHRvIHRlc3QgdGhpcyBw
YXRjaCwgYnV0ICJnZW1fZW5naW5lX21taW9fYmFzZSgpIiBhYm92ZSBpcw0KPiBub3QgZGVmaW5l
ZC4NCj4gPiBDYW4geW91IGNoZWNrPw0KPiANCj4gRGlkIHlvdSBwZXJjaGFuY2UgbG9vayBhdCBw
YXRjaCA0Pw0KDQpUaGFua3MsIGZpbmQgdGhpcyBvbmU6DQpbaS1nLXQsNC85XSBpOTE1OiBTdGFy
dCBwdXR0aW5nIHRoZSBtbWlvX2Jhc2UgdG8gd2lkZXIgdXNlDQoNCi0tQ1ENCg0KPiAtQ2hyaXMN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
