Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F1289DB7
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Nov 2018 16:58:21 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id d15-v6so8059200edr.0
 for <igt-dev@lists.freedesktop.org>; Tue, 06 Nov 2018 08:58:21 -0800 (PST)
Date: Tue, 6 Nov 2018 17:58:17 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20181106165817.GS21967@phenom.ffwll.local>
References: <20181106161943.28641-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181106161943.28641-1-ville.syrjala@linux.intel.com>
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBOb3YgMDYsIDIwMTggYXQgMDY6MTk6NDFQTSArMDIwMCwgVmlsbGUgU3lyamFsYSB3
cm90ZToKPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+IAo+IERlYWwgd2l0aCBmcmFtZSBjb3VudGVyIHdyYXBhcm91bmQgY29ycmVjcnRseS4K
PiAKPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVs
LmNvbT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBTaWdu
ZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29t
PgoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+
IC0tLQo+ICBsaWIvaWd0X2RlYnVnZnMuYyB8IDEyICsrKysrKysrKysrLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9s
aWIvaWd0X2RlYnVnZnMuYyBiL2xpYi9pZ3RfZGVidWdmcy5jCj4gaW5kZXggYTNhY2E4NDY2NjU4
Li43MDg3NDQxNmQxMjggMTAwNjQ0Cj4gLS0tIGEvbGliL2lndF9kZWJ1Z2ZzLmMKPiArKysgYi9s
aWIvaWd0X2RlYnVnZnMuYwo+IEBAIC05NzUsNiArOTc1LDE2IEBAIHZvaWQgaWd0X3BpcGVfY3Jj
X2dldF9zaW5nbGUoaWd0X3BpcGVfY3JjX3QgKnBpcGVfY3JjLCBpZ3RfY3JjX3QgKmNyYykKPiAg
CWNyY19zYW5pdHlfY2hlY2tzKGNyYyk7Cj4gIH0KPiAgCj4gK3N0YXRpYyBib29sIHZibF9hZnRl
cl9lcSh1aW50MzJfdCBhLCB1aW50MzJfdCBiKQo+ICt7Cj4gKwlyZXR1cm4gKGludDMyX3QpKGEg
LSBiKSA+PSAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMgYm9vbCB2YmxfYmVmb3JlX2VxKHVpbnQzMl90
IGEsIHVpbnQzMl90IGIpCj4gK3sKPiArCXJldHVybiB2YmxfYWZ0ZXJfZXEoYiwgYSk7Cj4gK30K
PiArCj4gIC8qKgo+ICAgKiBpZ3RfcGlwZV9jcmNfZ2V0X2N1cnJlbnQ6Cj4gICAqIEBkcm1fZmQ6
IFBvaW50ZXIgdG8gZHJtIGZkIGZvciB2YmxhbmsgY291bnRlcgo+IEBAIC05OTksNyArMTAwOSw3
IEBAIGlndF9waXBlX2NyY19nZXRfY3VycmVudChpbnQgZHJtX2ZkLCBpZ3RfcGlwZV9jcmNfdCAq
cGlwZV9jcmMsIGlndF9jcmNfdCAqY3JjKQo+ICAJCQlpZ3RfcGlwZV9jcmNfZ2V0X3NpbmdsZShw
aXBlX2NyYywgY3JjKTsKPiAgCQkJcmV0dXJuOwo+ICAJCX0KPiAtCX0gd2hpbGUgKGNyYy0+ZnJh
bWUgPD0gdmJsYW5rKTsKPiArCX0gd2hpbGUgKHZibF9iZWZvcmVfZXEoY3JjLT5mcmFtZSwgdmJs
YW5rKSk7Cj4gIAo+ICAJY3JjX3Nhbml0eV9jaGVja3MoY3JjKTsKPiAgfQo+IC0tIAo+IDIuMTgu
MQo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0
aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldgo=
