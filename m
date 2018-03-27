Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA906E599
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Mar 2018 08:32:23 +0000 (UTC)
Date: Tue, 27 Mar 2018 11:32:16 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20180327083216.GE16453@ahiler-desk1.ger.corp.intel.com>
References: <20180321210828.16701-1-antonio.argenziano@intel.com>
 <71bc4687-27ef-8a83-3642-640c71d9da96@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <71bc4687-27ef-8a83-3642-640c71d9da96@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3] igt/gem_measure_ring_size_inflight:
 Measure smallest inflight ring size
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
To: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBNYXIgMjIsIDIwMTggYXQgMDk6NDA6NDRBTSAtMDcwMCwgQW50b25pbyBBcmdlbnpp
YW5vIHdyb3RlOgo+IAo+IAo+IE9uIDIxLzAzLzE4IDE0OjA4LCBBbnRvbmlvIEFyZ2Vuemlhbm8g
d3JvdGU6Cj4gPiBTb21lIHRlc3RzIG1lYXN1cmUgdGhlIHJlbmRlcidzIHJpbmcgc2l6ZSBidXQg
YXJlIGFjdHVhbGx5IG1lYW50IHRvCj4gPiBtZWFzdXJlIHRoZSBzbWFsbGVzdCBhY3Jvc3MgYWxs
IGVuZ2luZXMuIFRoaXMgcGF0Y2ggYWRkcyBtZWFzdXJpbmcgdGhlCj4gPiBzbWFsbGVzdCBzaXpl
IGluIGdlbV9tZWFzdXJlX3Jpbmdfc2l6ZV9pbmZsaWdodCgpIGdpdmVuIHRoZSBhcHByb3ByaWF0
ZQo+ID4gcGFyYW1ldGVyLgo+ID4gCj4gPiB2MjoKPiA+IAktIE9ubHkgZXhwb3NlIGhpZ2ggbGV2
ZWwgQVBJLiAoQ2hyaXMpCj4gPiAKPiA+IHYzOgo+ID4gCS0gVXNlIEFMTF9FTkdJTkVTIG1hY3Jv
Lgo+ID4gCj4gPiBTdWdnZXN0ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29u
LmNvLnVrPgo+ID4gU2lnbmVkLW9mZi1ieTogQW50b25pbyBBcmdlbnppYW5vIDxhbnRvbmlvLmFy
Z2Vuemlhbm9AaW50ZWwuY29tPgo+ID4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2ls
c29uLmNvLnVrPgo+ID4gUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2ls
c29uLmNvLnVrPiAjMgo+IAo+IEBtYWludGFpbmVyczogSXMgaXQgT0sgdG8gbWVyZ2UgdGhpcyBw
YXRjaD8gSSd2ZSBnb3QgYSBSQiBvbiB2MiBidXQgdjMgaXMKPiBjb3NtZXRpYyBjaGFuZ2VzIHBs
dXMgcmViYXNlLgoKSXQgYWxsIHJlZHVjZXMgdG8gdXNpbmcgdGhlIGNvbW1vbiBzZW5zZS4KCklm
IHRoaXMgaXMgYSBjaGFuZ2UgcmVxdWVzdGVkIGJ5IHRoZSByZXZpZXdlciBhbmQgeW91IGFyZSBz
dXJlIHRoYXQncwpleGFjdGVseSB3aGF0IHdhcyByZXF1ZXN0ZWQsIHRoZXJlJ3Mgbm8gZnVuY3Rp
b25hbCBjaGFuZ2VzLCBhbmQgdGhlIENJCmxpa2VzIHRoZSB1cGRhdGVkIHBhdGNoIC0gdGhlbiBp
dCdzIG9rYXkgdG8ga2VlcCB0aGUgci1iLgoKSWYgeW91IGFyZSBub3Qgc3VyZSwgaXQncyBiZXR0
ZXIgdG8gcGluZyB0aGUgb3JpZ2luYWwgcmV2aWV3ZXIuIElSQyBpcwplbm91Z2guCgotLSAKQ2hl
ZXJzLApBcmVrCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
