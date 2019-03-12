Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3585989FF7
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2019 22:02:25 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190312215738.5598-3-antonio.argenziano@intel.com>
References: <20190312215738.5598-1-antonio.argenziano@intel.com>
 <20190312215738.5598-3-antonio.argenziano@intel.com>
Message-ID: <155242812120.30003.18128376671223213396@skylake-alporthouse-com>
Date: Tue, 12 Mar 2019 22:02:06 +0000
Subject: Re: [igt-dev] [RFC 2/4] tests/i915/gem_mmap: Add invalid parameters
 tests
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTktMDMtMTIgMjE6NTc6MzYpCj4gQWRkIGEg
Y291cGxlIG9mIHRlc3RzIHRoYXQgc3VwcGx5IGludmFsaWQgcGFyYW1ldGVycyB0byB0aGUgbW1h
cCBJT0NUTC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbnRvbmlvIEFyZ2Vuemlhbm8gPGFudG9uaW8u
YXJnZW56aWFub0BpbnRlbC5jb20+Cj4gLS0tCj4gIHRlc3RzL2k5MTUvZ2VtX21tYXAuYyB8IDE4
ICsrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQo+
IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9tbWFwLmMgYi90ZXN0cy9pOTE1L2dlbV9t
bWFwLmMKPiBpbmRleCAwZWQxNTg3OC4uMmE2NzZiOWEgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvaTkx
NS9nZW1fbW1hcC5jCj4gKysrIGIvdGVzdHMvaTkxNS9nZW1fbW1hcC5jCj4gQEAgLTEzNiw2ICsx
MzYsMjQgQEAgaWd0X21haW4KPiAgICAgICAgICAgICAgICAgaWd0X2Fzc2VydChyZXQgPT0gLTEg
JiYgZXJybm8gPT0gRU5PRU5UKTsKPiAgICAgICAgIH0KPiAgCj4gKyAgICAgICBpZ3Rfc3VidGVz
dCgiYmFkLW9mZnNldCIpIHsKPiArICAgICAgICAgICAgICAgbWVtc2V0KCZhcmcsIDAsIHNpemVv
ZihhcmcpKTsKPiArICAgICAgICAgICAgICAgYXJnLmhhbmRsZSA9IGdlbV9jcmVhdGUoZmQsIDQw
OTYpOwo+ICsgICAgICAgICAgICAgICBhcmcub2Zmc2V0ID0gNDA5NiArIDE7Cj4gKyAgICAgICAg
ICAgICAgIGFyZy5zaXplID0gNDA5NjsKPiArICAgICAgICAgICAgICAgcmV0ID0gaW9jdGwoZmQs
IERSTV9JT0NUTF9JOTE1X0dFTV9NTUFQLCAmYXJnKTsKPiArICAgICAgICAgICAgICAgaWd0X2Fz
c2VydChyZXQgPT0gLTEgJiYgZXJybm8gPT0gRUlOVkFMKTsKCkFsc28gYXJnLm9mZnNldCA9IC1z
aXplIGlzIGEgZ29vZCBvbmUuCgpUaGVuIHNpemU9ODE5MiBhbmQgYXJnLm9mZnNldD0tNDA5NjsK
Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgaWd0X3N1YnRlc3QoImJhZC1zaXplIikgewo+ICsg
ICAgICAgICAgICAgICBtZW1zZXQoJmFyZywgMCwgc2l6ZW9mKGFyZykpOwo+ICsgICAgICAgICAg
ICAgICBhcmcuaGFuZGxlID0gZ2VtX2NyZWF0ZShmZCwgNDA5Nik7Cj4gKyAgICAgICAgICAgICAg
IGFyZy5vZmZzZXQgPSA0MDk2Owo+ICsgICAgICAgICAgICAgICBhcmcuc2l6ZSA9IDA7Cj4gKyAg
ICAgICAgICAgICAgIHJldCA9IGlvY3RsKGZkLCBEUk1fSU9DVExfSTkxNV9HRU1fTU1BUCwgJmFy
Zyk7Cj4gKyAgICAgICAgICAgICAgIGlndF9hc3NlcnQocmV0ID09IC0xICYmIGVycm5vID09IEVJ
TlZBTCk7CgpBbHNvID40MDk2LCAtNDA5NgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pZ3QtZGV2
