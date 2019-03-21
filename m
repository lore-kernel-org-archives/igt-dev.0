Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD18F892BD
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2019 09:05:42 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190321085938.17043-1-simon.ser@intel.com>
References: <20190321085938.17043-1-simon.ser@intel.com>
Message-ID: <155315913079.22764.16577903388199927509@skylake-alporthouse-com>
Date: Thu, 21 Mar 2019 09:05:30 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_latency: fix
 uninitialized variable
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
To: Simon Ser <simon.ser@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBTaW1vbiBTZXIgKDIwMTktMDMtMjEgMDg6NTk6MzgpCj4gU2lnbmVkLW9mZi1ieTog
U2ltb24gU2VyIDxzaW1vbi5zZXJAaW50ZWwuY29tPgo+IC0tLQo+ICB0ZXN0cy9pOTE1L2dlbV9l
eGVjX2xhdGVuY3kuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfbGF0ZW5j
eS5jIGIvdGVzdHMvaTkxNS9nZW1fZXhlY19sYXRlbmN5LmMKPiBpbmRleCA2ZGQxOTFlYy4uMWIw
MjJkZjUgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvaTkxNS9nZW1fZXhlY19sYXRlbmN5LmMKPiArKysg
Yi90ZXN0cy9pOTE1L2dlbV9leGVjX2xhdGVuY3kuYwo+IEBAIC01OTcsNyArNTk3LDcgQEAgcnRo
b2dfbGF0ZW5jeV9vbl9yaW5nKGludCBmZCwgdW5zaWduZWQgaW50IGVuZ2luZSwgY29uc3QgY2hh
ciAqbmFtZSwgdW5zaWduZWQgaW4KPiAgICAgICAgIGZvciAodW5zaWduZWQgaW50IGNoaWxkID0g
MDsgY2hpbGQgPCBuZW5naW5lOyBjaGlsZCsrKSB7Cj4gICAgICAgICAgICAgICAgIHN0cnVjdCBy
dF9wa3Qgbm9ybWFsID0gcmVzdWx0c1tOUEFTUyAqIGNoaWxkICsgMV07Cj4gICAgICAgICAgICAg
ICAgIGlndF9zdGF0c190IHN0YXRzOwo+IC0gICAgICAgICAgICAgICBkb3VibGUgdmFyaWFuY2U7
Cj4gKyAgICAgICAgICAgICAgIGRvdWJsZSB2YXJpYW5jZSA9IDAuMDsKCkkga25vdyBJIHJldmll
d2VkIGEgcGF0Y2ggYnkgUGV0cmkgd2l0aCB0aGUgc2FtZSBmaXguLi4KLUNocmlzCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
