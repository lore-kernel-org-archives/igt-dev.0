Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71E289D49
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Oct 2018 13:52:51 +0000 (UTC)
Date: Mon, 15 Oct 2018 16:52:47 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20181015135247.GZ9144@intel.com>
References: <1539357826-22787-1-git-send-email-sunpeng.li@amd.com>
 <CAPj87rN4VZEMC8jc8QYXqU+0isXh0UTb_xGgtE3QTG6But+qRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPj87rN4VZEMC8jc8QYXqU+0isXh0UTb_xGgtE3QTG6But+qRQ@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] lib: Don't call
 igt_require_fb_modifiers() when no modifier
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
To: Daniel Stone <daniel@fooishbar.org>
Cc: igt-dev@lists.freedesktop.org, drawat@vmware.com, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

T24gU2F0LCBPY3QgMTMsIDIwMTggYXQgMDE6MDQ6MDhQTSArMDEwMCwgRGFuaWVsIFN0b25lIHdy
b3RlOgo+IEhpIERlZXBhaywKPiAKPiBPbiBGcmksIDEyIE9jdCAyMDE4IGF0IDE2OjI0LCA8c3Vu
cGVuZy5saUBhbWQuY29tPiB3cm90ZToKPiA+ICogSW4gY3JlYXRlX2ZiKCkgY2FsbHMgdG8ga21z
X2FkZGZiKCksIHJlbW92ZSB0aGUgbW9kaWZpZXIgZmxhZyBpZmYgdGhlCj4gPiAgIGRyaXZlciBk
b2Vzbid0IHN1cHBvcnQgbW9kaWZpZXJzIGFuZCB0aGUgbW9kaWZlciBpcyAwCj4gCj4gSSBrbm93
IHRoaXMgd2Fzbid0IHlvdXIgaWRlYSBhbmQgeW91IHdlcmUganVzdCBmb2xsb3dpbmcgdGhlCj4g
c3VnZ2VzdGlvbiAtIGJ1dCAwIF9pc18gYSB2YWxpZCBtb2RpZmllciB3aXRoIGEgdmVyeSBzcGVj
aWZpYyBtZWFuaW5nLAo+IHdoaWNoIGlzIHRvIGFsd2F5cyBpbnRlcnByZXQgdGhlIGJ1ZmZlciBh
cyBsaW5lYXIsIG5vIG1hdHRlciB3aGF0Lgo+IAo+IERSTV9GT1JNQVRfTU9EX0lOVkFMSUQgaXMg
YSBub24temVybyB2YWx1ZSwgYW5kIHNob3VsZCBiZSBwYXNzZWQKPiBhbnl3aGVyZSB0aGF0IG1v
ZGlmaWVycyBhcmUgbm90IHN1cHBvcnRlZCBvciB0aGVpciB1c2UgaXMgbm90IHdhbnRlZC4KPiAK
PiA+IEBAIC0xNjc4LDcgKzE2ODIsOCBAQCBpbnQgX19rbXNfYWRkZmIoaW50IGZkLCB1aW50MzJf
dCBoYW5kbGUsCj4gPiAgICAgICAgIHN0cnVjdCBkcm1fbW9kZV9mYl9jbWQyIGY7Cj4gPiAgICAg
ICAgIGludCByZXQsIGk7Cj4gPgo+ID4gLSAgICAgICBpZ3RfcmVxdWlyZV9mYl9tb2RpZmllcnMo
ZmQpOwo+ID4gKyAgICAgICBpZiAobW9kaWZpZXIgfHwgZmxhZ3MgJiBEUk1fTU9ERV9GQl9NT0RJ
RklFUlMpCj4gCj4gU28gSSB3b3VsZCBzdWdnZXN0IGNoYW5naW5nIHRoaXMgdGVzdCB0byBtb2Rp
ZmllciAhPQo+IERSTV9GT1JNQVRfTU9EX0lOVkFMSUQsIGFuZCBwYXNzaW5nIElOVkFMSUQgcmF0
aGVyIHRoYW4gMCB3aGVyZQo+IHJlcXVpcmVkLgoKSWYgd2Ugc3RhcnQgdXNpbmcgRFJNX0ZPUk1B
VF9NT0RfSU5WQUxJRCB0aGVuIEkgc3VwcG9zZSB3ZSBzaG91bGQKZHJvcCB0aGUgZmxhZ3MgcGFy
YW1ldGVyIGVudGlyZWx5IGFzIGl0J2xsIGJlY29tZSByZWR1bmRhbnQuCgpJbiB0aGUgY3VycmVu
dCBzY2hlbWUgSSB0aGluayBpdCB3b3VsZCBzdWZmaWNlIHRvIGp1c3QKJ2lmIChmbGFncyAmIE1P
RCkgaWd0X3JlcXVpcmVfbW9kcygpJy4gSSBkb24ndCB0aGluayB3ZSBuZWVkIHRvCnByb3RlY3Qg
YWdhaW5zdCBzb21lb25lIHBhc3NpbmcgaW4gYSBub24tbGluZWFyIG1vZGlmaWVyIHdpdGhvdXQK
dGhlIGZsYWcuIFRoYXQgd291bGQganVzdCBiZSBhIGJ1ZyAob3IgZXZlbiBhIGZlYXR1cmUgcGVy
aGFwcykKaW4gdGhlIHRlc3QuCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
