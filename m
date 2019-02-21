Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9726589686
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Feb 2019 14:06:16 +0000 (UTC)
Date: Thu, 21 Feb 2019 16:06:13 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20190221140613.GL20097@intel.com>
References: <20190221024123.17516-1-dhinakaran.pandiyan@intel.com>
 <20190221024123.17516-3-dhinakaran.pandiyan@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190221024123.17516-3-dhinakaran.pandiyan@intel.com>
Subject: Re: [igt-dev] [HAX 3/5] lib/igt_fb: Use rendercopy for rendering
 into compressed buffers
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
To: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBGZWIgMjAsIDIwMTkgYXQgMDY6NDE6MjFQTSAtMDgwMCwgRGhpbmFrYXJhbiBQYW5k
aXlhbiB3cm90ZToKPiBAQCAtMjM5Nyw4ICsyNTIzLDEwIEBAIGNhaXJvX3N1cmZhY2VfdCAqaWd0
X2dldF9jYWlyb19zdXJmYWNlKGludCBmZCwgc3RydWN0IGlndF9mYiAqZmIpCj4gIAkJICAgICgo
Zi0+Y2Fpcm9faWQgPT0gQ0FJUk9fRk9STUFUX0lOVkFMSUQpICYmCj4gIAkJICAgICAoZi0+cGl4
bWFuX2lkICE9IFBJWE1BTl9pbnZhbGlkKSkpCj4gIAkJCWNyZWF0ZV9jYWlyb19zdXJmYWNlX19j
b252ZXJ0KGZkLCBmYik7Cj4gKwkJZWxzZSBpZiAoaXNfY2NzX21vZGlmaWVyKGZiLT50aWxpbmcp
KQo+ICsJCQljcmVhdGVfY2Fpcm9fc3VyZmFjZV9fcmVuZGVyY29weShmZCwgZmIpOwo+ICAJCWVs
c2UgaWYgKGZiLT50aWxpbmcgPT0gTE9DQUxfSTkxNV9GT1JNQVRfTU9EX1lfVElMRUQgfHwKPiAt
CQkgICAgZmItPnRpbGluZyA9PSBMT0NBTF9JOTE1X0ZPUk1BVF9NT0RfWWZfVElMRUQpCj4gKwkJ
CSBmYi0+dGlsaW5nID09IExPQ0FMX0k5MTVfRk9STUFUX01PRF9ZZl9USUxFRCkKPiAgCQkJY3Jl
YXRlX2NhaXJvX3N1cmZhY2VfX2JsaXQoZmQsIGZiKTsKPiAgCQllbHNlCj4gIAkJCWNyZWF0ZV9j
YWlyb19zdXJmYWNlX19ndHQoZmQsIGZiKTsKCk9oLCBhbmQgdGhpcyByZW1pbmRzIG1lIHRoYXQg
d2Ugc3RpbGwgaGF2ZSB0aGUgPDMyayBieXRlIGJsaXR0ZXIgc3RyaWRlCnByb2JsZW0sIHdoaWNo
IEkgdHJpZWQgdG8gYWRkcmVzcyBhIGJpdCBpbgpodHRwczovL3BhdGNod29yay5mcmVlZGVza3Rv
cC5vcmcvcGF0Y2gvMjQ4NTQzLwpieSB1c2luZyBndHQgbW1hcHMgaW5zdGVhZC4gSG93ZXZlciB0
aGF0IGZhaWxlZCBmb3IgWWYgc2luY2UgZmVuY2VzIGNhbid0CmhhbmRsZSBZZi4gTXkgaW5pdGlh
bCBpZGVhIHdhcyB0byBjcHUgbW1hcCBhbmQgdGlsZS9kZXRpbGUgbWFudWFsbHksCmJ1dCB3ZSBj
b3VsZCBhY3R1YWxseSBjb25zaWRlciB1c2luZyByZW5kZXJjb3B5IGluc3RlYWQuCgotLSAKVmls
bGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dg==
