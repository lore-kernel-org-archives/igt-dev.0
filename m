Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707D66E4CF
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2020 12:38:10 +0000 (UTC)
From: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Date: Wed, 2 Sep 2020 12:38:07 +0000
Message-ID: <7ed4eba16ec5de4503c62ec2eb0feff9406511e2.camel@intel.com>
References: <20200901173414.15012-1-jose.souza@intel.com>
In-Reply-To: <20200901173414.15012-1-jose.souza@intel.com>
Content-Language: en-US
Content-ID: <CC781599FE5AB84DA9A2497BAE9E351B@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/psr: Check for DRRS enabled in
 no_drrs test
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Souza,
 Jose" <jose.souza@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEd3YW4tZ3llb25nIE11biA8Z3dhbi1neWVvbmcubXVuQGludGVsLmNvbT4N
Cg0KT24gVHVlLCAyMDIwLTA5LTAxIGF0IDEwOjM0IC0wNzAwLCBKb3PDqSBSb2JlcnRvIGRlIFNv
dXphIHdyb3RlOg0KPiBDb21taXQgY2FhYjI1ZGM5ZTM2ICgiZHJtL2k5MTUvZGlzcGxheTogRml4
IERSUlMgZGVidWdmcyIpIGFkZGVkDQo+ICJEUlJTIEVuYWJsZWQiIHRoYXQgaXMgc2V0IHdoZW4g
RFJSUyBpcyBlbmFibGVkIGFuZCBsZWZ0DQo+ICJEUlJTIFN1cHBvcnRlZCIgdG8gcmV0dXJuIGlm
IHRoZSBwYW5lbCBzdXBwb3J0cyBEUlJTLg0KPiANCj4gVGhlIGxhY2sgb2YgdGhpcyBjaGFuZ2Ug
d2FzIGNhdXNpbmcgbm9fZHJycyB0ZXN0cyB0byBhbHdheXMgZmFpbHMgaWYNCj4gcGFuZWwgc3Vw
cG9ydHMgdGhpcyBmZWF0dXJlLg0KPiANCj4gQ2M6IEd3YW4tZ3llb25nIE11biA8Z3dhbi1neWVv
bmcubXVuQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6
YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMva21zX3Bzci5jIHwgMiAr
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3Bzci5jIGIvdGVzdHMva21zX3Bzci5jDQo+IGluZGV4
IDQ5ZWE0NDZhZi4uYWIxOTA3M2U3IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9rbXNfcHNyLmMNCj4g
KysrIGIvdGVzdHMva21zX3Bzci5jDQo+IEBAIC0yMzQsNyArMjM0LDcgQEAgc3RhdGljIGJvb2wg
ZHJyc19kaXNhYmxlZChkYXRhX3QgKmRhdGEpDQo+ICAJaWd0X2RlYnVnZnNfc2ltcGxlX3JlYWQo
ZGF0YS0+ZGVidWdmc19mZCwgImk5MTVfZHJyc19zdGF0dXMiLA0KPiAgCQkJIGJ1Ziwgc2l6ZW9m
KGJ1ZikpOw0KPiAgDQo+IC0JcmV0dXJuICFzdHJzdHIoYnVmLCAiRFJSUyBTdXBwb3J0ZWQ6IFll
c1xuIik7DQo+ICsJcmV0dXJuICFzdHJzdHIoYnVmLCAiRFJSUyBFbmFibGVkIDogWWVzXG4iKTsN
Cj4gIH0NCj4gIA0KPiAgc3RhdGljIHZvaWQgcnVuX3Rlc3QoZGF0YV90ICpkYXRhKQ0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
