Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E90F6F898
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2019 12:16:53 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191205075800.12625-3-zbigniew.kempczynski@intel.com>
References: <20191205075800.12625-1-zbigniew.kempczynski@intel.com>
 <20191205075800.12625-3-zbigniew.kempczynski@intel.com>
Message-ID: <157554819564.22727.17486311599674289741@skylake-alporthouse-com>
Date: Thu, 05 Dec 2019 12:16:35 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tests/i915/gem_mmap_offset: remove
 local mmap calls
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

UXVvdGluZyBaYmlnbmlldyBLZW1wY3p5xYRza2kgKDIwMTktMTItMDUgMDc6NTg6MDApCj4gRnJv
bTogTHVrYXN6IEthbGFtYXJ6IDxsdWthc3oua2FsYW1hcnpAaW50ZWwuY29tPgo+IAo+IFVzZSBn
ZW1fbW1hbiBmdW5jdGlvbnMgaW5zdGVhZCBsb2NhbCB2ZXJzaW9ucy4KPiBMaW1pdCBhdmFpbGFi
bGUgbWVtb3J5IGZvciAnY2xlYXInIHRlc3QgdG8gcnVuIGl0IG9uIGxtZW0gY29ycmVjdGx5LgoK
SSBhZHZpc2Ugd2UgZG9uJ3QgZG8gdGhpcy4gVGhlIGxlc3NvbiBsZWFybnQgd2l0aCBnZW1fbW1h
cF93Yy5jIGV0IGFsCmlzIHRoYXQgd2Ugd2FudCB0aGUgZGVkaWNhdGVkIHRlc3RzIGZvciBwYXJ0
aWN1bGFyIGlvY3RscyB0byBiZQppbmRlcGVuZGVudCBvZiB0aGUgbGlicmFyeSB3cmFwcGVycyAt
LSBzbyB0aGF0IHdlIGRvIG5vdCBpbmFkdmVydGVudGx5CmNoYW5nZSB0aGUgYmFzaWMgaW9jdGwg
dGVzdHMuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
