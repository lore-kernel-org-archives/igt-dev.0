Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7240789C8D
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Jun 2018 08:20:10 +0000 (UTC)
References: <20180606201642.24618-1-ville.syrjala@linux.intel.com>
 <20180606201642.24618-4-ville.syrjala@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <6b2132e4-64bf-b0ff-2849-441707ca223a@linux.intel.com>
Date: Thu, 7 Jun 2018 10:20:07 +0200
MIME-Version: 1.0
In-Reply-To: <20180606201642.24618-4-ville.syrjala@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] lib/igt_fb: Round to nearest when
 clamping rgb
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

T3AgMDYtMDYtMTggb20gMjI6MTYgc2NocmVlZiBWaWxsZSBTeXJqYWxhOgo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4KPiBJIHRoaW5rIHJv
dW5kIHRvIG5lYXJlc3QgaXMgbWF5YmUgbW9yZSBjb3JyZWN0IGhlcmUuIEFsc28gZG8gdGhlCj4g
Y2xhbXAgd2l0aCBpbnRlZ2VycyBhcyBpdCBhY3R1YWxseSBtYWtlcyB0aGUgcmVzdWx0aW5nIGNv
ZGUKPiBtZWFzdXJhYmx5IGZhc3Rlci4KPgo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRl
bi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrD
pGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gLS0tCj4gIGxpYi9pZ3RfZmIu
YyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9mYi5jIGIvbGliL2lndF9mYi5jCj4gaW5kZXggYTky
NmEwOGQ0NGUxLi42ZmY5MGQ1M2Y0MzMgMTAwNjQ0Cj4gLS0tIGEvbGliL2lndF9mYi5jCj4gKysr
IGIvbGliL2lndF9mYi5jCj4gQEAgLTEzMjMsNyArMTMyMyw3IEBAIHN0cnVjdCBmYl9jb252ZXJ0
X2JsaXRfdXBsb2FkIHsKPiAgCj4gIHN0YXRpYyB1aW50OF90IGNsYW1wcmdiKGZsb2F0IHZhbCkK
PiAgewo+IC0JcmV0dXJuIGNsYW1wKHZhbCwgMC4wZiwgMjU1LjBmKTsKPiArCXJldHVybiBjbGFt
cCgoaW50KSh2YWwgKyAwLjVmKSwgMCwgMjU1KTsKPiAgfQo+ICAKPiAgc3RhdGljIHZvaWQgY29u
dmVydF9udjEyX3RvX3JnYjI0KHN0cnVjdCBpZ3RfZmIgKmZiLCBzdHJ1Y3QgZmJfY29udmVydF9i
bGl0X3VwbG9hZCAqYmxpdCkKCk5vIGFsZ29yaXRobToKcmVhbCAgICAwbTIyLDA1MnMKCk9yaWdp
bmFsIGFsZ29yaXRobToKcmVhbCAgICAwbTI2LDA5MXMKCk5ldyBhbGdvcml0aG06CnJlYWwgICAg
MG0yOSwzNDJzCgpBbW91bnQgb2YgY29udmVyc2lvbnMgdGhhdCBhcmUgMjU2MHgxNDQwOiAxOC4g
U29tZSBzbWFsbGVyIDY0eDY0IGFuZCAxMjh4MTI4IGFyZSBkb25lIHRvbyBidXQgbm90IHdoZXJl
IG1vc3QgdGltZSB3aWxsIGJlIHNwZW50Li4KCkVhY2ggY29udmVyc2lvbiAoYmFjayBhbmQgZm9y
dGgpIGFwcHJveGltYXRlbHkgdGFrZXMgLjQwNXMsIHdoaWNoIHdvdWxkIGludGVycG9sYXRlIHRv
IDAuOTExcyBmb3IgYSA0SyBmYi4gSnVzdCBhYm91dCBkb2FibGUgd2l0aG91dCBmdXJ0aGVyIG9w
dGltaXphdGlvbnMuCgpSZXZpZXdlZC1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFu
a2hvcnN0QGxpbnV4LmludGVsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldgo=
