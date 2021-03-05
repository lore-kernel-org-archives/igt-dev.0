Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207B96EB54
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Mar 2021 15:00:12 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20210301161403.98278-33-zbigniew.kempczynski@intel.com>
References: <20210301161403.98278-1-zbigniew.kempczynski@intel.com>
 <20210301161403.98278-33-zbigniew.kempczynski@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 05 Mar 2021 15:00:09 +0000
Message-ID: <161495640932.8241.13115791967867365730@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t v21 32/35] tests/gem_ppgtt: Adopt test
 to use intel_bb with allocator
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
To: zbigniew.kempczynski@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBaYmlnbmlldyBLZW1wY3p5xYRza2kgKDIwMjEtMDMtMDEgMTY6MTQ6MDApCj4gVGVz
dHMgd29yayBpbiBtdWx0aXByb2Nlc3MgZW52aXJvbm1lbnQgc28gd2UgbXVzdCB0dXJuIG9uL29m
Zgo+IHRocmVhZCBpbiBwYXJlbnQgcHJvY2VzcyB3aGljaCBpcyByZXNwb25zaWJsZSBmb3IgYWxs
b2NhdGlvbnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymln
bmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+Cj4gQ2M6IERvbWluaWsgR3J6ZWdvcnplayA8ZG9t
aW5pay5ncnplZ29yemVrQGludGVsLmNvbT4KPiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+Cj4gLS0tCj4gIHRlc3RzL2k5MTUvZ2VtX3BwZ3R0LmMgfCA2ICsrKysr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3Rl
c3RzL2k5MTUvZ2VtX3BwZ3R0LmMgYi90ZXN0cy9pOTE1L2dlbV9wcGd0dC5jCj4gaW5kZXggNWY4
YjM0MjI0Li42NzhhNjM0OTggMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvaTkxNS9nZW1fcHBndHQuYwo+
ICsrKyBiL3Rlc3RzL2k5MTUvZ2VtX3BwZ3R0LmMKPiBAQCAtMjgzLDEwICsyODMsMTMgQEAgaWd0
X21haW4KPiAgICAgICAgICAgICAgICAgcmNzID0gY2FsbG9jKHNpemVvZigqcmNzKSwgbmNoaWxk
KTsKPiAgICAgICAgICAgICAgICAgaWd0X2Fzc2VydChyY3MpOwo+ICAKPiArICAgICAgICAgICAg
ICAgaW50ZWxfYWxsb2NhdG9yX211bHRpcHJvY2Vzc19zdGFydCgpOwoKQ2FuIHdlIHVzZSBjaGls
ZF9waWQgdG8gd2FybiB3aGVuIGFuIGFsbG9jYXRvciBpcyB1c2VkIGluIGEgY2hpbGQ/CgpCdXQg
aGVyZSB0aGUgYWxsb2NhdG9yIGlzIG5vdCBzaGFyZWQgYmV0d2VlbiBjaGlsZHJlbiwgYXMgZWFj
aCBjaGlsZAp3aWxsIGhhdmUgdGhlaXIgb3duIHNldCBvZiBwcEdUVCB0byBwbGF5IHdpdGguCgpX
aGF0IGFtIEkgbWlzc2luZz8KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldgo=
