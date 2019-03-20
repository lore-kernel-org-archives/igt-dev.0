Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB9B89FD4
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2019 16:52:28 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190320164050.GF30702@intel.com>
References: <20190319192320.10526-1-chris@chris-wilson.co.uk>
 <20190320164050.GF30702@intel.com>
Message-ID: <155309975207.15790.7075400941662429787@skylake-alporthouse-com>
Date: Wed, 20 Mar 2019 16:35:52 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_mocs_settings/mocs-isolation:
 Filter out missing rings
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
To: "Kumar Valsan, Prathap" <prathap.kumar.valsan@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBLdW1hciBWYWxzYW4sIFByYXRoYXAgKDIwMTktMDMtMjAgMTY6NDA6NTApCj4gT24g
VHVlLCBNYXIgMTksIDIwMTkgYXQgMDc6MjM6MjBQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdyb3Rl
Ogo+ID4gRG9uJ3QgdHJ5IHRvIGV2YWx1YXRlIHdoZXRoZXIgcmVhZHMgZXhlY3V0ZWQgb24gYW4g
YWJzZW50IHJpbmcgZG8KPiA+IGFueXRoaW5nLgo+IAo+IENocmlzLAo+IAo+IEkgYW0gdHJ5aW5n
IHRvIHVuZGVyc3RhbmQgdGhpcyBwYXRjaCBhbmQgaGFzIHRoaXMgcXVlc3Rpb24uCj4gQUZBSUsg
ZXZlcnkgR1BVIGVuZ2luZSBoYXMgYW4gYXNzb3NpYXRlZCByaW5nIGJ1ZmZlciBwZXIKPiBjb250
ZXh0LiBBYnNlbnQgcmluZyBpcyBhIGVycm9yIGNhc2U/CgpOb3QgYWxsIEhXIGhhcyB0aGUgc2Ft
ZSBzZXQgb2YgZW5naW5lcyBhdmFpbGFibGUuIEFuZCB3ZSBzaG91bGQgZ2V0IGEKZmFpbHVyZSBm
cm9tIGdlbV9leGVjYnVmKCkgaWYgeW91IHRyeSB0byBkaXNwYXRjaCBzb21ldGhpbmcgb24gYSBy
aW5nCnRoYXQgZGlkbid0IGV4aXN0LiBXaGF0IEkgaGF2ZW4ndCBhY3R1YWxseSBhbnN3ZXJlZCBp
cyB3aHkgd2UgYWN0dWFsbHkKaGl0IGEgZmFpbHVyZSBsYXRlci4gQnV0IGl0J3MgZGVmaW5pdGVs
eSBhIHJlcXVpcmVtZW50IG9mIHRoZSB0ZXN0IHRoYXQKdGhlIGVuZ2luZSBleGlzdC4KLUNocmlz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
