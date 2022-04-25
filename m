Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0690810E86B
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Apr 2022 13:37:00 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>
Date: Mon, 25 Apr 2022 13:36:59 +0000
Message-ID: <dc51666444e8be51d44d8c7e25e9c586677b0ec0.camel@intel.com>
References: <20220422060240.3193599-1-jouni.hogander@intel.com>
In-Reply-To: <20220422060240.3193599-1-jouni.hogander@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <21ED7292F36BEF4F8538D8694093A194@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] kms_psr2_su: Skip page-flip tests if
 FB_DAMAGE_CLIPS not supported
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Latvala, Petri" <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCAyMDIyLTA0LTIyIGF0IDA5OjAyICswMzAwLCBKb3VuaSBIw7ZnYW5kZXIgd3JvdGU6
DQo+IEN1cnJlbnRseSB3ZSBhcmUgc2VlaW5nIGZhaWx1cmVzIGluIElDTCBwbGF0Zm9ybXMgZHVl
IHRvDQo+IG1pc3Npbmcgc3VwcG9ydCBmb3IgSUdUX1BMQU5FX0ZCX0RBTUFHRV9DTElQUy4gU2tp
cCBwYWdlLWZsaXANCj4gdGVzdHMgaWYgSUdUX1BMQU5FX0ZCX0RBTUFHRV9DTElQUyBpcyBub3Qg
c3VwcG9ydGVkLg0KDQpJdCBzaG91bGQgc2tpcCB0aGlzIHdob2xlIHRlc3QgdGVzdCBpbiBkaXNw
bGF5IDw9IDExDQoNCj4gDQo+IENsb3NlczogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L2RybS9pbnRlbC8tL2lzc3Vlcy80MTQ4DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKb3VuaSBIw7Zn
YW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCj4gQ2M6IFBldHJpIExhdHZhbGEgPHBl
dHJpLmxhdHZhbGFAaW50ZWwuY29tPg0KPiBDYzogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9z
ZS5zb3V6YUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMvaTkxNS9rbXNfcHNyMl9zdS5jIHwg
NyArKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvdGVzdHMvaTkxNS9rbXNfcHNyMl9zdS5jIGIvdGVzdHMvaTkxNS9rbXNfcHNyMl9z
dS5jDQo+IGluZGV4IDQ3NGIxZGZkLi4wY2UxZjkyNCAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvaTkx
NS9rbXNfcHNyMl9zdS5jDQo+ICsrKyBiL3Rlc3RzL2k5MTUva21zX3BzcjJfc3UuYw0KPiBAQCAt
MzIyLDYgKzMyMiwxMyBAQCBpZ3RfbWFpbg0KPiAgCQkJCQkgKi8NCj4gIAkJCQkJaWd0X3NraXAo
IlBTUjIgc2VsZWN0aXZlIGZldGNoIGlzIGRvaW5nIGZ1bGwgZnJhbWUgZmV0Y2hlcyBmb3IgZnJv
bnRidWZmZXIgcmVuZGVyaW5nXG4iKTsNCj4gIAkJCQl9DQo+ICsJCQkJaWYgKGRhdGEub3AgPT0g
UEFHRV9GTElQICYmDQo+ICsJCQkJICAgICFpZ3RfcGxhbmVfaGFzX3Byb3AoaWd0X291dHB1dF9n
ZXRfcGxhbmVfdHlwZSgNCj4gKwkJCQkJCQkJZGF0YS5vdXRwdXQsDQo+ICsJCQkJCQkJCURSTV9Q
TEFORV9UWVBFX1BSSU1BUlkpLA0KPiArCQkJCQkJCUlHVF9QTEFORV9GQl9EQU1BR0VfQ0xJUFMp
KSB7DQo+ICsJCQkJCWlndF9za2lwKCJGQl9EQU1BR0VfQ0xJUFMgbm90IHN1cHBvcnRlZFxuIik7
DQo+ICsJCQkJfQ0KPiAgCQkJCXByZXBhcmUoJmRhdGEpOw0KPiAgCQkJCXJ1bigmZGF0YSk7DQo+
ICAJCQkJY2xlYW51cCgmZGF0YSk7DQoNCg==
