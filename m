Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB686E02C
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2019 22:13:40 +0000 (UTC)
References: <20190312215738.5598-1-antonio.argenziano@intel.com>
 <20190312215738.5598-3-antonio.argenziano@intel.com>
 <155242812120.30003.18128376671223213396@skylake-alporthouse-com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <3ac1c1b9-d986-8d71-6a7a-7120671c118e@intel.com>
Date: Tue, 12 Mar 2019 15:13:39 -0700
MIME-Version: 1.0
In-Reply-To: <155242812120.30003.18128376671223213396@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [RFC 2/4] tests/i915/gem_mmap: Add invalid parameters
 tests
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

CgpPbiAxMi8wMy8xOSAxNTowMiwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgQW50b25p
byBBcmdlbnppYW5vICgyMDE5LTAzLTEyIDIxOjU3OjM2KQo+PiBBZGQgYSBjb3VwbGUgb2YgdGVz
dHMgdGhhdCBzdXBwbHkgaW52YWxpZCBwYXJhbWV0ZXJzIHRvIHRoZSBtbWFwIElPQ1RMLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBBbnRvbmlvIEFyZ2Vuemlhbm8gPGFudG9uaW8uYXJnZW56aWFub0Bp
bnRlbC5jb20+Cj4+IC0tLQo+PiAgIHRlc3RzL2k5MTUvZ2VtX21tYXAuYyB8IDE4ICsrKysrKysr
KysrKysrKysrKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCj4+Cj4+IGRp
ZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9tbWFwLmMgYi90ZXN0cy9pOTE1L2dlbV9tbWFwLmMK
Pj4gaW5kZXggMGVkMTU4NzguLjJhNjc2YjlhIDEwMDY0NAo+PiAtLS0gYS90ZXN0cy9pOTE1L2dl
bV9tbWFwLmMKPj4gKysrIGIvdGVzdHMvaTkxNS9nZW1fbW1hcC5jCj4+IEBAIC0xMzYsNiArMTM2
LDI0IEBAIGlndF9tYWluCj4+ICAgICAgICAgICAgICAgICAgaWd0X2Fzc2VydChyZXQgPT0gLTEg
JiYgZXJybm8gPT0gRU5PRU5UKTsKPj4gICAgICAgICAgfQo+PiAgIAo+PiArICAgICAgIGlndF9z
dWJ0ZXN0KCJiYWQtb2Zmc2V0Iikgewo+PiArICAgICAgICAgICAgICAgbWVtc2V0KCZhcmcsIDAs
IHNpemVvZihhcmcpKTsKPj4gKyAgICAgICAgICAgICAgIGFyZy5oYW5kbGUgPSBnZW1fY3JlYXRl
KGZkLCA0MDk2KTsKPj4gKyAgICAgICAgICAgICAgIGFyZy5vZmZzZXQgPSA0MDk2ICsgMTsKPj4g
KyAgICAgICAgICAgICAgIGFyZy5zaXplID0gNDA5NjsKPj4gKyAgICAgICAgICAgICAgIHJldCA9
IGlvY3RsKGZkLCBEUk1fSU9DVExfSTkxNV9HRU1fTU1BUCwgJmFyZyk7Cj4+ICsgICAgICAgICAg
ICAgICBpZ3RfYXNzZXJ0KHJldCA9PSAtMSAmJiBlcnJubyA9PSBFSU5WQUwpOwo+IAo+IEFsc28g
YXJnLm9mZnNldCA9IC1zaXplIGlzIGEgZ29vZCBvbmUuCj4gCj4gVGhlbiBzaXplPTgxOTIgYW5k
IGFyZy5vZmZzZXQ9LTQwOTY7Cj4gCj4+ICsgICAgICAgfQo+PiArCj4+ICsgICAgICAgaWd0X3N1
YnRlc3QoImJhZC1zaXplIikgewo+PiArICAgICAgICAgICAgICAgbWVtc2V0KCZhcmcsIDAsIHNp
emVvZihhcmcpKTsKPj4gKyAgICAgICAgICAgICAgIGFyZy5oYW5kbGUgPSBnZW1fY3JlYXRlKGZk
LCA0MDk2KTsKPj4gKyAgICAgICAgICAgICAgIGFyZy5vZmZzZXQgPSA0MDk2Owo+PiArICAgICAg
ICAgICAgICAgYXJnLnNpemUgPSAwOwo+PiArICAgICAgICAgICAgICAgcmV0ID0gaW9jdGwoZmQs
IERSTV9JT0NUTF9JOTE1X0dFTV9NTUFQLCAmYXJnKTsKPj4gKyAgICAgICAgICAgICAgIGlndF9h
c3NlcnQocmV0ID09IC0xICYmIGVycm5vID09IEVJTlZBTCk7Cj4gCj4gQWxzbyA+NDA5NiwgLTQw
OTYKCk1ha2VzIHNlbnNlLCBJJ2xsIG1ha2UgdGhlIHNhbWUgY2hhbmdlcyB0byBhbGwgZmlsZXMg
KHdoZXJlIGFwcGxpY2FibGUpLgoKQW50b25pbwoKPiAtQ2hyaXMKPiAKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
