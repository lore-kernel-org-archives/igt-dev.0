Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Mon, 9 Oct 2023 22:03:59 +0000
Message-ID: <PH0PR11MB5782AF81E325E521E2B5EE6182CEA@PH0PR11MB5782.namprd11.prod.outlook.com>
References: <20231005153116.452319-1-matthew.auld@intel.com>
 <20231005153116.452319-4-matthew.auld@intel.com>
In-Reply-To: <20231005153116.452319-4-matthew.auld@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 03/12] lib/igt_draw: mark buffers as
 SCANOUT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIE9jdG9iZXIgNSwgMjAy
MyA4OjMxIEFNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogaW50
ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBTb3V6YSwgSm9zZSA8am9zZS5zb3V6YUBpbnRl
bC5jb20+Ow0KPiBNaXNocmEsIFBhbGxhdmkgPHBhbGxhdmkubWlzaHJhQGludGVsLmNvbT4NCj4g
U3ViamVjdDogW1BBVENIIGktZy10IDAzLzEyXSBsaWIvaWd0X2RyYXc6IG1hcmsgYnVmZmVycyBh
cyBTQ0FOT1VUDQo+IA0KPiBEaXNwbGF5IGJ1ZmZlcnMgbGlrZWx5IHdpbGwgd2FudCBXQywgaW5z
dGVhZCBvZiB0aGUgZGVmYXVsdCBXQiBvbiB0aGUgQ1BVIHNpZGUsDQo+IGdpdmVuIHRoYXQgZGlz
cGxheSBlbmdpbmUgaXMgaW5jb2hlcmVudCB3aXRoIENQVSBjYWNoZXMuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+DQo+IENjOiBKb3PD
qSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCj4gQ2M6IFBhbGxhdmkg
TWlzaHJhIDxwYWxsYXZpLm1pc2hyYUBpbnRlbC5jb20+DQoNClJldmlld2VkLWJ5OiBQYWxsYXZp
IE1pc2hyYSA8cGFsbGF2aS5taXNocmFAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGxpYi9pZ3RfZHJh
dy5jIHwgMyArKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9saWIvaWd0X2RyYXcuYyBiL2xpYi9pZ3RfZHJhdy5j
IGluZGV4IDQ3Njc3OGExMy4uMjMzMmJmOTRhDQo+IDEwMDY0NA0KPiAtLS0gYS9saWIvaWd0X2Ry
YXcuYw0KPiArKysgYi9saWIvaWd0X2RyYXcuYw0KPiBAQCAtNzkxLDcgKzc5MSw4IEBAIHN0YXRp
YyB2b2lkIGRyYXdfcmVjdF9yZW5kZXIoaW50IGZkLCBzdHJ1Y3QgY21kX2RhdGENCj4gKmNtZF9k
YXRhLA0KPiAgCWVsc2UNCj4gIAkJdG1wLmhhbmRsZSA9IHhlX2JvX2NyZWF0ZV9mbGFncyhmZCwg
MCwNCj4gIAkJCQkJCUFMSUdOKHRtcC5zaXplLA0KPiB4ZV9nZXRfZGVmYXVsdF9hbGlnbm1lbnQo
ZmQpKSwNCj4gLQkJCQkJCXZpc2libGVfdnJhbV9pZl9wb3NzaWJsZShmZCwNCj4gMCkpOw0KPiAr
CQkJCQkJdmlzaWJsZV92cmFtX2lmX3Bvc3NpYmxlKGZkLA0KPiAwKSB8DQo+ICsNCj4gCVhFX0dF
TV9DUkVBVEVfRkxBR19TQ0FOT1VUKTsNCj4gDQo+ICAJdG1wLnN0cmlkZSA9IHJlY3QtPncgKiBw
aXhlbF9zaXplOw0KPiAgCXRtcC5icHAgPSBidWYtPmJwcDsNCj4gLS0NCj4gMi40MS4wDQoNCg==
