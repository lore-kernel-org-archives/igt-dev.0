Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7382389317
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Feb 2019 19:48:08 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190221192745.31178-3-antonio.argenziano@intel.com>
References: <20190221192745.31178-1-antonio.argenziano@intel.com>
 <20190221192745.31178-3-antonio.argenziano@intel.com>
Message-ID: <155077847953.4937.918589523312592932@skylake-alporthouse-com>
Date: Thu, 21 Feb 2019 19:47:59 +0000
Subject: Re: [igt-dev] [RFC 2/5] lib/ioctl_wrappers: add mmap_offset support
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, igt-dev@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>, Janulgue Abdiel <abdiel.janulgue@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTktMDItMjEgMTk6Mjc6NDIpCj4gRnJvbTog
IkthbGFtYXJ6LCBMdWthc3oiIDxsdWthc3oua2FsYW1hcnpAaW50ZWwuY29tPgo+IAo+IFdpdGgg
cmVjZW50bHkgcHJvcG9zZWQgY2hhbmdlcywgSUdUIG5lZWQgdG8gc3RhcnQgc3VwcG9ydGluZyBu
ZXcKPiB3YXkgb2YgbW1hcGluZyBvYmplY3QsIHdoaWNoIHdpbGwgYmUgdXNlZCBmcm9tIG5vdyBi
eSBkZWZhdWx0Lgo+IFRoaXMgcGF0Y2ggbW9kaWZ5IGdlbV9tbWFwX3djIGFuZCBnZW1fbW1hcCBm
dW5jdGlvbnMgdG8gYmUKPiBpbiBzeW5jIHdpdGggdGhvc2UgY2hhbmdlcy4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBMdWthc3ogS2FsYW1hcnogPGx1a2Fzei5rYWxhbWFyekBpbnRlbC5jb20+Cj4gQ2M6
IEphbnVsZ3VlIEFiZGllbCA8YWJkaWVsLmphbnVsZ3VlQGludGVsLmNvbT4KPiBDYzogTWF0dGhl
dyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPgo+IENjOiBNaWNoYWwgV2luaWFyc2tpIDxt
aWNoYWwud2luaWFyc2tpQGludGVsLmNvbT4KPiBDYzogQW50b25pbyBBcmdlbnppYW5vIDxhbnRv
bmlvLmFyZ2Vuemlhbm9AaW50ZWwuY29tPgo+IENjOiBEYW5pZWxlIFNwdXJpbyBDZXJhb2xvIDxk
YW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPgo+IENjOiBKb29uYXMgTGFodGluZW4gPGpv
b25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb20+Cj4gLS0tCj4gIGxpYi9pb2N0bF93cmFwcGVy
cy5jIHwgMTUwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEyOSBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvbGliL2lvY3RsX3dyYXBwZXJzLmMgYi9saWIvaW9jdGxfd3JhcHBlcnMuYwo+
IGluZGV4IDQwNGMyZmJmLi5kOWI0NjA4OCAxMDA2NDQKPiAtLS0gYS9saWIvaW9jdGxfd3JhcHBl
cnMuYwo+ICsrKyBiL2xpYi9pb2N0bF93cmFwcGVycy5jCj4gQEAgLTY0MSw2ICs2NDEsMjQgQEAg
dm9pZCBnZW1fZXhlY2J1Zl93cihpbnQgZmQsIHN0cnVjdCBkcm1faTkxNV9nZW1fZXhlY2J1ZmZl
cjIgKmV4ZWNidWYpCj4gICAgICAgICBpZ3RfYXNzZXJ0X2VxKF9fZ2VtX2V4ZWNidWZfd3IoZmQs
IGV4ZWNidWYpLCAwKTsKPiAgfQo+ICAKPiArc3RhdGljIGJvb2wgaGFzX21tYXBfb2Zmc2V0KGlu
dCBmZCkKPiArewo+ICsgICAgICAgc3RhdGljIGludCBoYXNfbW1hcF9vZmZzZXQgPSAtMTsKCmEp
IG5vdGhpbmcgbmV3IGluIGlvY3RsX3dyYXBwZXJzLCBwbGVhc2UKCmIpIGRvIG5vdCByZXBlYXQg
dGhlIG1pc3Rha2VzIG9mIHVzaW5nIHN0YXRpYywgYXNzdW1pbmcgYWxsIGZkIGFyZSB0aGUKc2Ft
ZS4gSnVzdCBkb24ndCBjYWxsIGhhc19tbWFwX29mZnNldCgpIG1vcmUgdGhhbiBpcyBzdHJpY3Rs
eSByZXF1aXJlZC4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dg==
