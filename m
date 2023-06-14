Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D59E10E425
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jun 2023 08:25:14 +0000 (UTC)
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Manszewski, Christoph" <christoph.manszewski@intel.com>
Date: Wed, 14 Jun 2023 08:25:09 +0000
Message-ID: <78378790b50f640c5d2625efa38f53e94efe557d.camel@intel.com>
References: <20230609093719.2076046-1-christoph.manszewski@intel.com>
 <20230609093719.2076046-2-christoph.manszewski@intel.com>
In-Reply-To: <20230609093719.2076046-2-christoph.manszewski@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F3C27D621B05D4690EEBA8A3F03502F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib: Apply rightmost execution mask
 to xehp gpu walker
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Wilson, Chris P" <chris.p.wilson@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTA2LTA5IGF0IDExOjM3ICswMjAwLCBDaHJpc3RvcGggTWFuc3pld3NraSB3
cm90ZToNCj4gVGhlIGZpbmFsIHRocmVhZCBncm91cCBpbiBlYWNoIHJvdyBtYXkgbmVlZCBwYXJ0
aWFsIGV4ZWN1dGlvbiAobm90IHRoZQ0KPiBmdWxsIHNpbWQxNikgaW4gb3JkZXIgdG8gZml0IHdp
dGhpbiB0aGUgcmVnaW9uIG9mIGludGVyZXN0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMg
V2lsc29uIDxjaHJpcy5wLndpbHNvbkBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IENocmlz
dG9waCBNYW5zemV3c2tpIDxjaHJpc3RvcGgubWFuc3pld3NraUBpbnRlbC5jb20+DQoNClJldmll
d2VkLWJ5OiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsuZ3J6ZWdvcnpla0BpbnRlbC5jb20+
DQo+IC0tLQ0KPiAgbGliL2dwdV9jbWRzLmMgfCAxMCArKysrKysrKy0tDQo+ICAxIGZpbGUgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2xpYi9ncHVfY21kcy5jIGIvbGliL2dwdV9jbWRzLmMNCj4gaW5kZXggYWVjYmE5MjguLjQ4ZmUx
ZTEzIDEwMDY0NA0KPiAtLS0gYS9saWIvZ3B1X2NtZHMuYw0KPiArKysgYi9saWIvZ3B1X2NtZHMu
Yw0KPiBAQCAtOTUzLDcgKzk1Myw3IEBAIHhlaHBfZW1pdF9jb21wdXRlX3dhbGsoc3RydWN0IGlu
dGVsX2JiICppYmIsDQo+ICAJCSAgICAgICBzdHJ1Y3QgeGVocF9pbnRlcmZhY2VfZGVzY3JpcHRv
cl9kYXRhICpwaWRkLA0KPiAgCQkgICAgICAgdWludDhfdCBjb2xvcikNCj4gIHsNCj4gLQl1aW50
MzJfdCB4X2RpbSwgeV9kaW07DQo+ICsJdWludDMyX3QgeF9kaW0sIHlfZGltLCBtYXNrOw0KPiAg
DQo+ICAJLyoNCj4gIAkgKiBTaW1wbHkgZG8gU0lNRDE2IGJhc2VkIGRpc3BhdGNoLCBzbyBldmVy
eSB0aHJlYWQgdXNlcw0KPiBAQCAtOTY5LDYgKzk2OSwxMiBAQCB4ZWhwX2VtaXRfY29tcHV0ZV93
YWxrKHN0cnVjdCBpbnRlbF9iYiAqaWJiLA0KPiAgCXhfZGltID0gKHggKyB3aWR0aCArIDE1KSAv
IDE2Ow0KPiAgCXlfZGltID0geSArIGhlaWdodDsNCj4gIA0KPiArCW1hc2sgPSAoeCArIHdpZHRo
KSAmIDE1Ow0KPiArCWlmIChtYXNrID09IDApDQo+ICsJCW1hc2sgPSAoMSA8PCAxNikgLSAxOw0K
PiArCWVsc2UNCj4gKwkJbWFzayA9ICgxIDw8IG1hc2spIC0gMTsNCj4gKw0KPiAgCWludGVsX2Ji
X291dChpYmIsIFhFSFBfQ09NUFVURV9XQUxLRVIgfCAweDI1KTsNCj4gIA0KPiAgCWludGVsX2Ji
X291dChpYmIsIDApOyAvKiBkZWJ1ZyBvYmplY3QgKi8JCS8vZHcxDQo+IEBAIC05ODAsNyArOTg2
LDcgQEAgeGVocF9lbWl0X2NvbXB1dGVfd2FsayhzdHJ1Y3QgaW50ZWxfYmIgKmliYiwNCj4gIAlp
bnRlbF9iYl9vdXQoaWJiLCAxIDw8IDMwIHwgMSA8PCAyNSB8IDEgPDwgMTcpOwkJLy9kdzQNCj4g
IA0KPiAgCS8qIEV4ZWN1dGlvbiBtYXNrICovDQo+IC0JaW50ZWxfYmJfb3V0KGliYiwgMHhmZmZm
ZmZmZik7CQkJCS8vZHc1DQo+ICsJaW50ZWxfYmJfb3V0KGliYiwgbWFzayk7CQkJCS8vZHc1DQo+
ICANCj4gIAkvKiB4L3kveiBtYXggKi8NCj4gIAlpbnRlbF9iYl9vdXQoaWJiLCAoeF9kaW0gPDwg
MjApIHwgKHlfZGltIDw8IDEwKSB8IDEpOwkvL2R3Ng0KDQo=
