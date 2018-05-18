Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E5F6ED78
 for <igt-dev@lists.freedesktop.org>; Fri, 18 May 2018 13:17:25 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180518130006.GV23723@intel.com>
References: <20180517195148.5765-1-ville.syrjala@linux.intel.com>
 <20180517195148.5765-8-ville.syrjala@linux.intel.com>
 <152659691631.4210.13911231106136420282@mail.alporthouse.com>
 <20180518130006.GV23723@intel.com>
Message-ID: <152664944056.13926.18097232894897858924@mail.alporthouse.com>
Date: Fri, 18 May 2018 14:17:20 +0100
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
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBWaWxsZSBTeXJqw6Rsw6QgKDIwMTgtMDUtMTggMTQ6MDA6MDYpCj4gT24gVGh1LCBN
YXkgMTcsIDIwMTggYXQgMTE6NDE6NTZQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4g
UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDE4LTA1LTE3IDIwOjUxOjQ2KQo+ID4gPiArLyogeyBZ
MCwgVSwgWTEsIFYgfSAqLwo+ID4gPiArc3RhdGljIGNvbnN0IHVuc2lnbmVkIGNoYXIgc3dpenps
ZV95dXl2W10gPSB7IDAsIDEsIDIsIDMgfTsKPiA+ID4gK3N0YXRpYyBjb25zdCB1bnNpZ25lZCBj
aGFyIHN3aXp6bGVfeXZ5dVtdID0geyAwLCAzLCAyLCAxIH07Cj4gPiA+ICtzdGF0aWMgY29uc3Qg
dW5zaWduZWQgY2hhciBzd2l6emxlX3V5dnlbXSA9IHsgMSwgMCwgMywgMiB9Owo+ID4gCj4gPiA+
ICtzdGF0aWMgY29uc3QgdW5zaWduZWQgY2hhciBzd2l6emxlX3Z5dXlbXSA9IHsgMSwgMiwgMywg
MCB9Owo+ID4gCj4gPiBUaGlzIG9uZSBzdGFuZHMgb3V0IGFzIGJhY2t3YXJkcy4gSXMgaXQgYSB2
eXV5X3Jldj8KPiAKPiBIbW0uIEkgdGhpbmsgaXQncyBjb3JyZWN0Lgo+IAo+IHN3aXp6bGVbXSB0
ZWxscyB1cyBpbiB3aGljaCBvZmZzZXQgaW4gdGhlIG1hY3JvcGl4ZWwgd2UgZmluZCB0aGUKPiBj
b21wb25lbnQuIFRoZSBpbmRleCBkZXRlcm1pbmVzIHdoaWNoIGNvbXBvbmVudCB3ZSB3YW50Lgo+
IAo+IHN3aXp6bGVbMF0gPSBvZmZzZXQgb2YgWTAKPiBzd2l6emxlWzFdID0gb2Zmc2V0IG9mIFUK
PiBzd2l6emxlWzJdID0gb2Zmc2V0IG9mIFkxCj4gc3dpenpsZVszXSA9IG9mZnNldCBvZiBWCgpT
byBJIHdhcyByZWFkaW5nIGl0IGFzIHRoZSBpbnZlcnNlIG1hcHBpbmcsCgpzd2l6emxlX3Z5dXk6
CglieXRlIDAgPSB2LCByZWFkIG9mZnNldCAxCglieXRlIDEgPSB5LCByZWFkIG9mZnNldCAyCgli
eXRlIDIgPSB1LCByZWFkIG9mZnNldCAzCglieXRlIDMgPSB5LCByZWFkIG9mZnNldCAwCgpidXQg
dGhlIGluY29taW5nIG9mZnNldHMgYXJlIHl1eXYsIHNvIEkgcmVhZCB7IDEsIDIsIDMsIDAgfSBh
cyB1eXZ5LgoKRnJvbSB0aGlua2luZyB0aGF0Cglzd2l6emxlX3JnYmEgPSB7IDAsIDEsIDIsIDMg
fQoJc3dpenpsZV9ycnJyID0geyAwLCAwLCAwLCAwIH0KLUNocmlzCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
