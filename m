Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B556E8C1
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Aug 2018 11:59:57 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180831115108.auuck57ppuh5pulu@platvala-desk.ger.corp.intel.com>
References: <20180831104115.11344-1-katarzyna.dec@intel.com>
 <20180831110049.15277-1-katarzyna.dec@intel.com>
 <20180831115108.auuck57ppuh5pulu@platvala-desk.ger.corp.intel.com>
Message-ID: <153571679178.20986.14820400401693293800@skylake-alporthouse-com>
Date: Fri, 31 Aug 2018 12:59:51 +0100
Subject: Re: [igt-dev] [PATCH i-g-t v3] lib/drmtest: Move open device to
 separate function
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
To: Katarzyna Dec <katarzyna.dec@intel.com>, Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBQZXRyaSBMYXR2YWxhICgyMDE4LTA4LTMxIDEyOjUxOjA4KQo+IE9uIEZyaSwgQXVn
IDMxLCAyMDE4IGF0IDAxOjAwOjQ5UE0gKzAyMDAsIEthdGFyenluYSBEZWMgd3JvdGU6Cj4gPiBX
aGlsZSB3b3JraW5nIG9uIElHVCBjb2RlIGFuZCBkdXJpbmcgcmV2aWV3ZXMgSSd2ZSBub3RpY2Vk
IHRoYXQKPiA+IGl0IGNvdWxkIGJlIG5pY2UgdG8gaGF2ZSBmdW5jdGlvbiB0aGF0IGlzIG9wZW5p
bmcgcGFydGljdWxhciBkZXZpY2UuCj4gPiBMZXQncyBtb3ZlIG91dCBjb25kaXRpb25zIGZvciBv
cGVuaW5nIGRldmljZSBhbmQgcmVuYW1lIF9fb3Blbl9kZXZpY2UKPiA+IHRvIF9fc2VhcmNoX2Fu
ZF9vcGVuKCkgZnVuY3Rpb24uCj4gPiAKPiA+IHYyOiBSZWZhY3RvcmVkIG9wZW5fZGV2aWNlIGV2
ZW4gbW9yZSBieSBnZXR0aW5nIGRldmljZSBuYW1lIG9uY2UgYW5kCj4gPiByZXR1cm5pbmcgZmQg
Zm9yIGl0LiAoQ2hyaXMpCj4gPiB2MzogQWRkZWQgbmFtZV9zaXplIHRvIF9fZ2V0X2RybV9kZXZp
Y2VfbmFtZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogS2F0YXJ6eW5hIERlYyA8a2F0YXJ6eW5h
LmRlY0BpbnRlbC5jb20+Cj4gPiBDYzogRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVsZS5j
ZXJhb2xvc3B1cmlvQGludGVsLmNvbT4KPiA+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlz
LXdpbHNvbi5jby51az4KPiA+IC0tLQo+IAo+IAo+IAo+IFRoaXMgYnJlYWtzIG9wZW5pbmcgdmly
dGlvX2dwdS4KCk9mIGNvdXJzZSB0aGV5IG5lZWRlZCB0byBiZSBkaWZmZXJlbnQgYW5kIGhhdmUg
ZGlzdGluY3QgbmFtZXMgZm9yIHRoZWlyCm1vZHVsZSBhbmQgZHJpdmVyLgotQ2hyaXMKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
