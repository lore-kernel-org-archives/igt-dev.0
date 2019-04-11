Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20190408161533.2421-6-andi.shyti@intel.com>
 <20190411122654.1680-1-tvrtko.ursulin@linux.intel.com>
 <155498592365.22467.8220615834316531843@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <581d8364-09e5-6f74-47d0-b992de86164e@linux.intel.com>
Date: Thu, 11 Apr 2019 13:53:24 +0100
MIME-Version: 1.0
In-Reply-To: <155498592365.22467.8220615834316531843@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [RFT i-g-t 6/6] test: perf_pmu: use the
 gem_engine_topology library
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
Cc: Intel-gfx@lists.freedesktop.org, Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDExLzA0LzIwMTkgMTM6MzIsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIFR2cnRr
byBVcnN1bGluICgyMDE5LTA0LTExIDEzOjI2OjU0KQo+PiBGcm9tOiBBbmRpIFNoeXRpIDxhbmRp
LnNoeXRpQGludGVsLmNvbT4KPj4KPj4gUmVwbGFjZSB0aGUgbGVnYWN5IGZvcl9lYWNoX2VuZ2lu
ZSogZGVmaW5lcyB3aXRoIHRoZSBvbmVzCj4+IGltcGxlbWVudGVkIGluIHRoZSBnZW1fZW5naW5l
X3RvcG9sb2d5IGxpYnJhcnkuCj4+Cj4+IFVzZSB3aGVuZXZlciBwb3NzaWJsZSBnZW1fZW5naW5l
X2Nhbl9zdG9yZV9kd29yZCgpIHRoYXQgY2hlY2tzCj4+IGNsYXNzIGluc3RlYWQgb2YgZmxhZ3Mu
Cj4+Cj4+IE5vdyB0aGUgX19mb3JfZWFjaF9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgYW5kCj4+IGZv
cl9lYWNoX2VuZ2luZV9jbGFzc19pbnN0YW5jZSBhcmUgdW51c2VkLCByZW1vdmUgdGhlbS4KPj4K
Pj4gU3VnZ2VzdGVkLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29t
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRpIFNoeXRpIDxhbmRpLnNoeXRpQGludGVsLmNvbT4KPj4g
Q2M6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBsaW51eC5pbnRlbC5jb20+Cj4+IFJl
dmlld2VkLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+
IEkgc2VlIGEgbG90IG9mIG5ldyBnZW1fY29udGV4dF9jcmVhdGUoKSwgYnV0IG5vdCBnZW1fcmVx
dWlyZV9jb250ZXh0cygpLgoKUHJvYmxlbSBpcyBfX2Zvcl9lYWNoX3BoeXNpY2FsX2VuZ2luZSBt
b2RpZmllcyB0aGUgZGVmYXVsdCBjb250ZXh0IHNvIAp0ZXN0cyB1bmRlciB0aGF0IGl0ZXJhdG9y
IGNhbid0IGtlZXAgdXNpbmcgSTkxNV9FWEVDX1JFTkRFUi4KCkl0IHdhcyBwZXJoYXBzIGEga25l
ZS1qZXJrIHJlYWN0aW9uIHRvIG1ha2UgdGhlbSBjcmVhdGUgdGhlaXIgb3duIApjb250ZXh0IGFz
IGEgd29ya2Fyb3VuZC4KClNob3VsZCB3ZSBoYXZlIGEgaGVscGVyIGFmdGVyIGFsbCB0byBnZXQg
ZWIgZmxhZ3MgZm9yIGdpdmVuIGNsYXNzOmluc3RhbmNlPwoKdW5zaWduZWQgaW50CmdlbV9nZXRf
Y3R4X2ViX2ZsYWdzKHVpbnQzMl90IGN0eCwgdWludDE2X3QgY2xhc3MsIHVpbnQxNl90IGluc3Rh
bmNlKQp7CglpZiAoY3R4Lmhhc19tYXApCgkJcmV0dXJuIGZpbmRfY2xhc3NfaW5zdGFuY2VfaW5f
bWFwLT5mbGFnczsKCWVsc2UKCQlyZXR1cm4gZ2VtX2NsYXNzX2luc3RhbmNlX3RvX2ViX2ZsYWdz
KGNsYXNzLCBpbnN0YW5jZSk7Cn0KCj8KClJlZ2FyZHMsCgpUdnJ0a28KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
