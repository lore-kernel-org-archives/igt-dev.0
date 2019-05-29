Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07F56E0AA
 for <igt-dev@lists.freedesktop.org>; Wed, 29 May 2019 10:54:56 +0000 (UTC)
From: "Ser, Simon" <simon.ser@intel.com>
Date: Wed, 29 May 2019 10:54:54 +0000
Message-ID: <128385757b1ab1ee6c1f2396eafa6410676289fd.camel@intel.com>
References: <20190529105150.19050-1-petri.latvala@intel.com>
 <20190529105150.19050-2-petri.latvala@intel.com>
In-Reply-To: <20190529105150.19050-2-petri.latvala@intel.com>
Content-Language: en-US
Content-ID: <5563A67383F6104D815E1D46FBA7EA4C@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] meson: Mark pciaccess and kmod as
 required
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Latvala, Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTA1LTI5IGF0IDEzOjUxICswMzAwLCBQZXRyaSBMYXR2YWxhIHdyb3RlOg0K
PiBsaWJwY2lhY2Nlc3MgYW5kIGxpYmttb2QgaGF2ZSBiZWVuIG1hbmRhdG9yeSBhbHJlYWR5LCBi
dXQgbm90IG1hcmtlZA0KPiBhcyByZXF1aXJlZC4NCg0KSSB0aG91Z2h0IG1hbmRhdG9yeSBkZXBz
IHdlcmUgdGhlIGRlZmF1bHQ/DQoNCkluIG90aGVyIHdvcmRzLCBJIGJlbGlldmUgdGhpczoNCg0K
ICAgbGlia21vZCA9IGRlcGVuZGVuY3koJ2xpYmttb2QnKQ0KDQpNYWtlcyBsaWJrbW9kIGEgbWFu
ZGF0b3J5IGRlcC4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2
YWxhQGludGVsLmNvbT4NCj4gQ2M6IEFya2FkaXVzeiBIaWxlciA8YXJrYWRpdXN6LmhpbGVyQGlu
dGVsLmNvbT4NCj4gQ2M6IFNpbW9uIFNlciA8c2ltb24uc2VyQGludGVsLmNvbT4NCj4gLS0tDQo+
ICBtZXNvbi5idWlsZCB8IDQgKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29u
LmJ1aWxkDQo+IGluZGV4IDYyNjhjNThkLi4zMzZjZTRlNiAxMDA2NDQNCj4gLS0tIGEvbWVzb24u
YnVpbGQNCj4gKysrIGIvbWVzb24uYnVpbGQNCj4gQEAgLTExNCw4ICsxMTQsOCBAQCBlbmRpZg0K
PiAgDQo+ICBidWlsZF9pbmZvICs9ICdXaXRoIGxpYmRybTogJyArICcsJy5qb2luKGxpYmRybV9p
bmZvKQ0KPiAgDQo+IC1wY2lhY2Nlc3MgPSBkZXBlbmRlbmN5KCdwY2lhY2Nlc3MnLCB2ZXJzaW9u
IDogJz49MC4xMCcpDQo+IC1saWJrbW9kID0gZGVwZW5kZW5jeSgnbGlia21vZCcpDQo+ICtwY2lh
Y2Nlc3MgPSBkZXBlbmRlbmN5KCdwY2lhY2Nlc3MnLCB2ZXJzaW9uIDogJz49MC4xMCcsIHJlcXVp
cmVkIDogdHJ1ZSkNCj4gK2xpYmttb2QgPSBkZXBlbmRlbmN5KCdsaWJrbW9kJywgcmVxdWlyZWQg
OiB0cnVlKQ0KPiAgbGlicHJvY3BzID0gZGVwZW5kZW5jeSgnbGlicHJvY3BzJywgcmVxdWlyZWQg
OiB0cnVlKQ0KPiAgDQo+ICBsaWJ1bndpbmQgPSBkZXBlbmRlbmN5KCdsaWJ1bndpbmQnLCByZXF1
aXJlZCA6IGdldF9vcHRpb24oJ3dpdGhfbGlidW53aW5kJykpDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2lndC1kZXY=
