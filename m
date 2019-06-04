Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE97389248
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jun 2019 12:54:41 +0000 (UTC)
References: <20190604114836.2830-1-simon.ser@intel.com>
 <20190604114836.2830-3-simon.ser@intel.com>
From: Martin Peres <martin.peres@linux.intel.com>
Message-ID: <b2ac6d2c-27f2-1c80-aac7-d53eaab48bb0@linux.intel.com>
Date: Tue, 4 Jun 2019 15:54:35 +0300
MIME-Version: 1.0
In-Reply-To: <20190604114836.2830-3-simon.ser@intel.com>
Content-Language: en-PH
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/3] lib/tests/igt_audio: add a pop
 test
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
To: Simon Ser <simon.ser@intel.com>, igt-dev@lists.freedesktop.org
Cc: martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

T24gMDQvMDYvMjAxOSAxNDo0OCwgU2ltb24gU2VyIHdyb3RlOgo+IE1ha2Ugc3VyZSBhZGRpbmcg
YSBwb3AgaW4gdGhlIGlucHV0IHNpZ25hbCBtYWtlcyBhdWRpb19zaWduYWxfZGV0ZWN0IGZhaWwu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogU2ltb24gU2VyIDxzaW1vbi5zZXJAaW50ZWwuY29tPgo+IC0t
LQo+ICBsaWIvdGVzdHMvaWd0X2F1ZGlvLmMgfCAyMyArKysrKysrKysrKysrKysrKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9saWIv
dGVzdHMvaWd0X2F1ZGlvLmMgYi9saWIvdGVzdHMvaWd0X2F1ZGlvLmMKPiBpbmRleCA0N2U2MWFk
Zjc0ZmUuLjgyMTgxM2JhZTQ3YSAxMDA2NDQKPiAtLS0gYS9saWIvdGVzdHMvaWd0X2F1ZGlvLmMK
PiArKysgYi9saWIvdGVzdHMvaWd0X2F1ZGlvLmMKPiBAQCAtMTE2LDYgKzExNiwyNiBAQCBzdGF0
aWMgdm9pZCB0ZXN0X3NpZ25hbF9kZXRlY3Rfd2l0aF91bmV4cGVjdGVkX2ZyZXEoc3RydWN0IGF1
ZGlvX3NpZ25hbCAqc2lnbmFsKQo+ICAJaWd0X2Fzc2VydCghb2spOwo+ICB9Cj4gIAo+ICtzdGF0
aWMgdm9pZCB0ZXN0X3NpZ25hbF9kZXRlY3RfcG9wKHN0cnVjdCBhdWRpb19zaWduYWwgKnNpZ25h
bCkKCkkgd291bGQgcHJlZmVyIHlvdSByZXBlYXRpbmcvaG9sZGluZyB0aGUgc2FtcGxlIGZvciBt
dWx0aXBsZSBzYW1wbGVzIGFzCm9wcG9zZWQgdG8gZm9yY2luZyAwLjkuCgpIb3cgYWJvdXQgbmFt
aW5nIHRoZSB0ZXN0ICJ0ZXN0X3NpZ25hbF9kZXRlY3RfaGVsZF9zYW1wbGUiPwoKPiArewo+ICsJ
ZG91YmxlICpidWY7Cj4gKwlib29sIG9rOwo+ICsJc2l6ZV90IGk7Cj4gKwo+ICsJYnVmID0gbWFs
bG9jKEJVRkZFUl9MRU4gKiBzaXplb2YoZG91YmxlKSk7Cj4gKwlhdWRpb19zaWduYWxfZmlsbChz
aWduYWwsIGJ1ZiwgQlVGRkVSX0xFTiAvIENIQU5ORUxTKTsKPiArCj4gKwkvKiBBZGQgYSBkaXNj
b250aW51aXR5IGluIHRoZSBzaWduYWwgKi8KPiArCWZvciAoaSA9IDA7IGkgPCA1OyBpKyspCj4g
KwkJYnVmW0JVRkZFUl9MRU4gLyAzICsgaV0gPSAwLjk7Cj4gKwo+ICsJb2sgPSBhdWRpb19zaWdu
YWxfZGV0ZWN0KHNpZ25hbCwgU0FNUExJTkdfUkFURSwgMCwgYnVmLCBCVUZGRVJfTEVOKTsKPiAr
Cj4gKwlmcmVlKGJ1Zik7Cj4gKwo+ICsJaWd0X2Fzc2VydCghb2spOwo+ICt9Cj4gKwo+ICBpZ3Rf
bWFpbgo+ICB7Cj4gIAlzdHJ1Y3QgYXVkaW9fc2lnbmFsICpzaWduYWw7Cj4gQEAgLTE1MSw2ICsx
NzEsOSBAQCBpZ3RfbWFpbgo+ICAJCWlndF9zdWJ0ZXN0KCJzaWduYWwtZGV0ZWN0LXdpdGgtdW5l
eHBlY3RlZC1mcmVxIikKPiAgCQkJdGVzdF9zaWduYWxfZGV0ZWN0X3dpdGhfdW5leHBlY3RlZF9m
cmVxKHNpZ25hbCk7Cj4gIAo+ICsJCWlndF9zdWJ0ZXN0KCJzaWduYWwtZGV0ZWN0LXBvcCIpCj4g
KwkJCXRlc3Rfc2lnbmFsX2RldGVjdF9wb3Aoc2lnbmFsKTsKPiArCj4gIAkJaWd0X2ZpeHR1cmUg
ewo+ICAJCQlhdWRpb19zaWduYWxfZmluaShzaWduYWwpOwo+ICAJCX0KPiAKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
