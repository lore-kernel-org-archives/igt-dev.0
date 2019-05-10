Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035AB899C4
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2019 09:22:37 +0000 (UTC)
Date: Fri, 10 May 2019 12:22:35 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190510092235.GJ22949@platvala-desk.ger.corp.intel.com>
References: <20190510000604.3580-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190510000604.3580-1-lyude@redhat.com>
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Use glib's regex utilities
 instead of POSIX ERE
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
To: Lyude <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBNYXkgMDksIDIwMTkgYXQgMDg6MDY6MDRQTSAtMDQwMCwgTHl1ZGUgd3JvdGU6Cj4g
RnJvbTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiAKPiBQT1NJWCBFUkUsIHdoaWxl
IHByZXR0eSBzdGFuZGFyZCBpcyBhbHNvIHZlcnkgb2xkIGFuZCBzZXZlcmVseSBsaW1pdGVkLgo+
IEluIGZhY3QsIGl0J3Mgc28gbGltaXRlZCB0aGF0IEludGVsIENJJ3Mgb3duIHRlc3QgYmxhY2ts
aXN0LAo+IHRlc3RzL2ludGVsLWNpL2JsYWNrbGlzdC50eHQsIGRvZXNuJ3QgZXZlbiB3b3JrIHdp
dGggaXQgZHVlIHRvIHRoZSBsYWNrCj4gb2Ygc3VwcG9ydCBmb3IgYmFja3JlZmVyZW5jZXMuCgpT
aWRlIG5vdGU6IEV2ZW4gd2l0aCB0aGVzZSBjaGFuZ2VzLCBub3RoaW5nIGNhbiBjdXJyZW50bHkg
ZWF0CmJsYWNrbGlzdC50eHQgYXMgaXMuIFNpdHRpbmcgdGlnaHRseSBpbiBteSBUT0RPIGlzIHRv
IGltcGxlbWVudCB0aGUKZmluYWwgcGllY2Ugb2YgdGhlIHBpcGVsaW5lIHRoYXQgQ0kgdXNlcyBw
aWdsaXQgZm9yIHdpdGggaWd0X3J1bm5lciwKc2NyaXB0cy9ydW4tdGVzdHMuc2ggLWwsIHdpdGgg
c29tZXRoaW5nIHRoYXQgY2FuIHByb2Nlc3MKYmxhY2tsaXN0LnR4dC4gVGhlc2UgY2hhbmdlcyBh
cmUgdGhlIGZpcnN0IHN0ZXAgdG93YXJkcyB0aGF0LCB0aGFua3MKZm9yIGRvaW5nIHRoaXMuCgpJ
biBvdGhlciB3b3JkcywgdGhpcyBkb2Vzbid0IGltcGxlbWVudCB3aGF0IEkgZ3Vlc3MgeW91J3Jl
IHRyeWluZyB0bwpkbyBidXQgaXQncyBuZWVkZWQsIHNvCgpSZXZpZXdlZC1ieTogUGV0cmkgTGF0
dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldg==
