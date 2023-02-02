Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1B410E4DD
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Feb 2023 11:03:41 +0000 (UTC)
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 2 Feb 2023 11:03:37 +0000
Message-ID: <DM6PR11MB31775E6459E9E8BB79504CE9BAD69@DM6PR11MB3177.namprd11.prod.outlook.com>
References: <20230131120646.27434-1-ville.syrjala@linux.intel.com>
 <20230131120646.27434-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20230131120646.27434-2-ville.syrjala@linux.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/6] tests/kms_async_flips: Add missing
 igt_put_cairo_ctx()
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
Q0ggaS1nLXQgMS82XSB0ZXN0cy9rbXNfYXN5bmNfZmxpcHM6IEFkZCBtaXNzaW5nDQo+IGlndF9w
dXRfY2Fpcm9fY3R4KCkNCj4gDQo+IEZyb206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFs
YUBsaW51eC5pbnRlbC5jb20+DQo+IA0KPiBSZW1lYmVyIHRvIGNhbGwgaWd0X3B1dF9jYWlyb19j
dHgoKSBhZnRlciByZW5kZXJpbmcgdG8gbWFrZSBzdXJlIHRoZSByZXN1bHRzDQo+IGFjdHVhbGx5
IGVuZCB1cCBpbiB0aGUgZnJhbWVidWZmZXIgKGluIGNhc2UgdGhlIHJlbmRlcmluZyBoYXBwZW5z
IHRvIGENCj4gdGVtcG9yYXJ5IGJ1ZmZlciBhbmQgdGhlcmUgbmVlZHMgdG8gYmUgYSBjb3B5IGJh
Y2sgYXQgdGhlIGVuZCkuDQo+IA0KPiBDYzogQXJ1biBSIE11cnRoeSA8YXJ1bi5yLm11cnRoeUBp
bnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFs
YUBsaW51eC5pbnRlbC5jb20+DQo+IC0tLQ0KUmV2aWV3ZWQtYnk6IEFydW4gUiBNdXJ0aHkgPGFy
dW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpBcnVuIFIgTXVy
dGh5DQotLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICB0ZXN0cy9rbXNfYXN5bmNfZmxpcHMuYyB8IDEg
Kw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
dGVzdHMva21zX2FzeW5jX2ZsaXBzLmMgYi90ZXN0cy9rbXNfYXN5bmNfZmxpcHMuYyBpbmRleA0K
PiA3Y2I3MWY2YjQ0MWEuLjg5ZTQzMWFjMzJlMiAxMDA2NDQNCj4gLS0tIGEvdGVzdHMva21zX2Fz
eW5jX2ZsaXBzLmMNCj4gKysrIGIvdGVzdHMva21zX2FzeW5jX2ZsaXBzLmMNCj4gQEAgLTEzNCw2
ICsxMzQsNyBAQCBzdGF0aWMgdm9pZCBtYWtlX2ZiKGRhdGFfdCAqZGF0YSwgc3RydWN0IGlndF9m
YiAqZmIsDQo+IA0KPiAgCWNyID0gaWd0X2dldF9jYWlyb19jdHgoZGF0YS0+ZHJtX2ZkLCBmYik7
DQo+ICAJaWd0X3BhaW50X2NvbG9yX3JhbmQoY3IsIHJlY193aWR0aCAqIDIgKyByZWNfd2lkdGgg
KiBpbmRleCwgaGVpZ2h0IC8NCj4gNCwgcmVjX3dpZHRoLCBoZWlnaHQgLyAyKTsNCj4gKwlpZ3Rf
cHV0X2NhaXJvX2N0eChjcik7DQo+ICB9DQo+IA0KPiAgc3RhdGljIHZvaWQgcmVxdWlyZV9tb25v
dG9uaWNfdGltZXN0YW1wKGludCBmZCkNCj4gLS0NCj4gMi4zOS4xDQoNCg==
