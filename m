Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com
 [IPv6:2a00:1450:400c:c09::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D536E2D6
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Jul 2018 23:43:33 +0000 (UTC)
Received: by mail-wm0-x243.google.com with SMTP id l2-v6so12321942wme.1
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Jul 2018 16:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <20180727124006.25757-1-petri.latvala@intel.com>
 <CAKi4VAJHB6f7XJ8_ZH1gQUVAmwG1k437sjwio+TpejRRSN1AoA@mail.gmail.com>
 <20180730074632.mpd7sxddcixun4nb@platvala-desk.ger.corp.intel.com>
In-Reply-To: <20180730074632.mpd7sxddcixun4nb@platvala-desk.ger.corp.intel.com>
From: Lucas De Marchi <lucas.de.marchi@gmail.com>
Date: Tue, 31 Jul 2018 16:43:20 -0700
Message-ID: <CAKi4VAK8VCGysLmEpHYsO=wrVpZ0O2JYoeU8yBEfhE1s=g3v7A@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] meson: Downgrade meson version
 requirement a notch
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBKdWwgMzAsIDIwMTggYXQgMTI6NDYgQU0gUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0
dmFsYUBpbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdWwgMjcsIDIwMTggYXQgMTI6MzE6
MDlQTSAtMDcwMCwgTHVjYXMgRGUgTWFyY2hpIHdyb3RlOgo+ID4gT24gRnJpLCBKdWwgMjcsIDIw
MTggYXQgNTo0MCBBTSBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+IDAuNDQuMCBpcyBhIGZpbmUgdmVyc2lvbi4KPiA+ID4KPiA+ID4gU2ln
bmVkLW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Cj4gPiA+
IC0tLQo+ID4gPiAgbWVzb24uYnVpbGQgfCAyICstCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL21lc29u
LmJ1aWxkIGIvbWVzb24uYnVpbGQKPiA+ID4gaW5kZXggNjNhYzYyOTIuLjY4MmY0NGRhIDEwMDY0
NAo+ID4gPiAtLS0gYS9tZXNvbi5idWlsZAo+ID4gPiArKysgYi9tZXNvbi5idWlsZAo+ID4gPiBA
QCAtNSw3ICs1LDcgQEAgcHJvamVjdCgnaWd0LWdwdS10b29scycsICdjJywKPiA+ID4gICAgICAg
ICAgICAnY19zdGQ9Z251MTEnLAo+ID4gPiAgICAgICAgICBdLAo+ID4gPiAgICAgICAgIGxpY2Vu
c2UgOiAnTUlUJywKPiA+ID4gLSAgICAgICBtZXNvbl92ZXJzaW9uIDogJz4wLjQ0LjAnKQo+ID4g
PiArICAgICAgIG1lc29uX3ZlcnNpb24gOiAnPj0wLjQ0LjAnKQo+ID4KPiA+IHdpdGggb3Igd2l0
aG91dCB0aGlzIHBhdGNoIEkgZ2V0IHRoaXM6Cj4gPgo+ID4gV0FSTklORzogUHJvamVjdCBzcGVj
aWZpZXMgYSBtaW5pbXVtIG1lc29uX3ZlcnNpb24gJz4wLjQ0LjAnIHdoaWNoCj4gPiBjb25mbGlj
dHMgd2l0aDoKPiA+ICAqIDAuNDcuMDogeydidWlsZF9hbHdheXNfc3RhbGUgYXJnIGluIGN1c3Rv
bV90YXJnZXQnfQo+ID4gRm91bmQgbmluamEtMS44LjIgYXQgL3Vzci9iaW4vbmluamEKPiA+IFts
dWNhc0BsZG1hcnRpbi1kZXNrIGludGVsLWdwdS10b29sc10kIG1lc29uIC0tdmVyc2lvbgo+ID4g
MC40Ny4xCj4gPgo+ID4gU28gaXQgc2VlbXMgc29tZXRoaW5nIGlzIHN0aWxsIHdyb25nIHdpdGgg
dGhlIHZlcnNpb25zLgo+Cj4KPiBOYWgsIHRoYXQncyBqdXN0IGh0dHBzOi8vZ2l0aHViLmNvbS9t
ZXNvbmJ1aWxkL21lc29uL2lzc3Vlcy8zOTA0Cj4KPiBJbiBzaG9ydDogTWVzb24gMC40Ny4wIGlt
cGxlbWVudHMgdmNzX3RhZygpIHdpdGggYnVpbGRfYWx3YXlzX3N0YWxlLCBhCj4gZmVhdHVyZSBm
cm9tIDAuNDcuMC4gRWFybGllciBtZXNvbiB2ZXJzaW9ucyBoYXZlIHZjc190YWcgd2l0aCBvdGhl
cgo+IG1hY2hpbmVyeS4KCk9rLCB0aGFua3MuCgpSZXZpZXdlZC1ieTogTHVjYXMgRGUgTWFyY2hp
IDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+CgpMdWNhcyBEZSBNYXJjaGkKCj4KPgo+IC0tCj4g
UGV0cmkgTGF0dmFsYQoKCgotLSAKTHVjYXMgRGUgTWFyY2hpCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldgo=
