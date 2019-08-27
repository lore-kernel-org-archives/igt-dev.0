Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D0C89220
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2019 15:28:48 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190827152504.7491-3-daniel.t.mrzyglod@intel.com>
References: <20190827152504.7491-1-daniel.t.mrzyglod@intel.com>
 <20190827152504.7491-3-daniel.t.mrzyglod@intel.com>
Message-ID: <156691970767.15406.5120507904035985423@skylake-alporthouse-com>
Date: Tue, 27 Aug 2019 16:28:27 +0100
Subject: Re: [igt-dev] [PATCH i-g-t v9 2/4] lib/intel_mmio: fix unnecessary
 casting in R/W register functions
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
To: Daniel Mrzyglod <daniel.t.mrzyglod@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgTXJ6eWdsb2QgKDIwMTktMDgtMjcgMTY6MjU6MDIpCj4gVGhpcyBwYXRj
aCByZW1vdmUgY2FzdCAodm9sYXRpbGUgY2hhciAqKSBiZWNvdXNlIHdlIGFsbG93IGFyaXRobWV0
aWMgb24KPiB2b2lkIHBvaW50ZXIuCj4gCj4gQ2M6IE1pY2hhbCBXaW5pYXJza2kgPG1pY2hhbC53
aW5pYXJza2lAaW50ZWwuY29tPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+
Cj4gQ2M6IEFudG9uaW8gQXJnZW56aWFubyA8YW50b25pby5hcmdlbnppYW5vQGludGVsLmNvbT4K
PiBDYzogRGFuaWVsZSBTcHVyaW8gQ2VyYW9sbyA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVs
LmNvbT4KPiBDYzogS2F0YXJ6eW5hIERlYyA8a2F0YXJ6eW5hLmRlY0BpbnRlbC5jb20+Cj4gQ2M6
IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IENjOiBQZXRyaSBMYXR2
YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KPiBDYzogWmJpZ25pZXcgS2VtcGN6ecWEc2tp
IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+Cj4gCj4gU2lnbmVkLW9mZi1ieTogRGFu
aWVsIE1yenlnbG9kIDxkYW5pZWwudC5tcnp5Z2xvZEBpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBD
aHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLUNocmlzCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
