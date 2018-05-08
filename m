Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F3D6E621
 for <igt-dev@lists.freedesktop.org>; Tue,  8 May 2018 08:50:53 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180508084745.GI18898@ahiler-desk1.ger.corp.intel.com>
References: <20180430092848.10830-1-petri.latvala@intel.com>
 <20180430092848.10830-4-petri.latvala@intel.com>
 <20180508084745.GI18898@ahiler-desk1.ger.corp.intel.com>
Message-ID: <152576943944.24602.8208515769749591272@mail.alporthouse.com>
Date: Tue, 08 May 2018 09:50:39 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] runner: New test runner
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>, Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, Tomi Sarvela <tomi.p.sarvela@intel.com>, Martin Peres <martin.peres@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBcmthZGl1c3ogSGlsZXIgKDIwMTgtMDUtMDggMDk6NDc6NDUpCj4gT24gTW9uLCBB
cHIgMzAsIDIwMTggYXQgMTI6Mjg6NDdQTSArMDMwMCwgUGV0cmkgTGF0dmFsYSB3cm90ZToKPiA+
IGRpZmYgLS1naXQgYS9ydW5uZXIvcmVzdWx0Z2VuLmMgYi9ydW5uZXIvcmVzdWx0Z2VuLmMKPiA+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMC4uOTc4YzA3YmUKPiA+IC0t
LSAvZGV2L251bGwKPiA+ICsrKyBiL3J1bm5lci9yZXN1bHRnZW4uYwo+ID4gQEAgLTAsMCArMSw4
NjQgQEAKPiA+ICsjaW5jbHVkZSA8Y3R5cGUuaD4KPiA+ICsjaW5jbHVkZSA8ZmNudGwuaD4KPiA+
ICsjaW5jbHVkZSA8c3RkaW8uaD4KPiA+ICsjaW5jbHVkZSA8c3RyaW5nLmg+Cj4gPiArI2luY2x1
ZGUgPHN5cy9tbWFuLmg+Cj4gPiArI2luY2x1ZGUgPHN5cy9zdGF0Lmg+Cj4gPiArI2luY2x1ZGUg
PHN5cy90eXBlcy5oPgo+ID4gKyNpbmNsdWRlIDx1bmlzdGQuaD4KPiA+ICsKPiA+ICsjaW5jbHVk
ZSA8anNvbi5oPgo+ID4gKwo+ID4gKyNpbmNsdWRlICJyZXN1bHRnZW4uaCIKPiA+ICsjaW5jbHVk
ZSAic2V0dGluZ3MuaCIKPiA+ICsjaW5jbHVkZSAiZXhlY3V0b3IuaCIKPiA+ICsjaW5jbHVkZSAi
aWd0X2NvcmUuaCIKPiA+ICsKPiA+ICtzdGF0aWMgY2hhciBzdWJ0ZXN0X3Jlc3VsdF9iZWdbXSA9
ICJTdWJ0ZXN0ICI7Cj4gPiArc3RhdGljIHNpemVfdCBzdWJ0ZXN0X3Jlc3VsdF9sZW4gPSBzaXpl
b2Yoc3VidGVzdF9yZXN1bHRfYmVnKSAtIDE7Cj4gCj4gX2JlZ18KPiAKPiA+ICtzdGF0aWMgY2hh
ciBzdGFydGluZ19zdWJ0ZXN0W10gPSAiU3RhcnRpbmcgc3VidGVzdDogIjsKPiA+ICtzdGF0aWMg
c2l6ZV90IHN0YXJ0aW5nX2xlbiA9IHNpemVvZihzdGFydGluZ19zdWJ0ZXN0KSAtIDE7Cj4gCj4g
X3N1YnRlc3RfCj4gCj4gPiArc3RhdGljIGNoYXIgc3RhcnRpbmdfc3VidGVzdF9kbWVzZ1tdID0g
Ijogc3RhcnRpbmcgc3VidGVzdCAiOwo+ID4gK3N0YXRpYyBzaXplX3Qgc3RhcnRpbmdfc3VidGVz
dF9kbWVzZ19sZW4gPSBzaXplb2Yoc3RhcnRpbmdfc3VidGVzdF9kbWVzZykgLSAxOwo+IAo+IEFM
TF9DQVBTIG9yIHNvbWV0aGluZyBlbHNlIGZvciByZWFkYWJpbGl0eSBwbGVhc2UuIE90aGVyd2lz
ZSBpdCBpcyBlYXN5Cj4gdG8gZ2V0IGxvc3QgdHJhY2sgb2Ygd2hhdCBpcyB3aGF0IGluIHNvbWUg
b2YgdGhlIHBhcnNpbmcgZnVuY3Rpb25zCj4gZG93biBiZWxvdywgZHVlIHRvIHNpbWlsYXIgbmFt
aW5nLgoKSXQncyBhbHNvIHRoZSBvcHRpbWlzYXRpb24gdGhlIGNvbXBpbGVyIHdpbGwgbWFrZSBm
b3IKc3RybGVuKGNvbnN0YW50X3N0aW5nKSwgc28gZG9uJ3QgYm90aGVyLCBqdXN0IG1ha2Ugc3Vy
ZSB0aGV5IGFyZSBrbm93bgpjb25zdGFudC4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldgo=
