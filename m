Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EAA6E897
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2019 10:51:51 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j9so20686127wrn.6
 for <igt-dev@lists.freedesktop.org>; Wed, 03 Apr 2019 03:51:50 -0700 (PDT)
Date: Wed, 3 Apr 2019 12:51:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190403105146.GA2665@phenom.ffwll.local>
References: <20190402163348.4680-1-ville.syrjala@linux.intel.com>
 <20190402163348.4680-3-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190402163348.4680-3-ville.syrjala@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/6] tests/kms_color: Reuse some already
 compute values
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBBcHIgMDIsIDIwMTkgYXQgMDc6MzM6NDVQTSArMDMwMCwgVmlsbGUgU3lyamFsYSB3
cm90ZToKPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+IAo+IFdlIGFscmVhZHkgY29tcHV0ZSB0aGUgbHV0X3NpemUqZW50cnlfc2l6ZSBzbyBs
ZXQncyByZXVzZSB0aG9zZQo+IHdoZW4gYWxsb2NhdGluZyB0aGUgTFVUcy4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+
IC0tLQo+ICB0ZXN0cy9rbXNfY29sb3IuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNf
Y29sb3IuYyBiL3Rlc3RzL2ttc19jb2xvci5jCj4gaW5kZXggNDNlNTlkZDQyYjBiLi5jNjViYjg4
Y2Q3ZGMgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMva21zX2NvbG9yLmMKPiArKysgYi90ZXN0cy9rbXNf
Y29sb3IuYwo+IEBAIC0xMDc5LDggKzEwNzksOCBAQCBpbnZhbGlkX2x1dF9zaXplcyhkYXRhX3Qg
KmRhdGEpCj4gIAlzaXplX3QgZGVnYW1tYV9sdXRfc2l6ZSA9IGRhdGEtPmRlZ2FtbWFfbHV0X3Np
emUgKiBzaXplb2Yoc3RydWN0IGRybV9jb2xvcl9sdXQpOwo+ICAJc2l6ZV90IGdhbW1hX2x1dF9z
aXplID0gZGF0YS0+Z2FtbWFfbHV0X3NpemUgKiBzaXplb2Yoc3RydWN0IGRybV9jb2xvcl9sdXQp
Owo+ICAKPiAtCXN0cnVjdCBkcm1fY29sb3JfbHV0ICpkZWdhbW1hX2x1dCA9IG1hbGxvYyhkYXRh
LT5kZWdhbW1hX2x1dF9zaXplICogc2l6ZW9mKHN0cnVjdCBkcm1fY29sb3JfbHV0KSAqIDIpOwo+
IC0Jc3RydWN0IGRybV9jb2xvcl9sdXQgKmdhbW1hX2x1dCA9IG1hbGxvYyhkYXRhLT5nYW1tYV9s
dXRfc2l6ZSAqIHNpemVvZihzdHJ1Y3QgZHJtX2NvbG9yX2x1dCkgKiAyKTsKPiArCXN0cnVjdCBk
cm1fY29sb3JfbHV0ICpkZWdhbW1hX2x1dCA9IG1hbGxvYyhkZWdhbW1hX2x1dF9zaXplICogMik7
Cj4gKwlzdHJ1Y3QgZHJtX2NvbG9yX2x1dCAqZ2FtbWFfbHV0ID0gbWFsbG9jKGdhbW1hX2x1dF9z
aXplICogMik7CgpDb3VsZCBhbHNvIGJpa2VzaGVkIHRvIGNhbGxvYywgYnV0IHRoaXMgaXNuJ3Qg
a2VybmVsIGNvZGUsIHNvIHdobyBjYXJlcwphYm91dCBvdmVyZmxvd3MuCgpSZXZpZXdlZC1ieTog
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KCj4gIAo+ICAJaWd0X2Rpc3Bs
YXlfY29tbWl0MihkaXNwbGF5LCBkaXNwbGF5LT5pc19hdG9taWMgPyBDT01NSVRfQVRPTUlDIDog
Q09NTUlUX0xFR0FDWSk7Cj4gIAo+IC0tIAo+IDIuMTkuMgo+IAo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gaWd0LWRldiBtYWlsaW5nIGxpc3QKPiBp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUg
RW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
