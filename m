Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1434E6E37C
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Oct 2019 15:28:28 +0000 (UTC)
Message-ID: <30187291c3b6029df3a4c9d5324c44a1a3210b7c.camel@intel.com>
From: Caz Yokoyama <Caz.Yokoyama@intel.com>
Date: Thu, 10 Oct 2019 08:31:06 -0700
In-Reply-To: <20191010075528.GG18974@kdec5-desk.ger.corp.intel.com>
References: <94c5547153d1c9ebce2b8eda730286aba6184793.1565040517.git.caz.yokoyama@intel.com>
 <20191010075528.GG18974@kdec5-desk.ger.corp.intel.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/1] tests/i915/gem_exec_balancer.c -
 remove unnecessary simulation check
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
To: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTEwLTEwIGF0IDA5OjU1ICswMjAwLCBLYXRhcnp5bmEgRGVjIHdyb3RlOgo+
IE9uIE1vbiwgQXVnIDA1LCAyMDE5IGF0IDAyOjMwOjM1UE0gLTA3MDAsIENheiBZb2tveWFtYSB3
cm90ZToKPiAKPiBVc3VhbCBhcHByb2FjaCBmb3IgcGF0Y2hlcyBpdCB0byBleHBsYWluIFdIWSB3
ZSBkbyB0aGluZ3MuIFdIQVQgaXMKPiBzZWxmLWV4cGxhaW5hYmxlIGJ5IGNvZGUuCj4gQWRkaW5n
IGNvbW1pdCBtc2cgY291bGQgbWFrZSBwYXRjaCBtb3JlIG5vdGljYWJsZS4KQWdyZWUuIEZvciB0
aGlzIGNhc2UgaG93ZXZlciwgSSBmb2xsb3dlZCB0aGUgYWR2aWNlIHdoaWNoIGFza2VkIG1lIHRv
CmRvIG5vdCBleHBvc2UgSW50ZWwgSW50ZXJuYWwgaW5mb3JtYXRpb24uIFRoZSBleHBsYW5hdGlv
biB3aHkgc2ltdWxhdG9yCmNoZWNrIGlzIG5vdCBuZWNjZXNzYXJ5IHNob3VsZCBpbmNsdWRlIGJl
Y2F1c2UgdGhlIHRlc3QgcnVucyBvbiBwcmUtCnNpbGxpY29uIG5vdCB5ZXQgcHVibGljbHkgYW5u
b3VuY2VkIFhYWCBjaGlwLgpBbnl3YXksIEkgZm9sbG93IHRoZSBhZHZpY2Ugb2Ygb3JpZ2luYWwg
YXV0aG9yLgoKPiAKPiBNb3Jlb3ZlciAtIEkgd291bGQgdGFsayB0byBhdXRob3Igb2YgdGhlIGNv
ZGUgd2hhdCBoZSB0aGlua3Mgb2YgdGhpcwo+IGNoYW5nZS4KPiAKPiBLYXNpYQo+IAo+ID4gU2ln
bmVkLW9mZi1ieTogQ2F6IFlva295YW1hIDxjYXoueW9rb3lhbWFAaW50ZWwuY29tPgo+ID4gLS0t
Cj4gPiAgdGVzdHMvaTkxNS9nZW1fZXhlY19iYWxhbmNlci5jIHwgMiAtLQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9n
ZW1fZXhlY19iYWxhbmNlci5jCj4gPiBiL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfYmFsYW5jZXIuYwo+
ID4gaW5kZXggYjIwNzQ0ODYuLmFiZjkwZGY2IDEwMDY0NAo+ID4gLS0tIGEvdGVzdHMvaTkxNS9n
ZW1fZXhlY19iYWxhbmNlci5jCj4gPiArKysgYi90ZXN0cy9pOTE1L2dlbV9leGVjX2JhbGFuY2Vy
LmMKPiA+IEBAIC0xMjY3LDggKzEyNjcsNiBAQCBpZ3RfbWFpbgo+ID4gIHsKPiA+ICAJaW50IGk5
MTUgPSAtMTsKPiA+ICAKPiA+IC0JaWd0X3NraXBfb25fc2ltdWxhdGlvbigpOwo+ID4gLQo+ID4g
IAlpZ3RfZml4dHVyZSB7Cj4gPiAgCQlpOTE1ID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9JTlRF
TCk7Cj4gPiAgCQlpZ3RfcmVxdWlyZV9nZW0oaTkxNSk7Cj4gPiAtLSAKPiA+IDIuMjEuMC41Lmdh
ZWI1ODJhOTgzCj4gPiAKPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gPiBpZ3QtZGV2IG1haWxpbmcgbGlzdAo+ID4gaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
