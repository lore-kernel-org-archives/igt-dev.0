Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07E86E851
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2019 23:15:08 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Thu, 24 Oct 2019 23:15:05 +0000
Message-ID: <c8bc10f4212fb6ee0615d25171fa31c42e75f71b.camel@intel.com>
References: <20191023215031.94821-1-jose.souza@intel.com>
 <20191024150039.GE18842@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20191024150039.GE18842@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
Content-ID: <04ED0078255AD74894FA66B497238CED@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/psr: Skip PSR tests if sink not
 reliable
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
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ap,
 Kamal" <kamal.ap@intel.com>, "Pandiyan,
 Dhinakaran" <dhinakaran.pandiyan@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTEwLTI0IGF0IDA4OjAwIC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBP
biBXZWQsIE9jdCAyMywgMjAxOSBhdCAwMjo1MDozMFBNIC0wNzAwLCBKb3PDqSBSb2JlcnRvIGRl
IFNvdXphDQo+IHdyb3RlOg0KPiA+IFJpZ2h0IG5vdyBpZiBzaW5rIHJlcG9ydGVkIGFueSBQU1Ig
ZXJyb3Igb3IgaWYgaXQgZmFpbHMgdG8NCj4gPiBhY2tub3dsZWRnZSB0aGUgUFNSIHdha2V1cCBp
dCBzZXRzIGEgZmxhZyBhbmQgZG8gbm90IGF0dGVtcHQgdG8NCj4gPiBlbmFibGUgUFNSIGFueW1v
cmUuIFRoYXQgaXMgdGhlIHNhZmVzdCBhcHByb2FjaCB0byBhdm9pZCByZXBldGl0aXZlDQo+ID4g
Z2xpdGNoZXMgYW5kIGFsbG93ZWQgdXMgdG8gaGF2ZSBQU1IgZW5hYmxlZCBieSBkZWZhdWx0Lg0K
PiA+IA0KPiA+IEJ1dCBmcm9tIHRpbWUgdG8gdGltZSBldmVuIGdvb2QgUFNSIHBhbmVscyBoYXZl
IGEgUFNSIGVycm9yLA0KPiA+IGNhdXNpbmcNCj4gPiB0ZXN0cyB0byBmYWlsLiBBbmQgZm9yIG5v
dyB3ZSBhcmUgbm90IHlldCB0byB0aGUgcG9pbnQgd2VyZSB3ZQ0KPiA+IGNvdWxkDQo+ID4gdHJ5
IHRvIHJlY292ZXIgZnJvbSBQU1IgZXJyb3JzLCBzbyBsZXRzIGNoZWNrIGZvciB0aGlzIGluZm9y
bWF0aW9uDQo+ID4gaW4NCj4gPiBkZWJ1Z2ZzIGFuZCBza2lwIFBTUiB0ZXN0cyBiZWNhdXNlIG9m
IHNpbmsgZXJyb3JzIGFuZCBlbGltaW5hdGUNCj4gPiB0aGlzDQo+ID4gbm9pc2UgZnJvbSBDSSBy
dW5zLg0KPiA+IA0KPiA+IENjOiBEaGluYWthcmFuIFBhbmRpeWFuIDxkaGluYWthcmFuLnBhbmRp
eWFuQGludGVsLmNvbT4NCj4gPiBDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwu
Y29tPg0KPiA+IENjOiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KPiA+
IENjOiBBcCBLYW1hbCA8a2FtYWwuYXBAaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEpv
c8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiANCj4gQnVnemls
bGE6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEwOTQ1NA0K
PiBSZXZpZXdlZC1ieTogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCg0K
QWRkZWQgYW5kIHB1c2hlZA0KDQpUaGFua3MNCg0KPiANCj4gYW5kIHItYiBmb3IgdGhlIGk5MTUg
cGF0Y2ggYXMgd2VsbC4NCj4gDQo+IA0KPiA+IC0tLQ0KPiA+ICBsaWIvaWd0X3Bzci5jIHwgMiAr
Kw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAt
LWdpdCBhL2xpYi9pZ3RfcHNyLmMgYi9saWIvaWd0X3Bzci5jDQo+ID4gaW5kZXggYjkyZWE3M2Yu
LjBlNzlkY2Q5IDEwMDY0NA0KPiA+IC0tLSBhL2xpYi9pZ3RfcHNyLmMNCj4gPiArKysgYi9saWIv
aWd0X3Bzci5jDQo+ID4gQEAgLTMzLDYgKzMzLDggQEAgc3RhdGljIGJvb2wgcHNyX2FjdGl2ZV9j
aGVjayhpbnQgZGVidWdmc19mZCwgZW51bQ0KPiA+IHBzcl9tb2RlIG1vZGUpDQo+ID4gIAlpZ3Rf
ZGVidWdmc19zaW1wbGVfcmVhZChkZWJ1Z2ZzX2ZkLCAiaTkxNV9lZHBfcHNyX3N0YXR1cyIsIGJ1
ZiwNCj4gPiAgCQkJCXNpemVvZihidWYpKTsNCj4gPiAgDQo+ID4gKwlpZ3Rfc2tpcF9vbihzdHJz
dHIoYnVmLCAiUFNSIHNpbmsgbm90IHJlbGlhYmxlOiB5ZXMiKSk7DQo+ID4gKw0KPiA+ICAJcmV0
dXJuIHN0cnN0cihidWYsIHN0YXRlKTsNCj4gPiAgfQ0KPiA+ICANCj4gPiAtLSANCj4gPiAyLjIz
LjANCj4gPiANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
