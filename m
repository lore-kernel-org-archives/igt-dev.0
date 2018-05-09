Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01AF6E950
 for <igt-dev@lists.freedesktop.org>; Wed,  9 May 2018 23:34:50 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Wed, 9 May 2018 23:34:50 +0000
Message-ID: <7c7e59d754a273f93f05b04124bff3409a2fb688.camel@intel.com>
References: <20180509173746.23405-1-dhinakaran.pandiyan@intel.com>
 <20180509173746.23405-15-dhinakaran.pandiyan@intel.com>
In-Reply-To: <20180509173746.23405-15-dhinakaran.pandiyan@intel.com>
Content-Language: en-US
Content-ID: <CC16A4131A848C438CCC8BFFB3A31912@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 14/14] tests/psr: Pass data_t pointer to
 dpms_off_on
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCAyMDE4LTA1LTA5IGF0IDEwOjM3IC0wNzAwLCBEaGluYWthcmFuIFBhbmRpeWFuIHdy
b3RlOg0KPiBDb25zaXN0ZW50IHdpdGggb3RoZXIgZnVuY3Rpb24gc2lnbmF0dXJlcyBpbiB0aGUg
ZmlsZS4NCj4gDQoNClJldmlld2VkLWJ5OiBKb3NlIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291
emFAaW50ZWwuY29tPg0KDQo+IFNpZ25lZC1vZmYtYnk6IERoaW5ha2FyYW4gUGFuZGl5YW4gPGRo
aW5ha2FyYW4ucGFuZGl5YW5AaW50ZWwuY29tPg0KPiAtLS0NCj4gIHRlc3RzL2ttc19wc3Jfc2lu
a19jcmMuYyB8IDggKysrKy0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3Bzcl9zaW5rX2Ny
Yy5jIGIvdGVzdHMva21zX3Bzcl9zaW5rX2NyYy5jDQo+IGluZGV4IDE1MmVhMDQ1Li4yODgxOGUy
NSAxMDA2NDQNCj4gLS0tIGEvdGVzdHMva21zX3Bzcl9zaW5rX2NyYy5jDQo+ICsrKyBiL3Rlc3Rz
L2ttc19wc3Jfc2lua19jcmMuYw0KPiBAQCAtNDE2LDExICs0MTYsMTEgQEAgc3RhdGljIHZvaWQg
c2V0dXBfdGVzdF9wbGFuZShkYXRhX3QgKmRhdGEsIGludA0KPiB0ZXN0X3BsYW5lKQ0KPiAgCWln
dF9kaXNwbGF5X2NvbW1pdCgmZGF0YS0+ZGlzcGxheSk7DQo+ICB9DQo+ICANCj4gLXN0YXRpYyB2
b2lkIGRwbXNfb2ZmX29uKGRhdGFfdCBkYXRhKQ0KPiArc3RhdGljIHZvaWQgZHBtc19vZmZfb24o
ZGF0YV90ICpkYXRhKQ0KPiAgew0KPiAtCWttc3Rlc3Rfc2V0X2Nvbm5lY3Rvcl9kcG1zKGRhdGEu
ZHJtX2ZkLCBkYXRhLm91dHB1dC0NCj4gPmNvbmZpZy5jb25uZWN0b3IsDQo+ICsJa21zdGVzdF9z
ZXRfY29ubmVjdG9yX2RwbXMoZGF0YS0+ZHJtX2ZkLCBkYXRhLT5vdXRwdXQtDQo+ID5jb25maWcu
Y29ubmVjdG9yLA0KPiAgCQkJCSAgIERSTV9NT0RFX0RQTVNfT0ZGKTsNCj4gLQlrbXN0ZXN0X3Nl
dF9jb25uZWN0b3JfZHBtcyhkYXRhLmRybV9mZCwgZGF0YS5vdXRwdXQtDQo+ID5jb25maWcuY29u
bmVjdG9yLA0KPiArCWttc3Rlc3Rfc2V0X2Nvbm5lY3Rvcl9kcG1zKGRhdGEtPmRybV9mZCwgZGF0
YS0+b3V0cHV0LQ0KPiA+Y29uZmlnLmNvbm5lY3RvciwNCj4gIAkJCQkgICBEUk1fTU9ERV9EUE1T
X09OKTsNCj4gIH0NCj4gIA0KPiBAQCAtNTE5LDcgKzUxOSw3IEBAIGludCBtYWluKGludCBhcmdj
LCBjaGFyICphcmd2W10pDQo+ICAJCWRhdGEub3AgPSBSRU5ERVI7DQo+ICAJCXNldHVwX3Rlc3Rf
cGxhbmUoJmRhdGEsIERSTV9QTEFORV9UWVBFX1BSSU1BUlkpOw0KPiAgCQlpZ3RfYXNzZXJ0KHdh
aXRfcHNyX2VudHJ5KCZkYXRhKSk7DQo+IC0JCWRwbXNfb2ZmX29uKGRhdGEpOw0KPiArCQlkcG1z
X29mZl9vbigmZGF0YSk7DQo+ICAJCXJ1bl90ZXN0KCZkYXRhKTsNCj4gIAkJdGVzdF9jbGVhbnVw
KCZkYXRhKTsNCj4gIAl9Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
