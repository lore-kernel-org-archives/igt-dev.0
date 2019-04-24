Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888C1894C9
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2019 13:26:57 +0000 (UTC)
Date: Wed, 24 Apr 2019 16:26:55 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190424132655.GY22949@platvala-desk.ger.corp.intel.com>
References: <20190424070129.8591-1-simon.ser@intel.com>
 <20190424092842.GV22949@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190424092842.GV22949@platvala-desk.ger.corp.intel.com>
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

T24gV2VkLCBBcHIgMjQsIDIwMTkgYXQgMTI6Mjg6NDJQTSArMDMwMCwgUGV0cmkgTGF0dmFsYSB3
cm90ZToKPiBPbiBXZWQsIEFwciAyNCwgMjAxOSBhdCAxMDowMToyOUFNICswMzAwLCBTaW1vbiBT
ZXIgd3JvdGU6Cj4gPiBUaGUgc291cmNlIGZpbGUgY29udGFpbnMgYSBzcGVjaWFsIGNvZGUtcGF0
aCBmb3IgQ2xhbmcsIGhvd2V2ZXIgdGhpcyBwYXRoIGZhaWxzCj4gPiB0byBjb21waWxlOgo+ID4g
Cj4gPiAgIC4uL2xpYi9pZ3RfaGFsZmZsb2F0LmM6MjI3Ojc6IGVycm9yOiBjb25mbGljdGluZyB0
eXBlcyBmb3IgJ2lndF9oYWxmX3RvX2Zsb2F0Jwo+ID4gICBmbG9hdCBpZ3RfaGFsZl90b19mbG9h
dChjb25zdCB1aW50MTZfdCAqaCwgZmxvYXQgKmYsIHVuc2lnbmVkIGludCBudW0pCj4gPiAgICAg
ICAgIF4KPiA+ICAgLi4vbGliL2lndF9oYWxmZmxvYXQuaDoyNjo2OiBub3RlOiBwcmV2aW91cyBk
ZWNsYXJhdGlvbiBpcyBoZXJlCj4gPiAgIHZvaWQgaWd0X2hhbGZfdG9fZmxvYXQoY29uc3QgdWlu
dDE2X3QgKmgsIGZsb2F0ICpmLCB1bnNpZ25lZCBpbnQgbnVtKTsKPiA+ICAgICAgICBeCj4gPiAg
IDEgZXJyb3IgZ2VuZXJhdGVkLgo+ID4gCj4gPiBUaGlzIGNvbW1pdCBmaXhlcyB0aGlzIG1pc21h
dGNoLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBTZXIgPHNpbW9uLnNlckBpbnRlbC5j
b20+Cj4gCj4gU2FtZSBjbGFuZyBwYXRoIGlzIGFsc28gdXNlZCBmb3IgIXg4Nl82NCwgYXMgc2hv
d24gaW4gdGhlIGdpdGxhYiBDSQo+IGJ1aWxkIGZhaWx1cmUuCj4gCj4gCj4gUmV2aWV3ZWQtYnk6
IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgoKCkFuZCBtZXJnZWQgbm93
LCB0aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
