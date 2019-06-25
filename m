Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9544A89F01
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2019 07:17:28 +0000 (UTC)
From: "Ser, Simon" <simon.ser@intel.com>
Date: Tue, 25 Jun 2019 07:17:25 +0000
Message-ID: <62331196b1c2bf25774185c3374c5308edcc5096.camel@intel.com>
References: <20190624151422.21058-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20190624151422.21058-1-ville.syrjala@linux.intel.com>
Content-Language: en-US
Content-ID: <98655F695E60E241B543891DD31C0286@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_draw: Zero initalize the
 igt_bufs
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
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTA2LTI0IGF0IDE4OjE0ICswMzAwLCBWaWxsZSBTeXJqYWxhIHdyb3RlOg0K
PiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0K
PiANCj4gSSBtaXNzZWQgdGhlc2Ugd2hlbiBzcHJpbmtsaW5nIHRoZSBtZW1zZXRzLiBVc2luZyBz
dGFjayBnYXJiYWdlIGFzIHRoZQ0KPiBhdXggc3VyZmFjZSBzdGF0ZSBpc24ndCBhIGdvb2QgaWRl
YS4gQ2F1c2VzIGttc19mcm9udF9idWZmZXJfdHJhY2tpbmcNCj4gdG8gZmFpbCBvbiBza2wrLg0K
PiANCj4gRml4ZXM6IGE0MzkzYzM5NTFlYyAoImxpYjogQWRkIGF1eCBzdXJmYWNlIHN0YXRlIHRv
IGlndF9idWYiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmph
bGFAbGludXguaW50ZWwuY29tPg0KDQpSZXZpZXdlZC1ieTogU2ltb24gU2VyIDxzaW1vbi5zZXJA
aW50ZWwuY29tPg0KDQo+IC0tLQ0KPiAgbGliL2lndF9kcmF3LmMgfCAyICstDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9saWIvaWd0X2RyYXcuYyBiL2xpYi9pZ3RfZHJhdy5jDQo+IGluZGV4IGViYWU5MTUxMTNkYS4u
YzdkNTc3MGRjYTI4IDEwMDY0NA0KPiAtLS0gYS9saWIvaWd0X2RyYXcuYw0KPiArKysgYi9saWIv
aWd0X2RyYXcuYw0KPiBAQCAtNTY4LDcgKzU2OCw3IEBAIHN0YXRpYyB2b2lkIGRyYXdfcmVjdF9y
ZW5kZXIoaW50IGZkLCBzdHJ1Y3QgY21kX2RhdGEgKmNtZF9kYXRhLA0KPiAgCWRybV9pbnRlbF9i
byAqc3JjLCAqZHN0Ow0KPiAgCXVpbnQzMl90IGRldmlkID0gaW50ZWxfZ2V0X2RybV9kZXZpZChm
ZCk7DQo+ICAJaWd0X3JlbmRlcl9jb3B5ZnVuY190IHJlbmRlcmNvcHkgPSBpZ3RfZ2V0X3JlbmRl
cl9jb3B5ZnVuYyhkZXZpZCk7DQo+IC0Jc3RydWN0IGlndF9idWYgc3JjX2J1ZiwgZHN0X2J1ZjsN
Cj4gKwlzdHJ1Y3QgaWd0X2J1ZiBzcmNfYnVmID0ge30sIGRzdF9idWYgPSB7fTsNCj4gIAlzdHJ1
Y3QgaW50ZWxfYmF0Y2hidWZmZXIgKmJhdGNoOw0KPiAgCXVpbnQzMl90IHRpbGluZywgc3dpenps
ZTsNCj4gIAlzdHJ1Y3QgYnVmX2RhdGEgdG1wOw0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2
