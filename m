Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF12E10E418
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Sep 2023 04:43:42 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 7 Sep 2023 04:43:20 +0000
Message-ID: <MW3PR11MB474896584E089915582F04E9AEEEA@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20230906080840.1714917-1-bhanuprakash.modem@intel.com>
 <20230906080840.1714917-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20230906080840.1714917-2-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V3 1/6] lib/igt_gt: Fix igt_post_hang_ring for
 XE driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IEJoYW51cHJh
a2FzaCBNb2RlbQ0KPiBTZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciA2LCAyMDIzIDE6MzkgUE0N
Cj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBKb3NoaSwgS3VuYWwx
IDxrdW5hbDEuam9zaGlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbaWd0LWRldl0gW2ktZy10IFYz
IDEvNl0gbGliL2lndF9ndDogRml4IGlndF9wb3N0X2hhbmdfcmluZyBmb3IgWEUgZHJpdmVyDQo+
IA0KPiBGaXggaWd0X3Bvc3RfaGFuZ19yaW5nKCkgdG8gbm90IGV4ZWN1dGUgZ2VtIHNwZWNpZmlj
IGxvZ2ljIGZvciBYRSBkcml2ZXIuDQo+IA0KPiBDYzogS3VuYWwgSm9zaGkgPGt1bmFsMS5qb3No
aUBpbnRlbC5jb20+DQo+IENjOiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBj
enluc2tpQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQmhhbnVwcmFrYXNoIE1vZGVtIDxi
aGFudXByYWthc2gubW9kZW1AaW50ZWwuY29tPg0KPiAtLS0NCj4gIGxpYi9pZ3RfZ3QuYyB8IDIg
KysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQg
YS9saWIvaWd0X2d0LmMgYi9saWIvaWd0X2d0LmMgaW5kZXggN2NmMGU0NjhlLi5hMjRhNTY2Yzcg
MTAwNjQ0DQo+IC0tLSBhL2xpYi9pZ3RfZ3QuYw0KPiArKysgYi9saWIvaWd0X2d0LmMNCj4gQEAg
LTM4NCw2ICszODQsOCBAQCB2b2lkIGlndF9wb3N0X2hhbmdfcmluZyhpbnQgZmQsIGlndF9oYW5n
X3QgYXJnKQ0KPiAgCWlmIChpc194ZV9kZXZpY2UoZmQpKSB7DQo+ICAJCWlndF9zcGluX2ZyZWUo
ZmQsIGFyZy5zcGluKTsNCj4gIAkJeGVfcG9zdF9oYW5nX3JpbmcoZmQsIGFyZyk7DQo+ICsNCj4g
KwkJcmV0dXJuOw0KPiAgCX0NCj4gDQo+ICAJZ2VtX3N5bmMoZmQsIGFyZy5zcGluLT5oYW5kbGUp
OyAvKiBXYWl0IHVudGlsIGl0IGhhbmdzICovDQo+IC0tDQo+IDIuNDAuMA0KDQpSZXZpZXdlZC1i
eTogSmFuZ2EgUmFodWwgS3VtYXI8amFuZ2EucmFodWwua3VtYXJAaW50ZWwuY29tPg0K
