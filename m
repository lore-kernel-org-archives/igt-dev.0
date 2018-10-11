Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20181011123027.12203-1-tvrtko.ursulin@linux.intel.com>
 <153926124738.2691.8558923552654477730@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <fb5ecccd-74c3-b83a-32a3-0f84d138baa2@linux.intel.com>
Date: Thu, 11 Oct 2018 13:42:31 +0100
MIME-Version: 1.0
In-Reply-To: <153926124738.2691.8558923552654477730@skylake-alporthouse-com>
Content-Language: en-GB
Subject: Re: [igt-dev] [PATCH i-g-t] tests/gem_set_tiling_vs_pwrite: Skip on
 unknown swizzling
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
To: Chris Wilson <chris@chris-wilson.co.uk>, Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDExLzEwLzIwMTggMTM6MzQsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIFR2cnRr
byBVcnN1bGluICgyMDE4LTEwLTExIDEzOjMwOjI3KQo+PiBGcm9tOiBUdnJ0a28gVXJzdWxpbiA8
dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+Pgo+PiBTYW1lIGFzIGluIGNvbW1pdCA3ODA3MWMy
ZmE1M2QgKCJpZ3QvZ2VtX3RpbGVkX3BhcnRpYWxfcHdyaXRlX3ByZWFkOiBDaGVjawo+PiBmb3Ig
a25vd24gc3dpenpsaW5nIiksIHRvIGJlIGFibGUgdG8gY29tcGFyZSB0aGUgYm8gYWdhaW5zdCB0
aGUgdGVzdAo+PiBwYXR0ZXJuIHdlIG5lZWQgdG8gc2tpcCB0aGUgdGVzdCBpZiB0aGUgc3dpenps
aW5nIGlzIG5vdCBjb21wYXRpYmxlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBUdnJ0a28gVXJzdWxp
biA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+PiBCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmZy
ZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTAyNTc1Cj4+IENjOiBDaHJpcyBXaWxzb24g
PGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPj4gLS0tCj4+IEVlZWsgY29uZmlkZW5jZSBsZXZl
bCBsb3cgLSBpcyB0aGlzIGNvcnJlY3Q/Cj4gCj4gQWN0dWFsbHkgdGhpcyBpcyBhIHNsaWdodGx5
IG1vcmUgc3VidGxlIHByb2JsZW0sCj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3Jn
L3BhdGNoLzI0MDMyNy8KClNvIGFzc3VtaW5nIHlvdXIgcGF0Y2ggaXMgaW4sIHRoaXMgSUdUIGNh
bm5vdCBhY3R1YWxseSB3b3JrIGlmIGFueSAKc3dpenpsaW5nIGlzIGluIGVmZmVjdD8gT3Igd2l0
aG91dCB5b3VyIHBhdGNoLCBpdCBzaG91bGQgc2tpcCBiYXNlZCBvbiAKa25vd25fc3dpenpsaW5n
PyBPciBpcyBldmVuIHRoYXQgbm90IGVub3VnaD8KClJlZ2FyZHMsCgpUdnJ0a28KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
