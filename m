Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DAAA6E0CC
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Nov 2019 15:08:30 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20191129143048.1936-1-ville.syrjala@linux.intel.com>
 <20191129143048.1936-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20191129143048.1936-2-ville.syrjala@linux.intel.com>
Message-ID: <157504010559.11312.8977766640437417351@skylake-alporthouse-com>
Date: Fri, 29 Nov 2019 15:08:25 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] lib/igt_draw: Fix blt tiled stride
 for gen2/3
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

UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDE5LTExLTI5IDE0OjMwOjQ3KQo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gR2VuMi8zIGJs
aXR0ZXIgZG9lc24ndCB3YW50IHVzIHRvIGRvIHRoZSAvNCBhZGp1c3RtZW50Cj4gdG8gdGhlIHRp
bGVkIHN0cmlkZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPgo+IC0tLQo+ICBsaWIvaWd0X2RyYXcuYyB8IDIgKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2xpYi9pZ3RfZHJhdy5jIGIvbGliL2lndF9kcmF3LmMKPiBpbmRleCAxMWJiZmQwYTEz
NTMuLjdlMGVkZWMxOThkMiAxMDA2NDQKPiAtLS0gYS9saWIvaWd0X2RyYXcuYwo+ICsrKyBiL2xp
Yi9pZ3RfZHJhdy5jCj4gQEAgLTU1MSw3ICs1NTEsNyBAQCBzdGF0aWMgdm9pZCBkcmF3X3JlY3Rf
Ymx0KGludCBmZCwgc3RydWN0IGNtZF9kYXRhICpjbWRfZGF0YSwKPiAgCj4gICAgICAgICBibHRf
Y21kX2xlbiA9IChnZW4gPj0gOCkgPyAgMHg1IDogMHg0Owo+ICAgICAgICAgYmx0X2NtZF90aWxp
bmcgPSAodGlsaW5nKSA/IFhZX0NPTE9SX0JMVF9USUxFRCA6IDA7Cj4gLSAgICAgICBwaXRjaCA9
ICh0aWxpbmcpID8gYnVmLT5zdHJpZGUgLyA0IDogYnVmLT5zdHJpZGU7Cj4gKyAgICAgICBwaXRj
aCA9IChnZW4gPj0gNCAmJiB0aWxpbmcpID8gYnVmLT5zdHJpZGUgLyA0IDogYnVmLT5zdHJpZGU7
CgpSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci1D
aHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
