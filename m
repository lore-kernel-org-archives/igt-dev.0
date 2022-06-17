Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5865611ACA5
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jun 2022 11:19:47 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
To: Luca Coelho <luca@coelho.fi>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Fri, 17 Jun 2022 11:19:43 +0000
Message-ID: <MWHPR1101MB21576495991DFF9A2FF4D48EEFAF9@MWHPR1101MB2157.namprd11.prod.outlook.com>
References: <20220615122533.658564-1-luca@coelho.fi>
 <20220615122533.658564-3-luca@coelho.fi>
In-Reply-To: <20220615122533.658564-3-luca@coelho.fi>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/4] tests/kms_sysfs_edid_timing:
 fail if probing a single connector takes too long
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMdWNhIENvZWxobyA8bHVjYUBj
b2VsaG8uZmk+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVuZSAxNSwgMjAyMiAzOjI2IFBNDQo+IFRv
OiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogTGF0dmFsYSwgUGV0cmkgPHBl
dHJpLmxhdHZhbGFAaW50ZWwuY29tPjsgS2Fob2xhLCBNaWthDQo+IDxtaWthLmthaG9sYUBpbnRl
bC5jb20+OyBsdWNhQGNvZWxoby5maQ0KPiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXQgdjIgMi80XSB0
ZXN0cy9rbXNfc3lzZnNfZWRpZF90aW1pbmc6IGZhaWwgaWYgcHJvYmluZyBhIHNpbmdsZQ0KPiBj
b25uZWN0b3IgdGFrZXMgdG9vIGxvbmcNCj4gDQo+IEZyb206IEx1Y2EgQ29lbGhvIDxsdWNpYW5v
LmNvZWxob0BpbnRlbC5jb20+DQo+IA0KPiBUaGVyZSdzIG5vIHBvaW50IGluIGp1c3Qgd2Fybmlu
ZyBpZiBwcm9iaW5nIGEgc2luZ2xlIGNvbm5lY3RvciB0YWtlcyB0b28gbG9uZy4gIElmIGENCj4g
dGVzdCBmaW5kcyBhbnkgaXNzdWVzLCBpdCBzaG91bGQganVzdCBmYWlsLg0KPiANCj4gQ29udmVy
dCB0aGUgd2FybmluZyBpbnRvIGFuIGFzc2VydGlvbi4NCj4gDQoNClJldmlld2VkLWJ5OiBNaWth
IEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPg0KDQo+IFNpZ25lZC1vZmYtYnk6IEx1Y2Eg
Q29lbGhvIDxsdWNpYW5vLmNvZWxob0BpbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMva21zX3N5
c2ZzX2VkaWRfdGltaW5nLmMgfCAxMCArKysrKy0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2tt
c19zeXNmc19lZGlkX3RpbWluZy5jIGIvdGVzdHMva21zX3N5c2ZzX2VkaWRfdGltaW5nLmMNCj4g
aW5kZXggMDI4YTUzMjNjMGIyLi5lYTBlMTY5ZTZlZDkgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2tt
c19zeXNmc19lZGlkX3RpbWluZy5jDQo+ICsrKyBiL3Rlc3RzL2ttc19zeXNmc19lZGlkX3RpbWlu
Zy5jDQo+IEBAIC04MSwxMSArODEsMTEgQEAgaWd0X3NpbXBsZV9tYWluDQo+ICAJCQkgIG1lYW4u
bWF4LCBtZWFuLm1heCAvIDFlMywgbWVhbi5tYXggLyAxZTYsDQo+ICAJCQkgIG1lYW4ubWVhbiwg
bWVhbi5tZWFuIC8gMWUzLCBtZWFuLm1lYW4gLyAxZTYpOw0KPiANCj4gLQkJaWYgKG1lYW4ubWF4
ID4gKFRIUkVTSE9MRF9QRVJfQ09OTkVDVE9SICogMWU2KSkgew0KPiAtCQkJaWd0X3dhcm4oIiVz
OiBwcm9iZSB0aW1lIGV4Y2VlZCAlZG1zLCBtYXg9JS4yZm1zLA0KPiBhdmc9JS4yZm1zXG4iLA0K
PiAtCQkJCSBkZS0+ZF9uYW1lLCBUSFJFU0hPTERfUEVSX0NPTk5FQ1RPUiwNCj4gLQkJCQkgbWVh
bi5tYXggLyAxZTYsIG1lYW4ubWVhbiAvIDFlNik7DQo+IC0JCX0NCj4gKwkJaWd0X2Fzc2VydF9m
KG1lYW4ubWF4IDwgVEhSRVNIT0xEX1BFUl9DT05ORUNUT1IgKiAxZTYsDQo+ICsJCQkgICAgICIl
czogcHJvYmUgdGltZSBleGNlZWQgJWRtcywgbWF4PSUuMmZtcywNCj4gYXZnPSUuMmZtc1xuIiwN
Cj4gKwkJCSAgICAgZGUtPmRfbmFtZSwgVEhSRVNIT0xEX1BFUl9DT05ORUNUT1IsDQo+ICsJCQkg
ICAgIG1lYW4ubWF4IC8gMWU2LCBtZWFuLm1lYW4gLyAxZTYpOw0KPiArDQo+ICAJCWlndF9hc3Nl
cnRfZihtZWFuLm1lYW4gPCAoVEhSRVNIT0xEX1RPVEFMICogMWU2KSwNCj4gIAkJCSAgICAgIiVz
OiBhdmVyYWdlIHByb2JlIHRpbWUgZXhjZWVkZWQgJWRtcywNCj4gbWF4PSUuMmZtcywgYXZnPSUu
MmZtc1xuIiwNCj4gIAkJCSAgICAgZGUtPmRfbmFtZSwgVEhSRVNIT0xEX1RPVEFMLA0KPiAtLQ0K
PiAyLjM2LjENCg0K
