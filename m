Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-it0-x233.google.com (mail-it0-x233.google.com
 [IPv6:2607:f8b0:4001:c0b::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5094789C97
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Apr 2018 19:53:40 +0000 (UTC)
Received: by mail-it0-x233.google.com with SMTP id 15-v6so5698270itl.1
 for <igt-dev@lists.freedesktop.org>; Thu, 05 Apr 2018 12:53:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1522956624.2748.16.camel@intel.com>
References: <20180227085232.54025-1-maarten.lankhorst@linux.intel.com>
 <20180227085232.54025-5-maarten.lankhorst@linux.intel.com>
 <c2d5541a-6dd5-b962-fe25-82a9898dd536@linux.intel.com>
 <1521661661.3150.13.camel@intel.com>
 <1522945862.2748.4.camel@intel.com>
 <1ec07ec3-8f39-bbf2-9a3d-02746040e9b9@linux.intel.com>
 <1522956624.2748.16.camel@intel.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 5 Apr 2018 21:44:58 +0200
Message-ID: <CAKMK7uG7LNdJ1Zm38gWngpYcv_KP-FMb9nrvAyF-_iACayOONg@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 4/4] tests/kms_frontbuffer_tracking:
 Remove redundant modesets during subtest start.
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
To: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBBcHIgNSwgMjAxOCBhdCA5OjMwIFBNLCBQYXVsbyBaYW5vbmkgPHBhdWxvLnIuemFu
b25pQGludGVsLmNvbT4gd3JvdGU6Cj4gRW0gUXVpLCAyMDE4LTA0LTA1IMOgcyAyMToyMSArMDIw
MCwgTWFhcnRlbiBMYW5raG9yc3QgZXNjcmV2ZXU6Cj4+IE9wIDA1LTA0LTE4IG9tIDE4OjMxIHNj
aHJlZWYgUGF1bG8gWmFub25pOgo+PiA+IEVtIFF1YSwgMjAxOC0wMy0yMSDDoHMgMTI6NDcgLTA3
MDAsIFBhdWxvIFphbm9uaSBlc2NyZXZldToKPj4gPiA+IEVtIFF1aSwgMjAxOC0wMy0wMSDDoHMg
MTY6MzMgKzAxMDAsIE1hYXJ0ZW4gTGFua2hvcnN0IGVzY3JldmV1Ogo+PiA+ID4gPiBIZXksCj4+
ID4gPiA+Cj4+ID4gPiA+IE9wIDI3LTAyLTE4IG9tIDA5OjUyIHNjaHJlZWYgTWFhcnRlbiBMYW5r
aG9yc3Q6Cj4+ID4gPiA+ID4gQ1JDIGNhcHR1cmluZyBlbmFibGVzIHRoZSBkaXNwbGF5LCB0aGVu
IGRpc2FibGVzIGl0IGFnYWluLgo+PiA+ID4gPiA+IFdpdGgKPj4gPiA+ID4gPiBpZ3RfZGlzcGxh
eSB3ZSBjYW4gdXNlIGlndF9kaXNwbGF5X3Jlc2V0IHRvIHJlc3RvcmUgdGhlCj4+ID4gPiA+ID4g
b3JpZ2luYWwKPj4gPiA+ID4gPiBzdGF0ZSwKPj4gPiA+ID4gPiB3aXRob3V0IGNvbW1pdHRpbmcg
aXQgdG8gdGhlIGh3Lgo+PiA+ID4gPiA+Cj4+ID4gPiA+ID4gQWxsIHN1YnRlc3RzIGZpcnN0IHNl
dCB0aGVpciBvd24gc3RhdGUgYW55d2F5LCBzbyB3ZSBjYW4gc2F2ZQo+PiA+ID4gPiA+IHVwCj4+
ID4gPiA+ID4gb24KPj4gPiA+ID4gPiB0aGUgbnVtYmVyIG9mIGNvbW1pdHMuCj4+ID4gPiA+Cj4+
ID4gPiA+IEkgcGF0Y2hlZCBpZ3Rfa21zIHRvIHJlcG9ydCB0aGUgbnVtYmVyIG9mIG1vZGVzZXRz
Li4KPj4gPiA+ID4KPj4gPiA+ID4gV2l0aG91dCB0aGlzIHBhdGNoIHJ1bm5pbmcgLi9rbXNfZnJv
bnRidWZmZXJfdHJhY2tpbmcgb24gYSAyCj4+ID4gPiA+IG91dHB1dAo+PiA+ID4gPiBzeXN0ZW0g
KGYyLXNuYi0yNjAwLCBmb3JjZWQgVkdBLTEgZW5hYmxlZCk6Cj4+ID4gPiA+IFBlcmZvcm1lZCAz
ODIgbW9kZXNldHMKPj4gPiA+ID4KPj4gPiA+ID4gV2l0aCB0aGlzIHBhdGNoIG9uIGEgMiBvdXRw
dXQgc3lzdGVtOgo+PiA+ID4gPiBQZXJmb3JtZWQgMjMgbW9kZXNldHMKPj4gPiA+ID4KPj4gPiA+
ID4gT24gZ2VtaW5pbGFrZSB0aGlzIG1lYW5zIHdlIHNhdmUgYSBsb3Qgb2YgdGltZSwgc28gY291
bGQKPj4gPiA+ID4gc29tZW9uZQo+PiA+ID4gPiByZXZpZXcgdGhpcyBzZXJpZXM/Cj4+ID4gPgo+
PiA+ID4gSXMgdGhlcmUgYW4gYW5hbHlzaXMgb24gaG93IHJlZHVjaW5nIHRoZSBhbW91bnQgb2Yg
bW9kZXNldHMgd2lsbAo+PiA+ID4gKm5vdCoKPj4gPiA+IGludmFsaWRhZGUgdGhlIHB1cnBvc2Ug
b2YgdGhlIHRlc3RzPyBUaGUgbW9kZXNldHMgYXJlIHRoZXJlIGZvciBhCj4+ID4gPiByZWFzb24u
Cj4+ID4KPj4gPiBQaW5nPwo+Pgo+PiBIb3cgd2lsbCBkb2luZyBhIG1vZGVzZXQgaW1wcm92ZSB0
aGUgdGVzdD8KPj4KPj4gV2UgcHJlc2VydmUgdGhlIG1vZGUgb25seSBpZiBpdCBtYWtlcyBzZW5z
ZSwgZWFjaCBzdWJ0ZXN0IHNldHMgdGhlCj4+IHBhcmFtZXRlcnMgaXQgd2FudHMuIEl0IGp1c3Qg
aGFwcGVucyB0aGF0IGluIG1vc3QgY2FzZXMgdGhhdCdzIHRoZQo+PiBzYW1lIG1vZGUsIHNvIHdl
IGRvbid0IGhhdmUgdG8gZG8gYSBtb2Rlc2V0Lgo+PiBUaGF0J3MgYWxsLiA6KQo+Cj4gQnV0IGhh
dmluZyBvciBub3QgaGF2aW5nIGEgbW9kZXNldCwgaGF2aW5nIG9yIG5vdCBoYXZpbmcgYSBmbGlw
IGNoYW5nZXMKPiBob3cgdGhlIEZCQyBjb2RlIGluIHRoZSBLZXJuZWwgYmVoYXZlcy4gU28gY2hh
bmdpbmcgZnJvbSBoYXZpbmcgYQo+IG1vZGVzZXQgdG8gbm90IGhhdmluZyBvbmUgd2lsbCBkZWZp
bml0ZWx5IGhhdmUgYW4gaW1wYWN0IG9uIHdoYXQgY29kZQo+IGdldHMgcnVuLiBJdCB3b3VsZCBi
ZSBnb29kIHRvIGhhdmUgYSBkZXRhaWxlZCBhbmFseXNpcyBvbiB3aHkgdGhpcyBpcwo+IG5vdCB0
aGUgY2FzZSB0aGUgc3BlY2lmaWMgcG9pbnRzIHRoYXQgY2hhbmdlZC4KCkhlbHBzIHRvIGFsc28g
cG9pbnQgYXQgdGhlIHJlZ3Jlc3Npb24gcmVwb3J0OgoKaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9w
Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA1NTAzCgpDaGVlcnMsIERhbmllbAotLSAKRGFuaWVsIFZl
dHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUg
NTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXYK
