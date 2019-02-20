Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF2E891A6
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Feb 2019 05:39:58 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <0cc138314abc390aa0bfc79d5463034da3024530.1550624857.git.caz@caz-nuc.ra.intel.com>
 <20190219222110.19815-1-chris@chris-wilson.co.uk>
Date: Tue, 19 Feb 2019 21:39:55 -0800
In-Reply-To: <20190219222110.19815-1-chris@chris-wilson.co.uk> (Chris Wilson's
 message of "Tue, 19 Feb 2019 15:21:10 -0700")
Message-ID: <87lg2bauhg.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Incrementally mlock()
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, Caz Yokoyama <caz@caz-nuc.ra.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBGZWIgMTkgMjAxOSBhdCAwOToyNjo1NiBQTSwgQXNodXRvc2ggRGl4aXQgPGFzaHV0
b3NoLmRpeGl0QGludGVsLmNvbT4gd3JvdGU6Cj4gT24gVHVlLCBGZWIgMTkgMjAxOSBhdCAwMzoy
MToxMCBQTSwgQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+IHdyb3RlOgo+
PiBBcyB3ZSBhbHJlYWR5IGhhdmUgdGhlIHByZXZpb3VzIHBvcnRpb24gb2YgdGhlIG1tYXAgbWxv
Y2tlZCwgd2Ugb25seQo+PiBuZWVkIHRvIG1sb2NrKCkgdGhlIGZyZXNoIHBvcnRpb24gZm9yIHRl
c3RpbmcgYXZhaWxhYmxlIG1lbW9yeS4KPgo+IFN0aWxsIGxvb2tpbmcgYXQgd2hhdCBpcyB3cm9u
ZyB3aXRoIHRoZSBwYXRjaCBidXQgd2l0aCB0aGUgcGF0Y2ggdGhlCj4gdGVzdCBpcyB1bmFibGUg
dG8gbG9jayBhcyBtdWNoIG1lbW9yeSBhcyBiZWZvcmUgYW5kIGludm9rZSB0aGUKPiBzaHJpbmtl
ci4gSGVyZSBhcmUgdGhlIG91dHB1dHMgYmVmb3JlIGFuZCBhZnRlciB0aGUgcGF0Y2ggb24gYSBz
eXN0ZW0KPiB3aXRoIDE2IEdCOgoKT0ssIGZvdW5kIHRoZSBidWcuIFRoZSBidWcgaXMgdGhhdCBj
YW5fbWxvY2sgaXMgdTY0Ki4gVGhlcmVmb3JlCmNhbl9tbG9jayBtdXN0IGJlIGNhc3QgdG8gdTgq
IG9uIHRoZXNlIHR3byBsaW5lczoKCgo+ICsgICAgIGlmIChtbG9jayhjYW5fbWxvY2sgKyBieXRl
cywgaW5jKSkKCmFuZCAKCj4gKwlpZ3RfYXNzZXJ0KCFtbG9jayhjYW5fbWxvY2sgKyBsb2NrZWQs
ICpjYW5fbWxvY2sgLSBsb2NrZWQpKTsKCkhvd2V2ZXIgd2hlbiB3ZSBkbyB0aGlzLCB0aGUgcGFy
ZW50IHByb2Nlc3MgaW52YXJpYWJseSBnZXRzIGtpbGxlZCBieQp0aGUgT09NIGtpbGxlciwgc29t
ZXRoaW5nIHdoaWNoIHdhcyBub3QgaGFwcGVuaW5nIHByZXZpb3VzbHk6CgojIC4vaTkxNV9zdXNw
ZW5kIC0tcnVuLXN1YnRlc3Qgc2hyaW5rCklHVC1WZXJzaW9uOiAxLjIzLWc5ZWY3OTFjZSAoeDg2
XzY0KSAoTGludXg6IDUuMC4wLXJjNSsgeDg2XzY0KQpTdGFydGluZyBzdWJ0ZXN0OiBzaHJpbmsK
Y2hpbGQgMCBkaWVkIHdpdGggc2lnbmFsIDksIEtpbGxlZApjaGlsZCAwIGRpZWQgd2l0aCBzaWdu
YWwgOSwgS2lsbGVkCmNoaWxkIDAgZGllZCB3aXRoIHNpZ25hbCA5LCBLaWxsZWQKY2hpbGQgMCBk
aWVkIHdpdGggc2lnbmFsIDksIEtpbGxlZApjaGlsZCAwIGRpZWQgd2l0aCBzaWduYWwgOSwgS2ls
bGVkCmNoaWxkIDAgZGllZCB3aXRoIHNpZ25hbCA5LCBLaWxsZWQKS2lsbGVkCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
