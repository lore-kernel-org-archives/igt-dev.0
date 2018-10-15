Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F816E0E5
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Oct 2018 21:52:27 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Mon, 15 Oct 2018 21:52:25 +0000
Message-ID: <717d23dbc93f2060b64a8ba00a45918ad8b6ecb8.camel@intel.com>
References: <20181012212827.30163-1-jose.souza@intel.com>
 <20181012212827.30163-2-jose.souza@intel.com>
 <153942632780.3258.18172280785668043335@skylake-alporthouse-com>
In-Reply-To: <153942632780.3258.18172280785668043335@skylake-alporthouse-com>
Content-Language: en-US
Content-ID: <004CD84F1B2F5B4DB5FB28468EE6CFF2@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests: Skip testdisplay when KMS is
 disabled
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
List-ID: <igt-dev@lists.freedesktop.org>

T24gU2F0LCAyMDE4LTEwLTEzIGF0IDExOjI1ICswMTAwLCBDaHJpcyBXaWxzb24gd3JvdGU6DQo+
IFF1b3RpbmcgSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSAoMjAxOC0xMC0xMiAyMjoyODoyNykNCj4g
PiBUaGlzIHRlc3Qgc2hvdWxkIGJlIHNraXBlZCB3aGVuIEtNUyBpcyBkaXNhYmxlZC4NCj4gPiAN
Cj4gPiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+DQo+ID4gU2ln
bmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+
DQo+ID4gLS0tDQo+ID4gIHRlc3RzL3Rlc3RkaXNwbGF5LmMgfCA1ICstLS0tDQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IFRlc3RkaXNw
bGF5IGlzIHJlYWxseSBhbiBvZGRiYWxsIHRoYXQgZG9lc24ndCBiZWxvbmcgYW1pZCB0aGUgaWd0
DQo+IHN1aXRlDQo+IG9mIHRlc3RzLw0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvdGVzdGRp
c3BsYXkuYyBiL3Rlc3RzL3Rlc3RkaXNwbGF5LmMNCj4gPiBpbmRleCBiMTNjM2Q3MC4uOTk3MmZi
M2MgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMvdGVzdGRpc3BsYXkuYw0KPiA+ICsrKyBiL3Rlc3Rz
L3Rlc3RkaXNwbGF5LmMNCj4gPiBAQCAtNDU3LDEwICs0NTcsNyBAQCBpbnQgdXBkYXRlX2Rpc3Bs
YXkoYm9vbCBwcm9iZSkNCj4gPiAgICAgICAgIGludCBjOw0KPiA+ICANCj4gPiAgICAgICAgIHJl
c291cmNlcyA9IGRybU1vZGVHZXRSZXNvdXJjZXMoZHJtX2ZkKTsNCj4gPiAtICAgICAgIGlmICgh
cmVzb3VyY2VzKSB7DQo+ID4gLSAgICAgICAgICAgICAgIGlndF93YXJuKCJkcm1Nb2RlR2V0UmVz
b3VyY2VzIGZhaWxlZDogJXNcbiIsDQo+ID4gc3RyZXJyb3IoZXJybm8pKTsNCj4gPiAtICAgICAg
ICAgICAgICAgcmV0dXJuIDA7DQo+ID4gLSAgICAgICB9DQo+ID4gKyAgICAgICBpZ3RfcmVxdWly
ZShyZXNvdXJjZXMpOw0KPiANCj4gSG1tLCBsb29rcyBsaWtlIHRoZXJlJ3MgYSBkcm1TZXRDbGll
bnRDYXAoKSB0aGF0IHdvdWxkIGZhaWwgZWFybGllci4NCj4gSQ0KPiB0aGluayBpZGVhbGx5IHdl
IHdvdWxkIHBhc3MgcmVzb3VyY2VzIGludG8gdGhlIGZ1bmN0aW9uLg0KPiANCj4gRm9yIG5vdywg
dGhpcyBpcyBhIHNpbXBsZSBpbXByb3ZlbWVudA0KPiBSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29u
IDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+DQo+IA0KPiBGd2l3LA0KPiBodHRwczovL3BhdGNo
d29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMjU0OTYyLw0KPiBodHRwczovL3BhdGNod29yay5m
cmVlZGVza3RvcC5vcmcvcGF0Y2gvMjU0OTYxLw0KPiBhcmUgdGhlIHJlbWFpbmluZyBpc3N1ZXMg
Zm9yIEJBVCArIG5vIGRpc3BsYXkuDQoNCg0KVGhhbmtzLiBDb3VsZCBzb21lb25lIG1lcmdlIHRo
aXMgMj8NCkknbSB3YWl0aW5nIHRoZSBHaXRMYWIgbWlncmF0aW9uIHRvIGFzayBjb21taXQgcmln
aHRzLg0KDQo+IC1DaHJpcw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
Cg==
