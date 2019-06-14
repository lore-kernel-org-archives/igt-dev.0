Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 234708946E
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jun 2019 08:20:43 +0000 (UTC)
From: "Ser, Simon" <simon.ser@intel.com>
Date: Fri, 14 Jun 2019 08:20:40 +0000
Message-ID: <ade79e362741ef0c8e04b2f820310cd448ebd6ba.camel@intel.com>
References: <20190614080816.12464-1-arkadiusz.hiler@intel.com>
 <20190614080816.12464-2-arkadiusz.hiler@intel.com>
In-Reply-To: <20190614080816.12464-2-arkadiusz.hiler@intel.com>
Content-Language: en-US
Content-ID: <A1DF8D2E563CC84081965346E66B9FA4@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] runner: Handle SIGHUP too
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
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTA2LTE0IGF0IDExOjA4ICswMzAwLCBBcmthZGl1c3ogSGlsZXIgd3JvdGU6
DQo+IERlZmF1bHQgaGFuZGxlciBmb3IgU0lHSFVQIGlzIGFsc28gdGVybWluYXRpbmcgdGhlIHBy
b2Nlc3MsIHNvIGxldCdzDQo+IG1hc2sgaXQgYW5kIGhhbmRsZSBpdCBtYW51YWxseSwgbGlrZSB0
aGUgcmVzdCBvZiB0aGUgYnVuY2guDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBcmthZGl1c3ogSGls
ZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgcnVubmVyL2V4ZWN1dG9y
LmMgfCAxICsNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL3J1bm5lci9leGVjdXRvci5jIGIvcnVubmVyL2V4ZWN1dG9yLmMNCj4gaW5kZXggZjlj
NjlmZWYuLjZiMTcxYzEyIDEwMDY0NA0KPiAtLS0gYS9ydW5uZXIvZXhlY3V0b3IuYw0KPiArKysg
Yi9ydW5uZXIvZXhlY3V0b3IuYw0KPiBAQCAtOTUwLDYgKzk1MCw3IEBAIHN0YXRpYyBpbnQgZXhl
Y3V0ZV9uZXh0X2VudHJ5KHN0cnVjdCBleGVjdXRlX3N0YXRlICpzdGF0ZSwNCj4gIAlzaWdhZGRz
ZXQoJm1hc2ssIFNJR0lOVCk7DQo+ICAJc2lnYWRkc2V0KCZtYXNrLCBTSUdURVJNKTsNCj4gIAlz
aWdhZGRzZXQoJm1hc2ssIFNJR1FVSVQpOw0KPiArCXNpZ2FkZHNldCgmbWFzaywgU0lHSFVQKTsN
Cg0KTm90ZSB0byBzZWxmOiBoYW5kbGVkIGluIHRoZSBlbHNlIGJsb2NrIG9uIGxpbmUgNzI0Lg0K
DQpSZXZpZXdlZC1ieTogU2ltb24gU2VyIDxzaW1vbi5zZXJAaW50ZWwuY29tPg0KDQo+ICAJc2ln
cHJvY21hc2soU0lHX0JMT0NLLCAmbWFzaywgTlVMTCk7DQo+ICAJc2lnZmQgPSBzaWduYWxmZCgt
MSwgJm1hc2ssIE9fQ0xPRVhFQyk7DQo+ICANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldg==
