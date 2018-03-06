Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm0-x241.google.com (mail-wm0-x241.google.com
 [IPv6:2a00:1450:400c:c09::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB5B6E04A
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Mar 2018 14:56:31 +0000 (UTC)
Received: by mail-wm0-x241.google.com with SMTP id x7so22724760wmc.0
 for <igt-dev@lists.freedesktop.org>; Tue, 06 Mar 2018 06:56:31 -0800 (PST)
Date: Tue, 6 Mar 2018 15:56:27 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20180306145627.GO22212@phenom.ffwll.local>
References: <20180222074343.25292-1-marta.lofstedt@intel.com>
 <151928561738.11316.4884773980791963564@mail.alporthouse.com>
 <CA5F6A4B62957246A95956419746064382B39509@IRSMSX106.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA5F6A4B62957246A95956419746064382B39509@IRSMSX106.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] igt/kms_fbcon_fbt: Handle ENODEV
 when checking i915_edp_psr_status for chipset support
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
To: "Lofstedt, Marta" <marta.lofstedt@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBGZWIgMjIsIDIwMTggYXQgMDc6NDg6NTNBTSArMDAwMCwgTG9mc3RlZHQsIE1hcnRh
IHdyb3RlOgo+IAo+IAo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IENo
cmlzIFdpbHNvbiBbbWFpbHRvOmNocmlzQGNocmlzLXdpbHNvbi5jby51a10KPiA+IFNlbnQ6IFRo
dXJzZGF5LCBGZWJydWFyeSAyMiwgMjAxOCA5OjQ3IEFNCj4gPiBUbzogTG9mc3RlZHQsIE1hcnRh
IDxtYXJ0YS5sb2ZzdGVkdEBpbnRlbC5jb20+OyBpZ3QtCj4gPiBkZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gPiBTdWJqZWN0OiBSZTogW2lndC1kZXZdIFtQQVRDSCBpLWctdCAxLzNdIGlndC9r
bXNfZmJjb25fZmJ0OiBIYW5kbGUgRU5PREVWCj4gPiB3aGVuIGNoZWNraW5nIGk5MTVfZWRwX3Bz
cl9zdGF0dXMgZm9yIGNoaXBzZXQgc3VwcG9ydAo+ID4gCj4gPiBRdW90aW5nIE1hcnRhIExvZnN0
ZWR0ICgyMDE4LTAyLTIyIDA3OjQzOjQxKQo+ID4gPiBJZiB0aGUgbWFjaGluZSBkb2Vzbid0IHN1
cHBvcnQgUFNSLCBpdCB3aWxsIHJldHVybiAtRU5PREVWIGZyb20KPiA+ID4gaTkxNV9lZHBfcHNy
X3N0YXR1cywgd2hpY2ggd2Ugd2FudCB0byBpbnRlcnByZXQgYXMgdW5zdXBwb3J0ZWQuCj4gPiA+
IFRoaXMgaXMgaW4gbGluZSB3aXRoIHdoYXQgQ2hyaXMganVzdCBmaXhlZCBmb3IgRkJDLgo+ID4g
Pgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXJ0YSBMb2ZzdGVkdCA8bWFydGEubG9mc3RlZHRAaW50
ZWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gIHRlc3RzL2ttc19mYmNvbl9mYnQuYyB8IDIgKysKPiA+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdp
dCBhL3Rlc3RzL2ttc19mYmNvbl9mYnQuYyBiL3Rlc3RzL2ttc19mYmNvbl9mYnQuYyBpbmRleAo+
ID4gPiAxYjIzNmY4Yi4uNmFhMTcxZTYgMTAwNjQ0Cj4gPiA+IC0tLSBhL3Rlc3RzL2ttc19mYmNv
bl9mYnQuYwo+ID4gPiArKysgYi90ZXN0cy9rbXNfZmJjb25fZmJ0LmMKPiA+ID4gQEAgLTE2NCw2
ICsxNjQsOCBAQCBzdGF0aWMgYm9vbCBwc3Jfc3VwcG9ydGVkX29uX2NoaXBzZXQoaW50IGZkKSAg
ewo+ID4gPiAgICAgICAgIGNoYXIgYnVmWzI1Nl07Cj4gPiA+Cj4gPiA+ICsgICAgICAgaWYgKCpi
dWYgPT0gJ1wwJykgLyogIUhBU19QU1IgLT4gLUVOT0RFViovCj4gPiA+ICsgICAgICAgICAgICAg
ICByZXR1cm4gZmFsc2U7Cj4gPiA+ICAgICAgICAgaWd0X2RlYnVnZnNfcmVhZChmZCwgImk5MTVf
ZWRwX3Bzcl9zdGF0dXMiLCBidWYpOwo+ID4gCj4gPiBBZnRlciB0aGUgcmVhZCA6KQo+IAo+IFll
YWgsIHdhcyB3YXkgdG9vIHRyaWdnZXIgaGFwcHkgaGVyZQoKU2luY2UgQ2hyaXMgd3JvdGUgdGhl
IHNhbWUgcGF0Y2ggZnJvbSBrbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcgLi4uIHNob3VsZAp3ZSBl
eHRyYWN0IHRoZXNlIGludG8gaGVscGVycyBpbiBsaWIvIHNvbWV3aGVyZT8KLURhbmllbAoKPiAK
PiA+IAo+ID4gPiAgICAgICAgIHJldHVybiBzdHJzdHIoYnVmLCAiU2lua19TdXBwb3J0OiB5ZXNc
biIpOyAgfQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gaWd0LWRldiBtYWlsaW5nIGxpc3QKPiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgoK
LS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0
dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dgo=
