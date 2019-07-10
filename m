Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A269D6E0BF
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jul 2019 08:20:04 +0000 (UTC)
From: "Ser, Simon" <simon.ser@intel.com>
Date: Wed, 10 Jul 2019 08:20:01 +0000
Message-ID: <ca6b8fb9bf4c7536106d052fddd7d4104e931953.camel@intel.com>
References: <20190709122345.29180-1-arkadiusz.hiler@intel.com>
 <20190709122345.29180-2-arkadiusz.hiler@intel.com>
In-Reply-To: <20190709122345.29180-2-arkadiusz.hiler@intel.com>
Content-Language: en-US
Content-ID: <27FD3E4718271042965CBD026897C063@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] runner: Warn when watchdogs are
 being closed from the exit handler
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
To: "Hiler, Arkadiusz" <arkadiusz.hiler@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Latvala, Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTA3LTA5IGF0IDE1OjIzICswMzAwLCBBcmthZGl1c3ogSGlsZXIgd3JvdGU6
DQo+IGluc3RlYWQgb2YgYmVpbmcgY2xvc2VkIG5vcm1hbGx5IG9uIGEgZ3JhY2VmdWwgY29kZSBw
YXRoDQo+IA0KPiBDYzogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+DQo+
IFNpZ25lZC1vZmYtYnk6IEFya2FkaXVzeiBIaWxlciA8YXJrYWRpdXN6LmhpbGVyQGludGVsLmNv
bT4NCg0KUmV2aWV3ZWQtYnk6IFNpbW9uIFNlciA8c2ltb24uc2VyQGludGVsLmNvbT4NCg0KPiAt
LS0NCj4gIHJ1bm5lci9leGVjdXRvci5jIHwgMyArKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9ydW5uZXIvZXhlY3V0b3IuYyBiL3J1bm5l
ci9leGVjdXRvci5jDQo+IGluZGV4IGFmMDJjNWE4Li42NDYzYWI5NiAxMDA2NDQNCj4gLS0tIGEv
cnVubmVyL2V4ZWN1dG9yLmMNCj4gKysrIGIvcnVubmVyL2V4ZWN1dG9yLmMNCj4gQEAgLTQzLDYg
KzQzLDkgQEAgc3RhdGljIHZvaWQgY2xvc2Vfd2F0Y2hkb2dzKHN0cnVjdCBzZXR0aW5ncyAqc2V0
dGluZ3MpDQo+ICAJaWYgKHNldHRpbmdzICYmIHNldHRpbmdzLT5sb2dfbGV2ZWwgPj0gTE9HX0xF
VkVMX1ZFUkJPU0UpDQo+ICAJCXByaW50ZigiQ2xvc2luZyB3YXRjaGRvZ3NcbiIpOw0KPiAgDQo+
ICsJaWYgKHNldHRpbmdzID09IE5VTEwgJiYgd2F0Y2hkb2dzLm51bV9kb2dzICE9IDApDQo+ICsJ
CWZwcmludGYoc3RkZXJyLCAiQ2xvc2luZyB3YXRjaGRvZ3MgZnJvbSBleGl0IGhhbmRsZXIhXG4i
KTsNCj4gKw0KPiAgCWZvciAoaSA9IDA7IGkgPCB3YXRjaGRvZ3MubnVtX2RvZ3M7IGkrKykgew0K
PiAgCQlfX2Nsb3NlX3dhdGNoZG9nKHdhdGNoZG9ncy5mZHNbaV0pOw0KPiAgCX0NCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
