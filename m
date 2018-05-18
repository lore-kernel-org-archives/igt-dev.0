Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B9E6ED6F
 for <igt-dev@lists.freedesktop.org>; Fri, 18 May 2018 13:00:24 +0000 (UTC)
Date: Fri, 18 May 2018 16:00:06 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20180518130006.GV23723@intel.com>
References: <20180517195148.5765-1-ville.syrjala@linux.intel.com>
 <20180517195148.5765-8-ville.syrjala@linux.intel.com>
 <152659691631.4210.13911231106136420282@mail.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <152659691631.4210.13911231106136420282@mail.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t 08/10] lib: Add support for rendering
 into packed YCbCr framebuffers
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBNYXkgMTcsIDIwMTggYXQgMTE6NDE6NTZQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgVmlsbGUgU3lyamFsYSAoMjAxOC0wNS0xNyAyMDo1MTo0NikKPiA+ICsv
KiB7IFkwLCBVLCBZMSwgViB9ICovCj4gPiArc3RhdGljIGNvbnN0IHVuc2lnbmVkIGNoYXIgc3dp
enpsZV95dXl2W10gPSB7IDAsIDEsIDIsIDMgfTsKPiA+ICtzdGF0aWMgY29uc3QgdW5zaWduZWQg
Y2hhciBzd2l6emxlX3l2eXVbXSA9IHsgMCwgMywgMiwgMSB9Owo+ID4gK3N0YXRpYyBjb25zdCB1
bnNpZ25lZCBjaGFyIHN3aXp6bGVfdXl2eVtdID0geyAxLCAwLCAzLCAyIH07Cj4gCj4gPiArc3Rh
dGljIGNvbnN0IHVuc2lnbmVkIGNoYXIgc3dpenpsZV92eXV5W10gPSB7IDEsIDIsIDMsIDAgfTsK
PiAKPiBUaGlzIG9uZSBzdGFuZHMgb3V0IGFzIGJhY2t3YXJkcy4gSXMgaXQgYSB2eXV5X3Jldj8K
CkhtbS4gSSB0aGluayBpdCdzIGNvcnJlY3QuCgpzd2l6emxlW10gdGVsbHMgdXMgaW4gd2hpY2gg
b2Zmc2V0IGluIHRoZSBtYWNyb3BpeGVsIHdlIGZpbmQgdGhlCmNvbXBvbmVudC4gVGhlIGluZGV4
IGRldGVybWluZXMgd2hpY2ggY29tcG9uZW50IHdlIHdhbnQuCgpzd2l6emxlWzBdID0gb2Zmc2V0
IG9mIFkwCnN3aXp6bGVbMV0gPSBvZmZzZXQgb2YgVQpzd2l6emxlWzJdID0gb2Zmc2V0IG9mIFkx
CnN3aXp6bGVbM10gPSBvZmZzZXQgb2YgVgoKc28gZm9yIHRoZSB2eXV5IGNhc2UgdGhlIG1hY3Jv
cGl4ZWwgbGF5b3V0IHdpbGwgYmU6CgpieXRlOiAwICAgICAgICAgIDEgICAgICAgICAgMiAgICAg
ICAgICAzCiAgICAgIHN3aXp6bGVbM10gc3dpenplbFswXSBzd2l6emxlWzFdIHN3aXp6bGVbMl0K
ICAgICAgViAgICAgICAgICBZMCAgICAgICAgIFUgICAgICAgICAgWTEKClNlZW1zIHRvIG1ha2Ug
c29tZSBzZW5zZSwgYXQgbGVhc3QgdG8gbWUuCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
