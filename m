Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F1FC10E1D4
 for <igt-dev@lists.freedesktop.org>; Thu,  4 May 2023 21:45:23 +0000 (UTC)
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 4 May 2023 21:44:28 +0000
Message-ID: <DM4PR11MB63607E8EF579CFA3F2C414FEF46D9@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230411161555.10001-1-ville.syrjala@linux.intel.com>
 <20230411161555.10001-8-ville.syrjala@linux.intel.com>
In-Reply-To: <20230411161555.10001-8-ville.syrjala@linux.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 7/9] tests/kms_color: Dump the CTM
 before/after color values
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFZpbGxlIFN5cmph
bGENCj4gU2VudDogVHVlc2RheSwgQXByaWwgMTEsIDIwMjMgOTo0NiBQTQ0KPiBUbzogaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogW2lndC1kZXZdIFtQQVRDSCBpLWct
dCB2MiA3LzldIHRlc3RzL2ttc19jb2xvcjogRHVtcCB0aGUgQ1RNIGJlZm9yZS9hZnRlcg0KPiBj
b2xvciB2YWx1ZXMNCj4gDQo+IEZyb206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBs
aW51eC5pbnRlbC5jb20+DQo+IA0KPiBJbmNsdWRlIHRoZSBiZWZvcmUvYWZ0ZXIgY29sb3IgdmFs
dWVzIGluIHRoZSBkZWJ1ZyBvdXRwdXQgdG8gaGVscCB3aXRoIGRpYWdub3NpbmcNCj4gZmFpbHVy
ZXMuDQoNCkxvb2tzIEdvb2QgdG8gbWUuDQpSZXZpZXdlZC1ieTogVW1hIFNoYW5rYXIgPHVtYS5z
aGFua2FyQGludGVsLmNvbT4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gIHRlc3RzL2ttc19jb2xvci5j
IHwgOCArKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19jb2xvci5jIGIvdGVzdHMva21zX2NvbG9yLmMgaW5kZXgN
Cj4gMzUwODMxMjJkZmJmLi4xZWMwOTc5NTNjOWQgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ttc19j
b2xvci5jDQo+ICsrKyBiL3Rlc3RzL2ttc19jb2xvci5jDQo+IEBAIC01MTEsNiArNTExLDE0IEBA
IHN0YXRpYyBib29sIHRlc3RfcGlwZV9jdG0oZGF0YV90ICpkYXRhLA0KPiAgCQlzZXRfZ2FtbWEo
ZGF0YSwgcHJpbWFyeS0+cGlwZSwgZ2FtbWFfbGluZWFyKTsNCj4gIAl9DQo+IA0KPiArCWlndF9k
ZWJ1ZygiY29sb3IgYmVmb3JlWzBdICVmLCVmLCVmXG4iLCBiZWZvcmVbMF0uciwgYmVmb3JlWzBd
LmcsDQo+IGJlZm9yZVswXS5iKTsNCj4gKwlpZ3RfZGVidWcoImNvbG9yIGJlZm9yZVsxXSAlZiwl
ZiwlZlxuIiwgYmVmb3JlWzFdLnIsIGJlZm9yZVsxXS5nLA0KPiBiZWZvcmVbMV0uYik7DQo+ICsJ
aWd0X2RlYnVnKCJjb2xvciBiZWZvcmVbMl0gJWYsJWYsJWZcbiIsIGJlZm9yZVsyXS5yLCBiZWZv
cmVbMl0uZywNCj4gK2JlZm9yZVsyXS5iKTsNCj4gKw0KPiArCWlndF9kZWJ1ZygiY29sb3IgYWZ0
ZXJbMF0gJWYsJWYsJWZcbiIsIGFmdGVyWzBdLnIsIGFmdGVyWzBdLmcsIGFmdGVyWzBdLmIpOw0K
PiArCWlndF9kZWJ1ZygiY29sb3IgYWZ0ZXJbMV0gJWYsJWYsJWZcbiIsIGFmdGVyWzFdLnIsIGFm
dGVyWzFdLmcsIGFmdGVyWzFdLmIpOw0KPiArCWlndF9kZWJ1ZygiY29sb3IgYWZ0ZXJbMl0gJWYs
JWYsJWZcbiIsIGFmdGVyWzJdLnIsIGFmdGVyWzJdLmcsDQo+ICthZnRlclsyXS5iKTsNCj4gKw0K
PiAgCWRpc2FibGVfY3RtKHByaW1hcnktPnBpcGUpOw0KPiAgCWlndF9kaXNwbGF5X2NvbW1pdCgm
ZGF0YS0+ZGlzcGxheSk7DQo+IA0KPiAtLQ0KPiAyLjM5LjINCg0K
