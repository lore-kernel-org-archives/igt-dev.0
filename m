Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Deepak Singh Rawat <drawat@vmware.com>
Date: Thu, 6 Sep 2018 22:24:49 +0000
Message-ID: <BYAPR05MB418144E2E4B25B80F2C41F61BA010@BYAPR05MB4181.namprd05.prod.outlook.com>
References: <20180906000350.2478-1-drawat@vmware.com>
 <20180906000350.2478-5-drawat@vmware.com>
 <153622433707.3050.13686202456647481282@skylake-alporthouse-com>
In-Reply-To: <153622433707.3050.13686202456647481282@skylake-alporthouse-com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 4/5] lib/igt_fb: Check for
 stride before creating cairo surface
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
To: Chris Wilson <chris@chris-wilson.co.uk>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, linux-graphics-maintainer <linux-graphics-maintainer@vmware.com>, Sinclair Yeh <syeh@vmware.com>, Thomas Hellstrom <thellstrom@vmware.com>
List-ID: <igt-dev@lists.freedesktop.org>

PiBRdW90aW5nIERlZXBhayBSYXdhdCAoMjAxOC0wOS0wNiAwMTowMzo0OSkNCj4gPiBDYWlybyBz
dXJmYWNlIGNyZWF0aW9uIHdpbGwgZmFpbCBpZiBzdHJpZGUgb2YgcHJvdmlkZWQgYnVmZmVyIGlz
IG5vdA0KPiA+IHNhbWUgYXMgZXhwZWN0ZWQgYnkgY2Fpcm8uIFRoaXMgZmFpbHMgZm9yIHZtd2dm
eCBvZGQgbGVuZ3RoIGZyYW1lYnVmZmVyDQo+ID4gYXMgaW4gdm13Z2Z4IHN0cmlkZSBpcyBhbHdh
eXMgd2lkdGggKiBicHAuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBEZWVwYWsgUmF3YXQgPGRy
YXdhdEB2bXdhcmUuY29tPg0KPiA+IC0tLQ0KPiA+ICBsaWIvaWd0X2ZiLmMgfCAzICsrKw0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
bGliL2lndF9mYi5jIGIvbGliL2lndF9mYi5jDQo+ID4gaW5kZXggYmE5OTVhMWEuLjI3MjRlMzIz
IDEwMDY0NA0KPiA+IC0tLSBhL2xpYi9pZ3RfZmIuYw0KPiA+ICsrKyBiL2xpYi9pZ3RfZmIuYw0K
PiA+IEBAIC0xMzQ5LDYgKzEzNDksOSBAQCBzdGF0aWMgdm9pZCBjcmVhdGVfY2Fpcm9fc3VyZmFj
ZV9fZ3R0KGludCBmZCwNCj4gc3RydWN0IGlndF9mYiAqZmIpDQo+ID4gICAgICAgICAgICAgICAg
IHB0ciA9IGdlbV9tbWFwX19ndHQoZmQsIGZiLT5nZW1faGFuZGxlLCBmYi0+c2l6ZSwNCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQUk9UX1JFQUQgfCBQUk9UX1dSSVRF
KTsNCj4gPg0KPiA+ICsgICAgICAgaWd0X3JlcXVpcmUoZmItPnN0cmlkZSA9PSBjYWlyb19mb3Jt
YXRfc3RyaWRlX2Zvcl93aWR0aCgNCj4gPiArICAgICAgICAgICAgICAgZHJtX2Zvcm1hdF90b19j
YWlybyhmYi0+ZHJtX2Zvcm1hdCksIGZiLT53aWR0aCkpOw0KPiA+ICsNCj4gPiAgICAgICAgIGZi
LT5jYWlyb19zdXJmYWNlID0NCj4gPiAgICAgICAgICAgICAgICAgY2Fpcm9faW1hZ2Vfc3VyZmFj
ZV9jcmVhdGVfZm9yX2RhdGEocHRyLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBkcm1fZm9ybWF0X3RvX2NhaXJvKGZiLT5kcm1fZm9ybWF0
KSwNCj4gDQo+IElzIHRoZXJlIG5vdCBhDQo+IGlndF9yZXF1aXJlX2YvaWd0X2Fzc2VydF9mKGNh
aXJvX3N1cmZhY2Vfc3RhdHVzKGZiLT5jYWlyb19zdXJmYWNlKSA9PQ0KPiBDQUlST19TVEFUVVNf
U1VDQ0VTUywNCj4gIlVuYWJsZSB0byBjcmVhdGUgYSBjYWlybyBzdXJmYWNlOiAlcyIsDQo+IGNh
aXJvX3N0YXR1c190b19zdHJpbmcoY2Fpcm9fc3VyZmFjZV9zdGF0dXMoZmItPmNhaXJvX3N1cmZh
Y2UpKSk7DQo+IGhlcmU/DQo+IC1DaHJpcw0KDQpUaGFua3MgQ2hyaXMgZm9yIHRoZSByZXZpZXcu
DQoNCk5vIHRoZXJlIHdhc24ndCBhIGNoZWNrIGxpa2UgdGhhdCBidXQgSSBndWVzcyBJIGNhbiBh
ZGQgdGhhdCBpbnN0ZWFkIG9mDQpjaGVja2luZyBmb3Igc3RyaWRlLiANCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
