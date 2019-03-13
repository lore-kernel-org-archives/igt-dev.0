Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ABFB6E08E
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2019 08:59:12 +0000 (UTC)
Date: Wed, 13 Mar 2019 10:59:09 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190313085909.GM4038@platvala-desk.ger.corp.intel.com>
References: <20190312112114.1979-1-petri.latvala@intel.com>
 <20190312152533.GE2665@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190312152533.GE2665@phenom.ffwll.local>
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
To: Daniel Vetter <daniel@ffwll.ch>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBNYXIgMTIsIDIwMTkgYXQgMDQ6MjU6MzNQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUdWUsIE1hciAxMiwgMjAxOSBhdCAwMToyMToxNFBNICswMjAwLCBQZXRyaSBM
YXR2YWxhIHdyb3RlOgo+ID4gSWYgdGhlIGlvY3RsIGlzIHN1Y2Nlc3NmdWwsIHRoZSByZXR1cm5l
ZCBmZCBzaG91bGQgYmUgdmFsaWQuIENoZWNrCj4gPiB0aGF0IGl0IGlzLCB0aHVzIGFsc28gaGVs
cGluZyBzdGF0aWMgYW5hbHlzaXMgaW4gYWxtb3N0IDcwIGNhbGwgc2l0ZXMuCj4gPiAKPiA+IFNp
Z25lZC1vZmYtYnk6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgo+ID4g
LS0tCj4gPiAgbGliL2lvY3RsX3dyYXBwZXJzLmMgfCAxICsKPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2xpYi9pb2N0bF93cmFwcGVycy5j
IGIvbGliL2lvY3RsX3dyYXBwZXJzLmMKPiA+IGluZGV4IDM5OTIwZjg3Li4zMTk2OWU3NyAxMDA2
NDQKPiA+IC0tLSBhL2xpYi9pb2N0bF93cmFwcGVycy5jCj4gPiArKysgYi9saWIvaW9jdGxfd3Jh
cHBlcnMuYwo+ID4gQEAgLTEzMzIsNiArMTMzMiw3IEBAIGludCBwcmltZV9oYW5kbGVfdG9fZmQo
aW50IGZkLCB1aW50MzJfdCBoYW5kbGUpCj4gPiAgCWFyZ3MuZmQgPSAtMTsKPiA+ICAKPiA+ICAJ
ZG9faW9jdGwoZmQsIERSTV9JT0NUTF9QUklNRV9IQU5ETEVfVE9fRkQsICZhcmdzKTsKPiA+ICsJ
aWd0X2Fzc2VydF9mZChhcmdzLmZkKTsKPiAKPiBmZCA+PSAwIGlmIHdlIHdhbnQgdGhpcyBjaGVj
ay4gSSB0aGluayBpdCdzIG9rIHRvIGhhdmUgdGhlIGFzc2VydCBoZXJlLCBzaW5jZQo+IGRvX2lv
Y3RsIGFscmVhZHkgY2hlY2tzIHRoYXQgdGhlIGlvY3RsIGRpZG4ndCBmYWlsLiBJZiB3ZSB3YW50
IGFuCj4gdW5jaGVja2VkIHZlcnNpb24gd2UgY2FuIGFkZCB0aGUgdXN1YWwgX19wcmltZV9oYW5s
ZGVfdG9fZmQuCgpmZCA+PSAwIGlzIHdoYXQgaWd0X2Fzc2VydF9mZCBkb2VzPwoKCi0tIApQZXRy
aSBMYXR2YWxhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
