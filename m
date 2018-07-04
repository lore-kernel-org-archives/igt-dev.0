Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4278A6EBCF
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jul 2018 13:57:37 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id d3-v6so4140027edi.1
 for <igt-dev@lists.freedesktop.org>; Wed, 04 Jul 2018 06:57:37 -0700 (PDT)
Date: Wed, 4 Jul 2018 15:57:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20180704135733.GE4693@phenom.ffwll.local>
References: <20180704123823.3271-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180704123823.3271-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] amdgpu/amd_prime: Reduce
 setup time
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBKdWwgMDQsIDIwMTggYXQgMDE6Mzg6MjNQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IElmIHdlIGFsbG93IDVzICgrMjAlIHN5c3RlbWF0aWMgZXJyb3IpIHRvIGNvbnN0cnVj
dCB0aGUgZmVuY2VzLCB3ZSBtYXkKPiByZWFzb25hYmx5IGFzc3VtZSB0aGF0IGl0IHdpbGwgdGFr
ZSBlcXVhbGx5IGFzIGxvbmcgdG8gY29uc3VtZSB0aGVtLiBBcwo+IHdlIG9ubHkgaGF2ZSAxMHMg
YmVmb3JlIHRoZSB2Z2VtIGZlbmNlIHRpbWVzIG91dCwgdGhlcmUgaXMgbm8gbWFyZ2luIG9mCj4g
c2FmZXR5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2ls
c29uLmNvLnVrPgo+IC0tLQo+ICB0ZXN0cy9hbWRncHUvYW1kX3ByaW1lLmMgfCAyICstCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS90ZXN0cy9hbWRncHUvYW1kX3ByaW1lLmMgYi90ZXN0cy9hbWRncHUvYW1kX3ByaW1lLmMK
PiBpbmRleCBiYjY4Y2NmMzEuLjZjNjRjM2FmOSAxMDA2NDQKPiAtLS0gYS90ZXN0cy9hbWRncHUv
YW1kX3ByaW1lLmMKPiArKysgYi90ZXN0cy9hbWRncHUvYW1kX3ByaW1lLmMKPiBAQCAtMzQ4LDcg
KzM0OCw3IEBAIHN0YXRpYyB2b2lkIGFtZF90b19pOTE1KGludCBpOTE1LCBpbnQgYW1kLCBhbWRn
cHVfZGV2aWNlX2hhbmRsZSBkZXZpY2UpCj4gIAljb3VudCA9IDA7Cj4gIAlzaXplID0gNjQgPDwg
MTA7Cj4gIAljb250ZXh0cyA9IG1hbGxvYyhzaXplICogc2l6ZW9mKCpjb250ZXh0cykpOwo+IC0J
aWd0X3VudGlsX3RpbWVvdXQoNSkgewo+ICsJaWd0X3VudGlsX3RpbWVvdXQoMikgewoKTWlnaHQg
YmUgZ29vZCB0byBwdXQgYSAibmVlZCB0byBiZWF0IHRoZSB2Z2VtIHRpbWVvdXQgb2YgMTBzIiBv
ciBzaW1pbGFyCmNvbW1lbnQgaGVyZS4gRXZlbiBmYW5jaWVyIHdvdWxkIGJlIGEgYml0IG9mIGln
dCBsaWJyYXJ5IHRvIGNyZWF0ZSB2Z2VtCnBsdWdzIGFuZCBsYXRlciBvbiBpbiB0aGUgY291bGQg
cHV0IGFuIGlndF9hc3NlcnRfc3RpbGxfcGx1Z2dlZCgpIHRvIG1ha2UKc3VyZSB3ZSd2ZSBoaXQg
dGhlIHJhY2UgZnVsbHkuIFdvdWxkIGFsc28gYmUgc29tZSBwaWVjZSBvZiByZWFsbHkgbmljZQpz
ZWxmLWRvY3VtZW50aW5nIGNvZGUuCgpFaXRoZXIgd2F5OiBSZXZpZXdlZC1ieTogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KCgo+ICAJCWlmIChjb3VudCA9PSBzaXplKSB7
Cj4gIAkJCXNpemUgKj0gMjsKPiAgCQkJY29udGV4dHMgPSByZWFsbG9jKGNvbnRleHRzLCBzaXpl
ICogc2l6ZW9mKCpjb250ZXh0cykpOwo+IC0tIAo+IDIuMTguMAo+IAo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gSW50ZWwtZ2Z4IG1haWxpbmcgbGlz
dAo+IEludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAoKLS0gCkRhbmllbCBWZXR0ZXIK
U29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNo
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
