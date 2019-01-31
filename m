Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A343A6E0FF
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Jan 2019 09:18:48 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20190130221833.19999-1-chris@chris-wilson.co.uk>
 <87k1ilyyxu.fsf@intel.com>
 <154892621142.14784.8571013382627732055@skylake-alporthouse-com>
In-Reply-To: <154892621142.14784.8571013382627732055@skylake-alporthouse-com>
Message-ID: <154892632425.14784.12368564293565807524@skylake-alporthouse-com>
Date: Thu, 31 Jan 2019 09:18:44 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] sw_sync: Initialise struct before use
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
To: Jani Nikula <jani.nikula@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTktMDEtMzEgMDk6MTY6NTEpCj4gUXVvdGluZyBKYW5p
IE5pa3VsYSAoMjAxOS0wMS0zMSAwOToxMDo1MykKPiA+IE9uIFdlZCwgMzAgSmFuIDIwMTksIENo
cmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPiB3cm90ZToKPiA+ID4gc3dfc3lu
YzogLi4vbGliL2lndF9jb3JlLmM6MTU5MjogX19pZ3RfZm9ya19oZWxwZXI6IEFzc2VydGlvbiBg
IXByb2MtPnJ1bm5pbmcnCj4gPiA+Cj4gPiA+IEJ1Z3ppbGxhOiBodHRwczovL2J1Z3MuZnJlZWRl
c2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDg4ODkKPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hy
aXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gPiAKPiA+IFNvIHRoZSBjb21w
aWxlciBzZWVzIHRoZSB2YXJpYWJsZSBpcyB1bmluaXRpYWxpemVkLCBidXQgaXQncyBiZWluZwo+
ID4gcGFzc2VkIHRvIGEgZnVuY3Rpb24uLi4gam9sbHkgZ29vZCwgdGhhdCBtdXN0IGRvIHRoZSBp
bml0aWFsaXphdGlvbi4gOi8KPiA+IAo+ID4gSSB0cnVzdCB5b3UgY2hlY2tlZCB0aGUgb3RoZXIg
Y2FsbCBzaXRlcy4KPiAKPiBJbiB0aGlzIGZpbGUgb25seS4KCkFsbCBvdGhlcnMgY2hlY2sgb3V0
LgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
