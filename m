Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318796E174
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Feb 2018 10:00:21 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180212094724.4650-1-tvrtko.ursulin@linux.intel.com>
References: <151807744819.28809.12247829425156020313@mail.alporthouse.com>
 <20180212094724.4650-1-tvrtko.ursulin@linux.intel.com>
Message-ID: <151842961309.18923.12614884681568217149@mail.alporthouse.com>
Date: Mon, 12 Feb 2018 10:00:13 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/3] tests/perf_pmu: Handle thermally
 throttled devices
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wMi0xMiAwOTo0NzoyNCkKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IFNvbWUgc3lzdGVtcyBj
YW5ub3QgcmVhY2ggdGhlIGFkdmVydGlzZWQgbWF4aW11bSBmcmVxdWVuY3kgZHVlIHRocm90dGxp
bmcuCj4gSGFuZGxlIHRoZW0gYnkgY29uc2lkZXJpbmcgYSAxMDBNSHogbG93ZXIgbGltaXQuCj4g
Cj4gdjI6IFVzZSBtb3JlIHJlbGF4ZWQgdG9sZXJhbmNlIG9ubHkgaW4gdGhlIGRvd253YXJkIGRp
cmVjdGlvbi4KPiAgICAgKENocmlzIFdpbHNvbikKPiAKPiBTaWduZWQtb2ZmLWJ5OiBUdnJ0a28g
VXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IC0tLQo+ICB0ZXN0cy9wZXJmX3Bt
dS5jIHwgMjAgKysrKysrKysrKysrKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL3BlcmZfcG11
LmMgYi90ZXN0cy9wZXJmX3BtdS5jCj4gaW5kZXggYWZjN2RjOTkyNjgxLi5hNTIyNGIwNWM3ZDMg
MTAwNjQ0Cj4gLS0tIGEvdGVzdHMvcGVyZl9wbXUuYwo+ICsrKyBiL3Rlc3RzL3BlcmZfcG11LmMK
PiBAQCAtMTIwLDExICsxMjAsMTYgQEAgc3RhdGljIHVpbnQ2NF90IHBtdV9yZWFkX211bHRpKGlu
dCBmZCwgdW5zaWduZWQgaW50IG51bSwgdWludDY0X3QgKnZhbCkKPiAgICAgICAgIHJldHVybiBi
dWZbMV07Cj4gIH0KPiAgCj4gKyNkZWZpbmUgX19hc3NlcnRfd2l0aGluX2Vwc2lsb24oeCwgcmVm
LCB0b2xfdXAsIHRvbF9kb3duKSBcCj4gKyAgICAgICBpZ3RfYXNzZXJ0X2YoKGRvdWJsZSkoeCkg
PD0gKDEuMCArICh0b2xfdXApKSAqIChkb3VibGUpKHJlZikgJiYgXAo+ICsgICAgICAgICAgICAg
ICAgICAgIChkb3VibGUpKHgpID49ICgxLjAgLSAodG9sX2Rvd24pKSAqIChkb3VibGUpKHJlZiks
IFwKPiArICAgICAgICAgICAgICAgICAgICAiJyVzJyAhPSAnJXMnICglZiBub3Qgd2l0aGluICVm
JSUvJWYlJSB0b2xlcmFuY2Ugb2YgJWYpXG4iLFwKCldvdWxkICJub3Qgd2l0aGluICgtJSUsICsl
JSkiIG9yICIuLi4oJSUgYmVsb3csICUlIGFib3ZlKSIgcmVhZCBiZXR0ZXI/CgpSZXZpZXdlZC1i
eTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci1DaHJpcwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcg
bGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
