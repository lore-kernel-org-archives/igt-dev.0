Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27E96E088
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Feb 2019 13:53:54 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id d12so8026494edy.3
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Feb 2019 05:53:54 -0800 (PST)
Date: Thu, 7 Feb 2019 14:53:50 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190207135350.GS3271@phenom.ffwll.local>
References: <20190207133652.5346-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190207133652.5346-1-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip: Fix comparison of
 unsigned integers
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBGZWIgMDcsIDIwMTkgYXQgMDM6MzY6NTJQTSArMDIwMCwgUGV0cmkgTGF0dmFsYSB3
cm90ZToKPiBEaWZmZXJlbmNlIG9mIHVuc2lnbmVkIGludHMgaXMgdW5zaWduZWQgaW50LCBhbmQg
dGhlcmVmb3JlIGFsd2F5cwo+IGxhcmdlciB0aGFuIHplcm8uCj4gCj4gU2lnbmVkLW9mZi1ieTog
UGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Cj4gQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CgpJIHRoaW5rIHdlIGhhdmUgc29tZSBvdGhlciB0
ZXN0cyBmb3IgdGhpcywgYnV0IHRoaXMgbG9va3MgY29ycmVjdC4KClJldmlld2VkLWJ5OiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IC0tLQo+ICB0ZXN0cy9rbXNfZmxp
cC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2ZsaXAuYyBiL3Rlc3RzL2ttc19mbGlwLmMK
PiBpbmRleCA3OThmYzRlOC4uOTZmNGEyZjcgMTAwNzU1Cj4gLS0tIGEvdGVzdHMva21zX2ZsaXAu
Ywo+ICsrKyBiL3Rlc3RzL2ttc19mbGlwLmMKPiBAQCAtNTAyLDcgKzUwMiw3IEBAIHN0YXRpYyB2
b2lkIGNoZWNrX3N0YXRlKGNvbnN0IHN0cnVjdCB0ZXN0X291dHB1dCAqbywgY29uc3Qgc3RydWN0
IGV2ZW50X3N0YXRlICplCj4gIAlpZiAoby0+ZmxhZ3MgJiBURVNUX1RTX0NPTlQpIHsKPiAgCQkv
KiBJZ25vcmUgc2VxX3N0ZXAgaGVyZSBzaW5jZSB2Ymxhbmsgd2FpdHMgdGltZSBvdXQgaW1tZWRp
YXRlbHkKPiAgCQkgKiB3aGVuIHdlIGtpbGwgdGhlIGNydGMuICovCj4gLQkJaWd0X2Fzc2VydF9m
KGVzLT5jdXJyZW50X3NlcSAtIGVzLT5sYXN0X3NlcSA+PSAwLAo+ICsJCWlndF9hc3NlcnRfZihl
cy0+Y3VycmVudF9zZXEgPj0gZXMtPmxhc3Rfc2VxLAo+ICAJCQkgICAgICJ1bmV4cGVjdGVkICVz
IHNlcSAldSwgc2hvdWxkIGJlID49ICV1XG4iLAo+ICAJCQkgICAgIGVzLT5uYW1lLCBlcy0+Y3Vy
cmVudF9zZXEsIGVzLT5sYXN0X3NlcSk7Cj4gIAkJaWd0X2Fzc2VydF9mKGVzLT5jdXJyZW50X3Nl
cSAtIGVzLT5sYXN0X3NlcSA8PSAxNTAsCj4gLS0gCj4gMi4xOS4xCj4gCgotLSAKRGFuaWVsIFZl
dHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3
bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
