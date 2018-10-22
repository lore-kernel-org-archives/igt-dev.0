Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FAEC899F3
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Oct 2018 14:26:03 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id z9-v6so6205094qto.7
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Oct 2018 07:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20181022084203.25118-1-arkadiusz.hiler@intel.com>
 <20181022120904.25566-1-arkadiusz.hiler@intel.com>
 <20181022141455.gz3p5x6ck24qv3jl@ahiler-desk1.fi.intel.com>
 <CAKMK7uEGU0aVEusENtQdX5NkeyaHUUNJ7C_gZ=cQ4Gsq=Rnu5Q@mail.gmail.com>
 <20181022142443.6qjjvdrhkai7b3bx@ahiler-desk1.fi.intel.com>
In-Reply-To: <20181022142443.6qjjvdrhkai7b3bx@ahiler-desk1.fi.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 22 Oct 2018 16:25:50 +0200
Message-ID: <CAKMK7uGGv0+ePe1EWDLQe+JB3GajPdv7f2shdr6qDYFD9iLiuQ@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] Add GitLab's CI/CD configuration
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: IGT development <igt-dev@lists.freedesktop.org>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjIsIDIwMTggYXQgNDoyNCBQTSBBcmthZGl1c3ogSGlsZXIKPGFya2FkaXVz
ei5oaWxlckBpbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBPY3QgMjIsIDIwMTggYXQgMDQ6
MTg6NTZQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+IE9uIE1vbiwgT2N0IDIyLCAy
MDE4IGF0IDQ6MTUgUE0gQXJrYWRpdXN6IEhpbGVyCj4gPiA8YXJrYWRpdXN6LmhpbGVyQGludGVs
LmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIE1vbiwgT2N0IDIyLCAyMDE4IGF0IDAzOjA5OjA0
UE0gKzAzMDAsIEFya2FkaXVzeiBIaWxlciB3cm90ZToKPiA+ID4gPiBUaGUgQ0kvQ0QgcGlwZWxp
bmUgaXMgY29uZmlndXJlZCB0aGUgZm9sbG93aW5nIHdheToKPiA+ID4gPiAgMS4gQnVpbGQgZG9j
a2VyIGltYWdlcyBhbmQgYWRkIHRoZW0gdG8gcmVwbydzIHJlZ2lzdHJ5IChtYW51YWwgc3RlcCBm
b3IKPiA+ID4gPiAgICAgbm93LCBhdXRvbWF0aW9uIG5lZWRzIEdpdExhYiB0byBiZSB1cGRhdGVk
KS4KPiA+ID4gPiAgMi4gQnVpbGQgaWd0IHdpdGggbWVzb24gb24gRGViaWFuIGFuZCBGZWRvcmEu
Cj4gPiA+ID4gIDMuIFJ1biBgbmluamEgdGVzdHNgIG9uIEZlZG9yYS4KPiA+ID4gPiAgNC4gQnVp
bGQgYW5kIHB1Ymxpc2ggZG9jcyBhcyBhbiBhcnRpZmFjdCwgZm9yIEdpdExhYiBQYWdlcy4KPiA+
ID4gPgo+ID4gPiA+IHYyOiBUeXBvcyBhbmQgZnVsbHktZmVhdHVyZWQgbWVzb24gYnVpbGQuCj4g
PiA+ID4KPiA+ID4gPiBDYzogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+
Cj4gPiA+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+Cj4g
PiA+Cj4gPiA+IEJvdGggaW1hZ2VzIGFyZSBhbHJlYWR5IGluIG91ciByZWdpc3RyeS4KPiA+ID4K
PiA+ID4gSGVyZSB5b3UgY2FuIHNlZSB0aGUgcGlwbGluZSBydW5uaW5nIChvbiBhIHRlc3Rpbmcg
YnJhbmNoKToKPiA+ID4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pZ3QtZ3B1
LXRvb2xzL3BpcGVsaW5lcy82MjkyCj4gPgo+ID4gSSB0aGluayB0aGUgInByb3BlciIgZ2l0bGFi
IHdheSBvZiBkb2luZyB0aGlzIGlzIG5vdCB0aHJvdWdoIGEKPiA+IHRlbXBvcmFyeSBicmFuY2gs
IGJ1dCB0aHJvdWdoIGEgbWVyZ2UgcmVxdWVzdC4gT3IgYSBwZXJzb25hbCBmb3JrLgo+ID4gR2l2
ZXMgeW91IHRoZSBleGFjdCBzYW1lIGFtb3VudCBvZiBnaXRsYWItY2kgdGVzdGluZyBhcyBhIGJy
YW5jaC4gSnVzdAo+ID4gYW4gYXNpZGUsIGZpZ3VyZSB3ZSdsbCBzdGFydCB3aXRoIHRoZSBwcm9j
ZXNzIGJpa2VzaGVkZGluZyByaWdodCBhd2F5Cj4gPiA6LSkKPiA+IC1EYW5pZWwKPgo+IEkgd2Fz
IHBsYXlpbmcgd2l0aCB0aGF0IG9uIG15IGZvcmssIGJ1dCB0aGUgaXNzdWUgd2FzIHRoYXQgSSB3
b3VsZCBoYXZlCj4gdG8gY2hhbmdlIHRoZSBwYXRocyB0byByZWdpc3RyeSBlYWNoIHRpbWUgSSBz
ZW5kIGEgcGF0Y2ggYW5kIHB1c2ggaXQgdG8KPiBteSByZXBvLiBUb28gYW5ub3lpbmcsIHNvIEkg
d2VudCB3aXRoIGEgdGVtcG9yYXJ5IGJyYW5jaC4KCklmIHlvdSBkbyBhbiBNUiwgZG9lcyBpdCB3
b3JrIGJldHRlcj8KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwg
SW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZnds
bC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
