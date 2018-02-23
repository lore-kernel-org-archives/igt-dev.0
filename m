Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F3E6F343
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Feb 2018 23:16:55 +0000 (UTC)
References: <20180221231947.4184-1-antonio.argenziano@intel.com>
 <20180221231947.4184-2-antonio.argenziano@intel.com>
 <151937816437.26255.2699092724391385897@mail.alporthouse.com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <d4fd5a32-1f56-2079-7a8a-da73aabbb046@intel.com>
Date: Fri, 23 Feb 2018 15:16:54 -0800
MIME-Version: 1.0
In-Reply-To: <151937816437.26255.2699092724391385897@mail.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v4 02/11] lib/igt_gt: add
 intel_measure_ring_size
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAyMy8wMi8xOCAwMToyOSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgQW50b25p
byBBcmdlbnppYW5vICgyMDE4LTAyLTIxIDIzOjE5OjM4KQo+PiArdW5zaWduZWQgaW50Cj4+ICtn
ZW1fbWVhc3VyZV9yaW5nX2luZmxpZ2h0KGludCBmZCwgdW5zaWduZWQgaW50IGVuZ2luZSwgZW51
bSBtZWFzdXJlX3JpbmdfZmxhZ3MgZmxhZ3MpCj4+ICt7Cj4+ICsgICAgICAgc3RydWN0IHNpZ2Fj
dGlvbiBvbGRfc2EsIHNhID0geyAuc2FfaGFuZGxlciA9IGFsYXJtX2hhbmRsZXIgfTsKPj4gKyAg
ICAgICBzdHJ1Y3QgZHJtX2k5MTVfZ2VtX2V4ZWNfb2JqZWN0MiBvYmpbMl07Cj4+ICsgICAgICAg
c3RydWN0IGRybV9pOTE1X2dlbV9leGVjYnVmZmVyMiBleGVjYnVmOwo+PiArICAgICAgIGNvbnN0
IHVpbnQzMl90IGJiZSA9IE1JX0JBVENIX0JVRkZFUl9FTkQ7Cj4+ICsgICAgICAgdW5zaWduZWQg
aW50IGNvdW50LCBsYXN0Owo+PiArICAgICAgIHN0cnVjdCBpdGltZXJ2YWwgaXR2Owo+PiArICAg
ICAgIElHVF9DT1JLX0hBTkRMRShjb3JrKTsKPiAKPiBBbiBpbXByb3ZlbWVudCB3ZSBjYW4gbWFr
ZSBoZXJlIGlzIHRvIGl0ZXJhdGUgb3ZlciBhbGwgZW5naW5lcyBhbmQKPiByZXBvcnQgdGhlIG1p
bmltdW0gcmluZyBzaXplIChmb3IgZW5naW5lPT0tMSkuIFNvbWV0aGluZyBsaWtlLAoKV2hpY2gg
d291bGQgbWFrZSB0aGUgdXNhZ2UgaW4gc29tZSB0ZXN0cyBtb3JlIGNvcnJlY3QuIEknbGwgYWRk
IGl0IHRvIG15IApUT0RPIGxpc3QuCgpUaGFua3MsCkFudG9uaW8KCj4gCj4gaWYgKGVuZ2luZSA9
PSB+MHUpIHsKPiAJdW5zaWduZWQgaW50IG1pbiA9IH4wdTsKPiAKPiAJZm9yX2VhY2hfcGh5c2lj
YWxfZW5naW5lKGZkLCBlbmdpbmUpIHsKPiAJCXVuc2lnbmVkIGludCB0aGlzID0gZ2VtX21lYXN1
cmVfcmluZ19pbmZsaWdodChmZCwgZW5naW5lLCBmbGFncyk7Cj4gCQlpZiAodGhpcyA8IG1pbikK
PiAJCQltaW4gPSB0aGlzOwo+IAl9Cj4gCj4gCXJldHVybiBtaW47Cj4gfQo+IC1DaHJpcwo+IApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1h
aWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
