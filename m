Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190304141131.14654-1-tvrtko.ursulin@linux.intel.com>
References: <20190304141131.14654-1-tvrtko.ursulin@linux.intel.com>
Message-ID: <155171071077.14887.9423109998793090230@skylake-alporthouse-com>
Date: Mon, 04 Mar 2019 14:45:11 +0000
Subject: Re: [igt-dev] [RFT i-g-t] lib/i915: Assert mmap size alignment
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOS0wMy0wNCAxNDoxMTozMSkKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IEZpc2hpbmcgZm9yIGZh
aWxzLi4uCj4gCj4gLyoKPiBtbWFwKDIpIG1hbmRhdGVzIHNpemUgaXMgcGFnZSBhbGlnbmVkIHNv
IGNoZWNrIHRoaXMgaW4gb3VyIHdyYXBwZXJzLgo+ICovCj4gCj4gU2lnbmVkLW9mZi1ieTogVHZy
dGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KPiAtLS0KPiAgbGliL2k5MTUv
Z2VtX21tYW4uYyB8ICA0ICsrKysKPiAgbGliL2lndF9mYi5jICAgICAgICB8IDE0ICsrKysrKysr
LS0tLS0tCj4gIHRlc3RzL2ttc19jY3MuYyAgICAgfCAxNCArKysrKysrKy0tLS0tLQo+ICB0ZXN0
cy9rbXNfcHNyLmMgICAgIHwgIDggKysrKy0tLS0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNl
cnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL2k5MTUvZ2Vt
X21tYW4uYyBiL2xpYi9pOTE1L2dlbV9tbWFuLmMKPiBpbmRleCAzY2Y5YTZiYmRiMzEuLjA4NGRi
YjNiMzY3OCAxMDA2NDQKPiAtLS0gYS9saWIvaTkxNS9nZW1fbW1hbi5jCj4gKysrIGIvbGliL2k5
MTUvZ2VtX21tYW4uYwo+IEBAIC01Nyw2ICs1Nyw4IEBAIHZvaWQgKl9fZ2VtX21tYXBfX2d0dChp
bnQgZmQsIHVpbnQzMl90IGhhbmRsZSwgdWludDY0X3Qgc2l6ZSwgdW5zaWduZWQgcHJvdCkKPiAg
ICAgICAgIHN0cnVjdCBkcm1faTkxNV9nZW1fbW1hcF9ndHQgbW1hcF9hcmc7Cj4gICAgICAgICB2
b2lkICpwdHI7Cj4gIAo+ICsgICAgICAgaWd0X2Fzc2VydCghKHNpemUgJiA0MDk1KSk7CgpGd2l3
LCBpdCdzIHByb2JhYmx5IGJlc3QgaWYgd2UgaGFkIHNvbWUga2luZCBvZiBJR1RfQlVHX09OKCkg
dGhhdCBjYXVzZWQKYSBtdWNoIG1vcmUgdmlzaWJsZSBleHBsb3Npb24gdGhhbiBhIG1lcmUgdGVz
dCBmYWlsdXJlLgoKI2RlZmluZSBJR1RfQlVHX09OKGNvbmQpIGlmICghKGNvbmQpKSByYWlzZShT
SUdJTEwpCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
