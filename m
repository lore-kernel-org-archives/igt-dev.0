Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180719163756.15463-1-tvrtko.ursulin@linux.intel.com>
References: <20180719163756.15463-1-tvrtko.ursulin@linux.intel.com>
Message-ID: <153201892009.24818.7035937748047758201@skylake-alporthouse-com>
Date: Thu, 19 Jul 2018 17:48:40 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] tests/perf_pmu: Restore runtime PM at
 subtest exit
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
To: Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wNy0xOSAxNzozNzo1NikKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IFJlc3RvcmUgcnVudGlt
ZSBQTSBzdGF0ZSAodmlhIGEgbmV3bHkgYWRkZWQgbGlicmFyeSBmdW5jdGlvbikgd2hlbiB0aGUK
PiB0ZXN0IHdoaWNoIHNldHMgaXQgdXAgZXhpdC4gVGhpcyB3YXMgd2UgYXZvaWQgcnVubmluZyBh
bGwgc3Vic2VxdWVudCBzdWItCj4gdGVzdHMgaW4gdGhlIGFnZ3Jlc3NpdmUgcnVudGltZSBQTSBt
b2RlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBp
bnRlbC5jb20+Cj4gLS0tCj4gIGxpYi9pZ3RfcG0uYyAgICAgfCAxMyArKysrKysrKysrKystCj4g
IGxpYi9pZ3RfcG0uaCAgICAgfCAgMSArCj4gIHRlc3RzL3BlcmZfcG11LmMgfCAgMyArKysKPiAg
MyBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2xpYi9pZ3RfcG0uYyBiL2xpYi9pZ3RfcG0uYwo+IGluZGV4IDhhYzEzMjI2OWQ3
OS4uMmUyZWVhNWQzYjJkIDEwMDY0NAo+IC0tLSBhL2xpYi9pZ3RfcG0uYwo+ICsrKyBiL2xpYi9p
Z3RfcG0uYwo+IEBAIC0yOTcsNyArMjk3LDEzIEBAIGludCBwbV9zdGF0dXNfZmQgPSAtMTsKPiAg
c3RhdGljIGNoYXIgX19pZ3RfcG1fcnVudGltZV9hdXRvc3VzcGVuZFs2NF07Cj4gIHN0YXRpYyBj
aGFyIF9faWd0X3BtX3J1bnRpbWVfY29udHJvbFs2NF07Cj4gIAo+IC1zdGF0aWMgdm9pZCBfX2ln
dF9wbV9ydW50aW1lX2V4aXRfaGFuZGxlcihpbnQgc2lnKQo+ICsvKioKPiArICogaWd0X3Jlc3Rv
cmVfcnVudGltZV9wbToKPiArICoKPiArICogUmVzdG9yZXMgdGhlIHJ1bnRpbWUgUE0gY29uZmln
dXJhdGlvbiBhcyBpdCB3YXMgYmVmb3JlIHRoZSBjYWxsIHRvCj4gKyAqIGlndF9zZXR1cF9ydW50
aW1lX3BtLgo+ICsgKi8KPiArdm9pZCBpZ3RfcmVzdG9yZV9ydW50aW1lX3BtKHZvaWQpCj4gIHsK
PiAgICAgICAgIGludCBmZDsKClNob3VsZCB3ZSBlYXQgX19pZ3RfcG1fcnVudGltZV9hdXRvc3Vz
cGVuZCBzbyB3ZSBvbmx5IGFwcGx5IGl0IG9uY2UgZm9yCmVhY2ggaWd0X3NldHVwX3J1bnRpbWVf
cG0/Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
