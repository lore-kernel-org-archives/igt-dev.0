Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85F06E91D
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jan 2018 10:34:30 +0000 (UTC)
References: <20180130101119.15758-1-tvrtko.ursulin@linux.intel.com>
 <20180130101119.15758-11-tvrtko.ursulin@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <7ef3ed4d-6a32-3f80-3822-f1d84903e730@linux.intel.com>
Date: Tue, 30 Jan 2018 10:34:27 +0000
MIME-Version: 1.0
In-Reply-To: <20180130101119.15758-11-tvrtko.ursulin@linux.intel.com>
Content-Language: en-GB
Subject: Re: [igt-dev] [PATCH i-g-t 08/11] trace.pl: Split engine busy
 accounting in split mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

CkdhcmJhZ2UgaW4gdGhlIGN3ZCwgcGxlYXNlIGlnbm9yZSB0aGlzIG9uZSEgOigKCk9uIDMwLzAx
LzIwMTggMTA6MTEsIFR2cnRrbyBVcnN1bGluIHdyb3RlOgo+IEZyb206IFR2cnRrbyBVcnN1bGlu
IDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Cj4gCj4gSW4gc3BsaXQgbW9kZSBhbGwgcmVxdWVz
dHMgaGF2ZSB0byBiZSBhZGRlZCB1cCBzaW5jZSB0aGV5IHdlcmUgcHJldmlvdXNseQo+IHJlLWFy
cmFuZ2VkIHNvIHRoZXJlIGlzIG5vIG92ZXJsYXAuCj4gCj4gU2lnbmVkLW9mZi1ieTogVHZydGtv
IFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KPiBDYzogSm9obiBIYXJyaXNvbiA8
Sm9obi5DLkhhcnJpc29uQGludGVsLmNvbT4KPiAtLS0KPiAgIHNjcmlwdHMvdHJhY2UucGwgfCAz
ICsrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
IAo+IGRpZmYgLS1naXQgYS9zY3JpcHRzL3RyYWNlLnBsIGIvc2NyaXB0cy90cmFjZS5wbAo+IGlu
ZGV4IDE2YTE2NzVjNmMyMS4uZTM5ZDU2Yzk2MmU3IDEwMDc1NQo+IC0tLSBhL3NjcmlwdHMvdHJh
Y2UucGwKPiArKysgYi9zY3JpcHRzL3RyYWNlLnBsCj4gQEAgLTU3OCw3ICs1NzgsOCBAQCBmb3Jl
YWNoIG15ICRrZXkgKEBzb3J0ZWRfa2V5cykgewo+ICAgCSRkYnska2V5fS0+eydzdWJtaXQtZGVs
YXknfSA9ICRkYnska2V5fS0+eydzdWJtaXQnfSAtICRkYnska2V5fS0+eydxdWV1ZSd9Owo+ICAg
CSRkYnska2V5fS0+eydkdXJhdGlvbid9ID0gJG5vdGlmeSAtICRzdGFydDsKPiAgIAo+IC0JJHJ1
bm5pbmd7JHJpbmd9ICs9ICRlbmQgLSAkc3RhcnQgdW5sZXNzIGV4aXN0cyAkZGJ7JGtleX0tPnsn
bm8tZW5kJ307Cj4gKwkkcnVubmluZ3skcmluZ30gKz0gJGVuZCAtICRzdGFydCBpZiAkY29ycmVj
dF9kdXJhdGlvbnMgb3IKPiArCQkJCQkgICAgbm90IGV4aXN0cyAkZGJ7JGtleX0tPnsnbm8tZW5k
J307Cj4gICAJJHJ1bm5hYmxleyRyaW5nfSArPSAkZGJ7JGtleX0tPnsnZXhlY3V0ZS1kZWxheSd9
Owo+ICAgCSRxdWV1ZWR7JHJpbmd9ICs9ICRzdGFydCAtICRkYnska2V5fS0+eydleGVjdXRlLWRl
bGF5J30gLSAkZGJ7JGtleX0tPnsncXVldWUnfTsKPiAgIAo+IApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2lndC1kZXYK
