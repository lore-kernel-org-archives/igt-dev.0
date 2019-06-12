Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D82896C4
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2019 15:15:30 +0000 (UTC)
Date: Wed, 12 Jun 2019 18:15:25 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20190612151525.vo55aujc7w5eqt35@ahiler-desk1.fi.intel.com>
References: <20190612125222.8447-1-arkadiusz.hiler@intel.com>
 <156034448740.5468.5235353527911714652@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156034448740.5468.5235353527911714652@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_aux/hang_detector: Don't enable
 reset if it's explicitly disabled
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
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMDI6MDE6MjdQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgQXJrYWRpdXN6IEhpbGVyICgyMDE5LTA2LTEyIDEzOjUyOjIyKQo+ID4g
V2UgZG9uJ3QgZXhwZWN0IHRvIGhhbmcgZHVyaW5nIHRoZSB0ZXN0cyB1c2luZyBoYW5nX2RldGVj
dG9yLCBhbmQgdGhlCj4gPiBvbmx5IGRpZmZlcmVuY2UgaXMgbW9yZSBzZXZlcmUgZmFsbG91dCBp
biBjYXNlIGEgaGFuZyBhY3R1YWxseSBoYXBwZW5zCj4gPiBhbmQgZmV3ZXIgc3VycHJpc2VkIHBl
b3BsZSBzZWVpbmcgcmVzZXQgbXlzdGVyaW91c2x5IGVuYWJsZWQgYSBjb3VwbGUgb2YKPiA+IHRl
c3RzIGRvd24gdGhlIGxpbmUuCj4gCj4gSSBkb24ndCB0aGluayB0aGlzIGlzIHdpc2UuIFRoZXkg
Y2FuIHVzZSB0aGUgZXhpc3RpbmcgSUdUIGVudmFycyBzdXJlbHk/Cj4gCj4gSWYgdGhlIG1hY2hp
bmUgaXMgbm90IGNhcGFibGUgb2YgcmVzZXRzLCBpdCBzaG91bGRuJ3QgZmFsbCB1cG9uIHRoZQo+
IHVzZXJzIHRvIGhhdmUgdG8gZGlzYWJsZSBpdC4KPiAtQ2hyaXMKCkZhaXIgcG9pbnQsIHRoZSBr
ZXJuZWwgc2hvdWxkIGJlIHdpc2UgZW5vdWdoIHRvIGRpc2FibGUgdGhlIHJlc2V0IGFuZAprZWVw
IGl0IGRpc2FibGVkLiBGb3IgdGhlIHRlc3QgdGhhdCBjaGVjayByZXNldCB0aGUgZW52IHZhcmlh
YmxlCm92ZXJyaWRlIHNob3VsZCBiZSBlbm91Z2guCgpEcm9wcGluZyB0aGUgcGF0Y2guCi1BcmVr
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
