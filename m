Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4EF510F16D
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jun 2022 07:47:29 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Mon, 13 Jun 2022 07:47:21 +0000
Message-ID: <MWHPR1101MB2157BED98B0C78B0B51E0657EFAB9@MWHPR1101MB2157.namprd11.prod.outlook.com>
References: <20220611203845.15118-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20220611203845.15118-1-juhapekka.heikkila@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_fb: Allow XY_FAST_COPY_BLT on
 DG2
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSnVoYS0NCj4gUGVra2Eg
SGVpa2tpbGENCj4gU2VudDogU2F0dXJkYXksIEp1bmUgMTEsIDIwMjIgMTE6MzkgUE0NCj4gVG86
IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFtpZ3QtZGV2XSBbUEFU
Q0ggaS1nLXRdIGxpYi9pZ3RfZmI6IEFsbG93IFhZX0ZBU1RfQ09QWV9CTFQgb24gREcyDQo+IA0K
PiBGcm9tOiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+DQo+IA0KPiBBbGxvdyBYWV9G
QVNUX0NPUFlfQkxUIG9uIERHMi4gVGhpcyBmaXhlcyB4LXRpbGVkIGJsaXRzIG9uIERHMi4NCj4g
DQoNClRlc3RlZC1ieTogTWlrYSBLYWhvbGEgPG1pa2Eua2Fob2xhQGludGVsLmNvbT4NClJldmll
d2VkLWJ5OiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPg0KDQo+IFNpZ25lZC1v
ZmYtYnk6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTog
SnVoYS1QZWtrYSBIZWlra2lsYSA8anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT4NCj4gQ2xv
c2VzOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2ludGVsLy0vaXNzdWVzLzU0
NTANCj4gQ2xvc2VzOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2ludGVsLy0v
aXNzdWVzLzU0MDkNCj4gLS0tDQo+ICBsaWIvaWd0X2ZiLmMgfCA2ICsrKysrLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2xpYi9pZ3RfZmIuYyBiL2xpYi9pZ3RfZmIuYyBpbmRleCBmYTMxYzQzYy4uMWI5MTMxZjIg
MTAwNjQ0DQo+IC0tLSBhL2xpYi9pZ3RfZmIuYw0KPiArKysgYi9saWIvaWd0X2ZiLmMNCj4gQEAg
LTI0MzAsNyArMjQzMCw4IEBAIHN0cnVjdCBmYl9ibGl0X3VwbG9hZCB7DQo+IA0KPiAgc3RhdGlj
IGJvb2wgZmFzdF9ibGl0X29rKGNvbnN0IHN0cnVjdCBpZ3RfZmIgKmZiKSAgew0KPiAtCWludCB2
ZXIgPSBpbnRlbF9kaXNwbGF5X3ZlcihpbnRlbF9nZXRfZHJtX2RldmlkKGZiLT5mZCkpOw0KPiAr
CWludCBkZXZfaWQgPSBpbnRlbF9nZXRfZHJtX2RldmlkKGZiLT5mZCk7DQo+ICsJaW50IHZlciA9
IGludGVsX2Rpc3BsYXlfdmVyKGRldl9pZCk7DQo+IA0KPiAgCWlmICh2ZXIgPCA5KQ0KPiAgCQly
ZXR1cm4gZmFsc2U7DQo+IEBAIC0yNDM4LDYgKzI0MzksOSBAQCBzdGF0aWMgYm9vbCBmYXN0X2Js
aXRfb2soY29uc3Qgc3RydWN0IGlndF9mYiAqZmIpDQo+ICAJaWYgKHZlciA8IDEyKQ0KPiAgCQly
ZXR1cm4gdHJ1ZTsNCj4gDQo+ICsJaWYgKHZlciA+PSAxMyAmJiAhSVNfQUxERVJMQUtFX1AoZGV2
X2lkKSkNCj4gKwkJcmV0dXJuIHRydWU7DQo+ICsNCj4gIAlyZXR1cm4gZmItPm1vZGlmaWVyICE9
IEk5MTVfRk9STUFUX01PRF9YX1RJTEVEOyAgfQ0KPiANCj4gLS0NCj4gMi4yNS4xDQoNCg==
