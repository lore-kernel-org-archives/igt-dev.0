Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229F089F19
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Aug 2020 08:18:24 +0000 (UTC)
From: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Date: Mon, 24 Aug 2020 08:18:21 +0000
Message-ID: <cf373543acd348b2b128f5c5ceb4a097@intel.com>
References: <20200821163928.1072379-1-michel@daenzer.net>
 <159803492175.16198.892699385799556109@emeril.freedesktop.org>
 <1f2bafb1-e3c2-8295-c8c1-816410759f41@daenzer.net>
 <20200824074209.GF7444@platvala-desk.ger.corp.intel.com>
In-Reply-To: <20200824074209.GF7444@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=3A_Turn_off_pipe_as_well_if_all_planes_are_off?=
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
To: "Latvala, Petri" <petri.latvala@intel.com>, =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

UmUtcmVwb3J0ZWQuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBMYXR2YWxh
LCBQZXRyaSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+IA0KU2VudDogTW9uZGF5LCBBdWd1c3Qg
MjQsIDIwMjAgMTI6NDIgQU0NClRvOiBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRhZW56ZXIubmV0
PjsgVnVkdW0sIExha3NobWluYXJheWFuYSA8bGFrc2htaW5hcmF5YW5hLnZ1ZHVtQGludGVsLmNv
bT4NCkNjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KU3ViamVjdDogUmU6IFtpZ3Qt
ZGV2XSDinJcgRmkuQ0kuSUdUOiBmYWlsdXJlIGZvciB0ZXN0cy9rbXM6IFR1cm4gb2ZmIHBpcGUg
YXMgd2VsbCBpZiBhbGwgcGxhbmVzIGFyZSBvZmYNCg0KT24gU2F0LCBBdWcgMjIsIDIwMjAgYXQg
MTE6MDg6MTVBTSArMDIwMCwgTWljaGVsIETDpG56ZXIgd3JvdGU6DQo+IE9uIDIwMjAtMDgtMjEg
ODozNSBwLm0uLCBQYXRjaHdvcmsgd3JvdGU6DQo+ID4gDQo+ID4gUG9zc2libGUgbmV3IGlzc3Vl
cw0KPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiANCj4gPiAgIEhlcmUgYXJlIHRoZSB1bmtu
b3duIGNoYW5nZXMgdGhhdCBtYXkgaGF2ZSBiZWVuIGludHJvZHVjZWQgaW4gSUdUUFdfNDkwMl9m
dWxsOg0KPiA+IA0KPiA+ICMjIyBJR1QgY2hhbmdlcyAjIyMNCj4gPiANCj4gPiAjIyMjIFBvc3Np
YmxlIHJlZ3Jlc3Npb25zICMjIyMNCj4gPiANCj4gPiAgICogaWd0QGttc19iaWdfZmJAbGluZWFy
LTMyYnBwLXJvdGF0ZS0wOg0KPiA+ICAgICAtIHNoYXJkLXRnbGI6ICAgICAgICAgW1BBU1NdWzFd
IC0+IFtGQUlMXVsyXQ0KPiA+ICAgIFsxXTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3Ry
ZWUvZHJtLXRpcC9DSV9EUk1fODkxMy9zaGFyZC10Z2xiNS9pZ3RAa21zX2JpZ19mYkBsaW5lYXIt
MzJicHAtcm90YXRlLTAuaHRtbA0KPiA+ICAgIFsyXTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEu
b3JnL3RyZWUvZHJtLXRpcC9JR1RQV180OTAyL3NoYXJkLXRnbGI1L2lndEBrbXNfYmlnX2ZiQGxp
bmVhci0zMmJwcC1yb3RhdGUtMC5odG1sDQo+IA0KPiBUaGlzIGlzIGEgZmFsc2UgcG9zaXRpdmUs
IHNpbmNlIG15IHNlcmllcyBkb2Vzbid0IGFmZmVjdCB0aGlzIHRlc3QuDQoNClllcC4gTGFrc2ht
aSwgc2VlIGFib3ZlLg0KDQoNCi0tIA0KUGV0cmkgTGF0dmFsYQ0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
