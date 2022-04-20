Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1779F10E2AC
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Apr 2022 19:08:40 +0000 (UTC)
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
Date: Wed, 20 Apr 2022 19:08:37 +0000
Message-ID: <3dd9fb53d204f1e7865b74bb675078fb462ed958.camel@intel.com>
References: <20220420184628.412506-1-rodrigo.vivi@intel.com>
 <671434dd9c4241e481bcf4abb0f2666c@intel.com>
In-Reply-To: <671434dd9c4241e481bcf4abb0f2666c@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <00C6F7EE2B268646BC5F620280AB9721@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/i915_pm_dc.c: Remove PC8+
 dependency from DC9.
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

T24gV2VkLCAyMDIyLTA0LTIwIGF0IDEyOjA3IC0wNzAwLCBTcml2YXRzYSwgQW51c2hhIHdyb3Rl
Og0KPiANCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBWaXZp
LCBSb2RyaWdvIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiA+IFNlbnQ6IFdlZG5lc2RheSwg
QXByaWwgMjAsIDIwMjIgMTE6NDYgQU0NCj4gPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCj4gPiBDYzogVml2aSwgUm9kcmlnbyA8cm9kcmlnby52aXZpQGludGVsLmNvbT47IERl
YWssIEltcmUNCj4gPiA8aW1yZS5kZWFrQGludGVsLmNvbT47IEd1cHRhLCBBbnNodW1hbiA8YW5z
aHVtYW4uZ3VwdGFAaW50ZWwuY29tPjsNCj4gPiBTcml2YXRzYSwgQW51c2hhIDxhbnVzaGEuc3Jp
dmF0c2FAaW50ZWwuY29tPg0KPiA+IFN1YmplY3Q6IFtQQVRDSCBpLWctdF0gdGVzdHMvaTkxNS9p
OTE1X3BtX2RjLmM6IFJlbW92ZSBQQzgrDQo+ID4gZGVwZW5kZW5jeQ0KPiA+IGZyb20gREM5Lg0K
PiA+IA0KPiA+IERpZmZlcmVudCBmcm9tIERDNiwgREM5IGRvZXMgbm90IGRlcGVuZCBvbiB0aGUg
QklPUy9QQ1UgdG8gZXhlY3V0ZQ0KPiA+IHNhdmUNCj4gPiBhbmQgcmVzdG9yZSBvciBhbnkgb3Ro
ZXIgc2VxdWVuY2Ugd2hlbiBnb2luZyB0byBQQzkvUEMxMC4NCj4gPiANCj4gPiBEQzkgYWN0dWFs
bHkgZGVwZW5kcyBvbiBEMyBhbmQgUENPREUgc2ltcGx5IHJlbW92ZSBwb3dlciBpZiBTVw0KPiA+
IGFsbG93ZWQuDQo+IA0KPiBJcyB0aGlzIHRoZSBjYXNlIGZvciBib3RoIGlnZnggYW5kIGRnZng/
DQoNCnllcw0KDQoNCj4gDQo+IEFudXNoYQ0KPiANCj4gPiBDYzogSW1yZSBEZWFrIDxpbXJlLmRl
YWtAaW50ZWwuY29tPg0KPiA+IENjOiBBbnNodW1hbiBHdXB0YSA8YW5zaHVtYW4uZ3VwdGFAaW50
ZWwuY29tPg0KPiA+IENjOiBBbnVzaGEgU3JpdmF0c2EgPGFudXNoYS5zcml2YXRzYUBpbnRlbC5j
b20+DQo+ID4gU2lnbmVkLW9mZi1ieTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwu
Y29tPg0KPiA+IC0tLQ0KPiA+IMKgdGVzdHMvaTkxNS9pOTE1X3BtX2RjLmMgfCAyIC0tDQo+ID4g
wqAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEv
dGVzdHMvaTkxNS9pOTE1X3BtX2RjLmMgYi90ZXN0cy9pOTE1L2k5MTVfcG1fZGMuYw0KPiA+IGlu
ZGV4DQo+ID4gMmMyYzUwODYuLjlhMjIyNDZjIDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2k5MTUv
aTkxNV9wbV9kYy5jDQo+ID4gKysrIGIvdGVzdHMvaTkxNS9pOTE1X3BtX2RjLmMNCj4gPiBAQCAt
NTMxLDggKzUzMSw2IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pDQo+ID4gDQo+
ID4gwqDCoMKgwqDCoMKgwqDCoGlndF9kZXNjcmliZSgiVGhpcyB0ZXN0IHZhbGlkYXRlcyBkaXNw
bGF5IGVuZ2luZSBlbnRyeSB0bw0KPiA+IERDOSBzdGF0ZSIpOw0KPiA+IMKgwqDCoMKgwqDCoMKg
wqBpZ3Rfc3VidGVzdCgiZGM5LWRwbXMiKSB7DQo+ID4gLQ0KPiA+IMKgwqDCoMKgwqDCoMKgwqBp
Z3RfcmVxdWlyZV9mKGlndF9wbV9wYzhfcGx1c19yZXNpZGVuY2llc19lbmFibGVkKGRhdGEubXNy
Xw0KPiA+IGZkKSwNCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAiUEM4KyByZXNpZGVuY2llcyBub3QNCj4gPiBzdXBwb3J0
ZWRcbiIpOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdGVzdF9kYzlfZHBt
cygmZGF0YSk7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoH0NCj4gPiANCj4gPiAtLQ0KPiA+IDIuMzQu
MQ0KPiANCg0K
