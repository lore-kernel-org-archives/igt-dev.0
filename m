Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7ED897F3
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2019 10:56:23 +0000 (UTC)
References: <20190513004508.8042-1-andi@etezian.org>
 <20190513004508.8042-12-andi@etezian.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <7dbd046b-3a0a-0eda-7216-af49fdf6ef6b@linux.intel.com>
Date: Mon, 13 May 2019 11:56:19 +0100
MIME-Version: 1.0
In-Reply-To: <20190513004508.8042-12-andi@etezian.org>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH v23 11/14] test/i915: gem_exec_parallel: use
 the gem_engine_topology library
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Andi Shyti <andi@etezian.org>, IGT dev <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDEzLzA1LzIwMTkgMDE6NDUsIEFuZGkgU2h5dGkgd3JvdGU6Cj4gRnJvbTogQW5kaSBTaHl0
aSA8YW5kaS5zaHl0aUBpbnRlbC5jb20+Cj4gCj4gUmVwbGFjZSB0aGUgbGVnYWN5IGZvcl9lYWNo
X2VuZ2luZSogZGVmaW5lcyB3aXRoIHRoZSBvbmVzCj4gaW1wbGVtZW50ZWQgaW4gdGhlIGdlbV9l
bmdpbmVfdG9wb2xvZ3kgbGlicmFyeS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRpIFNoeXRpIDxh
bmRpLnNoeXRpQGludGVsLmNvbT4KPiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxz
b24uY28udWs+Cj4gLS0tCj4gICB0ZXN0cy9pOTE1L2dlbV9leGVjX3BhcmFsbGVsLmMgfCA3ICsr
KystLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfcGFyYWxsZWwuYyBiL3Rlc3Rz
L2k5MTUvZ2VtX2V4ZWNfcGFyYWxsZWwuYwo+IGluZGV4IDc1OTdiZWZiMGIzOS4uMTk1MDBhMTM0
YjFlIDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfcGFyYWxsZWwuYwo+ICsrKyBi
L3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfcGFyYWxsZWwuYwo+IEBAIC0yMjksNiArMjI5LDggQEAgc3Rh
dGljIHZvaWQgYWxsKGludCBmZCwgdW5zaWduZWQgZW5naW5lLCB1bnNpZ25lZCBmbGFncykKPiAg
IAo+ICAgaWd0X21haW4KPiAgIHsKPiArCWNvbnN0IHN0cnVjdCBpbnRlbF9leGVjdXRpb25fZW5n
aW5lMiAqZTsKPiArCj4gICAJY29uc3Qgc3RydWN0IG1vZGUgewo+ICAgCQljb25zdCBjaGFyICpu
YW1lOwo+ICAgCQl1bnNpZ25lZCBmbGFnczsKPiBAQCAtMjUxLDE0ICsyNTMsMTMgQEAgaWd0X21h
aW4KPiAgIAkJaWd0X3N1YnRlc3RfZigiJXMiLCAqbS0+bmFtZSA/IG0tPm5hbWUgOiAiYmFzaWMi
KQo+ICAgCQkJYWxsKGZkLCBBTExfRU5HSU5FUywgbS0+ZmxhZ3MpOwoKVGhlcmUncyBhIGxlZ2Fj
eSBmb3JfZWFjaF9waHlzaWNhbF9lbmdpbmUgbG9vcCBpbiBhbGwoKSB1bmRlciB0aGUgYnJhbmNo
IAp3aGljaCBoYW5kbGVzIEFMTF9FTkdJTkVTIHdoaWNoIG5lZWRzIHRvIGJlIGNvbnZlcnRlZCB0
byB0aGUgbmV3IGl0ZXJhdG9yLgoKPiAgIAo+IC0JZm9yIChjb25zdCBzdHJ1Y3QgaW50ZWxfZXhl
Y3V0aW9uX2VuZ2luZSAqZSA9IGludGVsX2V4ZWN1dGlvbl9lbmdpbmVzOwo+IC0JICAgICBlLT5u
YW1lOyBlKyspIHsKPiArCV9fZm9yX2VhY2hfcGh5c2ljYWxfZW5naW5lKGZkLCBlKSB7Cj4gICAJ
CWZvciAoY29uc3Qgc3RydWN0IG1vZGUgKm0gPSBtb2RlczsgbS0+bmFtZTsgbSsrKQo+ICAgCQkJ
aWd0X3N1YnRlc3RfZigiJXMlcyVzIiwKPiAgIAkJCQkgICAgICBlLT5uYW1lLAo+ICAgCQkJCSAg
ICAgICptLT5uYW1lID8gIi0iIDogIiIsCj4gICAJCQkJICAgICAgbS0+bmFtZSkKPiAtCQkJCWFs
bChmZCwgZS0+ZXhlY19pZCB8IGUtPmZsYWdzLCBtLT5mbGFncyk7Cj4gKwkJCQlhbGwoZmQsIGUt
PmZsYWdzLCBtLT5mbGFncyk7Cj4gICAJfQo+ICAgCj4gICAJaWd0X2ZpeHR1cmUgewo+IAoKUmVn
YXJkcywKClR2cnRrbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
