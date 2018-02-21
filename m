Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: "Lofstedt, Marta" <marta.lofstedt@intel.com>
Date: Wed, 21 Feb 2018 13:59:34 +0000
Message-ID: <CA5F6A4B62957246A95956419746064382B387D5@IRSMSX106.ger.corp.intel.com>
References: <20180216090024.22548-1-chris@chris-wilson.co.uk>
In-Reply-To: <20180216090024.22548-1-chris@chris-wilson.co.uk>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH igt 1/2] igt/kms_frontbuffer_tracking: Disable
 FBC testing for -ENODEV
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
To: Chris Wilson <chris@chris-wilson.co.uk>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

V2hpbGUgeW91IGFyZSBhdCBpdCBjb3VsZCB5b3UgZml4IHRoZSBrbXNfZmJjb25fZmJ0IHRlc3Qg
aW4gdGhlIHNhbWUgbWFubmVyPw0KDQpBbmQgeW91J2xsIGhhdmUgbXkgUi1iDQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiBbbWFpbHRvOmlndC1kZXYtYm91
bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmddIE9uIEJlaGFsZiBPZg0KPiBDaHJpcyBXaWxzb24N
Cj4gU2VudDogRnJpZGF5LCBGZWJydWFyeSAxNiwgMjAxOCAxMTowMCBBTQ0KPiBUbzogaW50ZWwt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCj4gU3ViamVjdDogW2lndC1kZXZdIFtQQVRDSCBpZ3QgMS8yXSBpZ3Qva21zX2Zyb250
YnVmZmVyX3RyYWNraW5nOiBEaXNhYmxlIEZCQw0KPiB0ZXN0aW5nIGZvciAtRU5PREVWDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4N
Cj4gLS0tDQo+ICB0ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYyB8IDMgKysrDQo+ICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMv
a21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMNCj4gYi90ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJh
Y2tpbmcuYw0KPiBpbmRleCAyNjIyOTUyYy4uNmM0MDcxZGUgMTAwNjQ0DQo+IC0tLSBhL3Rlc3Rz
L2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jDQo+ICsrKyBiL3Rlc3RzL2ttc19mcm9udGJ1ZmZl
cl90cmFja2luZy5jDQo+IEBAIC0xNTg4LDYgKzE1ODgsOSBAQCBzdGF0aWMgYm9vbCBmYmNfc3Vw
cG9ydGVkX29uX2NoaXBzZXQodm9pZCkNCj4gIAljaGFyIGJ1ZlsxMjhdOw0KPiANCj4gIAlkZWJ1
Z2ZzX3JlYWQoImk5MTVfZmJjX3N0YXR1cyIsIGJ1Zik7DQo+ICsJaWYgKCpidWYgPT0gJ1wwJykN
Cj4gKwkJcmV0dXJuIGZhbHNlOw0KPiArDQo+ICAJcmV0dXJuICFzdHJzdHIoYnVmLCAiRkJDIHVu
c3VwcG9ydGVkIG9uIHRoaXMgY2hpcHNldFxuIik7ICB9DQo+IA0KPiAtLQ0KPiAyLjE2LjENCj4g
DQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGln
dC1kZXYgbWFpbGluZyBsaXN0DQo+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
