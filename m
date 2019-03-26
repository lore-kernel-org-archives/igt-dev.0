Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E74D6E05F
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2019 15:56:36 +0000 (UTC)
References: <20190326132801.5216-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <aea48eaa-35e2-fde6-cae2-021f52d7cd8a@linux.intel.com>
Date: Tue, 26 Mar 2019 15:56:33 +0000
MIME-Version: 1.0
In-Reply-To: <20190326132801.5216-1-chris@chris-wilson.co.uk>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tools/intel-gpu-top: Only link against
 igt_perf.la
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
Cc: Eero Tamminen <eero.t.tamminen@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDI2LzAzLzIwMTkgMTM6MjgsIENocmlzIFdpbHNvbiB3cm90ZToKPiBGaXggdGhlIG1lc29u
IGJ1aWxkIHRvIG5vdCBsaW5rIGludGVsLWdwdS10b3AgYWdhaW5zdHQgdGhlIHdob2xlIHRlc3QK
PiBpbmZyYXN0cnVjdHVyZTsgaXQncyBhIHRvb2wgbm90IGEgdGVzdCEKPiAKPiBSZXBvcnRlZC1i
eTogRWVybyBUYW1taW5lbiA8ZWVyby50LnRhbW1pbmVuQGludGVsLmNvbT4KPiBCdWd6aWxsYTog
aHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTEwMjQ5Cj4gU2ln
bmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gQ2M6
IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Cj4gLS0tCj4gICB0b29s
cy9tZXNvbi5idWlsZCB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS90b29scy9tZXNvbi5idWlsZCBiL3Rvb2xz
L21lc29uLmJ1aWxkCj4gaW5kZXggNzlmMzZhYTk1Li41ZDAwZjJlM2MgMTAwNjQ0Cj4gLS0tIGEv
dG9vbHMvbWVzb24uYnVpbGQKPiArKysgYi90b29scy9tZXNvbi5idWlsZAo+IEBAIC05OCw3ICs5
OCw3IEBAIHNoYXJlZF9saWJyYXJ5KCdpbnRlbF9hdWJkdW1wJywgJ2F1YmR1bXAuYycsCj4gICBl
eGVjdXRhYmxlKCdpbnRlbF9ncHVfdG9wJywgJ2ludGVsX2dwdV90b3AuYycsCj4gICAJICAgaW5z
dGFsbCA6IHRydWUsCj4gICAJICAgaW5zdGFsbF9ycGF0aCA6IGJpbmRpcl9ycGF0aGRpciwKPiAt
CSAgIGRlcGVuZGVuY2llcyA6IHRvb2xfZGVwcyArIFsgbGliX2lndF9wZXJmIF0pCj4gKwkgICBk
ZXBlbmRlbmNpZXMgOiBsaWJfaWd0X3BlcmYpCj4gICAKPiAgIGNvbmZfZGF0YSA9IGNvbmZpZ3Vy
YXRpb25fZGF0YSgpCj4gICBjb25mX2RhdGEuc2V0KCdwcmVmaXgnLCBwcmVmaXgpCj4gCgpQZmZm
dCwgaXQgd2FzIG9ubHkga2VlcGluZyBoaXAgaW4gdGhlIGFnZSBvZiBNZXNvbml6YXRpb24gLSAK
aHR0cHM6Ly93d3cucGhvcm9uaXguY29tL3NjYW4ucGhwP3BhZ2U9bmV3c19pdGVtJnB4PUZlZG9y
YS1NZXNhLU1lc29uLURlYnVnLUJ1aWxkLiAKOykKClJldmlld2VkLWJ5OiBUdnJ0a28gVXJzdWxp
biA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgoKUmVnYXJkcywKClR2cnRrbwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlz
dAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
