Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20180209143959.16606-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <168e61d8-40d8-7a67-bb8d-e12c8272fd8c@linux.intel.com>
Date: Mon, 12 Feb 2018 09:50:44 +0000
MIME-Version: 1.0
In-Reply-To: <20180209143959.16606-1-chris@chris-wilson.co.uk>
Content-Language: en-GB
Subject: Re: [igt-dev] [PATCH igt] igt/perf_pmu: Semaphores do not exists
 before gen6
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

Ck9uIDA5LzAyLzIwMTggMTQ6MzksIENocmlzIFdpbHNvbiB3cm90ZToKPiBXZSBkb24ndCBleHBl
Y3QgdG8gYmUgYWJsZSB0byBvcGVuIHRoZSBJOTE1X1NBTVBMRV9TRU1BIG9uIGdlbjUgYW5kCj4g
ZWFybGllciBhcyB0aGUgSFcgZG9lc24ndCBzdXBwb3J0IHNlbWFwaG9yZXMuCj4gCj4gU2lnbmVk
LW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gLS0tCj4g
ICB0ZXN0cy9wZXJmX3BtdS5jIHwgOCArKysrKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9wZXJmX3Bt
dS5jIGIvdGVzdHMvcGVyZl9wbXUuYwo+IGluZGV4IGEyN2E4YTgxZS4uYzdmODdkNTJmIDEwMDY0
NAo+IC0tLSBhL3Rlc3RzL3BlcmZfcG11LmMKPiArKysgYi90ZXN0cy9wZXJmX3BtdS5jCj4gQEAg
LTc0LDEzICs3NCwxOSBAQCBzdGF0aWMgdm9pZAo+ICAgaW5pdChpbnQgZ2VtX2ZkLCBjb25zdCBz
dHJ1Y3QgaW50ZWxfZXhlY3V0aW9uX2VuZ2luZTIgKmUsIHVpbnQ4X3Qgc2FtcGxlKQo+ICAgewo+
ICAgCWludCBmZCwgZXJyID0gMDsKPiArCWJvb2wgZXhpc3RzOwo+ICAgCj4gICAJZXJybm8gPSAw
Owo+ICAgCWZkID0gcGVyZl9pOTE1X29wZW4oX19JOTE1X1BNVV9FTkdJTkUoZS0+Y2xhc3MsIGUt
Pmluc3RhbmNlLCBzYW1wbGUpKTsKPiAgIAlpZiAoZmQgPCAwKQo+ICAgCQllcnIgPSBlcnJubzsK
PiAgIAo+IC0JaWYgKGdlbV9oYXNfZW5naW5lKGdlbV9mZCwgZS0+Y2xhc3MsIGUtPmluc3RhbmNl
KSkgewo+ICsJZXhpc3RzID0gZ2VtX2hhc19lbmdpbmUoZ2VtX2ZkLCBlLT5jbGFzcywgZS0+aW5z
dGFuY2UpOwo+ICsJaWYgKGludGVsX2dlbihpbnRlbF9nZXRfZHJtX2RldmlkKGdlbV9mZCkpIDwg
NiAmJgo+ICsJICAgIHNhbXBsZSA9PSBJOTE1X1NBTVBMRV9TRU1BKQo+ICsJCWV4aXN0cyA9IGZh
bHNlOwo+ICsKPiArCWlmIChleGlzdHMpIHsKPiAgIAkJaWd0X2Fzc2VydF9lcShlcnIsIDApOwo+
ICAgCQlpZ3RfYXNzZXJ0X2ZkKGZkKTsKPiAgIAkJY2xvc2UoZmQpOwo+IAoKT29vcHNpZS4uIDoo
CgpSZXZpZXdlZC1ieTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4K
ClJlZ2FyZHMsCgpUdnJ0a28KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
Cg==
