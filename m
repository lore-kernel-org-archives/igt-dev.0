Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC5A6E0C3
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2019 13:18:28 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id m12so1488340edv.4
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2019 06:18:27 -0700 (PDT)
Date: Wed, 13 Mar 2019 14:18:23 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190313131823.GK2665@phenom.ffwll.local>
References: <20190312112114.1979-1-petri.latvala@intel.com>
 <20190312152533.GE2665@phenom.ffwll.local>
 <20190313085909.GM4038@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190313085909.GM4038@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/ioctl_wrappers: Assert that
 prime_handle_to_fd returns a valid fd
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
To: Daniel Vetter <daniel@ffwll.ch>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBNYXIgMTMsIDIwMTkgYXQgMTA6NTk6MDlBTSArMDIwMCwgUGV0cmkgTGF0dmFsYSB3
cm90ZToKPiBPbiBUdWUsIE1hciAxMiwgMjAxOSBhdCAwNDoyNTozM1BNICswMTAwLCBEYW5pZWwg
VmV0dGVyIHdyb3RlOgo+ID4gT24gVHVlLCBNYXIgMTIsIDIwMTkgYXQgMDE6MjE6MTRQTSArMDIw
MCwgUGV0cmkgTGF0dmFsYSB3cm90ZToKPiA+ID4gSWYgdGhlIGlvY3RsIGlzIHN1Y2Nlc3NmdWws
IHRoZSByZXR1cm5lZCBmZCBzaG91bGQgYmUgdmFsaWQuIENoZWNrCj4gPiA+IHRoYXQgaXQgaXMs
IHRodXMgYWxzbyBoZWxwaW5nIHN0YXRpYyBhbmFseXNpcyBpbiBhbG1vc3QgNzAgY2FsbCBzaXRl
cy4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZh
bGFAaW50ZWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGxpYi9pb2N0bF93cmFwcGVycy5jIHwgMSAr
Cj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+ID4gCj4gPiA+IGRpZmYg
LS1naXQgYS9saWIvaW9jdGxfd3JhcHBlcnMuYyBiL2xpYi9pb2N0bF93cmFwcGVycy5jCj4gPiA+
IGluZGV4IDM5OTIwZjg3Li4zMTk2OWU3NyAxMDA2NDQKPiA+ID4gLS0tIGEvbGliL2lvY3RsX3dy
YXBwZXJzLmMKPiA+ID4gKysrIGIvbGliL2lvY3RsX3dyYXBwZXJzLmMKPiA+ID4gQEAgLTEzMzIs
NiArMTMzMiw3IEBAIGludCBwcmltZV9oYW5kbGVfdG9fZmQoaW50IGZkLCB1aW50MzJfdCBoYW5k
bGUpCj4gPiA+ICAJYXJncy5mZCA9IC0xOwo+ID4gPiAgCj4gPiA+ICAJZG9faW9jdGwoZmQsIERS
TV9JT0NUTF9QUklNRV9IQU5ETEVfVE9fRkQsICZhcmdzKTsKPiA+ID4gKwlpZ3RfYXNzZXJ0X2Zk
KGFyZ3MuZmQpOwo+ID4gCj4gPiBmZCA+PSAwIGlmIHdlIHdhbnQgdGhpcyBjaGVjay4gSSB0aGlu
ayBpdCdzIG9rIHRvIGhhdmUgdGhlIGFzc2VydCBoZXJlLCBzaW5jZQo+ID4gZG9faW9jdGwgYWxy
ZWFkeSBjaGVja3MgdGhhdCB0aGUgaW9jdGwgZGlkbid0IGZhaWwuIElmIHdlIHdhbnQgYW4KPiA+
IHVuY2hlY2tlZCB2ZXJzaW9uIHdlIGNhbiBhZGQgdGhlIHVzdWFsIF9fcHJpbWVfaGFubGRlX3Rv
X2ZkLgo+IAo+IGZkID49IDAgaXMgd2hhdCBpZ3RfYXNzZXJ0X2ZkIGRvZXM/CgpJJ20gYmxpbmQg
Oi0vCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldg==
