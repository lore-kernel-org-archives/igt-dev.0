Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70B86F1BA
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jan 2019 20:40:48 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20190109174057.16835-1-lukasz.kalamarz@intel.com>
 <20190109174057.16835-2-lukasz.kalamarz@intel.com>
In-Reply-To: <20190109174057.16835-2-lukasz.kalamarz@intel.com>
Message-ID: <154706643954.15385.15596004625618353914@skylake-alporthouse-com>
Date: Wed, 09 Jan 2019 20:40:39 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 2/6] lib/ioctl_wrapper: Implement
 __gem_mmap
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
To: Lukasz Kalamarz <lukasz.kalamarz@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBMdWthc3ogS2FsYW1hcnogKDIwMTktMDEtMDkgMTc6NDA6NTMpCj4gK3ZvaWQgKl9f
Z2VtX21tYXAoaW50IGZkLCB1aW50MzJfdCBoYW5kbGUsIHVpbnQ2NF90IG9mZnNldCwgdWludDY0
X3Qgc2l6ZSwgdW5zaWduZWQgcHJvdCwgYm9vbCB3YykKPiArewo+ICsgICAgICAgc3RydWN0IGRy
bV9pOTE1X2dlbV9tbWFwIGFyZzsKPiArCj4gKyAgICAgICBpZiAod2MgJiAhZ2VtX21tYXBfX2hh
c193YyhmZCkpIHsKCkxldCdzIGp1c3QgcGFzcyBpdCB0byB0aGUga2VybmVsIG9uY2UgcmF0aGVy
IHRoYW4gdHdpY2UuIEl0IG9ubHkgcmVhbGx5Cm1hZGUgc2Vuc2UgaWYgdGhlcmUgd2FzIGFuIGFz
c2VydCBsYXRlciBvbiBhbmQgd2Ugd2FudGVkIHRvCmRpZmZlcmVudGlhdGUgYmV0d2VlbiBleHBl
Y3RlZCBmYWlsdXJlIGFuZCB1c2VyIGVycm9yLgoKPiArICAgICAgICAgICAgICAgZXJybm8gPSBF
Tk9TWVM7Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ICsgICAgICAgfQo+ICsKPiAr
ICAgICAgIG1lbXNldCgmYXJnLCAwLCBzaXplb2YoYXJnKSk7Cj4gKyAgICAgICBhcmcuaGFuZGxl
ID0gaGFuZGxlOwo+ICsgICAgICAgYXJnLm9mZnNldCA9IG9mZnNldDsKPiArICAgICAgIGFyZy5z
aXplID0gc2l6ZTsKPiArICAgICAgIGFyZy5mbGFncyA9IHdjID8gSTkxNV9NTUFQX1dDIDogMDsK
ClRoZW4gdGFrZSBfZmxhZ3NfLgoKPiArICAgICAgIGlmIChpZ3RfaW9jdGwoZmQsIERSTV9JT0NU
TF9JOTE1X0dFTV9NTUFQLCAmYXJnKSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4g
Kwo+ICsgICAgICAgVkcoVkFMR1JJTkRfTUFLRV9NRU1fREVGSU5FRChmcm9tX3VzZXJfcG9pbnRl
cihhcmcuYWRkcl9wdHIpLCBhcmcuc2l6ZSkpOwo+ICsKPiArICAgICAgIGVycm5vID0gMDsKPiAr
ICAgICAgIHJldHVybiBmcm9tX3VzZXJfcG9pbnRlcihhcmcuYWRkcl9wdHIpOwo+ICt9Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
