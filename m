Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B236110E008
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Feb 2023 11:26:16 +0000 (UTC)
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 2 Feb 2023 11:25:50 +0000
Message-ID: <DM6PR11MB31770F1E94F19E6FB1A3BFB5BAD69@DM6PR11MB3177.namprd11.prod.outlook.com>
References: <20230131120646.27434-1-ville.syrjala@linux.intel.com>
 <20230131120646.27434-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20230131120646.27434-5-ville.syrjala@linux.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 4/6] tests/kms_async_flips: Run the test
 only once per pipe
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBWaWxsZSBTeXJqYWxhIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgSmFudWFyeSAzMSwg
MjAyMyA1OjM3IFBNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzog
TXVydGh5LCBBcnVuIFIgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFU
Q0ggaS1nLXQgNC82XSB0ZXN0cy9rbXNfYXN5bmNfZmxpcHM6IFJ1biB0aGUgdGVzdCBvbmx5IG9u
Y2UgcGVyDQo+IHBpcGUNCj4gDQo+IEZyb206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFs
YUBsaW51eC5pbnRlbC5jb20+DQo+IA0KPiBObyByZWFsIHJlYXNvbiB0byBpdGVyYXRlIG92ZXIg
YWxsIHRoZSBvdXRwdXRzIGhlcmUuIEp1c3QgZG8gdGhlIHRlc3Qgb25jZSBwZXINCj4gcGlwZS4N
Cj4gDQo+IENjOiBBcnVuIFIgTXVydGh5IDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gU2ln
bmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNv
bT4NCj4gLS0tDQoNClJldmlld2VkLWJ5OiBBcnVuIFIgTXVydGh5IDxhcnVuLnIubXVydGh5QGlu
dGVsLmNvbT4NCg0KVGhhbmtzIGFuZCBSZWdhcmRzLA0KQXJ1biBSIE11cnRoeQ0KLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQoNCj4gIHRlc3RzL2ttc19hc3luY19mbGlwcy5jIHwgMTggKysrKystLS0t
LS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfYXN5bmNfZmxpcHMuYyBiL3Rlc3Rz
L2ttc19hc3luY19mbGlwcy5jIGluZGV4DQo+IGY4Yzk3ZTAyOWM1OS4uNTQ2MTFmNjYzNTBkIDEw
MDY0NA0KPiAtLS0gYS90ZXN0cy9rbXNfYXN5bmNfZmxpcHMuYw0KPiArKysgYi90ZXN0cy9rbXNf
YXN5bmNfZmxpcHMuYw0KPiBAQCAtNTQ0LDIwICs1NDQsMTIgQEAgc3RhdGljIHZvaWQgdGVzdF9j
cmMoZGF0YV90ICpkYXRhKQ0KPiANCj4gIHN0YXRpYyB2b2lkIHJ1bl90ZXN0KGRhdGFfdCAqZGF0
YSwgdm9pZCAoKnRlc3QpKGRhdGFfdCAqKSkgIHsNCj4gLQlpZ3Rfb3V0cHV0X3QgKm91dHB1dDsN
Cj4gLQllbnVtIHBpcGUgcGlwZTsNCj4gKwlmb3JfZWFjaF9waXBlX3dpdGhfdmFsaWRfb3V0cHV0
KCZkYXRhLT5kaXNwbGF5LCBkYXRhLT5waXBlLCBkYXRhLQ0KPiA+b3V0cHV0KSB7DQo+ICsJCWln
dF9keW5hbWljX2YoInBpcGUtJXMiLCBrbXN0ZXN0X3BpcGVfbmFtZShkYXRhLT5waXBlKSkNCj4g
KwkJCXRlc3QoZGF0YSk7DQo+IA0KPiAtCWZvcl9lYWNoX3BpcGUoJmRhdGEtPmRpc3BsYXksIHBp
cGUpIHsNCj4gLQkJZm9yX2VhY2hfdmFsaWRfb3V0cHV0X29uX3BpcGUoJmRhdGEtPmRpc3BsYXks
IHBpcGUsDQo+IG91dHB1dCkgew0KPiAtCQkJaWd0X2R5bmFtaWNfZigicGlwZS0lcy0lcyIsDQo+
IGttc3Rlc3RfcGlwZV9uYW1lKHBpcGUpLCBvdXRwdXQtPm5hbWUpIHsNCj4gLQkJCQlkYXRhLT5v
dXRwdXQgPSBvdXRwdXQ7DQo+IC0JCQkJZGF0YS0+cGlwZSA9IHBpcGU7DQo+IC0JCQkJdGVzdChk
YXRhKTsNCj4gLQkJCX0NCj4gLQ0KPiAtCQkJaWYgKCFkYXRhLT5leHRlbmRlZCkNCj4gLQkJCQli
cmVhazsNCj4gLQkJfQ0KPiArCQlpZiAoIWRhdGEtPmV4dGVuZGVkKQ0KPiArCQkJYnJlYWs7DQo+
ICAJfQ0KPiAgfQ0KPiANCj4gLS0NCj4gMi4zOS4xDQoNCg==
