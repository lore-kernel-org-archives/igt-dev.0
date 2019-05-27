Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D38A8970E
 for <igt-dev@lists.freedesktop.org>; Mon, 27 May 2019 10:07:51 +0000 (UTC)
References: <20190523105632.29397-1-simon.ser@intel.com>
From: Martin Peres <martin.peres@linux.intel.com>
Message-ID: <c6eb9394-5ade-cf9b-7a9a-0dc3397eba7e@linux.intel.com>
Date: Mon, 27 May 2019 13:07:45 +0300
MIME-Version: 1.0
In-Reply-To: <20190523105632.29397-1-simon.ser@intel.com>
Content-Language: en-PH
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_audio: add more assertions
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

CgpPbiAyMy8wNS8yMDE5IDEzOjU2LCBTaW1vbiBTZXIgd3JvdGU6Cj4gLSBNYWtlIHN1cmUgYW4g
YXVkaW8gc2lnbmFsIGlzbid0IGNyZWF0ZWQgd2l0aCB6ZXJvIGNoYW5uZWxzCj4gLSBNYWtlIHN1
cmUgZWFjaCBjaGFubmVsIGhhcyBhdCBsZWFzdCBvbmUgZnJlcXVlbmN5IHdoZW4gc3ludGhlc2l6
aW5nCj4gCj4gU2lnbmVkLW9mZi1ieTogU2ltb24gU2VyIDxzaW1vbi5zZXJAaW50ZWwuY29tPgo+
IC0tLQo+ICBsaWIvaWd0X2F1ZGlvLmMgfCA1ICsrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9hdWRp
by5jIGIvbGliL2lndF9hdWRpby5jCj4gaW5kZXggMzc2ZTA0YmE2ZWQ2Li4xNjc3ZGQwOWMwMjkg
MTAwNjQ0Cj4gLS0tIGEvbGliL2lndF9hdWRpby5jCj4gKysrIGIvbGliL2lndF9hdWRpby5jCj4g
QEAgLTgwLDYgKzgwLDcgQEAgc3RydWN0IGF1ZGlvX3NpZ25hbCAqYXVkaW9fc2lnbmFsX2luaXQo
aW50IGNoYW5uZWxzLCBpbnQgc2FtcGxpbmdfcmF0ZSkKPiAgewo+ICAJc3RydWN0IGF1ZGlvX3Np
Z25hbCAqc2lnbmFsOwo+ICAKPiArCWlndF9hc3NlcnQoY2hhbm5lbHMgPiAwKTsKPiAgCWlndF9h
c3NlcnQoY2hhbm5lbHMgPD0gQ0hBTk5FTFNfTUFYKTsKPiAgCj4gIAlzaWduYWwgPSBtYWxsb2Mo
c2l6ZW9mKHN0cnVjdCBhdWRpb19zaWduYWwpKTsKPiBAQCAtMjY3LDggKzI2OCwxMCBAQCB2b2lk
IGF1ZGlvX3NpZ25hbF9maWxsKHN0cnVjdCBhdWRpb19zaWduYWwgKnNpZ25hbCwgZG91YmxlICpi
dWZmZXIsCj4gIAo+ICAJbWVtc2V0KGJ1ZmZlciwgMCwgc2l6ZW9mKGRvdWJsZSkgKiBzaWduYWwt
PmNoYW5uZWxzICogc2FtcGxlcyk7Cj4gIAo+IC0JZm9yIChpID0gMDsgaSA8IHNpZ25hbC0+Y2hh
bm5lbHM7IGkrKykKPiArCWZvciAoaSA9IDA7IGkgPCBzaWduYWwtPmNoYW5uZWxzOyBpKyspIHsK
PiAgCQlmcmVxc19wZXJfY2hhbm5lbFtpXSA9IGF1ZGlvX3NpZ25hbF9jb3VudF9mcmVxcyhzaWdu
YWwsIGkpOwo+ICsJCWlndF9hc3NlcnQoZnJlcXNfcGVyX2NoYW5uZWxbaV0pOwoKSU1PLCBhZGRp
bmcgPiAwIHdvdWxkIGJlIGNsZWFyZXIuCgpXaXRoIHRoaXMgZG9uZSwgdGhlIHNlcmllcyBpczoK
ClJldmlld2VkLWJ5OiBNYXJ0aW4gUGVyZXMgPG1hcnRpbi5wZXJlc0BsaW51eC5pbnRlbC5jb20+
Cgo+ICsJfQo+ICAKPiAgCWZvciAoaSA9IDA7IGkgPCBzaWduYWwtPmZyZXFzX2NvdW50OyBpKysp
IHsKPiAgCQlmcmVxID0gJnNpZ25hbC0+ZnJlcXNbaV07Cj4gCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldg==
