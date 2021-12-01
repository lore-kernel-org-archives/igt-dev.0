Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: "Rogozhkin, Dmitry V" <dmitry.v.rogozhkin@intel.com>
Date: Wed, 1 Dec 2021 02:20:14 +0000
Message-ID: <3894f6c21d51bdd4a188f077e146d36a3d6ddb71.camel@intel.com>
References: <20211119125945.55056-1-tvrtko.ursulin@linux.intel.com>
 <20211119125945.55056-6-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20211119125945.55056-6-tvrtko.ursulin@linux.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <D6A783E88596CE45B947583CFF6DA486@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 6/6] intel_gpu_top: Add a sanity check
 discovered busy metric is per engine
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>
Cc: "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>, "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCAyMDIxLTExLTE5IGF0IDEyOjU5ICswMDAwLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToN
Cj4gRnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4NCj4gDQo+
IEFkZGluZyBhIGNyb3NzLWNoZWNrIHdpdGggQUJJIGNvbmZpZyBuYW1lIHNwYWNlIGFuZCBub3Qg
anVzdCByZWx5aW5nDQo+IG9uDQo+IHN5c2ZzIG5hbWVzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
VHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4NCj4gQ2M6IERtaXRyeSBS
b2dvemhraW4gPGRtaXRyeS52LnJvZ296aGtpbkBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgdG9vbHMv
aW50ZWxfZ3B1X3RvcC5jIHwgNiArKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS90b29scy9pbnRlbF9ncHVfdG9wLmMgYi90b29scy9p
bnRlbF9ncHVfdG9wLmMNCj4gaW5kZXggNDFjNTlhNzJjMDlkLi44MWM3MjRkMWZlMWMgMTAwNjQ0
DQo+IC0tLSBhL3Rvb2xzL2ludGVsX2dwdV90b3AuYw0KPiArKysgYi90b29scy9pbnRlbF9ncHVf
dG9wLmMNCj4gQEAgLTM3Niw2ICszNzYsMTIgQEAgc3RhdGljIHN0cnVjdCBlbmdpbmVzICpkaXNj
b3Zlcl9lbmdpbmVzKGNoYXINCj4gKmRldmljZSkNCj4gIAkJCWJyZWFrOw0KPiAgCQl9DQo+ICAN
Cj4gKwkJLyogRG91YmxlIGNoZWNrIGNvbmZpZyBpcyBhbiBlbmdpbmUgY29uZmlnLiAqLw0KPiAr
CQlpZiAoZW5naW5lLT5idXN5LmNvbmZpZyA+PSBfX0k5MTVfUE1VX09USEVSKDApKSB7DQo+ICsJ
CQlmcmVlKCh2b2lkICopZW5naW5lLT5uYW1lKTsNCj4gKwkJCWNvbnRpbnVlOw0KPiArCQl9DQo+
ICsNCj4gIAkJZW5naW5lLT5jbGFzcyA9IChlbmdpbmUtPmJ1c3kuY29uZmlnICYNCj4gIAkJCQkg
KF9fSTkxNV9QTVVfT1RIRVIoMCkgLSAxKSkgPj4NCj4gIAkJCQlJOTE1X1BNVV9DTEFTU19TSElG
VDsNCg0KVGhpcyB3b3JrcyBmb3IgbWUuDQpBY2tlZC1ieTogRG1pdHJ5IFJvZ296aGtpbiA8ZG1p
dHJ5LnYucm9nb3poa2luQGludGVsLmNvbT4NCg0KSG93ZXZlciwgbG9va2luZyB0byB0aGUgZXhp
c3RpbmcgY29kZSBkb3duIGJlbG93IHRoZSBwbGFjZSB3aGVyZSB5b3UndmUNCmFkZGVkIGEgZml4
LCBpdCBzZWVtcyB0byBtZSB0aGF0ICdmcmVlKCh2b2lkICopZW5naW5lLT5uYW1lKScgbWlnaHQg
YmUNCm1pc3Npbmcgb24gYSBudW1iZXIgb2Ygb3RoZXIgZXJyb3IgcGF0aHMgYW5kIG9uIG5vbi1l
cnJvciBleGl0IHBhdGggYXMNCndlbGwuDQoNCg==
