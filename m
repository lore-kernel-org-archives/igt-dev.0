Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B1E6EAD4
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2019 07:30:42 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191121072520.GA12836@zkempczy-desk.igk.intel.com>
References: <20191120185739.7497-1-zbigniew.kempczynski@intel.com>
 <20191120185739.7497-2-zbigniew.kempczynski@intel.com>
 <157427890561.13839.4220650446069116139@skylake-alporthouse-com>
 <20191121072520.GA12836@zkempczy-desk.igk.intel.com>
Message-ID: <157432143497.24852.9450791000764400726@skylake-alporthouse-com>
Date: Thu, 21 Nov 2019 07:30:34 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/4] lib/i915/gem_mman: add
 mmap_offset support
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBaYmlnbmlldyBLZW1wY3p5xYRza2kgKDIwMTktMTEtMjEgMDc6MjU6MjApCj4gT24g
V2VkLCBOb3YgMjAsIDIwMTkgYXQgMDc6NDE6NDVQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdyb3Rl
Ogo+ID4gPiArI2RlZmluZSBMT0NBTF9JOTE1X1BBUkFNX01NQVBfT0ZGU0VUX1ZFUlNJT04gNTQK
PiA+ID4gKwo+ID4gPiArc3RhdGljIGJvb2wgZ2VtX2hhc19tbWFwX29mZnNldChpbnQgZmQpCj4g
PiA+ICt7Cj4gPiA+ICsgICAgICAgaW50IGhhc19tbWFwX29mZnNldCA9IDA7Cj4gPiA+ICsgICAg
ICAgc3RydWN0IGRybV9pOTE1X2dldHBhcmFtIGdwOwo+ID4gPiArCj4gPiA+ICsgICAgICAgbWVt
c2V0KCZncCwgMCwgc2l6ZW9mKGdwKSk7Cj4gPiA+ICsgICAgICAgZ3AucGFyYW0gPSBMT0NBTF9J
OTE1X1BBUkFNX01NQVBfT0ZGU0VUX1ZFUlNJT047Cj4gPiA+ICsgICAgICAgZ3AudmFsdWUgPSAm
aGFzX21tYXBfb2Zmc2V0Owo+ID4gPiArICAgICAgIGlvY3RsKGZkLCBEUk1fSU9DVExfSTkxNV9H
RVRQQVJBTSwgJmdwKTsKPiA+IAo+ID4gKiBCbGlua3MuCj4gPiAKPiA+IE9oIG5vIGl0IGlzbid0
Lgo+ID4gCj4gPiBJdCdzIGp1c3QgSTkxNV9QQVJBTV9NTUFQX0dUVF9WRVJTSU9OID49IDQKPiAK
PiBJJ3ZlIGRvdWJsZSBjaGVja2VkOgo+IAo+IGk5MTVfZ2V0cGFyYW06Cj4gICAgICAgICBjYXNl
IEk5MTVfUEFSQU1fTU1BUF9HVFRfVkVSU0lPTjoKPiAgICAgICAgICAgICAgICAgIC0+IGk5MTVf
Z2VtX21tYXBfZ3R0X3ZlcnNpb24oKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIC0+IHJldHVy
biAzCj4gCj4gICAgICAgICBjYXNlIEk5MTVfUEFSQU1fTU1BUF9PRkZTRVRfVkVSU0lPTjoKPiAg
ICAgICAgICAgICAgICAgLT4gcmV0dXJuIDEKPiAKPiBXaGVyZSdzIHRoZSBtYWdpYyA0IGluIEdU
VF9WRVJTSU9OPyBJIGRvbid0IHNlZSBpdC4KPiBJcyBzb21lIG5vbiBtZXJnZWQgcGF0Y2ggY29u
dGFpbmluZyBpdD8KCllvdSBhcmUgbG9va2luZyBhdCB0aGUgdW5tZXJnZWQgZ2FyYmFnZSBwaWxl
LgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
