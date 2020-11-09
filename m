Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0189B89856
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Nov 2020 13:06:38 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <160492712972.28777.15098942844906841840@build.alporthouse.com>
References: <20201109120632.389212-1-imre.deak@intel.com>
 <20201109120632.389212-2-imre.deak@intel.com>
 <160492372394.28777.4238415753044387552@build.alporthouse.com>
 <20201109130214.GB30774@zkempczy-mobl2>
 <160492712972.28777.15098942844906841840@build.alporthouse.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 09 Nov 2020 13:06:30 +0000
Message-ID: <160492719086.28777.3438928118260392351@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_batchbuffer: Fix relocs
 across the 4GB address boundary
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
To: zbigniew.kempczynski@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMjAtMTEtMDkgMTM6MDU6MjkpCj4gUXVvdGluZyBaYmln
bmlldyBLZW1wY3p5xYRza2kgKDIwMjAtMTEtMDkgMTM6MDI6MTQpCj4gPiBPbiBNb24sIE5vdiAw
OSwgMjAyMCBhdCAxMjowODo0M1BNICswMDAwLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiA+IFF1
b3RpbmcgSW1yZSBEZWFrICgyMDIwLTExLTA5IDEyOjA2OjMyKQo+ID4gPiA+IElmIHRoZSBkZWx0
YSBvZiBhIHJlbG9jYXRpb24gdGFyZ2V0IHdydC4gdGhlIG9iamVjdCBiYXNlIGFkZHJlc3MgY3Jv
c3Nlcwo+ID4gPiA+IHRoZSA0R0IgYWRkcmVzcyBib3VuZGFyeSB0aGUgdXBwZXIgMzJiaXQgb2Yg
dGhlIHRhcmdldCBhZGRyZXNzIHdpbGwgYmUKPiA+ID4gPiBpbmNvcnJlY3QsIGZpeCB0aGlzLgo+
ID4gPiA+IAo+ID4gPiA+IENjOiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBj
enluc2tpQGludGVsLmNvbT4KPiA+ID4gPiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13
aWxzb24uY28udWs+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSW1yZSBEZWFrIDxpbXJlLmRlYWtA
aW50ZWwuY29tPgo+ID4gPiAKPiA+ID4gWmJpZ25pZXcsIGZhbmN5IHdyaXRpbmcgYSB0ZXN0IGNh
c2UgZm9yIHRoaXM/Cj4gPiA+IC1DaHJpcwo+ID4gCj4gPiBTdXJlLCBlbnF1ZXVlZC4gCj4gPiAK
PiA+IEFwYXJ0IG9mIGZpeCBpcyBjb3JyZWN0IC0gSSB0aG91Z2h0IHdlJ3JlIG1vc3RseSB1c2lu
ZyBkZWx0YQo+ID4gdG8gc2V0IHNvbWUgYml0cyBpbiBjb21tYW5kcy4gV2hhdCdzIHRoZSByZWFs
IHVzYWdlPwo+IAo+IExhcmdlIG9mZnNldHMgd291bGQgbW9zdCBjb21tb25seSBiZSB1c2VkIGZv
ciBzdWJzdXJmYWNlcyBvciBhdXhpbGlhcnkKPiBzdGF0ZSBjb250YWluZWQgd2l0aGluIG9uZSBi
dWZmZXIuCgpBbHNvIHNvbWV0aGluZyB0byBrZWVwIGluIG1pbmQgaXMgdGhhdCB0aGUgZGVsdGEg
aXMgYWN0dWFsbHkgYW4gczMyCmRlc3BpdGUgdGhlIHUzMiBmaWVsZC4KLUNocmlzCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
