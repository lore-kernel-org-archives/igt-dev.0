Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E7B89819
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Sep 2018 00:08:36 +0000 (UTC)
From: "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
Date: Wed, 19 Sep 2018 00:04:30 +0000
Message-ID: <345e57efbb7a5319195340f4ed26deece9e18221.camel@intel.com>
References: <20180919000303.27440-1-dhinakaran.pandiyan@intel.com>
In-Reply-To: <20180919000303.27440-1-dhinakaran.pandiyan@intel.com>
Content-Language: en-US
Content-ID: <45E8602CD1439E40B176828B7AA9049F@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/psr: Add
 kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu to FF
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "martin.peres@linux.intel.com" <martin.peres@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCAyMDE4LTA5LTE4IGF0IDE3OjAzIC0wNzAwLCBEaGluYWthcmFuIFBhbmRpeWFuIHdy
b3RlOg0KPiBXZSBzdGlsbCBkbyBub3QgaGF2ZSB0aGUgY2FwYWJpbGl0eSB0byBydW4gUFNSIHRl
c3RzIHByZS1tZXJnZS4gQWRkIGENCgkJCQkJICAgICBeYWxsDQo+IG1tYXAtY3B1IHN1YnRlc3Qg
ZnJvbSBrbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcgdG8gdGhlIGZhc3QtZmVlZGJhY2sNCj4gbGlz
dA0KPiBzbyB0aGF0IHdlIGNhbiBjYXRjaCBzb21lIHJlZ3Jlc3Npb25zIGVhcmx5Lg0KPiANCj4g
Q2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gQ2M6IE1hcnRpbiBQ
ZXJlcyA8bWFydGluLnBlcmVzQGxpbnV4LmludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogRGhp
bmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5jb20+DQo+IC0tLQ0K
PiAgdGVzdHMvaW50ZWwtY2kvZmFzdC1mZWVkYmFjay50ZXN0bGlzdCB8IDEgKw0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwt
Y2kvZmFzdC1mZWVkYmFjay50ZXN0bGlzdCBiL3Rlc3RzL2ludGVsLQ0KPiBjaS9mYXN0LWZlZWRi
YWNrLnRlc3RsaXN0DQo+IGluZGV4IGM2MjU5MDRkLi40OTFhY2U4MyAxMDA2NDQNCj4gLS0tIGEv
dGVzdHMvaW50ZWwtY2kvZmFzdC1mZWVkYmFjay50ZXN0bGlzdA0KPiArKysgYi90ZXN0cy9pbnRl
bC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0DQo+IEBAIC0yMDUsNiArMjA1LDcgQEAgaWd0QGtt
c19mb3JjZV9jb25uZWN0b3JfYmFzaWNAZm9yY2UtZWRpZA0KPiAgaWd0QGttc19mb3JjZV9jb25u
ZWN0b3JfYmFzaWNAZm9yY2UtbG9hZC1kZXRlY3QNCj4gIGlndEBrbXNfZm9yY2VfY29ubmVjdG9y
X2Jhc2ljQHBydW5lLXN0YWxlLW1vZGVzDQo+ICBpZ3RAa21zX2Zyb250YnVmZmVyX3RyYWNraW5n
QGJhc2ljDQo+ICtpZ3RAa21zX2Zyb250YnVmZmVyX3RyYWNraW5nQHBzci1yZ2IxMDEwMTAtZHJh
dy1tbWFwLWNwdQ0KPiAgaWd0QGttc19waXBlX2NyY19iYXNpY0BiYWQtc291cmNlDQo+ICBpZ3RA
a21zX3BpcGVfY3JjX2Jhc2ljQGhhbmctcmVhZC1jcmMtcGlwZS1hDQo+ICBpZ3RAa21zX3BpcGVf
Y3JjX2Jhc2ljQGhhbmctcmVhZC1jcmMtcGlwZS1iCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldgo=
