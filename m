Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9DF6E60C
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Oct 2018 15:14:20 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20181004132705.GL31561@phenom.ffwll.local>
References: <20181003194349.16674-1-chris@chris-wilson.co.uk>
 <20181004124446.ewjwxv7jzc6zhuv6@ahiler-desk1.fi.intel.com>
 <20181004132705.GL31561@phenom.ffwll.local>
Message-ID: <153866605534.5379.3056255152464775187@skylake-alporthouse-com>
Date: Thu, 04 Oct 2018 16:14:15 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] igt: Check drmModeGetResources()
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDE4LTEwLTA0IDE0OjI3OjA1KQo+IE9uIFRodSwgT2N0
IDA0LCAyMDE4IGF0IDAzOjQ0OjQ2UE0gKzAzMDAsIEFya2FkaXVzeiBIaWxlciB3cm90ZToKPiA+
IE9uIFdlZCwgT2N0IDAzLCAyMDE4IGF0IDA4OjQzOjQ5UE0gKzAxMDAsIENocmlzIFdpbHNvbiB3
cm90ZToKPiA+ID4gSWYgS01TIGlzIG5vdCBzdXBwb3J0ZWQgb24gdGhlIGRldmljZSwgZHJtTW9k
ZUdldFJlc291cmNlcygpIHdpbGwgcmV0dXJuCj4gPiA+IE5VTEwsIG9mdGVuIHRoaXMgaXMgYW4g
aW5kaWNhdGlvbiB0aGF0IHdlIHNob3VsZCBub3QgYXR0ZW1wdCB0byBydW4gdGhlCj4gPiA+IHRl
c3QuIEFsdGhvdWdoIGl0IHdvdWxkIGJlIHByZWZlcnJlZCB0byB1c2Ugc29tZXRoaW5nIGxpa2UK
PiA+ID4gaWd0X3JlcXVpcmVfZGlzcGxheSgpIGFzIHRoZSBjYW5vbmljYWwgY2hlY2sgYW5kIGFz
c2VydCB0aGF0Cj4gPiA+IGRybU1vZGVHZXRSZXNvdXJjZXMoKSBkaWQgbm90IGhpdCBhbiBlcnJv
ciwgaXQgaXMgbm90IGFsd2F5cyBwcmFjdGljYWwKPiA+ID4gYXMgdGhlIHRlc3RzIGRvIG5vdCB1
dGlsaXplIHRoZSBjb21tb24gaWd0X2Rpc3BsYXkgYWJzdHJhY3Rpb24uCj4gPiA+IAo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiA+
IFJldmlld2VkLWJ5OiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+
Cj4gPiAKPiA+IGFuZCBwdXNoZWQKPiAKPiBJIHN0aWxsIHRoaW5rIGEga21zdGVzdF9yZXF1aXJl
KCkgb3Igc28sIHBsdXMgdGhlbiByZW1vdmluZyB0aGUgcGlsZSBvZgo+IGFkZC1ob3cgaWd0X3Jl
cXVpcmUgd2UganVzdCBzcHJpbmtsZWQgYWxsIG92ZXIsIHdvdWxkIGJlIG1vcmUgbWFpbnRhaW5h
YmxlCj4gbG9uZyB0ZXJtLiBrbXN0ZXN0X3JlcXVpcmUoKSB3b3VsZCBhbHNvIGFsbG93IHVzIHRv
IGRyb3AgYSBub3Qtc28tY3J5cHRpYwo+IG1lc3NhZ2UgaW50byBsb2dzLgoKQnV0IHdoYXQgZG9l
cyBrbXN0ZXN0IG1lYW4/IGlndF9yZXF1aXJlX2ttcygpLCB3aGljaCBjYW4gYmUgdGhlIHJhdwpk
cm1fbW9kZV9nZXRyZXNvdXJjZXMgaW9jdGwsIG1hdGNoZXMgbXkgZXhwZWN0YXRpb25zIG9mIGEg
bG93bGV2ZWwgY2hlY2suCkJ1dCBpcyB0aGF0IGFzIGRlc2NyaXB0aXZlIGZvciB0aGUgdGVzdHMg
dGhhdCBhcmUganVzdCB1c2luZwpkcm1Nb2RlR2V0UmVzb3VyY2VzKCkgZGlyZWN0bHk/IFRoYXQg
aXMgdGhlIGNvbnVuZHJ1bS4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldgo=
