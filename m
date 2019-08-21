Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3F06E356
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2019 13:40:29 +0000 (UTC)
From: "Ser, Simon" <simon.ser@intel.com>
Date: Wed, 21 Aug 2019 13:40:17 +0000
Message-ID: <cd7d5ae437e5ffcff9ac929a033468ba20b2effd.camel@intel.com>
References: <20190821130928.29640-1-jani.nikula@intel.com>
In-Reply-To: <20190821130928.29640-1-jani.nikula@intel.com>
Content-Language: en-US
Content-ID: <EC6C17853BB79F44B2FE5F9474B36756@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tools/intel_reg: fix use-after-free bug
 in register spec read
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Nikula,
 Jani" <jani.nikula@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTA4LTIxIGF0IDE2OjA5ICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
ZSBwb2ludHMgaW50byB0aGUgYnVmZmVyIHBvaW50ZXIgdG8gYnkgcC4NCg0KVHlwbzogcG9pbnRl
ZA0KDQo+IA0KPiBGaXhlczogZGZkYTBiNmFlY2NlICgiaW50ZWxfcmVnOiBpbnRyb2R1Y2Ugb25l
IGludGVsX3JlZyB0b29sIHRvIHJ1bGUgdGhlbSBhbGwiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBKYW5p
IE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0KDQpSZXZpZXdlZC1ieTogU2ltb24gU2Vy
IDxzaW1vbi5zZXJAaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiAgdG9vbHMvaW50ZWxfcmVnX3NwZWMu
YyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2ludGVsX3JlZ19zcGVjLmMgYi90b29scy9pbnRl
bF9yZWdfc3BlYy5jDQo+IGluZGV4IDBkZjY5YjY4ODRkZS4uNWFiNTZlYzFhMzFmIDEwMDY0NA0K
PiAtLS0gYS90b29scy9pbnRlbF9yZWdfc3BlYy5jDQo+ICsrKyBiL3Rvb2xzL2ludGVsX3JlZ19z
cGVjLmMNCj4gQEAgLTIzMyw5ICsyMzMsOSBAQCBzdGF0aWMgaW50IHBhcnNlX2xpbmUoc3RydWN0
IHJlZyAqcmVnLCBjb25zdCBjaGFyICpsaW5lKQ0KPiAgCQkJcmVnLT5uYW1lID0gcDsNCj4gIAkJ
fSBlbHNlIGlmIChpID09IDIpIHsNCj4gIAkJCXJlZy0+YWRkciA9IHN0cnRvdWwocCwgJmUsIDE2
KTsNCj4gLQkJCWZyZWUocCk7DQo+ICAJCQlpZiAoKmUpDQo+ICAJCQkJcmV0ID0gLTE7DQo+ICsJ
CQlmcmVlKHApOw0KPiAgCQl9IGVsc2UgaWYgKGkgPT0gMykgew0KPiAgCQkJcmV0ID0gcGFyc2Vf
cG9ydF9kZXNjKHJlZywgcCk7DQo+ICAJCQlmcmVlKHApOw0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2
