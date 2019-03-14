Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616886E24B
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2019 09:18:58 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <be1fd64dfd5a9dc5580202ed6d09afced38a7c97.camel@intel.com>
References: <20190215214608.32021-1-prathap.kumar.valsan@intel.com>
 <20190312151425.3939-1-prathap.kumar.valsan@intel.com>
 <be1fd64dfd5a9dc5580202ed6d09afced38a7c97.camel@intel.com>
Message-ID: <155255511522.4168.9719509102188979293@skylake-alporthouse-com>
Date: Thu, 14 Mar 2019 09:18:45 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v5] i915/gem_mocs_settings: Add mocs
 table for icelake
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
To: "Kalamarz, Lukasz" <lukasz.kalamarz@intel.com>, "Kumar Valsan,
 Prathap" <prathap.kumar.valsan@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBLYWxhbWFyeiwgTHVrYXN6ICgyMDE5LTAzLTEzIDEzOjU4OjU5KQo+IE9uIFR1ZSwg
MjAxOS0wMy0xMiBhdCAxMToxNCAtMDQwMCwgUHJhdGhhcCBLdW1hciBWYWxzYW4gd3JvdGU6Cj4g
PiBGcm9tOiAiS3VtYXIgVmFsc2FuLCBQcmF0aGFwIiA8cHJhdGhhcC5rdW1hci52YWxzYW5AaW50
ZWwuY29tPgo+ID4gCj4gPiBUaGlzIHBhdGNoIGFkZHMgbW9jcyB0YWJsZSBmb3IgaWNlbGFrZSB3
aXRoIGV4cGVjdGVkIEwzIGFuZCBlRFJBTQo+ID4gY29udHJvbCB2YWx1ZXMuCj4gPiAKPiA+IFNp
Z25lZC1vZmYtYnk6IEt1bWFyIFZhbHNhbiwgUHJhdGhhcCA8cHJhdGhhcC5rdW1hci52YWxzYW5A
aW50ZWwuY29tPgo+ID4gLS0tCj4gCj4gQ2hyaXMgYW5kIFRvbWVrIHN1Z2dlc3RlZCBjcmVhdGlu
ZyBuZWdhdGl2ZSBzY2VuYXJpbywgdGhhdCB3aWxsIHZlcmlmeQo+IHNldHRpbmcgZGlydHkgbW9j
cyB2YWx1ZXMgaW5zdGVhZCBvZiBza2lwcGluZyBmb3IgZ2VuMTErLiBCdXQgaWYgdGhleQo+IHdp
bGwgYWdyZWUgdGhhdCB0aGlzIGlzIG5vdCBhIGJsb2NrZXIsIHRoZW4gCj4gU2lnbmVkLW9mZi1i
eTogTHVrYXN6IEthbGFtYXJ6IDxsdWthc3oua2FsYW1hcnpAaW50ZWwuY29tPgoKSXQgYWxsIGRl
cGVuZHMgb24gdGhlIGxldmVsIG9mIGNvbmZpZGVuY2UgaW4gZm9sbG93IHRocm91Z2guCgpMdWth
c3osIGRpZCB5b3UgbWVhbiBzLW8tYiBvciByLWI/IHMtby1iIGp1c3Qgc2F5cyB5b3UndmUgaGFu
ZGxlZCB0aGUKcGF0Y2ggaW4gc29tZSBvZmZpY2lhbCBjYXBhY2l0eTsgd2l0aCBhbiByLWIgeW91
IGNvbmZpcm0gdGhhdCB0aGUgcGF0Y2gKZG9lcyB3aGF0IGl0IHNheXMsIGFuZCB0aGF0IGl0IGlz
IGRvaW5nIHRoZSByaWdodCB0aGluZyAoZ2l2ZSBvciB0YWtlIHdlCmFyZSB0b3RhbGx5IG5vdCBy
b2JvdHMpLCBhbmQgc28gcmVhZHkgZm9yIGluY2x1c2lvbi4KLUNocmlzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
