Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9A4756F0AE
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jan 2019 14:18:33 +0000 (UTC)
Message-ID: <0be4b8406e7681733f499ab71bde8fc8c8b7d28f.camel@bootlin.com>
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Wed, 16 Jan 2019 15:18:32 +0100
In-Reply-To: <20190116112050.27647-18-petri.latvala@intel.com>
References: <20190116112050.27647-1-petri.latvala@intel.com>
 <20190116112050.27647-18-petri.latvala@intel.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 17/21] lib/igt_core: Handle all failures
 to read .igtrc
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTAxLTE2IGF0IDEzOjIwICswMjAwLCBQZXRyaSBMYXR2YWxhIHdyb3RlOgo+
IFBhcnNlIGVycm9yIGlzIG5vdCB0aGUgb25seSB3YXkgdG8gZmFpbCBsb2FkaW5nIHRoZSBmaWxl
LiBBIGNvbW1vbgo+IG90aGVyIGVycm9yIGlzIHRoZSBmaWxlIG5vdCBleGlzdGluZy4gSGFuZGxl
IGFsbCBmYWlsdXJlcyB0byByZWFkCj4gLmlndHJjIGJ5IHJlbGVhc2luZyB0aGUga2V5IHN0b3Jl
IGltbWVkaWF0ZWx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBldHJpIExhdHZhbGEgPHBldHJpLmxh
dHZhbGFAaW50ZWwuY29tPgo+IENjOiBQYXVsIEtvY2lhbGtvd3NraSA8cGF1bC5rb2NpYWxrb3dz
a2lAYm9vdGxpbi5jb20+Cj4gQ2M6IEFya2FkaXVzeiBIaWxlciA8YXJrYWRpdXN6LmhpbGVyQGlu
dGVsLmNvbT4KClJldmlld2VkLWJ5OiBQYXVsIEtvY2lhbGtvd3NraSA8cGF1bC5rb2NpYWxrb3dz
a2lAYm9vdGxpbi5jb20+Cgo+IC0tLQo+ICBsaWIvaWd0X2NvcmUuYyB8IDIgKy0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2xpYi9pZ3RfY29yZS5jIGIvbGliL2lndF9jb3JlLmMKPiBpbmRleCAyNmRkMjc4OS4uMGNhZTli
NmEgMTAwNjQ0Cj4gLS0tIGEvbGliL2lndF9jb3JlLmMKPiArKysgYi9saWIvaWd0X2NvcmUuYwo+
IEBAIC01OTEsNyArNTkxLDcgQEAgc3RhdGljIHZvaWQgY29tbW9uX2luaXRfY29uZmlnKHZvaWQp
Cj4gIAlpZ3Rfa2V5X2ZpbGUgPSBnX2tleV9maWxlX25ldygpOwo+ICAJcmV0ID0gZ19rZXlfZmls
ZV9sb2FkX2Zyb21fZmlsZShpZ3Rfa2V5X2ZpbGUsIGtleV9maWxlX2xvYywKPiAgCQkJCQlHX0tF
WV9GSUxFX05PTkUsICZlcnJvcik7Cj4gLQlpZiAoZXJyb3IgJiYgZXJyb3ItPmNvZGUgPT0gR19L
RVlfRklMRV9FUlJPUikgewo+ICsJaWYgKCFyZXQpIHsKPiAgCQlnX2Vycm9yX2ZyZWUoZXJyb3Ip
Owo+ICAJCWdfa2V5X2ZpbGVfZnJlZShpZ3Rfa2V5X2ZpbGUpOwo+ICAJCWlndF9rZXlfZmlsZSA9
IE5VTEw7Ci0tIApQYXVsIEtvY2lhbGtvd3NraSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQg
a2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
