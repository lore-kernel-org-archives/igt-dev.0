Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F706E84D
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Sep 2021 07:16:04 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Fri, 3 Sep 2021 07:16:01 +0000
Message-ID: <07c8928d3a3e470ab225d64eb4550671@intel.com>
References: <20210804025637.2473-1-vidya.srinivas@intel.com>
In-Reply-To: <20210804025637.2473-1-vidya.srinivas@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] Fix rounding error in draw_squares
 in kms_plane_alpha_blend
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Srinivas, Vidya" <vidya.srinivas@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "juhapekkaheikkila@gmail.com" <juhapekkaheikkila@gmail.com>, "tejaskumax.surendrakumar.upadhyay@intel.com" <tejaskumax.surendrakumar.upadhyay@intel.com>, "Srinivas, Vidya" <vidya.srinivas@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Rm9yIHRoZSBzZXJpZXMuDQoNClJldmlld2VkLWJ5OiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFA
aW50ZWwuY29tPg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGlndC1k
ZXYgPGlndC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBW
aWR5YQ0KPiBTcmluaXZhcw0KPiBTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCA0LCAyMDIxIDU6NTcg
QU0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBqdWhhcGVra2Fo
ZWlra2lsYUBnbWFpbC5jb207DQo+IHRlamFza3VtYXguc3VyZW5kcmFrdW1hci51cGFkaHlheUBp
bnRlbC5jb207IFNyaW5pdmFzLCBWaWR5YQ0KPiA8dmlkeWEuc3Jpbml2YXNAaW50ZWwuY29tPg0K
PiBTdWJqZWN0OiBbaWd0LWRldl0gW1BBVENIIGktZy10IDAvMl0gRml4IHJvdW5kaW5nIGVycm9y
IGluIGRyYXdfc3F1YXJlcyBpbg0KPiBrbXNfcGxhbmVfYWxwaGFfYmxlbmQNCj4gDQo+IFNlcmll
cyBjb250YWlucyBwYXRjaCB3aGljaCBmaXhlcyBhIHJvdW5kaW5nIGlzc3VlIGluIGRyYXdfc3F1
YXJlcy4gRHVlIHRvIHRoaXMsDQo+IGNvdmVyYWdlLXByZW11bHRpcGxpZWQtY29uc3RhbnQgc3Vi
dGVzdCBnaXZlcyBDUkMgbWlzbWF0Y2ggb24gcGFuZWxzIHdpdGgNCj4gMTM2Nng3NjggcmVzb2x1
dGlvbi4NCj4gDQo+IEluIG9yZGVyIHRvIGdldCB0aGlzIHJpZ2h0IGZpeCBpbiBmcm9tIEp1aGEt
UGVra2EsIHdlIG5lZWQgdG8gcmV2ZXJ0IHRoZQ0KPiBBTElHTk1FTlQgZml4IHByZXZpb3VzbHkg
c3VibWl0dGVkLg0KPiANCj4gVmlkeWEgU3Jpbml2YXMgKDIpOg0KPiAgIFJldmVydCAidGVzdHMv
a21zX3BsYW5lX2FscGhhX2JsZW5kOiBBbGlnbiB3aWR0aCB0byAyNTZCIg0KPiAgIHRlc3RzL2tt
c19wbGFuZV9hbHBoYV9ibGVuZDogRml4IHJvdW5kaW5nIGluIGRyYXdfc3F1YXJlcw0KPiANCj4g
IHRlc3RzL2ttc19wbGFuZV9hbHBoYV9ibGVuZC5jIHwgMyArLS0NCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IC0tDQo+IDIuMzIuMA0KDQo=
