Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5FA66E2D5
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Apr 2018 14:00:17 +0000 (UTC)
Date: Wed, 4 Apr 2018 17:00:13 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20180404140013.GF9570@ahiler-desk1.ger.corp.intel.com>
References: <20180330154939.20647-1-daniels@collabora.com>
 <95cd7da4-fbba-9ac3-404c-3a0eb69c3a35@intel.com>
 <CAPj87rNAHOJNvhyO=BAUCvVYV5XrHJrU7v3Wv45FXNfu4qQX9Q@mail.gmail.com>
 <e5ed19e2-829e-ad2d-3968-ba0f19c8d059@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e5ed19e2-829e-ad2d-3968-ba0f19c8d059@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_getfb: Use fixtures and
 subtest groups
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
To: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: igt-dev@lists.freedesktop.org, Daniel Stone <daniels@collabora.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBBcHIgMDIsIDIwMTggYXQgMTA6MTM6MTlBTSAtMDcwMCwgQW50b25pbyBBcmdlbnpp
YW5vIHdyb3RlOgo+IAo+IAo+IE9uIDAyLzA0LzE4IDA2OjAyLCBEYW5pZWwgU3RvbmUgd3JvdGU6
Cj4gPiBIaSBBbnRvbmlvLAo+ID4gCj4gPiBPbiAzMCBNYXJjaCAyMDE4IGF0IDIyOjAxLCBBbnRv
bmlvIEFyZ2Vuemlhbm8KPiA+IDxhbnRvbmlvLmFyZ2Vuemlhbm9AaW50ZWwuY29tPiB3cm90ZToK
PiA+ID4gU2luY2UgYm90aCB0ZXN0X2hhbmRsZV9pbnB1dCBhbmQgdGVzdF9kdXBsaWNhdGVfaGFu
ZGxlcyBkZWZpbmUgc29tZQo+ID4gPiBzdWItdGVzdHMgYW5kIHNvbWUgZml4dHVyZXMsIEkgdGhp
bmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIHVud3JhcCB0aG9zZQo+ID4gPiBmdW5jdGlvbnMgYW5k
IGRvIGFsbCBmaXh0dXJlcyBhbmQgc3VidGVzdCBkZWZpbml0aW9uIGluIGlndF9tYWluIHRvIG1h
a2UgaXQKPiA+ID4gbW9yZSByZWFkYWJsZS4gSXQgc2VlbXMgbGlrZSB5b3Ugd291bGQgYWxzbyBi
ZSBhYmxlIHRvIHJldXNlIHRoZSBzYW1lCj4gPiA+IGZpeHR1cmUgYWNyb3NzIHRoZSB0d28gc3Vi
dGVzdF9ncm91cHMuCj4gPiAKPiA+IFRvIGJlIGNsZWFyLCBkb2VzIHRoaXMgbWVhbiB0aGF0IGVh
Y2ggcGllY2Ugb2YgZml4dHVyZSBhbmQgaWd0X3N1YnRlc3QKPiA+IGRlZmluaXRpb24gc2hvdWxk
IGxpdmUgaW5zaWRlIG1haW4/Cj4gCj4gSSBkb24ndCB0aGluayB0aGVyZSBpcyBhIHJ1bGUgZm9y
IHRoYXQsIGl0IGxvb2tzIGJldHRlciB0aGF0IHdheQo+IChmaXh0dXJlcy9pZ3Rfc3VidGVzdC9z
dWJ0ZXN0X2dyb3VwIGFsbCBpbiB0aGUgbWFpbikgSU1PIDopLiBBbHNvIGl0IGlzIHdoYXQKPiBJ
J3ZlIGZvdW5kIGluIG1vc3QgaWYgbm90IGFsbCB0ZXN0cyBJJ3ZlIGxvb2tlZCBhdC4KCkRlZmlu
YXRlbHkgbm90IGEgcnVsZSwgYW5kIGRlZmluYXRlbHkgbm90IGEgcGF0Y2ggdG8gZW5mb3JjZSBz
dWNoCnByZWZlcmVuY2UgOi1QCgpCdXQgZ2VuZXJhbGx5IGl0J3MgYSBnb29kIGRlZmF1bHQuCgo+
IFN0aWxsIHRoZSBwYXRjaCBtYWtlcyBzZW5zZSB3aXRoIG9yIHdpdGhvdXQgbXkgc3VnZ2VzdGlv
bi4KPiBBY2tlZC1ieTogQW50b25pbyBBcmdlbnppYW5vIDxhbnRvbmlvLmFyZ2Vuemlhbm9AaW50
ZWwuY29tPgoKVGhhbmtzLCB3aWxsIHB1c2ggaW4gYSBzZWNvbmQuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
