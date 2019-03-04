Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1872D89CDB
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2019 17:21:36 +0000 (UTC)
From: "Strasser, Kevin" <kevin.strasser@intel.com>
Date: Mon, 4 Mar 2019 17:21:11 +0000
Message-ID: <51B6C3CD1F10FB47A5702881E0E230A793D473A6@ORSMSX104.amr.corp.intel.com>
References: <1551577146-2348-1-git-send-email-kevin.strasser@intel.com>
 <1551577146-2348-6-git-send-email-kevin.strasser@intel.com>
 <ff70d50b-5fc4-774e-5bae-a5513c805e9d@linux.intel.com>
In-Reply-To: <ff70d50b-5fc4-774e-5bae-a5513c805e9d@linux.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [RFC 5/5] tests/kms_plane_scaling: Skip testing
 unsupported fp16 features
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

TWFhcnRlbiBMYW5raG9yc3Qgd3JvdGU6DQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19wbGFu
ZV9zY2FsaW5nLmMgYi90ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jIA0KPiA+IGluZGV4IDEwMTVj
ODAuLmZlZDZiM2QgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYw0K
PiA+ICsrKyBiL3Rlc3RzL2ttc19wbGFuZV9zY2FsaW5nLmMNCj4gPiBAQCAtMTkzLDYgKzE5Mywx
NCBAQCBzdGF0aWMgdm9pZCB0ZXN0X3NjYWxlcl93aXRoX3JvdGF0aW9uX3BpcGUoZGF0YV90ICpk
LCBlbnVtIHBpcGUgcGlwZSwNCj4gPiAgCQkJaWd0X3JvdGF0aW9uX3Qgcm90ID0gcm90YXRpb25z
W2ldOw0KPiA+ICAJCQlmb3IgKGludCBqID0gMDsgaiA8IHBsYW5lLT5kcm1fcGxhbmUtPmNvdW50
X2Zvcm1hdHM7IGorKykgew0KPiA+ICAJCQkJdW5zaWduZWQgZm9ybWF0ID0gcGxhbmUtPmRybV9w
bGFuZS0+Zm9ybWF0c1tqXTsNCj4gPiArDQo+ID4gKwkJCQkvLyBZLXRpbGVkIDkwLzI3MCByb3Rh
dGlvbiBpc24ndCBzdXBwb3J0ZWQgZm9yIGZwMTYgb24gSW50ZWwNCj4gPiArCQkJCWlmIChpc19p
OTE1X2RldmljZShkLT5kcm1fZmQpICYmDQo+ID4gKwkJCQkgICAgaWd0X2Zvcm1hdF9pc19mcDE2
KGZvcm1hdCkgJiYNCj4gPiArCQkJCSAgICAocm90ID09IElHVF9ST1RBVElPTl85MCB8fA0KPiA+
ICsJCQkJICAgICByb3QgPT0gSUdUX1JPVEFUSU9OXzI3MCkpDQo+ID4gKwkJCQkJY29udGludWU7
DQo+ID4gKw0KPiA+ICAJCQkJaWYgKGlndF9mYl9zdXBwb3J0ZWRfZm9ybWF0KGZvcm1hdCkgJiYN
Cj4gPiAgCQkJCSAgICBjYW5fcm90YXRlKGQsIGZvcm1hdCkpDQo+IF5Vc2UgdGhpcywgYW5kIHBl
cmhhcHMgYWRkIHRoZSByb3RhdGlvbiBhcyBhcmd1bWVudD8NCg0KTWFrZXMgc2Vuc2UuDQoNCj4g
PiBAQCBzdGF0aWMgdm9pZCB0ZXN0X3NjYWxlcl93aXRoX3BpeGVsX2Zvcm1hdF9waXBlKGRhdGFf
dCAqZCwgZW51bSBwaXBlIHBpcGUsIGlndF9vdQ0KPiA+ICAJCQlmb3IgKGludCBqID0gMDsgaiA8
IHBsYW5lLT5kcm1fcGxhbmUtPmNvdW50X2Zvcm1hdHM7IGorKykgew0KPiA+ICAJCQkJdWludDMy
X3QgZm9ybWF0ID0gcGxhbmUtPmRybV9wbGFuZS0+Zm9ybWF0c1tqXTsNCj4gPiAgDQo+ID4gKwkJ
CQkvLyBZZiBUaWxpbmcgbm90IHN1cHBvcnRlZCBmb3IgZnAxNiBvbiBJbnRlbA0KPiA+ICsJCQkJ
aWYgKGlzX2k5MTVfZGV2aWNlKGQtPmRybV9mZCkgJiYNCj4gPiArCQkJCSAgICBpZ3RfZm9ybWF0
X2lzX2ZwMTYoZm9ybWF0KSAmJg0KPiA+ICsJCQkJICAgIHRpbGluZyA9PSBMT0NBTF9JOTE1X0ZP
Uk1BVF9NT0RfWWZfVElMRUQpDQo+ID4gKwkJCQkJY29udGludWU7DQo+IA0KPiBUaGlzIHNob3Vs
ZCBiZSB0ZXN0YWJsZSB3aXRoIGlndF9wbGFuZV9oYXNfZm9ybWF0X21vZCgpIGluc3RlYWQ/DQoN
ClN1cmUsIGJldHRlciB0byB0YWtlIHRoZSBrZXJuZWwncyBsZWFkLg0KDQpUaGFua3MsDQpLZXZp
bg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
