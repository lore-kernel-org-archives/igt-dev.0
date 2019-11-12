Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7D56E12D
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2019 19:38:35 +0000 (UTC)
Date: Tue, 12 Nov 2019 11:38:34 -0800
From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
Message-ID: <20191112193834.pl5vlwkv463yg2eo@vrkonda-desk.ra.intel.com>
References: <20191112183908.1711141-1-vanshidhar.r.konda@intel.com>
 <20191112183908.1711141-2-vanshidhar.r.konda@intel.com>
 <157358679840.13929.5417683729804579288@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157358679840.13929.5417683729804579288@skylake-alporthouse-com>
Subject: Re: [igt-dev] [RFC PATCH 1/1] i915/gem_tiled_blits: Avoid
 SET_TILING on Gen 9+
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMDc6MjY6MzhQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+UXVvdGluZyBWYW5zaGlkaGFyIEtvbmRhICgyMDE5LTExLTEyIDE4OjM5OjA4KQo+PiBU
aGUgdGVzdCBjdXJyZW50bHkgdXNlcyBTRVRfVElMSU5HIElPQ1RMIGZvciBidWZmZXIgb2JqZWN0
cy4gVGhpcyBJT0NUTAo+PiBpcyBub3Qgc3VwcG9ydGVkIG9uIEdlbjEyIGFuZCBiZXlvbmQuIFVw
ZGF0ZSB0aGUgdGVzdCB0byB1c2UKPj4gaWd0X2JsaXR0ZXJfZmFzdF9jb3B5X19yYXcoKSBvbiBH
ZW4gOSsgLSB0aGlzIGF2b2lkcyBoYXZlIHRvIHVzZQo+PiBTRVRfVElMSU5HIElPQ1RMIGFzIHdl
bGwgYXMgaW5jcmVhc2VzIHRoZSB1c2FnZSBvZgo+PiBpZ3RfYmxpdHRlcl9mYXN0X2NvcHlfX3Jh
dygpIG1ldGhvZCBhdmFpbGFibGUgaW4gdGhlIGxpYnJhcnkuCj4KPkkgd291bGQgbXVjaCBwcmVm
ZXIgbm90IHRvIG1peCBhbmQgbWF0Y2ggbGliZHJtIHdpdGggbmF0aXZlLiBKdXN0Cj5jb252ZXJ0
IGl0IHRvIG5hdGl2ZS4KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suCgpBbnkgdGhvdWdodHMgb24g
anVzdCBtb3ZpbmcgYWxsIHRoZSBJR1QgdGVzdHMgdG8gdXNlIG5hdGl2ZSBpbnN0ZWFkIG9mCmxp
YmRybT8gT3IgaWYgSSBjYW4gbW92ZSB0aGlzIHRlc3QgdG8gdXNlIGxpYmRybSBzdHJ1Y3R1cmVz
L21ldGhvZHMsCnNob3VsZCBJIHByZWZlciB0aGF0PwoKVmFuc2hpCgo+LUNocmlzCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
