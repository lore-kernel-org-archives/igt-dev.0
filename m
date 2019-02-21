Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20190221101944.19711-1-chris@chris-wilson.co.uk>
 <20190221101944.19711-2-chris@chris-wilson.co.uk>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <fe539a4f-8ff9-a68e-6719-19da17dfa3cc@intel.com>
Date: Thu, 21 Feb 2019 08:11:56 -0800
MIME-Version: 1.0
In-Reply-To: <20190221101944.19711-2-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] igt/drv_hangman: Skip if resets are
 disallowed
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
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAyMS8wMi8xOSAwMjoxOSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IElmIHdlIHRlbGwgdGhl
IG1hY2hpbmUgdG8gcmVzZXQgYnV0IHRoZXkgYXJlIGRpc2FsbG93ZWQsIHdlIHdpbGwgbGVhdmUK
PiB0aGUgc3lzdGVtIGluIGEgd2VkZ2VkIHN0YXRlLCBwcmV2ZW50aW5nIHRoZSBtYWpvcml0eSBv
ZiBzdWJzZXF1ZW50Cj4gdGVzdHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxj
aHJpc0BjaHJpcy13aWxzb24uY28udWs+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudG9uaW8gQXJn
ZW56aWFubyA8YW50b25pby5hcmdlbnppYW5vQGludGVsLmNvbT4KCj4gLS0tCj4gICB0ZXN0cy9p
OTE1L2k5MTVfaGFuZ21hbi5jIHwgNyArKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvaTkxNV9oYW5nbWFuLmMgYi90
ZXN0cy9pOTE1L2k5MTVfaGFuZ21hbi5jCj4gaW5kZXggZGYxZTBhZmVkLi40ZTUxNWUzYTAgMTAw
NjQ0Cj4gLS0tIGEvdGVzdHMvaTkxNS9pOTE1X2hhbmdtYW4uYwo+ICsrKyBiL3Rlc3RzL2k5MTUv
aTkxNV9oYW5nbWFuLmMKPiBAQCAtMjU3LDYgKzI1Nyw3IEBAIHN0YXRpYyB2b2lkIGhhbmdjaGVj
a191bnRlcm1pbmF0ZWQodm9pZCkKPiAgIGlndF9tYWluCj4gICB7Cj4gICAJY29uc3Qgc3RydWN0
IGludGVsX2V4ZWN1dGlvbl9lbmdpbmUgKmU7Cj4gKwlpZ3RfaGFuZ190IGhhbmcgPSB7fTsKPiAg
IAo+ICAgCWlndF9za2lwX29uX3NpbXVsYXRpb24oKTsKPiAgIAo+IEBAIC0yNjYsNiArMjY3LDgg
QEAgaWd0X21haW4KPiAgIAkJZGV2aWNlID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9JTlRFTCk7
Cj4gICAJCWlndF9yZXF1aXJlX2dlbShkZXZpY2UpOwo+ICAgCj4gKwkJaGFuZyA9IGlndF9hbGxv
d19oYW5nKGRldmljZSwgMCwgSEFOR19BTExPV19DQVBUVVJFKTsKPiArCj4gICAJCXN5c2ZzID0g
aWd0X3N5c2ZzX29wZW4oZGV2aWNlLCAmaWR4KTsKPiAgIAkJaWd0X2Fzc2VydChzeXNmcyAhPSAt
MSk7Cj4gICAKPiBAQCAtMjg4LDQgKzI5MSw4IEBAIGlndF9tYWluCj4gICAKPiAgIAlpZ3Rfc3Vi
dGVzdCgiaGFuZ2NoZWNrLXVudGVybWluYXRlZCIpCj4gICAJCWhhbmdjaGVja191bnRlcm1pbmF0
ZWQoKTsKPiArCj4gKwlpZ3RfZml4dHVyZSB7Cj4gKwkJaWd0X2Rpc2FsbG93X2hhbmcoZGV2aWNl
LCBoYW5nKTsKPiArCX0KPiAgIH0KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2
