Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C5D89D4D
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jan 2019 13:07:46 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190122125940.13898-1-jani.nikula@intel.com>
References: <20190122125940.13898-1-jani.nikula@intel.com>
Message-ID: <154816244782.1277.8411319537664432112@skylake-alporthouse-com>
Date: Tue, 22 Jan 2019 13:07:28 +0000
Subject: Re: [igt-dev] [UNTESTED RFC] tests: drop openssl dependency in
 favor of glib sha1 implementation
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
To: Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, Tomi Valkeinen <tomi.valkeinen@ti.com>, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBKYW5pIE5pa3VsYSAoMjAxOS0wMS0yMiAxMjo1OTo0MCkKPiBXZSBhbHJlYWR5IGRl
cGVuZCBvbiBnbGliIHdoaWNoIGhhcyBzaGExLCBzbyB3ZSBkb24ndCByZWFsbHkgbmVlZAo+IG9w
ZW5zc2wganVzdCBmb3Igc2hhMS4KPiAKPiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13
aWxzb24uY28udWs+Cj4gQ2M6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBsaW51eC5p
bnRlbC5jb20+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogVG9t
aSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKYW5p
IE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgo+IAo+IC0tLQo+IAo+IFVudGVzdGVkLgoK
Tm93IHRlc3RlZC4KCkkganVzdCB3aXNoIGdsaWIgd2FzIHRoZSBDIGxpYnJhcnkgSSB3aXNoZWQg
aXQgdG8gYmUgOigKClJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNv
bi5jby51az4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
