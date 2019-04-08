Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A36B8902A
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Apr 2019 16:45:51 +0000 (UTC)
Date: Mon, 8 Apr 2019 19:45:48 +0300
From: Andi Shyti <andi.shyti@intel.com>
Message-ID: <20190408164548.GA2556@intel.intel>
References: <20190408161533.2421-1-andi.shyti@intel.com>
 <20190408161533.2421-6-andi.shyti@intel.com>
 <5bec9ae6-aaf4-4c65-b300-c51985b889b0@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5bec9ae6-aaf4-4c65-b300-c51985b889b0@linux.intel.com>
Subject: Re: [igt-dev] [PATCH v19 5/6] lib: igt_dummyload: use
 for_each_context_engine()
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: IGT dev <igt-dev@lists.freedesktop.org>, Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

SGkgVHZydGtvLAoKPiA+IC0JCWVuZ2luZXNbbmVuZ2luZSsrXSA9IG9wdHMtPmVuZ2luZTsKPiA+
ICsJCXN0cnVjdCBpbnRlbF9leGVjdXRpb25fZW5naW5lMiAqZTsKPiA+ICsJCWludCBjbGFzczsK
PiA+ICsKPiA+ICsJCWlmICghZ2VtX2N0eF9nZXRfZW5naW5lKGZkLCBvcHRzLT5lbmdpbmUsIG9w
dHMtPmN0eCwgZSkpIHsKPiA+ICsJCQljbGFzcyA9IGUtPmNsYXNzOwo+ID4gKwkJfSBlbHNlIHsK
PiA+ICsJCQlnZW1fcmVxdWlyZV9yaW5nKGZkLCBvcHRzLT5lbmdpbmUpOwo+ID4gKwkJCWNsYXNz
ID0gZ2VtX2ViX3RvX2NsYXNzKG9wdHMtPmVuZ2luZSk7Cj4gPiArCQl9Cj4gPiArCj4gPiArCQlp
ZiAob3B0cy0+ZmxhZ3MgJiBJR1RfU1BJTl9QT0xMX1JVTikKPiA+ICsJCQlpZ3RfcmVxdWlyZShn
ZW1fY2xhc3NfY2FuX3N0b3JlX2R3b3JkKGZkLCBjbGFzcykpOwo+ID4gKwo+ID4gKwkJZmxhZ3Nb
bmVuZ2luZSsrXSA9IG9wdHMtPmVuZ2luZTsKPiA+ICAgCX0KPiAKPiBQYXRjaCBsb29rcyBnb29k
IGJ1dCBJJ20gYWZyYWlkIEkgbWFkZSBhbiBvdmVyc2lnaHQgZWFybGllciBpbiByZXZpZXcgd2hl
biBJCj4gYXNrZWQgeW91IHRvIG1vdmUgdGhpcyBlbHNlIGJsb2NrIGluIHRoaXMgZnVuY3Rpb24u
IEkgZm9yZ290IHRoYXQgdGhlCj4gZGlmZmVyZW50aWF0aW9uIGJldHdlZW4gaWd0X3NwaW5fYmF0
Y2hfbmV3IGFuZCBfX2lndF9zcGluX2JhdGNoX25ldyB3YXMgdGhhdAo+IHRoZSBsYXR0ZXIgc2hv
dWxkIG5vdCBkbyBhbnkgZXhlY2J1ZiBjYWxscyBhcGFydCBmcm9tIHRoZSBzcGlubmVyIGl0c2Vs
Zi4KPiBTaW5jZSBnZW1fcmVxdWlyZV9yaW5nIGRvZXMgb25lIGl0IGNvdWxkIGJlIGEgcHJvYmxl
bS4KPiAKPiBXb3VsZCB5b3UgbWluZCBtb3ZpbmcganVzdCB0aGlzIGVsc2UgYmxvY2sgYmFjayBp
bnRvIHRoZSBtYWluIGNvbnN0cnVjdG9yPwoKTm8gcHJvYmxlbSwgSSdsbCBtb3ZlIGl0IGJhY2su
Cgo+IFdpdGggdGhhdCB5b3UgY2FuIGhhdmU6Cj4gCj4gUmV2aWV3ZWQtYnk6IFR2cnRrbyBVcnN1
bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+CgpUaGFua3MhCkFuZGkKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
