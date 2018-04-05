Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62D36E8A9
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Apr 2018 21:03:48 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Thu, 5 Apr 2018 21:03:46 +0000
Message-ID: <2bfeee9e0882e9370a325e6e2b125cc8d1972149.camel@intel.com>
References: <20180405104954.6880-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20180405104954.6880-1-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
Content-ID: <4A3224B9B96DE3478ED498AB46D260FB@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_debugfs: Add timeouts to
 opening pipe CRC fd.
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCAyMDE4LTA0LTA1IGF0IDEyOjQ5ICswMjAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gVGhpcyB3aWxsIGZpeCB0aGUgUFNSIHRlc3RzIHRvIGZhaWwgc2xpZ2h0bHkgZmFzdGVy
LCBzaW5jZSB0aGV5IHdhaXQNCj4gaW5kZWZpbml0ZWx5IGZvciBhIENSQyB0aGF0IG5ldmVyIGNv
bWVzIGR1cmluZyBvcGVuLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3Qg
PG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICBsaWIvaWd0X2Rl
YnVnZnMuYyB8IDMgKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvbGliL2lndF9kZWJ1Z2ZzLmMgYi9saWIvaWd0X2RlYnVnZnMuYw0KPiBp
bmRleCA4YWRjMDJlOWNjNDcuLjA5NGRmNTY0YjZmNCAxMDA2NDQNCj4gLS0tIGEvbGliL2lndF9k
ZWJ1Z2ZzLmMNCj4gKysrIGIvbGliL2lndF9kZWJ1Z2ZzLmMNCj4gQEAgLTc1Nyw3ICs3NTcsMTAg
QEAgdm9pZCBpZ3RfcGlwZV9jcmNfc3RhcnQoaWd0X3BpcGVfY3JjX3QNCj4gKnBpcGVfY3JjKQ0K
PiAgDQo+ICAJc3ByaW50ZihidWYsICJjcnRjLSVkL2NyYy9kYXRhIiwgcGlwZV9jcmMtPnBpcGUp
Ow0KPiAgDQo+ICsJaWd0X3NldF90aW1lb3V0KDUsICJPcGVuaW5nIGNyYyBmZCwgd2hpY2ggd2Fp
dHMgZm9yIGZpcnN0DQo+IENSQy4iKTsNCj4gIAlwaXBlX2NyYy0+Y3JjX2ZkID0gb3BlbmF0KHBp
cGVfY3JjLT5kaXIsIGJ1ZiwgcGlwZV9jcmMtDQo+ID5mbGFncyk7DQo+ICsJaWd0X3Jlc2V0X3Rp
bWVvdXQoKTsNCg0KSHVtIEkgd2FzIGFibGUgdG8gcmVwcm9kdWNlIHRoaXMgb25lIHRvbyBpbiBh
IEtCTCwgSSB3YXMgdGhpbmtpbmcgaW4NCmFkZCBhIHRpbWVvdXQgaW4gdGhlIGtlcm5lbCBzaWRl
LCBpZiBpdCBkb24ndCBnZXQgdGhlIENSQyBidWZmZXIgZmlsbGVkDQppdCB3b3VsZCByZXR1cm4g
YSBlcnJvci4NCg0KDQo+ICsNCj4gIAlpZ3RfYXNzZXJ0KHBpcGVfY3JjLT5jcmNfZmQgIT0gLTEp
Ow0KPiAgCWVycm5vID0gMDsNCj4gIH0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2Cg==
