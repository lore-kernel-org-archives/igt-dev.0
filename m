Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3E389183
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2019 13:56:04 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id p26so4285375edr.2
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2019 06:56:04 -0700 (PDT)
Date: Wed, 15 May 2019 15:55:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190515135559.GK17751@phenom.ffwll.local>
References: <20190515101956.935-1-petri.latvala@intel.com>
 <CACvgo50TYVbv4t_0jG3bsMgPy=Om-Yo_mnCq_dqsF32KHSF6hQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo50TYVbv4t_0jG3bsMgPy=Om-Yo_mnCq_dqsF32KHSF6hQ@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] Revert "tests/core_unauth_vs_render:
 new test for the relaxed DRM_AUTH handling"
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
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: IGT development <igt-dev@lists.freedesktop.org>, Petri Latvala <petri.latvala@intel.com>, Emil Velikov <emil.velikov@collabora.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMDE6MTE6NTBQTSArMDEwMCwgRW1pbCBWZWxpa292IHdy
b3RlOgo+IE9uIFdlZCwgMTUgTWF5IDIwMTkgYXQgMTE6MjAsIFBldHJpIExhdHZhbGEgPHBldHJp
LmxhdHZhbGFAaW50ZWwuY29tPiB3cm90ZToKPiA+Cj4gPiBUaGUga2VybmVsIHBhdGNoIGZvciBy
ZWxheGVkIERSTV9BVVRIIGhhbmRsaW5nIGNhdXNlZCBhIHJlZ3Jlc3Npb24sCj4gPiBoaWdobGln
aHRpbmcgYnVnIGluIHRoZSBSQURWIGltcGxlbWVudGF0aW9uLCBhbmQgd2FzIHJldmVydGVkLiBU
aGUKPiA+IHBhdGNoIHdpbGwgYmUgcmVpbnN0YXRlZCwgbGlrZWx5IGluIGRpZmZlcmVudCBmb3Jt
LCBhbHRob3VnaCB1bnRpbAo+ID4gdGhlbiBkaXNhYmxlIHRoZSB0ZXN0Lgo+ID4KPiA+IFNlZSB0
aGUgdGhyZWFkIGZvciBkZXRhaWxzLgo+ID4KPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LUFwcmlsLzIxNTAxOC5odG1sCj4gPgo+ID4gVGhp
cyByZXZlcnRzIGNvbW1pdCA5MGY3OGFjNzA0NzE4YTRkYzA4OWNhOTkwNDFmMDMyMTkxYzZmOGIx
Lgo+ID4KPiA+IEJ1Z3ppbGxhOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVn
LmNnaT9pZD0xMTA0NjcKPiA+IFNpZ25lZC1vZmYtYnk6IFBldHJpIExhdHZhbGEgPHBldHJpLmxh
dHZhbGFAaW50ZWwuY29tPgo+ID4gQ2M6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxh
Ym9yYS5jb20+Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4K
PiA+IC0tLQo+ID4KPiA+IFJhdGhlciB0aGFuIGFkZGluZyAjaWYgMAo+ID4gKGh0dHBzOi8vcGF0
Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNTk5NDUvKSBiZXR0ZXIgdG8gY29tcGxldGVs
eQo+ID4gcmV2ZXJ0IGZvciBub3cuCj4gCj4gQWNrZWQtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52
ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gCj4gU3RydWdnbGluZyB0byBzZWUgaG93IGEgcmV2ZXJ0
IGlzIGJldHRlciwgYnV0IGhleSAtIEknbSBnbGFkIHRvIHNlZQo+IHNvbWUgcHJvZ3Jlc3MgYWZ0
ZXIgMyB3ZWVrcyBvZiBzaWxlbmNlLgo+IFNwZWFraW5nIG9mIHByb2dyZXNzLCB3aG8gZG8gSSBu
ZWVkIHRvIGJyaWJlXldwb2tlIHRvIGdldCB0aGlzIFsxXQo+IHRyaXZpYWwgcGF0Y2ggbWVyZ2Vk
Pwo+IAo+IEhUSAo+IC1FbWlsCj4gCj4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9w
Lm9yZy9wYXRjaC8zMDIwNDkvCgpTaW1vbiBoYXMgY29tbWl0IHJpZ2h0cyBhbmQgci1iLCBqdXN0
IHBpbmcgaGltLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJ
bnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2lndC1kZXY=
