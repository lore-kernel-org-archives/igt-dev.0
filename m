Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287D389026
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2019 07:36:22 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id w37so604235edw.4
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2019 00:36:22 -0700 (PDT)
Date: Thu, 25 Apr 2019 09:36:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190425073613.GB9857@phenom.ffwll.local>
References: <20190424070129.8591-1-simon.ser@intel.com>
 <20190424092842.GV22949@platvala-desk.ger.corp.intel.com>
 <20190424132655.GY22949@platvala-desk.ger.corp.intel.com>
 <20190424200641.GW9857@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190424200641.GW9857@phenom.ffwll.local>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_halffloat: fix compilation with
 Clang
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
To: Simon Ser <simon.ser@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBBcHIgMjQsIDIwMTkgYXQgMTA6MDY6NDFQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBXZWQsIEFwciAyNCwgMjAxOSBhdCAwNDoyNjo1NVBNICswMzAwLCBQZXRyaSBM
YXR2YWxhIHdyb3RlOgo+ID4gT24gV2VkLCBBcHIgMjQsIDIwMTkgYXQgMTI6Mjg6NDJQTSArMDMw
MCwgUGV0cmkgTGF0dmFsYSB3cm90ZToKPiA+ID4gT24gV2VkLCBBcHIgMjQsIDIwMTkgYXQgMTA6
MDE6MjlBTSArMDMwMCwgU2ltb24gU2VyIHdyb3RlOgo+ID4gPiA+IFRoZSBzb3VyY2UgZmlsZSBj
b250YWlucyBhIHNwZWNpYWwgY29kZS1wYXRoIGZvciBDbGFuZywgaG93ZXZlciB0aGlzIHBhdGgg
ZmFpbHMKPiA+ID4gPiB0byBjb21waWxlOgo+ID4gPiA+IAo+ID4gPiA+ICAgLi4vbGliL2lndF9o
YWxmZmxvYXQuYzoyMjc6NzogZXJyb3I6IGNvbmZsaWN0aW5nIHR5cGVzIGZvciAnaWd0X2hhbGZf
dG9fZmxvYXQnCj4gPiA+ID4gICBmbG9hdCBpZ3RfaGFsZl90b19mbG9hdChjb25zdCB1aW50MTZf
dCAqaCwgZmxvYXQgKmYsIHVuc2lnbmVkIGludCBudW0pCj4gPiA+ID4gICAgICAgICBeCj4gPiA+
ID4gICAuLi9saWIvaWd0X2hhbGZmbG9hdC5oOjI2OjY6IG5vdGU6IHByZXZpb3VzIGRlY2xhcmF0
aW9uIGlzIGhlcmUKPiA+ID4gPiAgIHZvaWQgaWd0X2hhbGZfdG9fZmxvYXQoY29uc3QgdWludDE2
X3QgKmgsIGZsb2F0ICpmLCB1bnNpZ25lZCBpbnQgbnVtKTsKPiA+ID4gPiAgICAgICAgXgo+ID4g
PiA+ICAgMSBlcnJvciBnZW5lcmF0ZWQuCj4gPiA+ID4gCj4gPiA+ID4gVGhpcyBjb21taXQgZml4
ZXMgdGhpcyBtaXNtYXRjaC4KPiA+ID4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBT
ZXIgPHNpbW9uLnNlckBpbnRlbC5jb20+Cj4gPiA+IAo+ID4gPiBTYW1lIGNsYW5nIHBhdGggaXMg
YWxzbyB1c2VkIGZvciAheDg2XzY0LCBhcyBzaG93biBpbiB0aGUgZ2l0bGFiIENJCj4gPiA+IGJ1
aWxkIGZhaWx1cmUuCj4gPiA+IAo+ID4gPiAKPiA+ID4gUmV2aWV3ZWQtYnk6IFBldHJpIExhdHZh
bGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgo+ID4gCj4gPiAKPiA+IEFuZCBtZXJnZWQgbm93
LCB0aGFua3MuCj4gCj4gRm9yIG5leHQgdGltZSBmb3IgcmVncmVzc2lvbnM6IFBsZWFzZSBjYyB0
aGUgZm9sa3Mgd2hvIGJyb2tlIHRoaW5ncyAob3IKPiByZXZpZXdlZCB0aGF0IGJyZWFrYWdlKSwg
YW5kIHF1b3RlIHRoZSBvZmZlbmRpbmcgY29tbWl0IHdpdGggRml4ZXM6IGxpbmVzLgo+IAo+IEFs
c28gSSdtIGtpbmRhIHdvbmRlcmluZyB3aGV0aGVyIHdlIHNob3VsZCBlbmZvcmNlIGdpdGxhYiBD
SSBidWlsZCBzdWNjZXNzCj4gZ29pbmcgZm9yd2FyZCAuLi4gU3R1ZmYgbm90IGNvbXBpbGluZyBp
c24ndCBhd2Vzb21lLgoKYnR3IG9uZSBtb3JlOiBXaGF0IGJyb2tlIGlzIHRoZSBub24teDg2IGJ1
aWxkcywgdGhvc2Ugd2UgY2FyZSBhYm91dC4gV2UKZG9uJ3QgcmVhbGx5IGNhcmUgYWJvdXQgY2xh
bmcgKEkgdGhpbmsgYXQgbGVhc3QpLCBzbyBjb21taXQgbWVzc2FnZSBpcyBhCmJpdCBjb25mdXNp
bmcgLi4uCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVs
IENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldg==
