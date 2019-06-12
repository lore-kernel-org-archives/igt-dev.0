Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623E589487
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2019 10:56:07 +0000 (UTC)
References: <b2ac6d2c-27f2-1c80-aac7-d53eaab48bb0@linux.intel.com>
 <20190605080330.29059-1-simon.ser@intel.com>
From: Martin Peres <martin.peres@linux.intel.com>
Message-ID: <e29972b8-4761-46d3-b07a-16de5f0c1b47@linux.intel.com>
Date: Wed, 12 Jun 2019 13:56:03 +0300
MIME-Version: 1.0
In-Reply-To: <20190605080330.29059-1-simon.ser@intel.com>
Content-Language: en-PH
Subject: Re: [igt-dev] [PATCH i-g-t v3] lib/tests/igt_audio: add a test
 holding a sample
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
List-ID: <igt-dev@lists.freedesktop.org>

T24gMDUvMDYvMjAxOSAxMTowMywgU2ltb24gU2VyIHdyb3RlOgo+IE1ha2Ugc3VyZSBob2xkaW5n
IGEgc2FtcGxlIGluIHRoZSBpbnB1dCBzaWduYWwgbWFrZXMgYXVkaW9fc2lnbmFsX2RldGVjdCBm
YWlsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNpbW9uIFNlciA8c2ltb24uc2VyQGludGVsLmNvbT4K
PiAtLS0KPiAgbGliL3Rlc3RzL2lndF9hdWRpby5jIHwgMjUgKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9saWIvdGVzdHMvaWd0X2F1ZGlvLmMgYi9saWIvdGVzdHMvaWd0X2F1ZGlvLmMKPiBpbmRleCA0
N2U2MWFkZjc0ZmUuLmQxODUzN2Q2NmZiNyAxMDA2NDQKPiAtLS0gYS9saWIvdGVzdHMvaWd0X2F1
ZGlvLmMKPiArKysgYi9saWIvdGVzdHMvaWd0X2F1ZGlvLmMKPiBAQCAtMTE2LDYgKzExNiwyOCBA
QCBzdGF0aWMgdm9pZCB0ZXN0X3NpZ25hbF9kZXRlY3Rfd2l0aF91bmV4cGVjdGVkX2ZyZXEoc3Ry
dWN0IGF1ZGlvX3NpZ25hbCAqc2lnbmFsKQo+ICAJaWd0X2Fzc2VydCghb2spOwo+ICB9Cj4gCj4g
K3N0YXRpYyB2b2lkIHRlc3Rfc2lnbmFsX2RldGVjdF9oZWxkX3NhbXBsZShzdHJ1Y3QgYXVkaW9f
c2lnbmFsICpzaWduYWwpCj4gK3sKPiArCWRvdWJsZSAqYnVmOwo+ICsJYm9vbCBvazsKPiArCXNp
emVfdCBpOwo+ICsJZG91YmxlIHZhbHVlOwo+ICsKPiArCWJ1ZiA9IG1hbGxvYyhCVUZGRVJfTEVO
ICogc2l6ZW9mKGRvdWJsZSkpOwo+ICsJYXVkaW9fc2lnbmFsX2ZpbGwoc2lnbmFsLCBidWYsIEJV
RkZFUl9MRU4gLyBDSEFOTkVMUyk7Cj4gKwo+ICsJLyogUmVwZWF0IGEgc2FtcGxlIGluIHRoZSBt
aWRkbGUgb2YgdGhlIHNpZ25hbCAqLwo+ICsJdmFsdWUgPSBidWZbQlVGRkVSX0xFTiAvIDNdOwo+
ICsJZm9yIChpID0gMDsgaSA8IDU7IGkrKykKPiArCQlidWZbQlVGRkVSX0xFTiAvIDMgKyBpXSA9
IHZhbHVlOwo+ICsKPiArCW9rID0gYXVkaW9fc2lnbmFsX2RldGVjdChzaWduYWwsIFNBTVBMSU5H
X1JBVEUsIDAsIGJ1ZiwgQlVGRkVSX0xFTik7Cj4gKwo+ICsJZnJlZShidWYpOwo+ICsKPiArCWln
dF9hc3NlcnQoIW9rKTsKClBsZWFzZSBhZGQgYSByZWFzb24gaGVyZS4gV2l0aCB0aGlzIGRvbmUs
IHRoZSBwYXRjaCBpczoKUmV2aWV3ZWQtYnk6IE1hcnRpbiBQZXJlcyA8bWFydGluLnBlcmVzQGxp
bnV4LmludGVsLmNvbT4KCj4gK30KPiArCj4gIGlndF9tYWluCj4gIHsKPiAgCXN0cnVjdCBhdWRp
b19zaWduYWwgKnNpZ25hbDsKPiBAQCAtMTUxLDYgKzE3Myw5IEBAIGlndF9tYWluCj4gIAkJaWd0
X3N1YnRlc3QoInNpZ25hbC1kZXRlY3Qtd2l0aC11bmV4cGVjdGVkLWZyZXEiKQo+ICAJCQl0ZXN0
X3NpZ25hbF9kZXRlY3Rfd2l0aF91bmV4cGVjdGVkX2ZyZXEoc2lnbmFsKTsKPiAKPiArCQlpZ3Rf
c3VidGVzdCgic2lnbmFsLWRldGVjdC1oZWxkLXNhbXBsZSIpCj4gKwkJCXRlc3Rfc2lnbmFsX2Rl
dGVjdF9oZWxkX3NhbXBsZShzaWduYWwpOwo+ICsKPiAgCQlpZ3RfZml4dHVyZSB7Cj4gIAkJCWF1
ZGlvX3NpZ25hbF9maW5pKHNpZ25hbCk7Cj4gIAkJfQo+IC0tCj4gMi4yMS4wCj4gCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
