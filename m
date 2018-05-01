Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2399D6E466
 for <igt-dev@lists.freedesktop.org>; Tue,  1 May 2018 20:50:09 +0000 (UTC)
Message-ID: <1525207789.2704.9.camel@intel.com>
From: Paulo Zanoni <paulo.r.zanoni@intel.com>
Date: Tue, 01 May 2018 13:49:49 -0700
In-Reply-To: <20180427200123.22903-3-paulo.r.zanoni@intel.com>
References: <20180427200123.22903-1-paulo.r.zanoni@intel.com>
 <20180427200123.22903-3-paulo.r.zanoni@intel.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH igt 3/3] lib/instdone.c: Add Gen11 Support
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
To: igt-dev@lists.freedesktop.org
Cc: Javier Villavicencio <javier.villavicencio@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RW0gU2V4LCAyMDE4LTA0LTI3IMOgcyAxMzowMSAtMDcwMCwgUGF1bG8gWmFub25pIGVzY3JldmV1
Ogo+IEZyb206IEphdmllciBWaWxsYXZpY2VuY2lvIDxqYXZpZXIudmlsbGF2aWNlbmNpb0BpbnRl
bC5jb20+Cj4gCj4gQnNwZWM6IDExNDMxCgpJJ20gbm90IGFuIGV4cGVydCBpbiB0aGlzIGFyZWEs
IGJ1dCB0aGUgYml0cyBzZWVtIHRvIG1hdGNoIHRoZSBzcGVjLApzbzoKClJldmlld2VkLWJ5OiBQ
YXVsbyBaYW5vbmkgPHBhdWxvLnIuemFub25pQGludGVsLmNvbT4KCj4gCj4gU2lnbmVkLW9mZi1i
eTogSmF2aWVyIFZpbGxhdmljZW5jaW8gPGphdmllci52aWxsYXZpY2VuY2lvQGludGVsLmNvbT4K
PiAtLS0KPiAgbGliL2luc3Rkb25lLmMgfCAxMiArKysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDExIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbGli
L2luc3Rkb25lLmMgYi9saWIvaW5zdGRvbmUuYwo+IGluZGV4IDUxMGZjZTY0Li5hODNmODgzNiAx
MDA2NDQKPiAtLS0gYS9saWIvaW5zdGRvbmUuYwo+ICsrKyBiL2xpYi9pbnN0ZG9uZS5jCj4gQEAg
LTQxNywxMCArNDE3LDIwIEBAIGluaXRfZ2VuOF9pbnN0ZG9uZSh2b2lkKQo+ICAJaW5pdF9nZW43
NV9pbnN0ZG9uZSgpOwo+ICB9Cj4gIAo+ICtzdGF0aWMgdm9pZAo+ICtpbml0X2dlbjExX2luc3Rk
b25lKHZvaWQpCj4gK3sKPiArCWdlbjZfaW5zdGRvbmUxX2JpdCgxIDw8IDI0LCAiVFNHMSIpOwo+
ICsJZ2VuNl9pbnN0ZG9uZTFfYml0KDEgPDwgMTEsICJUREcxIik7Cj4gKwlpbml0X2dlbjhfaW5z
dGRvbmUoKTsKPiArfQo+ICsKPiAgYm9vbAo+ICBpbml0X2luc3Rkb25lX2RlZmluaXRpb25zKHVp
bnQzMl90IGRldmlkKQo+ICB7Cj4gLQlpZiAoSVNfR0VOOChkZXZpZCkgfHwgSVNfR0VOOShkZXZp
ZCkgfHwgSVNfR0VOMTAoZGV2aWQpKSB7Cj4gKwlpZiAoSVNfR0VOMTEoZGV2aWQpKSB7Cj4gKwkJ
aW5pdF9nZW4xMV9pbnN0ZG9uZSgpOwo+ICsJfSBlbHNlIGlmIChJU19HRU44KGRldmlkKSB8fCBJ
U19HRU45KGRldmlkKSB8fAo+IElTX0dFTjEwKGRldmlkKSkgewo+ICAJCWluaXRfZ2VuOF9pbnN0
ZG9uZSgpOwo+ICAJfSBlbHNlIGlmIChJU19HRU43KGRldmlkKSkgewo+ICAJCWluaXRfZ2VuN19p
bnN0ZG9uZSgpOwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
