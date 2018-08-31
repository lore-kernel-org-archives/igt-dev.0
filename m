Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7114F6E8DF
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Aug 2018 13:25:45 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180831131055.GE18600@kdec5-desk.ger.corp.intel.com>
References: <20180831121853.18786-1-chris@chris-wilson.co.uk>
 <20180831131055.GE18600@kdec5-desk.ger.corp.intel.com>
Message-ID: <153572194055.6452.16977117255742463469@skylake-alporthouse-com>
Date: Fri, 31 Aug 2018 14:25:40 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Stop caching __drm_device_id
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
To: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBLYXRhcnp5bmEgRGVjICgyMDE4LTA4LTMxIDE0OjEwOjU1KQo+IE9uIEZyaSwgQXVn
IDMxLCAyMDE4IGF0IDAxOjE4OjUzUE0gKzAxMDAsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IElu
IGEgbXVsdGktZGV2aWNlIHN5c3RlbSB0aGVyZSBpcyBubyBndWFyYW50ZWUgdGhhdCB0aGUgZmQg
YmVpbmcgcHJvYmVkCj4gPiBpbiBpbnRlbF9nZXRfZHJtX2RldmlkKCkgaXMgdGhlIHNhbWUgYXMg
d2FzIG9wZW5lZCBlYXJsaWVyLiBBbnkgY2FjaGUKPiA+IG1heSBvdXRsaXZlIHRoZSBmZCwgc28g
aXMgZnJvdWdodCB3aXRoIGxpZmV0aW1lIGlzc3Vlcy4gVGhlIHByaW1hcnkKPiA+IHJlYXNvbiBm
b3IgY2FjaGluZyB0aGUgZGV2aWQgd2FzIHRvIGF2b2lkIGV4dHJhIGlvY3RscyBpbiB0aGUKPiA+
IGRtZXNnL3N0cmFjZSwgYnV0IGhvcGVmdWxseSBhbGwgdXNlcnMgbm93IGdyYWIgdGhlIGlkIGlu
IHRoZWlyIGZpeHR1cmUKPiA+IGFuZCBub3QgaW5zaWRlIGV2ZXJ5IGZ1bmN0aW9uLgo+ID4gCj4g
PiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4K
PiA+IENjOiBLYXRhcnp5bmEgRGVjIDxrYXRhcnp5bmEuZGVjQGludGVsLmNvbT4KPiBSZXZpZXdl
ZC1ieTogS2F0YXJ6eW5hIERlYyA8a2F0YXJ6eW5hLmRlY0BpbnRlbC5jb20+Cj4gCj4gSSB3aWxs
IHByb2JhYmx5IGhhdmUgY29uZmxpY3Qgd2l0aCB0aGlzIHBhdGNoLCBidXQgaXQgaXMgb2suCgpQ
dXNoZWQsIHRoYXQgc2hvdWxkIGZpeCB1cCB0aGUgQ0kgZmFpbHVyZXMgZm9yIHlvdXIgcGF0Y2gu
Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
