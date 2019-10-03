Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB386EA79
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Oct 2019 20:05:02 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20191003195854.18208-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20191003195854.18208-1-ville.syrjala@linux.intel.com>
Message-ID: <157013309661.12925.8971461257324654851@skylake-alporthouse-com>
Date: Thu, 03 Oct 2019 21:04:56 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_fb: Fix XBGB->XBGR typo
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDE5LTEwLTAzIDIwOjU4OjUzKQo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gQSBzbGlnaHQg
dHlwbyBzbGlwcGVkIGluLCBmaXggaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOk
bMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiAtLS0KPiAgbGliL2lndF9mYi5j
IHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9mYi5jIGIvbGliL2lndF9mYi5jCj4gaW5kZXggNDFj
NjQ2ZDY1NWQ2Li5kYjc4OWFlNzk0NTggMTAwNjQ0Cj4gLS0tIGEvbGliL2lndF9mYi5jCj4gKysr
IGIvbGliL2lndF9mYi5jCj4gQEAgLTE1Nyw3ICsxNTcsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGZvcm1hdF9kZXNjX3N0cnVjdCB7Cj4gICAgICAgICAgIC5udW1fcGxhbmVzID0gMSwgLnBsYW5l
X2JwcCA9IHsgMzIsIH0sCj4gICAgICAgICAgIC5oc3ViID0gMSwgLnZzdWIgPSAxLAo+ICAgICAg
ICAgfSwKPiAtICAgICAgIHsgLm5hbWUgPSAiWEJHQjIxMDEwMTAiLCAuZGVwdGggPSAtMSwgLmRy
bV9pZCA9IERSTV9GT1JNQVRfWEJHUjIxMDEwMTAsCj4gKyAgICAgICB7IC5uYW1lID0gIlhCR1Iy
MTAxMDEwIiwgLmRlcHRoID0gLTEsIC5kcm1faWQgPSBEUk1fRk9STUFUX1hCR1IyMTAxMDEwLAoK
R2FoLCBldmVuIGFmdGVyIGJlaW5nIHRvbGQgdGhlcmUncyBhIHR5cG8gb24gdGhpcyBsaW5lLCBp
dCBzdGlsbCB0b29rCnNldmVyYWwgcGFzc2VzIHRvIHNwb3QgaXQuClJldmlld2VkLWJ5OiBDaHJp
cyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4gIyAhUHJvb2ZSZWFkZXIKLUNocmlz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
