Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE426F41B
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2020 21:16:59 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200122111153.GJ25209@platvala-desk.ger.corp.intel.com>
References: <20200122110548.22838-1-zbigniew.kempczynski@intel.com>
 <20200122111153.GJ25209@platvala-desk.ger.corp.intel.com>
Message-ID: <158024621519.7186.12871857226904306168@skylake-alporthouse-com>
Date: Tue, 28 Jan 2020 21:16:55 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_collection: Adding
 combinatorics facility
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
To: Petri Latvala <petri.latvala@intel.com>, =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBQZXRyaSBMYXR2YWxhICgyMDIwLTAxLTIyIDExOjExOjUzKQo+IE9uIFdlZCwgSmFu
IDIyLCAyMDIwIGF0IDEyOjA1OjQ4UE0gKzAxMDAsIFpiaWduaWV3IEtlbXBjennFhHNraSB3cm90
ZToKPiA+IER5bmFtaWMgdGVzdHMgZ2l2ZXMgdXMgbmV3IG1ldGhvZCB0byBjcmVhdGUgdGVzdHMg
ZGVwZW5kaW5nIG9uIHRoZQo+ID4gaGFyZHdhcmUvc29mdHdhcmUgY2FwYWJpbGl0aWVzLiBUbyBj
aGVjayBjb3ZlcmFnZSBzb21lIHRlc3RzIHJlcXVpcmUKPiA+IHZlcmlmaWNhdGlvbiBvdmVyIHNv
bWUgc2V0IG9mIG9iamVjdHMvZGF0YS4gVG8gbWFrZSBsaWZlIGVhc2llcgo+ID4gd2l0aCBjb21i
aW5hdG9yaWNzIHRoaXMgcGF0Y2ggaW50cm9kdWNlcyBpZ3RfY29sbGVjdGlvbi4gQ3VycmVudGx5
IGl0Cj4gPiBzdXBwb3J0cyBpdGVyYXRpbmcgb3ZlciBzZXQgdG8gZ2V0IHN1YnNldHMsIGNvbWJp
bmF0aW9ucywgdmFyaWF0aW9ucwo+ID4gd2l0aCBhbmQgd2l0aG91dCByZXBldGl0aW9ucy4KPiA+
IENvZGUgaGFzIHNvbWUgbGltaXRhdGlvbiAoc2V0L3N1YnNldCBjYW5ub3QgYmUgbGFyZ2VyIHRo
YW4gMTYgZWxlbWVudHMsCj4gPiB3aGF0IGlzIGVub3VnaCBmb3IgbW9zdCBjYXNlcykuCj4gPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6
eW5za2lAaW50ZWwuY29tPgo+ID4gQ2M6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50
ZWwuY29tPgo+ID4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+
IAo+IElzIHRoZSBwbGFuIHRvIG1lcmdlIHRoaXMgcGF0Y2ggZmlyc3QgYW5kIHRoZW4gd29yayBv
biB1bml0IHRlc3RzIGFuZAo+IHRoZSBjb2RlIHRoYXQgdXNlcyBjb2xsZWN0aW9ucz8KPiAKPiBG
b3IgdGhhdCBwbGFuLCBhbmQgdGhpcyBwYXRjaDoKCkVpdGhlciBhIHVuaXQgdGVzdCBvciB1c2Vy
IHRvIGxhbmQgdGhlIHBhdGNoIDotcAotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2Cg==
