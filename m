Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB761892DE
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2019 08:49:22 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
In-Reply-To: <155376125792.24691.13846060111589600892@skylake-alporthouse-com>
References: <20190327190337.729-1-ville.syrjala@linux.intel.com>
 <87r2ar2z79.fsf@intel.com>
 <155376125792.24691.13846060111589600892@skylake-alporthouse-com>
Date: Thu, 28 Mar 2019 10:52:03 +0200
Message-ID: <87o95v2xfw.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] Revert "lib/igt_device: Move
 intel_get_pci_device under igt_device"
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
To: Chris Wilson <chris@chris-wilson.co.uk>, Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCAyOCBNYXIgMjAxOSwgQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28u
dWs+IHdyb3RlOgo+IFF1b3RpbmcgSmFuaSBOaWt1bGEgKDIwMTktMDMtMjggMDg6MTQ6MDIpCj4+
IE9uIFdlZCwgMjcgTWFyIDIwMTksIFZpbGxlIFN5cmphbGEgPHZpbGxlLnN5cmphbGFAbGludXgu
aW50ZWwuY29tPiB3cm90ZToKPj4gPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmph
bGFAbGludXguaW50ZWwuY29tPgo+PiA+Cj4+ID4gT25lIHNpZ25pZmljYW50IHVzZWNhc2UgZm9y
IGludGVsX3JlZy9ldGMuIGlzIHRvIGJlIGFibGUgdG8gZXhhbWluZQo+PiA+IHRoZSBoYXJkd2Fy
ZSBzdGF0ZSAqYmVmb3JlKiBsb2FkaW5nIHRoZSBkcml2ZXIuIElmIHRoZSB0b29sIGZvcmNlcwo+
PiA+IHRoZSBkcml2ZXIgdG8gbG9hZCB3ZSd2ZSB0b3RhbGx5IGxvc3QgdGhhdCBjYXBhYmlsaXR5
Lgo+PiAKPj4gQWdyZWVkLgo+Cj4gTm90IHF1aXRlLCBJIHNlZSB0aGUgcHJvYmxlbSBvZiB0b29s
cy8gbGlua2luZyBhZ2FpbnN0IHRoZSBsaWJpZ3QubGEKPiBzbW9yZ2FzYm9yZCByZW1haW5pbmcu
CgpXZWxsLCBhZ3JlZWQgb24gdGhlIHJldmVydCBhcyBzdG9wZ2FwIGJlY2F1c2UgaXQgYnJlYWtz
IGFuIGltcG9ydGFudCB1c2UKY2FzZS4KCkkgd3JvdGUgYW5kIGRlbGV0ZWQgc29tZSBtdXNpbmdz
IG9uIGhvdyBJIHRoaW5rIHRvb2xzLyBpcyBpbmNyZWFzaW5nbHkKb3V0IG9mIHBsYWNlIGluIGln
dC4gVGhlIGNvbW1vbiBpZ3QgY29kZSBldm9sdmVzIGZyb20gdGVzdHMvCnBlcnNwZWN0aXZlLCBh
bmQgSSBzdXBwb3NlIHJpZ2h0bHkgc28uIEkgdGhpbmsgSSd2ZSBzdWdnZXN0ZWQgaW4gdGhlCnBh
c3QgdG9vbHMvIHNob3VsZCBiZSBzcGxpdCBvdXQgdG8gYmUgbW9yZSBpbmRlcGVuZGVudCwgZWl0
aGVyIHdpdGhpbgppZ3QgcmVwbyBvciBpbiBhIHNlcGFyYXRlIHByb2plY3QvcmVwbyBvZiBpdHMg
b3duLgoKSWYgdG9vbHMvIHJlbWFpbiBpbiBpZ3QsIHBlcmhhcHMgd2UgbmVlZCBhIGxvd2VyIGxl
dmVsIG5vLW5vbnNlbnNlIGxpYgp0aGF0IGRvZXNuJ3QsIGZvciBleGFtcGxlLCBkbyBzdGFjayB1
bndpbmQgb24gZXJyb3JzIHdoaWNoIGlzIHJhdGhlcgpzaWxseSB3aXRoIHRoZSBnZW5lcmFsIHB1
cnBvc2UgdG9vbHMuIEFuZCB0aGVuIGhhdmUgYSB0ZXN0cyBsaWIgb24gdG9wCmZvciB0ZXN0cy4K
CkJSLApKYW5pLgoKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3Mg
Q2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
