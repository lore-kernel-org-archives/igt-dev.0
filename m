Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C4B46ED6D
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Aug 2019 09:12:03 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20190725103034.8882-1-lionel.g.landwerlin@intel.com>
 <20190725103034.8882-11-lionel.g.landwerlin@intel.com>
 <156460522446.2512.13711873169438917838@skylake-alporthouse-com>
 <7a6d81bf-1bd1-9118-4fc6-7b0903f6d5c7@intel.com>
In-Reply-To: <7a6d81bf-1bd1-9118-4fc6-7b0903f6d5c7@intel.com>
Message-ID: <156473711931.6598.14824855310596046770@skylake-alporthouse-com>
Date: Fri, 02 Aug 2019 10:11:59 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 10/10] tests/i915/exec_fence: add
 timeline fence tests
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBMaW9uZWwgTGFuZHdlcmxpbiAoMjAxOS0wOC0wMiAxMDowMzo1OSkKPiBPbiAzMS8w
Ny8yMDE5IDIzOjMzLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBRdW90aW5nIExpb25lbCBMYW5k
d2VybGluICgyMDE5LTA3LTI1IDExOjMwOjM0KQo+ID4gWW91IGNvdWxkIG1vdmUgdGhpcyB0byBh
IHNlY29uZCBjb250ZXh0IGFuZCBhdm9pZCB0aGUgZGlmZmVyZW50aWF0aW9uCj4gPiBiZXR3ZWVu
IGVuZ2luZXM6Cj4gPgo+ID4gICAgICAgZmVuY2UuZmxhZ3MgPSBJOTE1X0VYRUNfRkVOQ0VfV0FJ
VDsKPiA+ICAgICAgIGV4ZWNidWYucnN2ZDEgPSBnZW1fY29udGV4dF9jcmVhdGUoZmQpOwo+ID4K
PiA+ICAgICAgIG4gPSAwOwo+ID4gICAgICAgZm9yX2VhY2hfZW5naW5lKGZkLCBlbmdpbmUpIHsK
PiA+ICAgICAgICAgICAgICAgb2JqLmhhbmRsZSA9IGdlbV9jcmVhdGUoZmQsIDQwOTYpOwo+ID4g
ICAgICAgICAgICAgICBnZW1fd3JpdGUoZmQsIG9iai5oYW5kbGUsIDAsICZiYmUsIHNpemVvZihi
YmUpKTsKPiA+Cj4gPiAgICAgICAgICAgICAgIC8qIFVuc3luY2hyb25pc2VkIHdpbGwgZXhlY3V0
ZSBhaGVhZCBvZiB0aGUgYmxvY2thZ2UgKi8KPiA+ICAgICAgICAgICAgICAgZXhlY2J1Zi5mbGFn
cyA9IGVuZ2luZTsKPiA+ICAgICAgICAgICAgICAgZXhlY2J1Zi5jbGlwcmVjdHNfcHRyID0gMDsK
PiA+ICAgICAgICAgICAgICAgZ2VtX2V4ZWNidWYoZmQsICZleGVjYnVmKTsKPiA+ICAgICAgICAg
ICAgICAgZ2VtX3N5bmMoZmQsIG9iai5oYW5kbGUpOwo+IAo+IAo+IE5vdCBxdWl0ZSBzdXJlIHRo
aXMgZW5kcyB1cCBibG9ja2luZyBvbiBlbmdpbmU9MS4KCkl0J3MgYSBkaWZmZXJlbnQgY29udGV4
dCwgaXQncyBhbGxvd2VkIHRvIGV4ZWN1dGUgYWhlYWQgb2YgdGhlIHNwaW5uZXIKd2hlbiB0aGUg
c3Bpbm5lciBleGNlZWRzIGl0cyB0aW1lc2xpY2UgLS0gc28gbG9uZyBhcyBwcmVlbXB0aW9uIGlz
CmVuYWJsZWQgb24gdGhlIHNwaW5uZXIuIElmIG5vdCwgdGhhdCdzIGtlcm5lbCBidWcuCi1DaHJp
cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
