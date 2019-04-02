Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBCC6E32F
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2019 09:02:20 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190402085659.GG2665@phenom.ffwll.local>
References: <20190401075840.28344-1-chris@chris-wilson.co.uk>
 <20190402085659.GG2665@phenom.ffwll.local>
Message-ID: <155419573361.24691.9895858958941207441@skylake-alporthouse-com>
Date: Tue, 02 Apr 2019 10:02:14 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] prime_vgem: Replace nanosleep with
 igt_waitchildren_timeout
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
To: Daniel Vetter <daniel@ffwll.ch>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDE5LTA0LTAyIDA5OjU2OjU5KQo+IE9uIE1vbiwgQXBy
IDAxLCAyMDE5IGF0IDA4OjU4OjQwQU0gKzAxMDAsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IFdl
IHdhbnQgdG8gdXNlIGEgY2hpbGQgaW4gb3JkZXIgdG8gZGV0ZWN0IGFuIHVuaW50ZXJydXB0YWJs
ZSBzbGVlcCAoYQo+ID4gcG90ZW50aWFsIGJ1ZyB3ZSBtaWdodCBoaXQpLCBidXQgd2UgY2FuIHVz
ZSBpZ3Rfd2FpdGNoaWxkcmVuX3RpbWVvdXQoKQo+ID4gdG8gcmVwbGFjZSBvdXIgcmlza3kgc2Vs
Zi1zaWduYWxpbmcgKyBuYW5vc2xlZXAuCj4gPiAKPiA+IEJ1Z3ppbGxhOiBodHRwczovL2J1Z3Mu
ZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDMxODIKPiA+IFNpZ25lZC1vZmYtYnk6
IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IAo+IE9uIGEgc3ByZWUg
aXQgc2VlbXMgLi4uCgpJIGRpZG4ndCByZWFsaXNlZCB1bnRpbCB0b28gbGF0ZSB0aGV5IGhhZCBt
b3JlIHRoYW4gb24gdGVzdCBjYXNlIGluIHRoZQpidWcuCgo+IEkgZ3Vlc3Mgc2FtZSBjaGFuZ2Vz
IG5lZWRlZCBhcyBmb3Iga21zX2J1c3kgdG8KPiBkaXRjaCB0aGUgc2lnbmFsIGhhbmRsZXIgc2V0
dXA/IE9uIHRoZSBwcmVzdW1lZCB2MjoKCkkgZGlkbid0IG5vdGljZSBnY2MgY29tcGxhaW4gdGhp
cyB0aW1lLi4uIEZvdW5kIGl0LCBpdCBpcyBzZXR1cCBpbgp0ZXN0X2ZsaXAoKS4KLUNocmlzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
