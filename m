Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BF489FC8
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jun 2021 08:40:35 +0000 (UTC)
Date: Tue, 15 Jun 2021 10:40:29 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210615084029.GJ4738@zkempczy-mobl2>
References: <20210614163704.365989-1-jason@jlekstrand.net>
 <20210614163902.366168-4-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210614163902.366168-4-jason@jlekstrand.net>
Subject: Re: [igt-dev] [PATCH i-g-t 53/77] tests/i915/gem_exec_endless: Stop
 munging ctx0 engines
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
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTQsIDIwMjEgYXQgMTE6Mzg6MzhBTSAtMDUwMCwgSmFzb24gRWtzdHJhbmQg
d3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogSmFzb24gRWtzdHJhbmQgPGphc29uQGpsZWtzdHJhbmQu
bmV0Pgo+IC0tLQo+ICB0ZXN0cy9pOTE1L2dlbV9leGVjX2VuZGxlc3MuYyB8IDIgKy0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfZW5kbGVzcy5jIGIvdGVzdHMvaTkxNS9nZW1fZXhlY19l
bmRsZXNzLmMKPiBpbmRleCBjM2M4MDY1NDMuLmI4M2Q1YTJjMSAxMDA2NDQKPiAtLS0gYS90ZXN0
cy9pOTE1L2dlbV9leGVjX2VuZGxlc3MuYwo+ICsrKyBiL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfZW5k
bGVzcy5jCj4gQEAgLTMwOSw3ICszMDksNyBAQCBzdGF0aWMgdm9pZCBlbmRsZXNzX2Rpc3BhdGNo
KGludCBpOTE1LCBjb25zdCBzdHJ1Y3QgaW50ZWxfZXhlY3V0aW9uX2VuZ2luZTIgKmUpCj4gIH0K
PiAgCj4gICNkZWZpbmUgdGVzdF9lYWNoX2VuZ2luZShULCBpOTE1LCBlKSBcCj4gLQlpZ3Rfc3Vi
dGVzdF93aXRoX2R5bmFtaWMoVCkgX19mb3JfZWFjaF9waHlzaWNhbF9lbmdpbmUoaTkxNSwgZSkg
XAo+ICsJaWd0X3N1YnRlc3Rfd2l0aF9keW5hbWljKFQpIGZvcl9lYWNoX3BoeXNpY2FsX2VuZ2lu
ZShpOTE1LCBlKSBcCj4gIAkJZm9yX2VhY2hfaWYoZ2VtX2NsYXNzX2Nhbl9zdG9yZV9kd29yZChp
OTE1LCAoZSktPmNsYXNzKSkgXAo+ICAJCQlpZ3RfZHluYW1pY19mKCIlcyIsIChlKS0+bmFtZSkK
PgoKUmV2aWV3ZWQtYnk6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5z
a2lAaW50ZWwuY29tPgoKLS0KWmJpZ25pZXcKICAKPiAtLSAKPiAyLjMxLjEKPiAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGlndC1kZXYgbWFpbGlu
ZyBsaXN0Cj4gaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
