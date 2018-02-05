Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269C389D8A
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Feb 2018 14:11:14 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <8050321d-cbcd-3bea-d758-f6b5cb1fe977@linux.intel.com>
References: <20180202183754.30042-1-tvrtko.ursulin@linux.intel.com>
 <20180202183754.30042-7-tvrtko.ursulin@linux.intel.com>
 <151760476672.15322.10668358533953843463@mail.alporthouse.com>
 <77724920-b34e-a10e-509e-32640dfb6b5a@linux.intel.com>
 <151782576413.15322.12045355885218174517@mail.alporthouse.com>
 <8050321d-cbcd-3bea-d758-f6b5cb1fe977@linux.intel.com>
Message-ID: <151783986820.15322.11176832867290867483@mail.alporthouse.com>
Date: Mon, 05 Feb 2018 14:11:08 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 6/9] tests/perf_pmu: PMU enable race test
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wMi0wNSAxMDo0MDowMSkKPiAKPiBPbiAwNS8w
Mi8yMDE4IDEwOjE2LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBRdW90aW5nIFR2cnRrbyBVcnN1
bGluICgyMDE4LTAyLTA1IDEwOjA3OjAyKQo+ID4+IEkgY2FuIHdyYXAgaXQgaW4gYSAxMHggbG9v
cCBidXQgdW50aWwgdGhlIFBNVSBpcyBmaXhlZCB0aGF0IG1lYW5zIDEweAo+ID4+IGxvbmdlciBy
dW50aW1lIGFzIHdlbGwgd2hpY2ggSSB3YW50ZWQgdG8gYXZvaWQsIGFuZCBpbnN0ZWFkIGNvdW50
IG9uCj4gPj4gZXhlY3V0aW9uIGluIG51bWJlcnMgYWNyb3NzIHRoZSBzaGFyZHMuCj4gPiAKPiA+
IE90b2gsIEkgd2FudCBhIHRlc3QgdGhhdCB3ZSBjYW4gcmVsaWFibHkgcnVuIGxvY2FsbHkgdG8g
ZGV0ZXJtaW5lIGlmIHdlCj4gPiBoYXZlIGEgcHJvYmxlbSBvciBub3QuIEEgZGlmZmljdWx0IGJh
bGFuY2UuIFdoYXQgc2hvdWxkIHdlIGFpbSBmb3IKPiA+IGZsaXAtZmxvcHB5IHRlc3RzLCA+NTAl
IGVycm9yIHJhdGU/ID4xMCU/IENlcnRhaW5seSBoYXMgdG8gYmUgPjElIG9yIHdlCj4gPiB3aWxs
IHN0cnVnZ2xlIHRvIG5vdGljZSB0aGUgcGF0dGVybi4gTXkgZmluZ2VyIGluIHRoZSBhaXIgd291
bGQgc2F5ID4zMyUuCj4gCj4gSSBkb24ndCBrbm93IGhvdyB3ZSBkbyB0aGF0IHNpbmNlIGl0IHdp
bGwgZGVwZW5kIG9uIHNvIG1hbnkgZmFjdG9ycy4gT24gCj4gbXkgU0tMIEdUMiBhbmQgbXkga2Vy
bmVsIGNvbmZpZywgaXQgaXMgbWF5YmUgYXJvdW5kIDEwJS4gU28gaWYgd2UgY2Fubm90IAo+IHJl
YWNoID4zMyUgd2hhdCBkbyB3ZSwgZG9uJ3QgYWRkIHRoZSB0ZXN0PwoKSSdtIGZsZXhpYmxlLCB0
aG91Z2ggaWYgd2UgY2FuJ3QgZm9yY2UgaXQgdG8gaGl0IHRoZSByYWNlIGV2ZW4gd2hlbiB3ZQpr
bm93IHdoYXQgd2UncmUgbG9va2luZyBmb3IsIHRoYXQgZG9lc24ndCBib2RlIHdlbGwgOikgSSB0
aGluayBpZiB3ZQprbm93aW5nbHkgYWRkIGEgZmxpcC1mbG9wLCB3ZSBhdCBsZWFzdCB0cnkgdG8g
Y2FwdHVyZSB3aGF0IHRoZQpyZWxpYWJpbGl0eSBvZiB0aGUgdGVzdCBpcyBmb3IgYSBnaXZlbiBz
ZXR1cCBpbiB0aGUgY2hhbmdlbG9nIGFuZApjb21tZW50cy4gSnVzdCBzbyB3ZSBrbm93IHdoYXQg
d2UgYXJlIGxvb2tpbmcgYXQgaW4gNiBtb250aHMgdGltZS4KLUNocmlzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
