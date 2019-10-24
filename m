Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836AB6E438
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2019 14:59:56 +0000 (UTC)
Date: Thu, 24 Oct 2019 08:00:39 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20191024150039.GE18842@mdroper-desk1.amr.corp.intel.com>
References: <20191023215031.94821-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023215031.94821-1-jose.souza@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/psr: Skip PSR tests if sink not
 reliable
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
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ap Kamal <kamal.ap@intel.com>, Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMDI6NTA6MzBQTSAtMDcwMCwgSm9zw6kgUm9iZXJ0byBk
ZSBTb3V6YSB3cm90ZToKPiBSaWdodCBub3cgaWYgc2luayByZXBvcnRlZCBhbnkgUFNSIGVycm9y
IG9yIGlmIGl0IGZhaWxzIHRvCj4gYWNrbm93bGVkZ2UgdGhlIFBTUiB3YWtldXAgaXQgc2V0cyBh
IGZsYWcgYW5kIGRvIG5vdCBhdHRlbXB0IHRvCj4gZW5hYmxlIFBTUiBhbnltb3JlLiBUaGF0IGlz
IHRoZSBzYWZlc3QgYXBwcm9hY2ggdG8gYXZvaWQgcmVwZXRpdGl2ZQo+IGdsaXRjaGVzIGFuZCBh
bGxvd2VkIHVzIHRvIGhhdmUgUFNSIGVuYWJsZWQgYnkgZGVmYXVsdC4KPiAKPiBCdXQgZnJvbSB0
aW1lIHRvIHRpbWUgZXZlbiBnb29kIFBTUiBwYW5lbHMgaGF2ZSBhIFBTUiBlcnJvciwgY2F1c2lu
Zwo+IHRlc3RzIHRvIGZhaWwuIEFuZCBmb3Igbm93IHdlIGFyZSBub3QgeWV0IHRvIHRoZSBwb2lu
dCB3ZXJlIHdlIGNvdWxkCj4gdHJ5IHRvIHJlY292ZXIgZnJvbSBQU1IgZXJyb3JzLCBzbyBsZXRz
IGNoZWNrIGZvciB0aGlzIGluZm9ybWF0aW9uIGluCj4gZGVidWdmcyBhbmQgc2tpcCBQU1IgdGVz
dHMgYmVjYXVzZSBvZiBzaW5rIGVycm9ycyBhbmQgZWxpbWluYXRlIHRoaXMKPiBub2lzZSBmcm9t
IENJIHJ1bnMuCj4gCj4gQ2M6IERoaW5ha2FyYW4gUGFuZGl5YW4gPGRoaW5ha2FyYW4ucGFuZGl5
YW5AaW50ZWwuY29tPgo+IENjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+
Cj4gQ2M6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+Cj4gQ2M6IEFwIEth
bWFsIDxrYW1hbC5hcEBpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBk
ZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+CgpCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmZy
ZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA5NDU0ClJldmlld2VkLWJ5OiBNYXR0IFJv
cGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPgoKYW5kIHItYiBmb3IgdGhlIGk5MTUgcGF0
Y2ggYXMgd2VsbC4KCgo+IC0tLQo+ICBsaWIvaWd0X3Bzci5jIHwgMiArKwo+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfcHNyLmMgYi9s
aWIvaWd0X3Bzci5jCj4gaW5kZXggYjkyZWE3M2YuLjBlNzlkY2Q5IDEwMDY0NAo+IC0tLSBhL2xp
Yi9pZ3RfcHNyLmMKPiArKysgYi9saWIvaWd0X3Bzci5jCj4gQEAgLTMzLDYgKzMzLDggQEAgc3Rh
dGljIGJvb2wgcHNyX2FjdGl2ZV9jaGVjayhpbnQgZGVidWdmc19mZCwgZW51bSBwc3JfbW9kZSBt
b2RlKQo+ICAJaWd0X2RlYnVnZnNfc2ltcGxlX3JlYWQoZGVidWdmc19mZCwgImk5MTVfZWRwX3Bz
cl9zdGF0dXMiLCBidWYsCj4gIAkJCQlzaXplb2YoYnVmKSk7Cj4gIAo+ICsJaWd0X3NraXBfb24o
c3Ryc3RyKGJ1ZiwgIlBTUiBzaW5rIG5vdCByZWxpYWJsZTogeWVzIikpOwo+ICsKPiAgCXJldHVy
biBzdHJzdHIoYnVmLCBzdGF0ZSk7Cj4gIH0KPiAgCj4gLS0gCj4gMi4yMy4wCj4gCgotLSAKTWF0
dCBSb3BlcgpHcmFwaGljcyBTb2Z0d2FyZSBFbmdpbmVlcgpWVFQtT1NHQyBQbGF0Zm9ybSBFbmFi
bGVtZW50CkludGVsIENvcnBvcmF0aW9uCig5MTYpIDM1Ni0yNzk1Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldg==
