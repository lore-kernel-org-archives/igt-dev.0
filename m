Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620C36E428
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2019 15:34:09 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <157478217987.18552.2397064001980929312@skylake-alporthouse-com>
References: <20191126100556.25230-1-zbigniew.kempczynski@intel.com>
 <20191126100556.25230-3-zbigniew.kempczynski@intel.com>
 <157478217987.18552.2397064001980929312@skylake-alporthouse-com>
Message-ID: <157478243421.18552.1731597230604468802@skylake-alporthouse-com>
Date: Tue, 26 Nov 2019 15:33:54 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] lib/i915/gem_mman: add mmap_offset
 support
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTktMTEtMjYgMTU6Mjk6MzkpCj4gUXVvdGluZyBaYmln
bmlldyBLZW1wY3p5xYRza2kgKDIwMTktMTEtMjYgMTA6MDU6NTUpCj4gCj4gRHVlIHRvIGhvdyB3
ZSBoYXZlIGhhZCB0byBleHRlbmQgdGhlIGlvY3RsLCB3ZSBjYW5ub3QgdXNlIGEgc2ltcGxlCj4g
dHJpYWwtYW5kLWVycm9yIGFwcHJvYWNoLCBidXQgbmVlZCB0aGUgQVBJIHBhcmFtZXRlcjoKPiAK
PiA+ICtib29sIF9fZ2VtX21tYXBfb2Zmc2V0X19oYXNfd2MoaW50IGZkKQo+ID4gK3sKPiA+ICsg
ICAgICAgaW50IGhhc193YyA9IDA7Cj4gPiArICAgICAgIHN0cnVjdCBkcm1faTkxNV9nZW1fbW1h
cF9vZmZzZXQgYXJnOwo+IAo+ICAgICAgICBpZiAoIWdlbV9oYXNfbW1hcF9vZmZzZXQoZmQpKQo+
ICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKCk1heWJlIGV2ZW46Cgp1aW50MzJfdCBoYW5k
bGU7CnZvaWQgKm1hcDsKCmhhbmRsZSA9IGdlbV9jcmVhdGUoZmQsIDQwOTYpOwptYXAgPSBfX2dl
bV9tbWFwX29mZnNldChmZCwgaGFuZGxlLCAwLCA0MDk2LAoJUFJPVF9SRUFELCBJOTE1X01NQVBf
T0ZGU0VUX1dDKTsKaWYgKG1hcCkKCW11bnVtYXAobWFwLCA0MDk2KTsKZ2VtX2Nsb3NlKGZkLCBo
YW5kbGUpOwoKcmV0dXJuIG1hcDsKCj4gPiArCj4gPiArICAgICAgIC8qIERvZXMgdGhpcyBkZXZp
Y2Ugc3VwcG9ydCB3Yy1tbWFwcyA/ICovCj4gPiArICAgICAgIG1lbXNldCgmYXJnLCAwLCBzaXpl
b2YoYXJnKSk7Cj4gPiArICAgICAgIGFyZy5oYW5kbGUgPSBnZW1fY3JlYXRlKGZkLCA0MDk2KTsK
PiA+ICsgICAgICAgYXJnLm9mZnNldCA9IDA7Cj4gPiArICAgICAgIGFyZy5mbGFncyA9IEk5MTVf
TU1BUF9PRkZTRVRfV0M7Cj4gPiArICAgICAgIGhhc193YyA9IGlndF9pb2N0bChmZCwgRFJNX0lP
Q1RMX0k5MTVfR0VNX01NQVBfT0ZGU0VULAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
JmFyZykgPT0gMDsKPiA+ICsgICAgICAgZ2VtX2Nsb3NlKGZkLCBhcmcuaGFuZGxlKTsKCkJhaCwg
bWlzc2VkIHRoZSBtdW5tYXAKLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldg==
