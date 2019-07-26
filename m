Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B05A6EE57
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jul 2019 20:57:36 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <ca157c90-292f-9a13-aeb2-a434b1b51e02@intel.com>
References: <20190725203354.6757-1-lucas.demarchi@intel.com>
 <20190725203354.6757-2-lucas.demarchi@intel.com>
 <ca157c90-292f-9a13-aeb2-a434b1b51e02@intel.com>
Message-ID: <156417464432.21451.7245606376501365382@skylake-alporthouse-com>
Date: Fri, 26 Jul 2019 21:57:24 +0100
Subject: Re: [igt-dev] [PATCH 2/5] i915/gem_mocs_settings: do not set
 undefined entries to PTE
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
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWxlIENlcmFvbG8gU3B1cmlvICgyMDE5LTA3LTI2IDIxOjQ5OjI4KQo+IAo+
IAo+IE9uIDcvMjUvMTkgMTozMyBQTSwgTHVjYXMgRGUgTWFyY2hpIHdyb3RlOgo+ID4gSW4gdGhl
IEljZSBMYWtlIHRhYmxlIHdlIGFyZSBzZXR0aW5nIGFsbCB1bmRlZmluZWQgZW50cmllcyB0byBQ
VEUuCj4gPiBXaXRoIFRpZ2VyIExha2UgdGhpcyB3b24ndCBiZSB0cnVlIGFueW1vcmUuIEV2ZW4g
aWYgZm9yIHRlc3QgaW4gSUdUIHdlCj4gPiBhZGQgYSBuZXcgdGFibGUgZm9yIFRpZ2VyIExha2Us
IGluIGtlcm5lbCB0aGV5IGNhbiBiZSBzaGFyZXMgc2luY2UgdGhleQo+ID4gYXJlIHN1cHBvc2Vk
bHkgY29tcGF0aWJsZSAob25seSB1bnVzZWQgZW50cmllcyB3ZXJlIGFkZGVkIG9yIGJlY2FtZQo+
ID4gdW51c2VkKS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTHVjYXMgRGUgTWFyY2hpIDxsdWNh
cy5kZW1hcmNoaUBpbnRlbC5jb20+Cj4gCj4gQW5kIHdlIHNob3VsZG4ndCBiZSBndWFyYW50ZWVp
bmcgdGhhdCB1bnVzZWQgZW50cmllcyBhcmUgc2V0IHRvIAo+IHNvbWV0aGluZyBzZW5zaWJsZSBh
cyBwYXJ0IG9mIHRoZSBBQkkuCgpCZXR0ZXIgcmVwaHJhc2VkIGFzIHVuZGVmaW5lZCB2YWx1ZXMg
YXJlIHVuZGVmaW5lZC4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldg==
