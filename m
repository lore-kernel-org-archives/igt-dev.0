Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BBD16E7AD
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2019 19:53:15 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191120185739.7497-5-zbigniew.kempczynski@intel.com>
References: <20191120185739.7497-1-zbigniew.kempczynski@intel.com>
 <20191120185739.7497-5-zbigniew.kempczynski@intel.com>
Message-ID: <157427958293.13839.9343823746796446845@skylake-alporthouse-com>
Date: Wed, 20 Nov 2019 19:53:02 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v3 4/4] tests/i915/gem_exec_basic:
 Iterate over all memory regions
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

UXVvdGluZyBaYmlnbmlldyBLZW1wY3p5xYRza2kgKDIwMTktMTEtMjAgMTg6NTc6MzkpCj4gRnJv
bTogTHVrYXN6IEthbGFtYXJ6IDxsdWthc3oua2FsYW1hcnpAaW50ZWwuY29tPgo+IAo+IEFzIGEg
cGFydCBvZiBsb2NhbCBtZW1vcnkgZWZmb3J0IHdlIG5lZWQgdG8gbWFrZSBzdXJlLCB0aGF0IGJh
c2ljCj4gc2NlbmFyaW9zIGFyZSBjb3ZlcmVkIGZvciBldmVyeSBhdmFpbGFibGUgbWVtb3J5IHJl
Z2lvbi4gVGhpcyBwYXRjaCBpcwo+IGFuIGF0dGVtcHQgZm9yIHRoaXMgcHJvYmxlbS4gSWYgaXQg
d2lsbCBiZSBhY2NlcHRlZCBpdCB3aWxsIGJlCj4gcmVwbGljYXRlZCBvbiBlYWNoIHRlc3QgdGhh
dCBjYW4gYmVuZWZpdCBmcm9tIGl0LgoKZ2VtX2V4ZWNfYmFzaWMganVzdCBleGVyY2lzZXMgdGhl
IGV4ZWNidWYgaW9jdGwuLi4gd2hpY2ggZG9lcyBub3QKbWVudGlvbiBtZW1vcnkgcmVnaW9uLiBZ
b3UgYXJlIHRoaW5raW5nIG9mIGdlbV9leGVjX25vcCBhbmQKZ2VtX2V4ZWNfc3RvcmUgZm9yIHRo
aXMgZmlyc3QgbGV2ZWwgb2YgYmFzaWMgdGVzdGluZy4KLUNocmlzCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldg==
