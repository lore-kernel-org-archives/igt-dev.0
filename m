Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8C06E586
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2019 10:28:32 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190814102140.3275-2-lukasz.kalamarz@intel.com>
References: <20190814102140.3275-1-lukasz.kalamarz@intel.com>
 <20190814102140.3275-2-lukasz.kalamarz@intel.com>
Message-ID: <156577850123.2301.8058170876745324840@skylake-alporthouse-com>
Date: Wed, 14 Aug 2019 11:28:21 +0100
Subject: Re: [igt-dev] [RFC PATCH 1/4] lib/i915/gem_mman: add mmap_offset
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
To: Lukasz Kalamarz <lukasz.kalamarz@intel.com>, igt-dev@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBMdWthc3ogS2FsYW1hcnogKDIwMTktMDgtMTQgMTE6MjE6MzcpCj4gV2l0aCBpbnRy
b2R1Y3Rpb24gb2YgTE1FTSBjb25jZXB0IG5ldyBJT0NUTCBjYWxsIHdlcmUgaW1wbGVtZW50ZWQK
PiAtIGdlbV9tbWFwX29mZnNldC4gVGhpcyBwYXRjaCBhZGQgc3VwcG9ydCBpbiBJR1QgZm9yIGl0
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEx1a2FzeiBLYWxhbWFyeiA8bHVrYXN6LmthbGFtYXJ6QGlu
dGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbnRvbmlvIEFyZ2Vuemlhbm8gPGFudG9uaW8uYXJn
ZW56aWFub0BpbnRlbC5jb20+Cj4gQ2M6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVs
LmNvbT4KPiBDYzogSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwu
Y29tPgo+IC0tLQo+ICBsaWIvaTkxNS9nZW1fbW1hbi5jIHwgMTg4ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tCj4gIGxpYi9pOTE1L2dlbV9tbWFuLmggfCAgMzcg
KysrKysrKystCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjAyIGluc2VydGlvbnMoKyksIDIzIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvaTkxNS9nZW1fbW1hbi5jIGIvbGliL2k5MTUv
Z2VtX21tYW4uYwo+IGluZGV4IDNjZjlhNmJiLi4yYjI4YTY3YyAxMDA2NDQKPiAtLS0gYS9saWIv
aTkxNS9nZW1fbW1hbi5jCj4gKysrIGIvbGliL2k5MTUvZ2VtX21tYW4uYwo+IEBAIC00MCw2ICs0
MCwyNyBAQAo+ICAjZGVmaW5lIFZHKHgpIGRvIHt9IHdoaWxlICgwKQo+ICAjZW5kaWYKPiAgCj4g
KyNkZWZpbmUgTE9DQUxfSTkxNV9QQVJBTV9NTUFQX09GRlNFVF9WRVJTSU9OIDU0Cj4gKwo+ICti
b29sIGdlbV9oYXNfbW1hcF9vZmZzZXQoaW50IGZkKQo+ICt7Cj4gKyAgICAgICBzdGF0aWMgaW50
IGhhc19tbWFwX29mZnNldCA9IC0xOwo+ICsKPiArICAgICAgIGlmIChoYXNfbW1hcF9vZmZzZXQg
PT0gLTEpIHsKCkhvdyBtYW55IHRpbWVzIGRvIEkgaGF2ZSB0byBzYXkgdGhhdCBJIGFtIHNvcnJ5
IGZvciBpbnRyb2R1Y2luZyBzdGF0aWMKaGVyZS4gSXQgd2FzIHRvIGN1dCBkb3duIG9uIHN0cmFj
ZSBzcGFtLCBidXQgbm8gb25lIHNob3VsZCBiZSByZXBlYXRlZGx5CmNoZWNraW5nLCBzbyBwbGVh
c2UgZG9uJ3QgY2FyZ28gY3VsdCBpdC4gSXQgZG9lc24ndCBib2RlIHdlbGwuCi1DaHJpcwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
