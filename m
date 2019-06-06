Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644DB892B1
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jun 2019 06:12:44 +0000 (UTC)
Date: Thu, 6 Jun 2019 09:12:40 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20190606061240.tevkdadxk5wydg7x@ahiler-desk1.fi.intel.com>
References: <20190531120723.23889-1-simon.ser@intel.com>
 <20190531120723.23889-2-simon.ser@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190531120723.23889-2-simon.ser@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] tests/i915/gem_mmap: fix
 bad-object tests error value
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
To: Simon Ser <simon.ser@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBNYXkgMzEsIDIwMTkgYXQgMDM6MDc6MjNQTSArMDMwMCwgU2ltb24gU2VyIHdyb3Rl
Ogo+IFRoZXNlIHRlc3RzIGNoZWNrZWQgZm9yIEVJTlZBTCwgYnV0IHRoZSBjb3JyZWN0IGVycm9y
IHZhbHVlIGlzIEVOT0VOVCwgYXMKPiBwb2ludGVkIG91dCBieSBDaHJpcyBXaWxzb246Cj4gCj4g
Y29tbWl0IGJmNzljYjkxNGRiZmU4NDhhZGQ4YmI3NmNiYjhmZjg5MTEwZDI5ZmYKPiBBdXRob3I6
IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IERhdGU6ICAgV2VkIEF1
ZyA0IDE0OjE5OjQ2IDIwMTAgKzAxMDAKPiAKPiAgICAgZHJtOiBVc2UgRU5PRU5UIGNvbnNpc3Rl
bnRseSBmb3IgdGhlIGVycm9yIHJldHVybiBmb3IgYW4gdW5tYXRjaGVkIGhhbmRsZS4KPiAKPiAg
ICAgVGhpcyBpcyBjb25zaXN0ZW50IHdpdGggdHJ5aW5nIHRvIGFjY2VzcyBhIGZpbGVuYW1lIHRo
YXQgbm90IGV4aXN0Cj4gICAgIHdpdGhpbiBhIGRpcmVjdG9yeSB3aGljaCBpcyBhIGdvb2QgYW5h
bG9neSBoZXJlLiBUaGUgbWFpbiByZWFzb24gZm9yIHRoZQo+ICAgICBjaGFuZ2UgaXMgdGhhdCBp
dCBpcyBlYXN5IHRvIGNvbmZ1c2UgdGhlIGVycm9yIGNvZGUgb2YgRUJBREYgYXMgYW4KPiAgICAg
cGVyZm9ybWluZyBhbiBpb2N0bCBvbiBhbiBpbnZhbGlkIGZpbGUgZGVzY3JpcHRvciAocmF0aGVy
IHRoYW4gYW4KPiAgICAgdW5rbm93biBvYmplY3QpLgo+IAo+ICAgICBTaWduZWQtb2ZmLWJ5OiBD
aHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiAgICAgU2lnbmVkLW9mZi1i
eTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KPiAKPiBUaGlzIGNvbW1pdCBmaXhl
cyB0aGUgdHdvIGJhZCB0ZXN0cyAodGhlIGdlbV9tbWFwX2d0dCB0ZXN0IGFscmVhZHkgY2hlY2tz
IGZvcgo+IEVOT0VOVCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogU2ltb24gU2VyIDxzaW1vbi5zZXJA
aW50ZWwuY29tPgo+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4K
UmV2aWV3ZWQtYnk6IEFya2FkaXVzeiBIaWxlciA8YXJrYWRpdXN6LmhpbGVyQGludGVsLmNvbT4K
CmZvciBib3RoIHBhdGNoZXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
