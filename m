Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312C96EAE2
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Apr 2018 10:58:10 +0000 (UTC)
Date: Fri, 13 Apr 2018 12:58:07 +0200
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20180413105807.GC13079@kdec5-desk.ger.corp.intel.com>
References: <20180411023732.32362-1-dhinakaran.pandiyan@intel.com>
 <20180411023732.32362-3-dhinakaran.pandiyan@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180411023732.32362-3-dhinakaran.pandiyan@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 03/20] tests/psr: Rename psr_active() to
 psr_enabled()
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

T24gVHVlLCBBcHIgMTAsIDIwMTggYXQgMDc6Mzc6MTVQTSAtMDcwMCwgRGhpbmFrYXJhbiBQYW5k
aXlhbiB3cm90ZToKPiBwc3JfYWN0aXZlKCkgY2hlY2tzIHRoZSBkZWJ1Z2ZzIGZsYWcgIkhXIEVu
YWJsZWQgJiBBY3RpdmUgYml0Iiwgd2hpY2ggb25seQo+IHRlbGxzIHVzIGlmIFBTUiB3YXMgZW5h
YmxlZCBieSB0aGUgZHJpdmVyLiBUaGUgc3RhdGUgb2YgUFNSIC0gYWN0aXZlCj4gb3IgaW5hY3Rp
dmUgaXMgZGlmZmVyZW50IGZyb20gdGhpcyBmbGFnIGZvciBEREkgcGxhdGZvcm1zLCBzbyByZW5h
bWUgdGhlCj4gZnVuY3Rpb24gYXBwcm9wcmlhdGVseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEaGlu
YWthcmFuIFBhbmRpeWFuIDxkaGluYWthcmFuLnBhbmRpeWFuQGludGVsLmNvbT4KUmV2aWV3ZWQt
Ynk6IEthdGFyenluYSBEZWMgPGthdGFyenluYS5kZWNAaW50ZWwuY29tPiAKPiAtLS0KPiAgdGVz
dHMva21zX3Bzcl9zaW5rX2NyYy5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19wc3Jf
c2lua19jcmMuYyBiL3Rlc3RzL2ttc19wc3Jfc2lua19jcmMuYwo+IGluZGV4IGU1NWQyNTc2Li4x
NjU3ZWU4YSAxMDA2NDQKPiAtLS0gYS90ZXN0cy9rbXNfcHNyX3NpbmtfY3JjLmMKPiArKysgYi90
ZXN0cy9rbXNfcHNyX3NpbmtfY3JjLmMKPiBAQCAtMjAzLDcgKzIwMyw3IEBAIHN0YXRpYyBib29s
IHNpbmtfc3VwcG9ydChkYXRhX3QgKmRhdGEpCj4gIAkJc3Ryc3RyKGJ1ZiwgIlNpbmtfU3VwcG9y
dDogeWVzXG4iKTsKPiAgfQo+ICAKPiAtc3RhdGljIGJvb2wgcHNyX2FjdGl2ZShkYXRhX3QgKmRh
dGEpCj4gK3N0YXRpYyBib29sIHBzcl9lbmFibGVkKGRhdGFfdCAqZGF0YSkKPiAgewo+ICAJY2hh
ciBidWZbNTEyXTsKPiAgCj4gQEAgLTIxNyw3ICsyMTcsNyBAQCBzdGF0aWMgYm9vbCB3YWl0X3Bz
cl9lbnRyeShkYXRhX3QgKmRhdGEpCj4gIHsKPiAgCWludCB0aW1lb3V0ID0gNTsKPiAgCXdoaWxl
ICh0aW1lb3V0LS0pIHsKPiAtCQlpZiAocHNyX2FjdGl2ZShkYXRhKSkKPiArCQlpZiAocHNyX2Vu
YWJsZWQoZGF0YSkpCj4gIAkJCXJldHVybiB0cnVlOwo+ICAJCXNsZWVwKDEpOwo+ICAJfQo+IC0t
IAo+IDIuMTQuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gaWd0LWRldiBtYWlsaW5nIGxpc3QKPiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
