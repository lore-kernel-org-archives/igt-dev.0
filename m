Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B77F6E08A
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2019 08:09:12 +0000 (UTC)
From: "Ser, Simon" <simon.ser@intel.com>
Date: Tue, 13 Aug 2019 08:07:04 +0000
Message-ID: <d6baf9017c4da46f84e0291e01b3503c2a5ffc92.camel@intel.com>
References: <20190808140205.16658-1-imre.deak@intel.com>
In-Reply-To: <20190808140205.16658-1-imre.deak@intel.com>
Content-Language: en-US
Content-ID: <E12DC4520E0AC941AC3641A4FCB3E9D3@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_properties: Fix upper bound
 of 'max bpc' range
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Deak,
 Imre" <imre.deak@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTA4LTA4IGF0IDE3OjAyICswMzAwLCBJbXJlIERlYWsgd3JvdGU6DQo+IFRo
ZSBhdmFpbGFibGUgcmFuZ2UgcmVwb3J0ZWQgYnkgdGhlIGRyaXZlciBpcyB0aGUgaW5jbHVzaXZl
IFttaW5fYnBjLA0KPiBtYXhfYnBjXSwgc28gZml4IHRoZSB1cHBlciBib3VuZCB1c2VkIGJ5IHRo
ZSB0ZXN0IGFjY29yZGluZ2x5LiBUaGlzDQo+IGlzc3VlIGhhZCB0aGUgc2lkZS1lZmZlY3QgKG9u
IElDTCBmb3IgaW5zdGFuY2UpIG9mIGxpbWl0aW5nICdtYXggYnBjJyB0bw0KPiAxMCAoaW5zdGVh
ZCBvZiByZXN0b3JpbmcgaXQgdG8gdGhlIGRlZmF1bHQgMTIpIGZvciBhbGwgdGhlIHRlc3RzDQo+
IGZvbGxvd2luZyBrbXNfcHJvcGVydGllcywgYXMgc2VlbiBmcm9tIHRoZSBsb2dzIGluIHRoZSBy
ZWZlcmVuY2VkIGJ1Zw0KPiBiZWxvdy4NCj4gDQo+IFJlZmVyZW5jZTogaHR0cHM6Ly9idWdzLmZy
ZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA5NTkzDQo+IENjOiBSYWRoYWtyaXNobmEg
U3JpcGFkYSA8cmFkaGFrcmlzaG5hLnNyaXBhZGFAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5
OiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+DQoNClRoaXMgcGF0Y2ggTEdUTS4NCg0K
UmV2aWV3ZWQtYnk6IFNpbW9uIFNlciA8c2ltb24uc2VyQGludGVsLmNvbT4NCg0KPiAtLS0NCj4g
IHRlc3RzL2ttc19wcm9wZXJ0aWVzLmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfcHJv
cGVydGllcy5jIGIvdGVzdHMva21zX3Byb3BlcnRpZXMuYw0KPiBpbmRleCBlYjljYmRkYS4uMThj
Zjk2ZTAgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ttc19wcm9wZXJ0aWVzLmMNCj4gKysrIGIvdGVz
dHMva21zX3Byb3BlcnRpZXMuYw0KPiBAQCAtOTEsNyArOTEsNyBAQCBzdGF0aWMgdm9pZCBtYXhf
YnBjX3Byb3BfdGVzdChpbnQgZmQsIHVpbnQzMl90IGlkLCB1aW50MzJfdCB0eXBlLCBkcm1Nb2Rl
UHJvcGVydA0KPiAgCWlmIChhdG9taWMpDQo+ICAJCXJlcSA9IGRybU1vZGVBdG9taWNBbGxvYygp
Ow0KPiAgDQo+IC0JZm9yICggaSA9IHByb3AtPnZhbHVlc1swXTsgaSA8IHByb3AtPnZhbHVlc1sx
XSA7IGkrKykgew0KPiArCWZvciAoaSA9IHByb3AtPnZhbHVlc1swXTsgaSA8PSBwcm9wLT52YWx1
ZXNbMV07IGkrKykgew0KPiAgCQlpZiAoIWF0b21pYykgew0KPiAgCQkJcmV0ID0gZHJtTW9kZU9i
amVjdFNldFByb3BlcnR5KGZkLCBpZCwgdHlwZSwgcHJvcF9pZCwgaSk7DQo+ICANCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
