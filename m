Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBE06E83A
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Aug 2021 12:07:52 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Thu, 19 Aug 2021 12:07:50 +0000
Message-ID: <4f681023b09749a19b484ef1383b2915@intel.com>
References: <20210817092724.16512-1-juhapekka.heikkila@gmail.com>
 <20210817092724.16512-2-juhapekka.heikkila@gmail.com>
In-Reply-To: <20210817092724.16512-2-juhapekka.heikkila@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_plane_alpha_blend: reset
 display after test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IE1pa2EgS2Fob2xhIDxtaWthLmthaG9sYUBpbnRlbC5jb20+DQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRldi1ib3VuY2Vz
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEp1aGEtDQo+IFBla2thIEhlaWtr
aWxhDQo+IFNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAxNywgMjAyMSAxMjoyNyBQTQ0KPiBUbzogaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEp1aGEtUGVra2EgSGVpa2tpbGEgPGp1
aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+DQo+IFN1YmplY3Q6IFtpZ3QtZGV2XSBbUEFUQ0gg
aS1nLXQgMi8yXSB0ZXN0cy9rbXNfcGxhbmVfYWxwaGFfYmxlbmQ6IHJlc2V0IGRpc3BsYXkNCj4g
YWZ0ZXIgdGVzdA0KPiANCj4gSWYgdGVzdCB3b3VsZCBmYWlsIGFscGhhL2JsZW5kIHNldHRpbmdz
IHdvdWxkIGJlIGxlZnQgb24gcmFuZG9tIHNldHRpbmcuIENsZWFuIHVwDQo+IGJlZm9yZSBleGl0
aW5nLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSnVoYS1QZWtrYSBIZWlra2lsYSA8anVoYXBla2th
LmhlaWtraWxhQGdtYWlsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9rbXNfcGxhbmVfYWxwaGFfYmxl
bmQuYyB8IDcgKysrKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19wbGFuZV9hbHBoYV9ibGVu
ZC5jIGIvdGVzdHMva21zX3BsYW5lX2FscGhhX2JsZW5kLmMNCj4gaW5kZXggY2I4ZjkyODkxLi5j
ZmY5YTllZmYgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ttc19wbGFuZV9hbHBoYV9ibGVuZC5jDQo+
ICsrKyBiL3Rlc3RzL2ttc19wbGFuZV9hbHBoYV9ibGVuZC5jDQo+IEBAIC01ODYsNiArNTg2LDEx
IEBAIGlndF9tYWluDQo+ICAJCWlndF9zdWJ0ZXN0X2dyb3VwDQo+ICAJCQlydW5fc3VidGVzdHMo
JmRhdGEsIHBpcGUpOw0KPiANCj4gLQlpZ3RfZml4dHVyZQ0KPiArCWlndF9maXh0dXJlIHsNCj4g
KwkJaWd0X2Rpc3BsYXlfcmVzZXQoJmRhdGEuZGlzcGxheSk7DQo+ICsJCWlndF9kaXNwbGF5X2Nv
bW1pdDIoJmRhdGEuZGlzcGxheSwgZGF0YS5kaXNwbGF5LmlzX2F0b21pYyA/DQo+ICsJCQkJICAg
IENPTU1JVF9BVE9NSUMgOiBDT01NSVRfTEVHQUNZKTsNCj4gKw0KPiAgCQlpZ3RfZGlzcGxheV9m
aW5pKCZkYXRhLmRpc3BsYXkpOw0KPiArCX0NCj4gIH0NCj4gLS0NCj4gMi4yOC4wDQoNCg==
