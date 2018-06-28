Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2856ED3B
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Jun 2018 11:46:12 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id r17-v6so4981000edo.13
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Jun 2018 04:46:12 -0700 (PDT)
Date: Thu, 28 Jun 2018 13:46:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20180628114608.GT13978@phenom.ffwll.local>
References: <20180621110625.14201-2-petri.latvala@intel.com>
 <20180625071006.12736-1-arkadiusz.hiler@intel.com>
 <87zhzfs1hk.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87zhzfs1hk.fsf@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3] meson: Add options to control
 optional parts
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
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Matt Turner <mattst88@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjgsIDIwMTggYXQgMTI6Mjk6MjdQTSArMDMwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gT24gTW9uLCAyNSBKdW4gMjAxOCwgQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGls
ZXJAaW50ZWwuY29tPiB3cm90ZToKPiA+IEZyb206IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZh
bGFAaW50ZWwuY29tPgo+ID4KPiA+IERpc3RyaWJ1dGlvbnMgd2FudCBleHBsaWNpdCBjb250cm9s
IG92ZXIgb3B0aW9uYWwgcGFydHMgc28gdGhleSBjYW4KPiA+IHN0YXRlIHJ1bnRpbWUgZGVwZW5k
ZW5jaWVzIGJlZm9yZSBidWlsZGluZy4gTGV0J3MgcmVzdG9yZSB0aGUKPiA+IGZ1bmN0aW9uYWxp
dHkgYXV0b3Rvb2xzIHVzZWQgdG8gcHJvdmlkZS4KPiA+Cj4gPiBXaGVyZSBwb3NzaWJsZSwgdGhl
IHNlbGVjdGlvbiBpcyBkb25lIGJ5IGNob29zaW5nIHdoZXRoZXIgdG8gYnVpbGQgYQo+ID4gcGFy
dGljdWxhciBpdGVtIGFuZCB0aGUgb3B0aW9uIG5hbWUgaXMgYnVpbGRfJGl0ZW0uIEV4YW1wbGU6
Cj4gPiBidWlsZF9vdmVybGF5LiBXaGVyZSBub3QgcG9zc2libGUsIHRoZSBvcHRpb24gbmFtZSBp
cwo+ID4gd2l0aF8kaXRlbS4gRXhhbXBsZTogd2l0aF92YWxncmluZC4KPiA+Cj4gPiBBcnJheSBv
cHRpb25zIHJlcXVpcmUgYSBidW1wIG9mIHJlcXVpcmVkIG1lc29uIHZlcnNpb24gdG8gMC40NC4g
RGViaWFuCj4gPiBzdGFibGUgaGFzIG1lc29uIDAuMzcgd2hpY2ggaXMgYWxyZWFkeSB0b28gb2xk
LCBzdGFibGUtYmFja3BvcnRzIGhhcwo+ID4gMC40NSwgQ0kgdXNlcyAwLjQ1LiBNZXNhJ3MgbWVz
b24gcmVxdWlyZW1lbnQgaXMgMC40NC4xLCBmb3IgYQo+ID4gcGVyc3BlY3RpdmUuCj4gCj4gSSdt
IGZpbmUgd2l0aCB0aGUgbWVzb24gdmVyc2lvbiByZXF1aXJlbWVudC4gSG93ZXZlciwgZm9yIHNv
bWUgcmVhc29uCj4gdGhlIG1lc29uX3ZlcnNpb24gOiAnPjAuNDQuMCcgZG9lc24ndCB0YWtlIGVm
ZmVjdCBmb3IgbWVzb25fb3B0aW9ucy50eHQ6Cj4gCj4gIiIiCj4gJCBybSAtcmYgYnVpbGQ7IG1l
c29uIGJ1aWxkCj4gVGhlIE1lc29uIGJ1aWxkIHN5c3RlbQo+IFZlcnNpb246IDAuNDIuMQo+IFNv
dXJjZSBkaXI6IC9ob21lL2phbmkvc3JjL2ludGVsLWdwdS10b29scwo+IEJ1aWxkIGRpcjogL2hv
bWUvamFuaS9zcmMvaW50ZWwtZ3B1LXRvb2xzL2J1aWxkCj4gQnVpbGQgdHlwZTogbmF0aXZlIGJ1
aWxkCj4gCj4gTWVzb24gZW5jb3VudGVyZWQgYW4gZXJyb3IgaW4gZmlsZSBtZXNvbl9vcHRpb25z
LnR4dCwgbGluZSA3LCBjb2x1bW4gMDoKPiBVbmtub3duIHR5cGUgYXJyYXkuCj4gIiIiCj4gCj4g
SSBjYW4gb2J2aW91c2x5IGp1c3QgdXBkYXRlIG1lc29uIG5vdyB0aGF0IEkgZmlndXJlZCBpdCBv
dXQsIGJ1dCBpcwo+IHRoZXJlIHNvbWV0aGluZyB3ZSBjb3VsZCBkbyB0byBiZSBtb3JlIGhlbHBm
dWwgZm9yIHRoZSBuZXh0IHBlcnNvbgo+IGhpdHRpbmcgdGhpcz8KCkh1aCwgaW4gbXkgdGVzdGlu
ZyB3aXRoIG9sZGVyIG1lc29uIGl0IGJhaWxlZCBvdXQgcmlnaHQgYXdheSBhZnRlcgpzcG90dGlu
ZyB0aGUgdmVyc2lvbiByZXF1aXJlbWVudCBpbiB0aGUgbWFpbiBtZXNvbi5idWlsZCBmaWxlIGlu
IHRoZSByb290CmRpcmVjdG9yeS4gTm8gaWRlYSBob3cgeW91IG1hbmFnZWQgdG8gZ2V0IHBhc3Qg
dGhhdC4KCkNvdW50IG1lIGJhZmZsZWQgLi4uCi1EYW5laWwKLS0gCkRhbmllbCBWZXR0ZXIKU29m
dHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
