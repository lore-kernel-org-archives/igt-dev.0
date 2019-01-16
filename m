Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51AB56F12B
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jan 2019 16:18:00 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <d937f2942f936f897bcde8eb98a8da0c0a683d8e.camel@vmware.com>
References: <20190116002230.2545-1-drawat@vmware.com>
 <20190116002230.2545-3-drawat@vmware.com>
 <154762815996.30063.10576306419800434128@skylake-alporthouse-com>
 <d937f2942f936f897bcde8eb98a8da0c0a683d8e.camel@vmware.com>
Message-ID: <154765547183.22625.10699972788212632326@skylake-alporthouse-com>
Date: Wed, 16 Jan 2019 16:17:52 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] igt/kms_addfb_basic: Call
 igt_require_gem for gem specific tiling
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, Deepak Singh Rawat <drawat@vmware.com>, Thomas Hellstrom <thellstrom@vmware.com>
Cc: Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBEZWVwYWsgU2luZ2ggUmF3YXQgKDIwMTktMDEtMTYgMTY6MTE6MTYpCj4gT24gV2Vk
LCAyMDE5LTAxLTE2IGF0IDAwOjQyIC0wODAwLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBRdW90
aW5nIERlZXBhayBSYXdhdCAoMjAxOS0wMS0xNiAwMDoyMjoyOSkKPiA+ID4gRm9yIHRlc3RzIHVz
aW5nIGdlbSBzcGVjaWZpYyBidWZmZXIgdGlsaW5nLCBhZGQgYSBjYWxsIHRvCj4gPiA+IGlndF9y
ZXF1aXJlX2dlbSBzbyB0aGF0IHRoZXNlIHRlc3RzIGRvbid0IGZhaWwgYXQgbGF0ZXIgc3RhZ2Uu
Cj4gPiAKPiA+IEtNUyBvcGVyYXRlcyBpbmRlcGVuZGVudGx5IGZyb20gR0VNIG9uIGk5MTUuIFNv
IGxvbmcgYXMgeW91IGFyZSBub3QKPiA+IGNhbGxpbmcgZ2VtX2V4ZWNidWYsIGl0IHNob3VsZCBj
b250aW51ZSB0byB3b3JrIGV2ZW4gaWYgd2UgZGlzYWJsZQo+ID4gdGhlCj4gPiBHUFUsIGkuZS4g
aWd0X3JlcXVpcmVfZ2VtKCkgc2hvdWxkIG5vdCBiZSByZXF1aXJlZCBoZXJlIChhZmFpaykuCj4g
PiAtQ2hyaXMKPiAKPiBnZW1fc2V0X3RpbGluZygpIGNhbGxzIGFuIGk5MTUgcHJpdmF0ZSBJT0NU
TCB3aGljaCBJIHRoaW5rIHdvdWxkIGZhaWwKPiB3aGVuIEdFTSBpcyBkaXNhYmxlZCBvciBvbiBv
dGhlciBkcml2ZXJzLiBTbyBJIGd1ZXNzIGVpdGhlciBoYXZlIGEKPiBpZ3RfcmVxdWlyZV9nZW0o
KSBvciBwZXJoYXBzIEdFTSBzcGVjaWZpYyBwcml2YXRlIElPQ1RMIGNhbGxzIFNLSVAgb24KPiBv
dGhlciBkcml2ZXJzLgoKQWgsIHlvdSB3YW50IGlndF9yZXF1aXJlKGlzX2k5MTVfZGV2aWNlKGZk
KSksIG9yIGludHJvZHVjZSBzb21ldGhpbmcKbGlrZSBpZ3RfcmVxdWlyZV9pOTE1KGZkKS4gRXZl
biBiZXR0ZXIgaWYgc3VjaCBzcGVjaWZpY3MgYXJlIHJlbW92ZWQsIG9yCm1vdmVkIHRvIGEgc3Vi
dGVzdCBncm91cCB0aGF0IGFyZSBjbGVhcmx5IGRldmljZSBzcGVjaWZpYy4KLUNocmlzCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
