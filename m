Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 216946F0B3
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jan 2019 14:22:23 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190116112050.27647-3-petri.latvala@intel.com>
References: <20190116112050.27647-1-petri.latvala@intel.com>
 <20190116112050.27647-3-petri.latvala@intel.com>
Message-ID: <154764853414.30063.7008706264558061976@skylake-alporthouse-com>
Date: Wed, 16 Jan 2019 14:22:14 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 02/21] lib/i915/gem_context: Help static
 analysis with execution flow
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBQZXRyaSBMYXR2YWxhICgyMDE5LTAxLTE2IDExOjIwOjMxKQo+IElmIGFuIGlndF9p
b2N0bCBmYWlscywgZXJybm8gaXMgc2V0IHRvIG5vbi16ZXJvLCBhbmQgc3RhdGljIGFuYWx5c2lz
Cj4gZG9lc24ndCBxdWl0ZSBnZXQgaXQuIEFkZCBhbiBpZ3RfYXNzdW1lKCkgdG8gaGVscC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4K
PiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gQ2M6IE1pY2hh
xYIgV2luaWFyc2tpIDxtaWNoYWwud2luaWFyc2tpQGludGVsLmNvbT4KPiAtLS0KPiAgbGliL2k5
MTUvZ2VtX2NvbnRleHQuYyB8IDYgKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9pOTE1L2dlbV9jb250
ZXh0LmMgYi9saWIvaTkxNS9nZW1fY29udGV4dC5jCj4gaW5kZXggNjY5YmQzMTguLjc4MWRlYTAw
IDEwMDY0NAo+IC0tLSBhL2xpYi9pOTE1L2dlbV9jb250ZXh0LmMKPiArKysgYi9saWIvaTkxNS9n
ZW1fY29udGV4dC5jCj4gQEAgLTgyLDggKzgyLDEwIEBAIGludCBfX2dlbV9jb250ZXh0X2NyZWF0
ZShpbnQgZmQsIHVpbnQzMl90ICpjdHhfaWQpCj4gICAgICAgICBtZW1zZXQoJmNyZWF0ZSwgMCwg
c2l6ZW9mKGNyZWF0ZSkpOwo+ICAgICAgICAgaWYgKGlndF9pb2N0bChmZCwgRFJNX0lPQ1RMX0k5
MTVfR0VNX0NPTlRFWFRfQ1JFQVRFLCAmY3JlYXRlKSA9PSAwKQo+ICAgICAgICAgICAgICAgICAq
Y3R4X2lkID0gY3JlYXRlLmN0eF9pZDsKPiAtICAgICAgIGVsc2UKPiAtICAgICAgICAgICAgICAg
ZXJyID0gLWVycm5vOwo+ICsgICAgICAgZWxzZSB7Cj4gKyAgICAgICAgICAgICAgZXJyID0gLWVy
cm5vOwo+ICsgICAgICAgICAgICAgIGlndF9hc3N1bWUoZXJyICE9IDApOwo+ICsgICAgICAgfQoK
SnVzdCBtYWtlIHN1cmUgZWFjaCBicmFuY2ggdGFrZXMgeyB9IGFuZApSZXZpZXdlZC1ieTogQ2hy
aXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CmZvciB0aGUgdGhyZWUgKG9yIGhv
dyBtYW55IG5lYXJseSBpZGVudGljYWwgcGF0Y2hlcyBpdCB3YXMhKS4KLUNocmlzCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
