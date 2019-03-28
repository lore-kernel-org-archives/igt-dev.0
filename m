Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6FC6E2F4
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2019 07:59:08 +0000 (UTC)
From: "Ser, Simon" <simon.ser@intel.com>
Date: Thu, 28 Mar 2019 07:59:04 +0000
Message-ID: <85345a3cd06beeebed677d0d7333a90b8a9a2e40.camel@intel.com>
References: <20190321085938.17043-1-simon.ser@intel.com>
 <155315913079.22764.16577903388199927509@skylake-alporthouse-com>
In-Reply-To: <155315913079.22764.16577903388199927509@skylake-alporthouse-com>
Content-Language: en-US
Content-ID: <45C5C33E45721F4DAD1391E4D0B4393D@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_latency: fix
 uninitialized variable
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>
Cc: "Latvala, Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTAzLTIxIGF0IDA5OjA1ICswMDAwLCBDaHJpcyBXaWxzb24gd3JvdGU6DQo+
IFF1b3RpbmcgU2ltb24gU2VyICgyMDE5LTAzLTIxIDA4OjU5OjM4KQ0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFNpbW9uIFNlciA8c2ltb24uc2VyQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgdGVzdHMv
aTkxNS9nZW1fZXhlY19sYXRlbmN5LmMgfCAyICstDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9p
OTE1L2dlbV9leGVjX2xhdGVuY3kuYw0KPiA+IGIvdGVzdHMvaTkxNS9nZW1fZXhlY19sYXRlbmN5
LmMNCj4gPiBpbmRleCA2ZGQxOTFlYy4uMWIwMjJkZjUgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMv
aTkxNS9nZW1fZXhlY19sYXRlbmN5LmMNCj4gPiArKysgYi90ZXN0cy9pOTE1L2dlbV9leGVjX2xh
dGVuY3kuYw0KPiA+IEBAIC01OTcsNyArNTk3LDcgQEAgcnRob2dfbGF0ZW5jeV9vbl9yaW5nKGlu
dCBmZCwgdW5zaWduZWQgaW50DQo+ID4gZW5naW5lLCBjb25zdCBjaGFyICpuYW1lLCB1bnNpZ25l
ZCBpbg0KPiA+ICAgICAgICAgZm9yICh1bnNpZ25lZCBpbnQgY2hpbGQgPSAwOyBjaGlsZCA8IG5l
bmdpbmU7IGNoaWxkKyspIHsNCj4gPiAgICAgICAgICAgICAgICAgc3RydWN0IHJ0X3BrdCBub3Jt
YWwgPSByZXN1bHRzW05QQVNTICogY2hpbGQgKyAxXTsNCj4gPiAgICAgICAgICAgICAgICAgaWd0
X3N0YXRzX3Qgc3RhdHM7DQo+ID4gLSAgICAgICAgICAgICAgIGRvdWJsZSB2YXJpYW5jZTsNCj4g
PiArICAgICAgICAgICAgICAgZG91YmxlIHZhcmlhbmNlID0gMC4wOw0KPiANCj4gSSBrbm93IEkg
cmV2aWV3ZWQgYSBwYXRjaCBieSBQZXRyaSB3aXRoIHRoZSBzYW1lIGZpeC4uLg0KPiAtQ2hyaXMN
Cg0KSW5kZWVkOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMjkxODkz
Lw0KDQpJJ2xsIG1hcmsgdGhpcyBvbmUgYXMgc3VwZXJzZWVkZWQuDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
