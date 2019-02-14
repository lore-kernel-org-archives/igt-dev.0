Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75CB36E952
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Feb 2019 15:32:20 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id h58so5341746edb.5
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Feb 2019 07:32:20 -0800 (PST)
Date: Thu, 14 Feb 2019 16:32:16 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190214153216.GF2665@phenom.ffwll.local>
References: <20190213183309.21175-1-daniel.vetter@ffwll.ch>
 <155014718255.14276.18353975601759997811@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <155014718255.14276.18353975601759997811@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/core_auth: mount namespace magic to
 make the test work everywhere
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: IGT development <igt-dev@lists.freedesktop.org>, Emil Velikov <emil.velikov@collabora.com>, Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBGZWIgMTQsIDIwMTkgYXQgMTI6MjY6MjJQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgRGFuaWVsIFZldHRlciAoMjAxOS0wMi0xMyAxODozMzowOSkKPiA+ICsg
ICAgICAgLyogY3JlYXRlIGEgY2FyZCBub2RlIG1hdGNoaW5nIG1hc3RlciB3aGljaCAob25seSkg
d2UgY2FuIGFjY2VzcyBhcwo+ID4gKyAgICAgICAgKiBub24tcm9vdCAqLwo+ID4gKyAgICAgICBk
b19vcl9kaWUoZnN0YXQobWFzdGVyLCAmc3RhdGJ1ZikpOwo+ID4gKyAgICAgICBkb19vcl9kaWUo
dW5zaGFyZShDTE9ORV9ORVdOUykpOwo+ID4gKyAgICAgICBpZ3Rfc3lzdGVtKCJtb3VudCAtLW1h
a2UtcnByaXZhdGUgLyIpOwo+ID4gKyAgICAgICBpZ3Rfc3lzdGVtKCJtb3VudCAtdCB0bXBmcyBu
b25lIC9kZXYvZHJpIik7Cj4gCj4gbWFuIG1vdW50KDIpPyBJJ20gb3B0aW1pc3RpYyB0aGF0IHRy
YW5zbGF0ZXMgdG8gTVNfUFJJVkFURS4KPiAKPiBDaGFuZ2luZyB0aGUgcHJvcGFnYXRpb24gdHlw
ZSBvZiBhbiBleGlzdGluZyBtb3VudAo+IAo+ICAgICAgICBJZiBtb3VudGZsYWdzIGluY2x1ZGVz
IG9uZSBvZiBNU19TSEFSRUQsIE1TX1BSSVZBVEUsIE1TX1NMQVZFLCBvcgo+ICAgICAgICBNU19V
TkJJTkRBQkxFIChhbGwgYXZhaWxhYmxlIHNpbmNlIExpbnV4IDIuNi4xNSksIHRoZW4gdGhlCj4g
ICAgICAgIHByb3BhZ2F0aW9uIHR5cGUgb2YgYW4gZXhpc3RpbmcgbW91bnQgaXMgY2hhbmdlZC4g
IElmIG1vcmUgdGhhbiBvbmUKPiAgICAgICAgb2YgdGhlc2UgZmxhZ3MgaXMgc3BlY2lmaWVkLCBh
biBlcnJvciByZXN1bHRzLgo+IAo+ICAgICAgICBUaGUgb25seSBmbGFncyB0aGF0IGNhbiBiZSB1
c2VkIHdpdGggY2hhbmdpbmcgdGhlIHByb3BhZ2F0aW9uIHR5cGUKPiAgICAgICAgYXJlIE1TX1JF
QyBhbmQgTVNfU0lMRU5ULgo+IAo+IFNlZW1zIGxpa2UgaXQgc2hvdWxkIGJlIGp1c3QgdGhhdCA6
KQoKWWVhaCBJIHVubGF6aWVkIGFuZCBjaGFuZ2VkIG15IGNtZGxpbmUgaGFja2VyeSB0byBwcm9w
ZXIgc3lzY2FsbHMgaW4gdjIuClRvb2sgbWUgYSB3aGlsZSB0byBmaWd1cmUgb3V0IHRoYXQgY21k
bGluZSB1bnNoYXJlIGRvZXMgYWRkaXRpb25hbCBzdHVmZgp3aGVuIHlvdSB3YW50IGEgbmV3IG5h
bWVzcGFjZS4gQW5kIG1vdW50KDIpIGlzIG5vdCB0aGUgbW9zdCBpbnR1aXRpdmUKdGhpbmcgZXZl
ciwgYnV0IGx1Y2tpbHkgbW91dGluZyB0bXBmcyBpcyBlYXN5LgotRGFuaWVsCi0tIApEYW5pZWwg
VmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5m
ZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
