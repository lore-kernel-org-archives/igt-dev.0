Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9754F6E086
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2019 20:39:03 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20190417203544.22298-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20190417203544.22298-1-ville.syrjala@linux.intel.com>
Message-ID: <155553353889.25904.14271529533299776329@skylake-alporthouse-com>
Date: Wed, 17 Apr 2019 21:38:58 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 1/5] lib/igt_fb: Unref the renderecopy
 scratch bos
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDE5LTA0LTE3IDIxOjM1OjQwKQo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gV2UncmUgY3Vy
cmVudGx5IGxlYWtpbmcgYWxsIHRoZSB0ZW1wb3JhcnkgYm9zIHdlIGNvbnN0cnVjdAo+IGZvciBy
ZW5kZXJjb3B5LiBUaGF0IGRvZXNuJ3QgZ28gc28gd2VsbCB3aGVuIHRyeWluZyB0byB0ZXN0Cj4g
d2l0aCAxR2lCIGZyYW1lYnVmZmVycy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rs
w6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IC0tLQo+ICBsaWIvaWd0X2ZiLmMg
fCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL2xpYi9pZ3RfZmIuYyBiL2xpYi9pZ3RfZmIuYwo+IGluZGV4IDZhNDNmY2M0NzM1Zi4uYzNl
Y2Q3MTg2NDQ0IDEwMDY0NAo+IC0tLSBhL2xpYi9pZ3RfZmIuYwo+ICsrKyBiL2xpYi9pZ3RfZmIu
Ywo+IEBAIC0xNjQ3LDYgKzE2NDcsOSBAQCBzdGF0aWMgdm9pZCByZW5kZXJjb3B5KHN0cnVjdCBm
Yl9ibGl0X3VwbG9hZCAqYmxpdCwKPiAgICAgICAgIHJlbmRlcl9jb3B5KGJsaXQtPmJhdGNoLCBO
VUxMLAo+ICAgICAgICAgICAgICAgICAgICAgJnNyYywgMCwgMCwgZHN0X2ZiLT5wbGFuZV93aWR0
aFswXSwgZHN0X2ZiLT5wbGFuZV9oZWlnaHRbMF0sCj4gICAgICAgICAgICAgICAgICAgICAmZHN0
LCAwLCAwKTsKPiArCj4gKyAgICAgICBkcm1faW50ZWxfYm9fdW5yZWZlcmVuY2UoZHN0LmJvKTsK
PiArICAgICAgIGRybV9pbnRlbF9ib191bnJlZmVyZW5jZShzcmMuYm8pOwoKRm9yIHN5bW1ldHJ5
IEkgd291bGQgc3VnZ2VzdCBhIGZpbmlfYnVmKCkuClJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24g
PGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldg==
