Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AAC36E10A
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2019 22:18:16 +0000 (UTC)
References: <20190312215738.5598-1-antonio.argenziano@intel.com>
 <20190312215738.5598-3-antonio.argenziano@intel.com>
 <155242812120.30003.18128376671223213396@skylake-alporthouse-com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <8a508da4-37f1-fcba-e81c-b6fe0d6a865b@intel.com>
Date: Wed, 13 Mar 2019 15:18:15 -0700
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
OTYKCkhtbW0sID40MDk2IHNlZW1zIG5vdCB0byBiZSByZXR1cm5pbmcgYW4gZXJyb3IuIFdoZXJl
IHNob3VsZCBpdCBiZSAKY2hlY2tlZCBhZ2FpbnN0IHRoZSBzaXplIG9mIHRoZSBvYmplY3Q/CgpB
bnRvbmlvCgo+IC1DaHJpcwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXY=
