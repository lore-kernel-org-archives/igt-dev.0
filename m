Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4D06F13F
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jan 2019 16:34:18 +0000 (UTC)
Message-ID: <e5605926f8b45b0984d9fc89067107ba2c1cf4f9.camel@vmware.com>
From: Deepak Singh Rawat <drawat@vmware.com>
Date: Wed, 16 Jan 2019 08:34:39 -0800
In-Reply-To: <154765547183.22625.10699972788212632326@skylake-alporthouse-com>
References: <20190116002230.2545-1-drawat@vmware.com>
 <20190116002230.2545-3-drawat@vmware.com>
 <154762815996.30063.10576306419800434128@skylake-alporthouse-com>
 <d937f2942f936f897bcde8eb98a8da0c0a683d8e.camel@vmware.com>
 <154765547183.22625.10699972788212632326@skylake-alporthouse-com>
MIME-Version: 1.0
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
To: Chris Wilson <chris@chris-wilson.co.uk>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, Thomas Hellstrom <thellstrom@vmware.com>
Cc: Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTAxLTE2IGF0IDE2OjE3ICswMDAwLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4g
UXVvdGluZyBEZWVwYWsgU2luZ2ggUmF3YXQgKDIwMTktMDEtMTYgMTY6MTE6MTYpCj4gPiBPbiBX
ZWQsIDIwMTktMDEtMTYgYXQgMDA6NDIgLTA4MDAsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+ID4g
UXVvdGluZyBEZWVwYWsgUmF3YXQgKDIwMTktMDEtMTYgMDA6MjI6MjkpCj4gPiA+ID4gRm9yIHRl
c3RzIHVzaW5nIGdlbSBzcGVjaWZpYyBidWZmZXIgdGlsaW5nLCBhZGQgYSBjYWxsIHRvCj4gPiA+
ID4gaWd0X3JlcXVpcmVfZ2VtIHNvIHRoYXQgdGhlc2UgdGVzdHMgZG9uJ3QgZmFpbCBhdCBsYXRl
ciBzdGFnZS4KPiA+ID4gCj4gPiA+IEtNUyBvcGVyYXRlcyBpbmRlcGVuZGVudGx5IGZyb20gR0VN
IG9uIGk5MTUuIFNvIGxvbmcgYXMgeW91IGFyZQo+ID4gPiBub3QKPiA+ID4gY2FsbGluZyBnZW1f
ZXhlY2J1ZiwgaXQgc2hvdWxkIGNvbnRpbnVlIHRvIHdvcmsgZXZlbiBpZiB3ZQo+ID4gPiBkaXNh
YmxlCj4gPiA+IHRoZQo+ID4gPiBHUFUsIGkuZS4gaWd0X3JlcXVpcmVfZ2VtKCkgc2hvdWxkIG5v
dCBiZSByZXF1aXJlZCBoZXJlIChhZmFpaykuCj4gPiA+IC1DaHJpcwo+ID4gCj4gPiBnZW1fc2V0
X3RpbGluZygpIGNhbGxzIGFuIGk5MTUgcHJpdmF0ZSBJT0NUTCB3aGljaCBJIHRoaW5rIHdvdWxk
Cj4gPiBmYWlsCj4gPiB3aGVuIEdFTSBpcyBkaXNhYmxlZCBvciBvbiBvdGhlciBkcml2ZXJzLiBT
byBJIGd1ZXNzIGVpdGhlciBoYXZlIGEKPiA+IGlndF9yZXF1aXJlX2dlbSgpIG9yIHBlcmhhcHMg
R0VNIHNwZWNpZmljIHByaXZhdGUgSU9DVEwgY2FsbHMgU0tJUAo+ID4gb24KPiA+IG90aGVyIGRy
aXZlcnMuCj4gCj4gQWgsIHlvdSB3YW50IGlndF9yZXF1aXJlKGlzX2k5MTVfZGV2aWNlKGZkKSks
IG9yIGludHJvZHVjZSBzb21ldGhpbmcKPiBsaWtlIGlndF9yZXF1aXJlX2k5MTUoZmQpLiBFdmVu
IGJldHRlciBpZiBzdWNoIHNwZWNpZmljcyBhcmUgcmVtb3ZlZCwKPiBvcgo+IG1vdmVkIHRvIGEg
c3VidGVzdCBncm91cCB0aGF0IGFyZSBjbGVhcmx5IGRldmljZSBzcGVjaWZpYy4KPiAtQ2hyaXMK
CkkgYW0gbm90IHN1cmUgaWYgaTkxNSBhbmQgR0VNIGFyZSBpbmRlcGVuZGVudCBvZiBlYWNoIG90
aGVyIGJ1dCB5ZXMgeW91CmFyZSByaWdodCBhYm91dCBrbXNfYWRkZmJfYmFzaWMuYyBzaG91bGQg
bm90IGhhdmUgZGV2aWNlL0dFTSBzcGVjaWZpYwpyZXF1aXJlcy4gUGVyaGFwcyB0aGUgYmV0dGVy
IHdheSB3b3VsZCBiZSBzb21ldGhpbmcgbGlrZSAoaW5zdGVhZCBvZgpnZW1fc2V0X3RpbGluZygp
KToKCnNldF90aWxpbmcoKSAtPiBkZXZpY2Vfc3BlY2lmaWNfdGlsaW5nKCkKCkFsc28gc2V0X3Rp
bGluZygpIHdyYXBwZXIgU0tJUCdzIGZvciBkcml2ZXJzIHdoaWNoIGRvIG5vdCBzdXBwb3J0CnRp
bGluZywgd2hpY2ggZm9yIG5vdyBhcHBsaWVzIHRvIGFsbCBleGNlcHQgaTkxNS4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
