Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20190128101415.21163-1-chris@chris-wilson.co.uk>
 <20190128101849.21355-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <22c79445-42e5-7a45-bbf3-0106cf38e2c5@linux.intel.com>
Date: Mon, 28 Jan 2019 11:00:43 +0000
MIME-Version: 1.0
In-Reply-To: <20190128101849.21355-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] i915/perf_pmu: Check for
 hangs allowed
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

Ck9uIDI4LzAxLzIwMTkgMTA6MTgsIENocmlzIFdpbHNvbiB3cm90ZToKPiBDaGVjayB3ZSBjYW4g
cmVzZXQgdGhlIEdQVSBiZWZvcmUgcnVubmluZyB0aGUgcmVzZXQgdGVzdC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiBDYzogVHZy
dGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KPiAtLS0KPiBEaWZmZXJlbnQg
bWVhbmluZyBvZiBmbGFncywgaXQncyBub3QgdGhlIHJpbmcgaWQhCj4gLS0tCj4gICB0ZXN0cy9w
ZXJmX3BtdS5jIHwgNyArKysrKystCj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL3BlcmZfcG11LmMgYi90ZXN0
cy9wZXJmX3BtdS5jCj4gaW5kZXggMjEyOTJiZjNhLi5jOTg4MWU1OWYgMTAwNjQ0Cj4gLS0tIGEv
dGVzdHMvcGVyZl9wbXUuYwo+ICsrKyBiL3Rlc3RzL3BlcmZfcG11LmMKPiBAQCAtMTgxMiw4ICsx
ODEyLDEzIEBAIGlndF9tYWluCj4gICAJCQkJCWFjY3VyYWN5KGZkLCBlLCBwY3RbaV0sIDEwKTsK
PiAgIAkJCX0KPiAgIAo+IC0JCQlpZ3Rfc3VidGVzdF9mKCJidXN5LWhhbmctJXMiLCBlLT5uYW1l
KQo+ICsJCQlpZ3Rfc3VidGVzdF9mKCJidXN5LWhhbmctJXMiLCBlLT5uYW1lKSB7Cj4gKwkJCQlp
Z3RfaGFuZ190IGhhbmcgPSBpZ3RfYWxsb3dfaGFuZyhmZCwgMCwgMCk7Cj4gKwo+ICAgCQkJCXNp
bmdsZShmZCwgZSwgVEVTVF9CVVNZIHwgRkxBR19IQU5HKTsKPiArCj4gKwkJCQlpZ3RfZGlzYWxs
b3dfaGFuZyhmZCwgaGFuZyk7Cj4gKwkJCX0KPiAgIAkJfQo+ICAgCj4gICAJCS8qKgo+IAoKU28g
YWxsIElHVHMgd2hpY2ggdHJpZ2dlciBoYW5ncy9yZXNldHMgc2hvdWxkIGNhbGwgdGhpcz8KClJl
dmlld2VkLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgoKUmVn
YXJkcywKClR2cnRrbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
