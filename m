Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F736E0BC
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jul 2019 08:18:46 +0000 (UTC)
From: "Ser, Simon" <simon.ser@intel.com>
Date: Wed, 10 Jul 2019 08:18:44 +0000
Message-ID: <c9dbf473ac6c5d8573b9143bc0b08ef3e5871833.camel@intel.com>
References: <20190709122345.29180-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20190709122345.29180-1-arkadiusz.hiler@intel.com>
Content-Language: en-US
Content-ID: <D659F38D40A4DE40A6D66DDD719AB528@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] runner: Make sure we don't close
 watchdogs twice
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
DQo+IFNldHRpbmcgdGhlIHdhdGNoZG9nIGZkIGxpc3RzIHRvIE5VTEwgZm9yIGV4dHJhIGZpcmV3
b3JrcyBpZiBhY2Nlc3NlZA0KPiB1bmludGVudGlvbmFsbHkuDQo+IA0KPiBDYzogUGV0cmkgTGF0
dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEFya2FkaXVz
eiBIaWxlciA8YXJrYWRpdXN6LmhpbGVyQGludGVsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFNpbW9u
IFNlciA8c2ltb24uc2VyQGludGVsLmNvbT4NCg0KPiAtLS0NCj4gIHJ1bm5lci9leGVjdXRvci5j
IHwgNCArKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvcnVubmVyL2V4ZWN1dG9yLmMgYi9ydW5uZXIvZXhlY3V0b3IuYw0KPiBpbmRleCA3
YTdlMjlkOS4uYWYwMmM1YTggMTAwNjQ0DQo+IC0tLSBhL3J1bm5lci9leGVjdXRvci5jDQo+ICsr
KyBiL3J1bm5lci9leGVjdXRvci5jDQo+IEBAIC00Niw2ICs0NiwxMCBAQCBzdGF0aWMgdm9pZCBj
bG9zZV93YXRjaGRvZ3Moc3RydWN0IHNldHRpbmdzICpzZXR0aW5ncykNCj4gIAlmb3IgKGkgPSAw
OyBpIDwgd2F0Y2hkb2dzLm51bV9kb2dzOyBpKyspIHsNCj4gIAkJX19jbG9zZV93YXRjaGRvZyh3
YXRjaGRvZ3MuZmRzW2ldKTsNCj4gIAl9DQo+ICsNCj4gKwlmcmVlKHdhdGNoZG9ncy5mZHMpOw0K
PiArCXdhdGNoZG9ncy5udW1fZG9ncyA9IDA7DQo+ICsJd2F0Y2hkb2dzLmZkcyA9IE5VTEw7DQo+
ICB9DQo+ICANCj4gIHN0YXRpYyB2b2lkIGNsb3NlX3dhdGNoZG9nc19hdGV4aXQodm9pZCkNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
