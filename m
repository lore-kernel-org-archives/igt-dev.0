Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F18310E47F
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Oct 2023 12:06:42 +0000 (UTC)
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Tue, 31 Oct 2023 12:06:38 +0000
Message-ID: <761972b1a6acd4f2d79a5bdb501e3d2bcdb8a4dc.camel@intel.com>
References: <20231031080949.1145422-1-kunal1.joshi@intel.com>
 <20231031080949.1145422-6-kunal1.joshi@intel.com>
In-Reply-To: <20231031080949.1145422-6-kunal1.joshi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <439616A943A3784898701F8AD550EB1C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 5/7] lib/igt_psr: modified psr_get_mode
 for pr compatability
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Murthy, Arun R" <arun.r.murthy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTEwLTMxIGF0IDEzOjM5ICswNTMwLCBLdW5hbCBKb3NoaSB3cm90ZToNCj4g
TW9kaWZpZWQgcHNyX2dldF9tb2RlIGZvciBQUl9NT0RFDQo+IA0KPiBDYzogSm91bmkgSMO2Z2Fu
ZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IENjOiBBbmltZXNoIE1hbm5hIDxhbmlt
ZXNoLm1hbm5hQGludGVsLmNvbT4NCj4gQ2M6IEFydW4gUiBNdXJ0aHkgPGFydW4uci5tdXJ0aHlA
aW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBLdW5hbCBKb3NoaSA8a3VuYWwxLmpvc2hpQGlu
dGVsLmNvbT4NCj4gLS0tDQo+IMKgbGliL2lndF9wc3IuYyB8IDQgKysrLQ0KPiDCoDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9saWIvaWd0X3Bzci5jIGIvbGliL2lndF9wc3IuYw0KPiBpbmRleCBjMmIyYTQxNDguLmJkZGY4
MGQ2YSAxMDA2NDQNCj4gLS0tIGEvbGliL2lndF9wc3IuYw0KPiArKysgYi9saWIvaWd0X3Bzci5j
DQo+IEBAIC0zODIsNyArMzgyLDkgQEAgZW51bSBwc3JfbW9kZSBwc3JfZ2V0X21vZGUoaW50IGRl
YnVnZnNfZmQpDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIFBTUl9E
SVNBQkxFRDsNCj4gwqDCoMKgwqDCoMKgwqDCoH0NCj4gwqANCj4gLcKgwqDCoMKgwqDCoMKgaWYg
KHN0cnN0cihidWYsICJQU1IyIHNlbGVjdGl2ZSBmZXRjaDogZW5hYmxlZCIpKQ0KPiArwqDCoMKg
wqDCoMKgwqBpZiAoc3Ryc3RyKGJ1ZiwgIlBhbmVsIFJlcGxheSBFbmFibGVkIikpDQo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gUFJfTU9ERTsNCj4gK8KgwqDCoMKgwqDC
oMKgZWxzZSBpZiAoc3Ryc3RyKGJ1ZiwgIlBTUjIgc2VsZWN0aXZlIGZldGNoOiBlbmFibGVkIikp
DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIFBTUl9NT0RFXzJfU0VM
X0ZFVENIOw0KPiDCoMKgwqDCoMKgwqDCoMKgZWxzZSBpZiAoc3Ryc3RyKGJ1ZiwgIlBTUjIgZW5h
YmxlZCIpKQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBQU1JfTU9E
RV8yOw0KDQpZb3UgYXJlIG1pc3NpbmcgUGFuZWwgUmVwbGF5IFNlbGVjdGl2ZSB1cGRhdGUuIEkg
d291bGQgYXNzdW1lIGZvcm1hdA0KbGlrZSB0aGlzOg0KZm9yIFBSIFNlbGVjdGl2ZSB1cGRhdGU6
DQoNClNpbmsgc3VwcG9ydDogUGFuZWwgUmVwbGF5IFNlbGVjdGl2ZSB1cGRhdGUNClBTUiBtb2Rl
OiBQYW5lbCBSZXBsYXkgU2VsZWN0aXZlIHVwZGF0ZSBlbmFibGVkDQpTb3VyY2UgUFNSIGN0bDog
ZW5hYmxlZCBbMHhjMjAwNGE5OV0NClNvdXJjZSBQU1Igc3RhdHVzOiBERUVQX1NMRUVQIFsweDgw
MDAwMTAwXQ0KQnVzeSBmcm9udGJ1ZmZlciBiaXRzOiAweDAwMDAwMDAwDQpQZXJmb3JtYW5jZSBj
b3VudGVyOiAwDQpGcmFtZToJUFNSMiBTVSBibG9ja3M6DQowCTANCjEJMA0KMgkwDQozCTANCjQJ
MA0KNQkwDQo2CTANCjcJMA0KUFNSMiBzZWxlY3RpdmUgZmV0Y2g6IGVuYWJsZWQNCg0KYW5kIFBS
Og0KDQpTaW5rIHN1cHBvcnQ6IFBhbmVsIFJlcGxheQ0KUFNSIG1vZGU6IFBhbmVsIFJlcGxheSBl
bmFibGVkDQpQU1Igc2luayBub3QgcmVsaWFibGU6IG5vDQoNCkJSLA0KDQpKb3VuaSBIw7ZnYW5k
ZXINCg==
