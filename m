Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81B46E4C2
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Dec 2018 22:53:55 +0000 (UTC)
Message-ID: <46e45015e8a405fc93994481d78f2a98a13f178d.camel@intel.com>
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Tue, 11 Dec 2018 14:53:52 -0800
In-Reply-To: <20181204230944.7753-1-jose.souza@intel.com>
References: <20181204230944.7753-1-jose.souza@intel.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/8] lib/psr: Increase the buffer lenght
 that stores the output of i915_edp_psr_status
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: dhinakaran.pandiyan@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCAyMDE4LTEyLTA0IGF0IDE1OjA5IC0wODAwLCBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IHdyb3RlOgo+IFNvbWV0aW1lcyA1MTIgYnl0ZXMgaXMgbm90IGVub2dodCB0byBzdG9yZSB0aGUg
d2hvbGUKICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeZW5vdWdoCk5vdCBlbm91Z2ggYmVj
YXVzZSBvZiBTVSBibG9jayBjb3VudHM/Cgo+IGk5MTVfZWRwX3Bzcl9zdGF0dXMgcG90ZW50aWFs
bHkgY2F1c2luZyBmYWlsIGluIHRlc3RzIHRoYXQgZGVwZW5kcwo+IGluIHRoZSBjb250ZW50IHRo
YXQgaXMgb3V0IG9mIHRoaXMgNTEyIGJ5dGVzLgo+IAo+IENjOiBEaGluYWthcmFuIFBhbmRpeWFu
IDxkaGluYWthcmFuLnBhbmRpeWFuQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBS
b2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4KPiAtLS0KPiAgbGliL2lndF9w
c3IuYyB8IDQgKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfcHNyLmMgYi9saWIvaWd0X3Bzci5jCj4g
aW5kZXggMGRkZmI2NGYuLmM3YmM1MjNjIDEwMDY0NAo+IC0tLSBhL2xpYi9pZ3RfcHNyLmMKPiAr
KysgYi9saWIvaWd0X3Bzci5jCj4gQEAgLTI1LDEwICsyNSwxMiBAQAo+ICAjaW5jbHVkZSAiaWd0
X3N5c2ZzLmgiCj4gICNpbmNsdWRlIDxlcnJuby5oPgo+ICAKPiArI2RlZmluZSBQU1JfU1RBVFVT
X01BWF9MRU4gMTAyNApNb3ZlIHRoaXMgdG8gaWd0X3Bzci5oIHNvIHRoYXQgd2UgY2FuIHVzZSB0
aGUgc2FtZSBzaXplIGluIGttc19wc3IuYy4KCj4gKwo+ICBzdGF0aWMgYm9vbCBwc3JfYWN0aXZl
KGludCBkZWJ1Z2ZzX2ZkLCBib29sIGNoZWNrX2FjdGl2ZSkKPiAgewo+ICAJYm9vbCBhY3RpdmU7
Cj4gLQljaGFyIGJ1Zls1MTJdOwo+ICsJY2hhciBidWZbUFNSX1NUQVRVU19NQVhfTEVOXTsKPiAg
Cj4gIAlpZ3RfZGVidWdmc19zaW1wbGVfcmVhZChkZWJ1Z2ZzX2ZkLCAiaTkxNV9lZHBfcHNyX3N0
YXR1cyIsIGJ1ZiwKPiAgCQkJCXNpemVvZihidWYpKTsKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldgo=
