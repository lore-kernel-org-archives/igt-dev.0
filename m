Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <7b4076e1-0636-5958-5d8c-fc57047d9019@intel.com>
References: <20190217143556.9482-1-chris@chris-wilson.co.uk>
 <20190217143556.9482-2-chris@chris-wilson.co.uk>
 <7b4076e1-0636-5958-5d8c-fc57047d9019@intel.com>
Message-ID: <155059595318.30979.10098560747129120812@skylake-alporthouse-com>
Date: Tue, 19 Feb 2019 17:05:53 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 2/8] i915/gem_eio: Check we only ban the
 context
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Mika Kuoppala <mika.kuoppala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTktMDItMTkgMTY6NTM6NTcpCj4gCj4gCj4g
T24gMTcvMDIvMTkgMDY6MzUsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IEluIHRyaWdnZXIgdGhl
IGJhbiwgd2Ugb25seSB3YW50IHRvIG9ic2VydmUgdGhlIGxvY2FsIGNvbnRleHQgYmUgYmFubmVk
Cj4gPiBhbmQgbm90IHRoZSBmcHJpdiBhcyBhIHdob2xlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5
OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiA+IENjOiBNaWthIEt1
b3BwYWxhIDxtaWthLmt1b3BwYWxhQGludGVsLmNvbT4KPiA+IC0tLQo+ID4gICB0ZXN0cy9pOTE1
L2dlbV9laW8uYyB8IDcgKysrKysrKwo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9laW8uYyBiL3Rlc3RzL2k5
MTUvZ2VtX2Vpby5jCj4gPiBpbmRleCAzYzU0ODIwYzkuLjNhZmRiZDY5ZSAxMDA2NDQKPiA+IC0t
LSBhL3Rlc3RzL2k5MTUvZ2VtX2Vpby5jCj4gPiArKysgYi90ZXN0cy9pOTE1L2dlbV9laW8uYwo+
ID4gQEAgLTMyNCw4ICszMjQsMTUgQEAgc3RhdGljIHZvaWQgX190ZXN0X2Jhbm5lZChpbnQgZmQp
Cj4gPiAgICAgICAgICAgICAgIGlndF9zcGluX3QgKmhhbmc7Cj4gPiAgIAo+ID4gICAgICAgICAg
ICAgICBpZiAoX19nZW1fZXhlY2J1ZihmZCwgJmV4ZWNidWYpID09IC1FSU8pIHsKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICB1aW50MzJfdCBjdHggPSAwOwo+ID4gKwo+ID4gICAgICAgICAgICAg
ICAgICAgICAgIGlndF9pbmZvKCJCYW5uZWQgYWZ0ZXIgY2F1c2luZyAlbHUgaGFuZ3NcbiIsIGNv
dW50KTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBpZ3RfYXNzZXJ0KGNvdW50ID4gMSk7Cj4g
PiArCj4gPiArICAgICAgICAgICAgICAgICAgICAgLyogT25seSB0aGlzIGNvbnRleHQsIG5vdCB0
aGUgZmlsZSwgc2hvdWxkIGJlIGJhbm5lZCAqLwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGln
dF9hc3NlcnRfbmVxKF9fZ2VtX2NvbnRleHRfY3JlYXRlKGZkLCAmY3R4KSwgLUVJTyk7Cj4gCj4g
U2hvdWxkIHdlIGNoZWNrIHN1Ym1pc3Npb24gd29ya3Mgb24gdGhlIG5ldyBjb250ZXh0PwoKV2h5
IG5vdD8gSW4gZm9yIGEgcGVubnksIGluIGZvciBhIHBvdW5kLgotQ2hyaXMKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
