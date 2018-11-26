Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFA689EFF
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Nov 2018 12:33:39 +0000 (UTC)
Date: Mon, 26 Nov 2018 14:33:33 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20181126123333.t7zxwco76trqhvlt@ahiler-desk1.fi.intel.com>
References: <20181122093700.31211-1-daniel.vetter@ffwll.ch>
 <20181122093700.31211-4-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181122093700.31211-4-daniel.vetter@ffwll.ch>
Subject: Re: [igt-dev] [PATCH i-g-t 4/5] lib/kms: warn if we commit without
 outputs
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
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: IGT development <igt-dev@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjIsIDIwMTggYXQgMTA6MzY6NTlBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBXaXRoIHRoZSBoaWdoLWxldmVsIGhlbHBlcnMgcmVxdWlyaW5nIG91dHB1dHMgdGhl
cmUncyBub3QgcG9pbnQKPiBpbiBzaWxlbnRseSBpZ25vcmluZyBpc3N1ZXMgYW55bW9yZS4gQ29t
cGxhaW4gYWJvdXQgdGhhdCBpZiBpdAo+IGV2ZXIgaGFwcGVucy4KPiAKPiBUaGlzIHJldmVydHMK
PiAKPiBjb21taXQgMjEyYjcxMzcyYmZiYjczNjYzZDg3MmRmMzExMThkNmIzOTZhZGE0Zgo+IEF1
dGhvcjogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gRGF0ZTogICBG
cmkgU2VwIDE0IDIxOjAzOjM4IDIwMTggKzAxMDAKPiAKPiAgICAgbGliL2ttczogU2tpcCBuby1v
cCBkaXNwbGF5IHVwZGF0ZXMKPiAKPiB3aGljaCBjcmVhdGVkIGFuIGluIG15IG9waW5pb24gc2Vy
aW91cyBBUEkgaXNzdWUgYnkgc2lsZW50bHkgZHJvcHBpbmcKPiBwb3NzaWJsZSBlcnJvcnMgb24g
dGhlIGZsb29yLiBJbnN0ZWFkIG9mIHNpbGVudGx5IHNlY29uZCBndWVzcyB3aGF0Cj4gdGhlIHRl
c3QgbWlnaHQgaGF2ZSB3YW50ZWQgdG8gZG8gaW4gdGhlIGFic2VuY2Ugb2YgZGlzcGxheSBvdXRw
dXRzCj4gaXQncyBtdWNoIGJldHRlciB0byBiZSBleHBsaWNpdCwgYW5kIGVuZm9yY2UgdGhhdC4K
PiAKPiB2MjogSW1wcm92ZSBjb21taXQgbWVzc2FnZS4KPiAKPiB2MzogU3dpdGNoIHRvIGFuIGFz
c2VydCBhbmQgdXBkYXRlIGNvbW1lbnRzLCB0byBtYWtlIGl0IGNsZWFyIHRoaXMgaXMKPiBpZ3Rf
ZGlzcGxheSBhcGkgYWJ1c2UgKEFyZWspLgo+IAo+IENjOiBBbnRvbmlvIEFyZ2Vuemlhbm8gPGFu
dG9uaW8uYXJnZW56aWFub0BpbnRlbC5jb20+Cj4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hy
aXMtd2lsc29uLmNvLnVrPgo+IENjOiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBp
bnRlbC5jb20+Cj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51
eC5pbnRlbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxh
bmtob3JzdEBsaW51eC5pbnRlbC5jb20+ICh2MikKPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KCkFja2VkLWJ5OiBBcmthZGl1c3ogSGlsZXIg
PGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldgo=
