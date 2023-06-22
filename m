Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808D010E179
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jun 2023 06:13:12 +0000 (UTC)
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 22 Jun 2023 06:13:06 +0000
Message-ID: <BYAPR11MB3413EC6412DF4E4ED333E47DD022A@BYAPR11MB3413.namprd11.prod.outlook.com>
References: <20230619085800.1994271-1-bhanuprakash.modem@intel.com>
 <20230619085800.1994271-3-bhanuprakash.modem@intel.com>
 <e12d35bc-815e-d77a-27e3-2c56fbf95229@intel.com>
In-Reply-To: <e12d35bc-815e-d77a-27e3-2c56fbf95229@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 2/2] tests/kms_cursor_legacy: Allow busy tests
 to run on XE
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

TEdUTSANCkFja2VkLWJ5OiBTYWkgR293dGhhbSBDaCA8c2FpLmdvd3RoYW0uY2hAaW50ZWwuY29t
Pg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1vZGVtLCBCaGFudXBy
YWthc2ggPGJoYW51cHJha2FzaC5tb2RlbUBpbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBK
dW5lIDIyLCAyMDIzIDEwOjE2IEFNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzsgQ2gsIFNhaSBHb3d0aGFtDQo+IDxzYWkuZ293dGhhbS5jaEBpbnRlbC5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbaS1nLXQgMi8yXSB0ZXN0cy9rbXNfY3Vyc29yX2xlZ2FjeTogQWxsb3cgYnVzeSB0
ZXN0cyB0byBydW4gb24gWEUNCj4gDQo+IA0KPiBPbiBNb24tMTktMDYtMjAyMyAwMjoyOCBwbSwg
QmhhbnVwcmFrYXNoIE1vZGVtIHdyb3RlOg0KPiA+IEFzIGJ1c3kgdGVzdHMgc3VwcG9ydHMgYm90
aCBpOTE1ICYgWEUsIHVwZGF0ZSB0aGUgaW50ZWwgc3BlY2lmaWMNCj4gPiBjaGVja3MgdG8gYWxs
b3cgdGhlbSB0byBydW4gb24gWEUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaGFudXByYWth
c2ggTW9kZW0gPGJoYW51cHJha2FzaC5tb2RlbUBpbnRlbC5jb20+DQo+IA0KPiBDYzogU2FpIEdv
d3RoYW0gQ2ggPHNhaS5nb3d0aGFtLmNoQGludGVsLmNvbT4NCj4gDQo+ID4gLS0tDQo+ID4gICB0
ZXN0cy9rbXNfY3Vyc29yX2xlZ2FjeS5jIHwgMiArLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMv
a21zX2N1cnNvcl9sZWdhY3kuYyBiL3Rlc3RzL2ttc19jdXJzb3JfbGVnYWN5LmMNCj4gPiBpbmRl
eCAxZjBmM2I3ZTYuLmQ1NWQ5NjA2NyAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0cy9rbXNfY3Vyc29y
X2xlZ2FjeS5jDQo+ID4gKysrIGIvdGVzdHMva21zX2N1cnNvcl9sZWdhY3kuYw0KPiA+IEBAIC0x
NzUyLDcgKzE3NTIsNyBAQCBpZ3RfbWFpbg0KPiA+ICAgCWlndF9kZXNjcmliZSgidGhpcyB0ZXN0
IHBlcmZvcm0gYSBidXN5IGJvIHVwZGF0ZSBmb2xsb3dlZCBieSBhIGN1cnNvcg0KPiB1cGRhdGUi
KTsNCj4gPiAgIAlpZ3Rfc3VidGVzdF9ncm91cCB7DQo+ID4gICAJCWlndF9maXh0dXJlIHsNCj4g
PiAtCQkJaWd0X3JlcXVpcmVfaTkxNShkaXNwbGF5LmRybV9mZCk7DQo+ID4gKwkJCWlndF9yZXF1
aXJlX2ludGVsKGRpc3BsYXkuZHJtX2ZkKTsNCj4gPiAgIAkJCWlndF9yZXF1aXJlX3BpcGVfY3Jj
KGRpc3BsYXkuZHJtX2ZkKTsNCj4gPiAgIAkJCWlndF9kaXNwbGF5X3JlcXVpcmVfb3V0cHV0KCZk
aXNwbGF5KTsNCj4gPiAgIAkJfQ0K
