Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68026E3E3
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Nov 2018 17:11:30 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20181106161943.28641-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20181106161943.28641-1-ville.syrjala@linux.intel.com>
Message-ID: <154152428093.6179.8744061859592611295@skylake-alporthouse-com>
Date: Tue, 06 Nov 2018 17:11:26 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/debugfs: Fix wraparound
 handling for crc frame counter check
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

UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDE4LTExLTA2IDE2OjE5OjQxKQo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gRGVhbCB3aXRo
IGZyYW1lIGNvdW50ZXIgd3JhcGFyb3VuZCBjb3JyZWNydGx5Lgo+IAo+IENjOiBNYWFydGVuIExh
bmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IENjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5
cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gLS0tCj4gIGxpYi9pZ3Rf
ZGVidWdmcy5jIHwgMTIgKysrKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZGVidWdmcy5j
IGIvbGliL2lndF9kZWJ1Z2ZzLmMKPiBpbmRleCBhM2FjYTg0NjY2NTguLjcwODc0NDE2ZDEyOCAx
MDA2NDQKPiAtLS0gYS9saWIvaWd0X2RlYnVnZnMuYwo+ICsrKyBiL2xpYi9pZ3RfZGVidWdmcy5j
Cj4gQEAgLTk3NSw2ICs5NzUsMTYgQEAgdm9pZCBpZ3RfcGlwZV9jcmNfZ2V0X3NpbmdsZShpZ3Rf
cGlwZV9jcmNfdCAqcGlwZV9jcmMsIGlndF9jcmNfdCAqY3JjKQo+ICAgICAgICAgY3JjX3Nhbml0
eV9jaGVja3MoY3JjKTsKPiAgfQo+ICAKPiArc3RhdGljIGJvb2wgdmJsX2FmdGVyX2VxKHVpbnQz
Ml90IGEsIHVpbnQzMl90IGIpCj4gK3sKPiArICAgICAgIHJldHVybiAoaW50MzJfdCkoYSAtIGIp
ID49IDA7Cj4gK30KPiArCj4gK3N0YXRpYyBib29sIHZibF9iZWZvcmVfZXEodWludDMyX3QgYSwg
dWludDMyX3QgYikKPiArewo+ICsgICAgICAgcmV0dXJuIHZibF9hZnRlcl9lcShiLCBhKTsKPiAr
fQoKVGhlc2Ugc2VlbSBsaWtlIHdpZGVseSB1c2VmdWwgZnVuY3Rpb25zLgoKaWd0X3ZibGFua19w
YXNzZWQoKSA/CgpGb3Igbm93LApSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXYK
