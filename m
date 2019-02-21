Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9497889548
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Feb 2019 12:39:56 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id j89so13589831edb.9
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Feb 2019 04:39:56 -0800 (PST)
Date: Thu, 21 Feb 2019 13:39:52 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190221123952.GQ2665@phenom.ffwll.local>
References: <20190220234345.18692-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190220234345.18692-1-daniel.vetter@ffwll.ch>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_pwrite_crtc: Drop fixtures
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
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBGZWIgMjEsIDIwMTkgYXQgMTI6NDM6NDRBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBOb3QgYWxsb3dlZCBpbiBpZ3Rfc2ltcGxlX21haW4sIGFsc28gcmVhbGx5IGRvZXNu
J3QgbWFrZSBhbnkgc2Vuc2UsCj4gaXQncyBhbGwganVzdCBvbmUgYmlnIHRlc3RjYXNlLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgoK
VGhpcyBhbmQgbmV4dCBvbmUgbWVyZ2VkIHdpdGggQXJlaydzIGlyYyByLWIuCi1EYW5pZWwKCj4g
LS0tCj4gIHRlc3RzL2ttc19wd3JpdGVfY3JjLmMgfCAxNiArKysrKystLS0tLS0tLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS90ZXN0cy9rbXNfcHdyaXRlX2NyYy5jIGIvdGVzdHMva21zX3B3cml0ZV9jcmMuYwo+
IGluZGV4IGZmZDcyZTRhYmNjNS4uOWJiNWE1ZGFiYmY5IDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2tt
c19wd3JpdGVfY3JjLmMKPiArKysgYi90ZXN0cy9rbXNfcHdyaXRlX2NyYy5jCj4gQEAgLTE3Niwy
MSArMTc2LDE3IEBAIGlndF9zaW1wbGVfbWFpbgo+ICB7Cj4gIAlpZ3Rfc2tpcF9vbl9zaW11bGF0
aW9uKCk7Cj4gIAo+IC0JaWd0X2ZpeHR1cmUgewo+IC0JCWRhdGEuZHJtX2ZkID0gZHJtX29wZW5f
ZHJpdmVyX21hc3RlcihEUklWRVJfSU5URUwpOwo+ICsJZGF0YS5kcm1fZmQgPSBkcm1fb3Blbl9k
cml2ZXJfbWFzdGVyKERSSVZFUl9JTlRFTCk7Cj4gIAo+IC0JCWRhdGEuZGV2aWQgPSBpbnRlbF9n
ZXRfZHJtX2RldmlkKGRhdGEuZHJtX2ZkKTsKPiArCWRhdGEuZGV2aWQgPSBpbnRlbF9nZXRfZHJt
X2RldmlkKGRhdGEuZHJtX2ZkKTsKPiAgCj4gLQkJa21zdGVzdF9zZXRfdnRfZ3JhcGhpY3NfbW9k
ZSgpOwo+ICsJa21zdGVzdF9zZXRfdnRfZ3JhcGhpY3NfbW9kZSgpOwo+ICAKPiAtCQlpZ3RfcmVx
dWlyZV9waXBlX2NyYyhkYXRhLmRybV9mZCk7Cj4gKwlpZ3RfcmVxdWlyZV9waXBlX2NyYyhkYXRh
LmRybV9mZCk7Cj4gIAo+IC0JCWlndF9kaXNwbGF5X3JlcXVpcmUoJmRhdGEuZGlzcGxheSwgZGF0
YS5kcm1fZmQpOwo+IC0JfQo+ICsJaWd0X2Rpc3BsYXlfcmVxdWlyZSgmZGF0YS5kaXNwbGF5LCBk
YXRhLmRybV9mZCk7Cj4gIAo+ICAJcnVuX3Rlc3QoJmRhdGEpOwo+ICAKPiAtCWlndF9maXh0dXJl
IHsKPiAtCQlpZ3RfZGlzcGxheV9maW5pKCZkYXRhLmRpc3BsYXkpOwo+IC0JfQo+ICsJaWd0X2Rp
c3BsYXlfZmluaSgmZGF0YS5kaXNwbGF5KTsKPiAgfQo+IC0tIAo+IDIuMjAuMQo+IAoKLS0gCkRh
bmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9i
bG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
