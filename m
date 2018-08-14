Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <e6be9842-7994-4260-9b4d-d630c4fdd1b5@linux.intel.com>
References: <20180814150519.20204-1-tvrtko.ursulin@linux.intel.com>
 <20180814150519.20204-2-tvrtko.ursulin@linux.intel.com>
 <153425935575.3371.7564394383875986620@skylake-alporthouse-com>
 <934ae971-492f-033e-a011-2d28f10c55ef@linux.intel.com>
 <153426046691.4061.1259690385298289243@skylake-alporthouse-com>
 <e6be9842-7994-4260-9b4d-d630c4fdd1b5@linux.intel.com>
Message-ID: <153427168771.4061.1687360595708668926@skylake-alporthouse-com>
Date: Tue, 14 Aug 2018 19:34:47 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 1/7] gem_wsim: Check sleep times
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
To: Tvrtko Ursulin <tursulin@ursulin.net>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wOC0xNCAxOToyNzowOCkKPiBUbyBub3QgdXNl
IGl0IGlzIHRvIHJlaW1wbGVtZW50IGV4aXN0aW5nIGhhbmR5IGhlbHBlcnMgLSBub3QgaWRlYWwu
CgpUaGUgcHJvYmxlbSB3YXMgdGhhdCB0aGV5IHdlcmUgb3Zlcmx5IGhhbmR5IHNvIEkgdHJpZWQg
dG8gYXZvaWQgdGhlbSBpbgpiZW5jaG1hcmtzLyBhZnRlciBiZWluZyBidXJudCB0b28gb2Z0ZW4u
CiAKPiBUbyBzcGxpdCB0aGUgdGVzdCBiaXRzIGZyb20gdXNlZnVsIGhlbHBlcnMgc291bmRzIGxp
a2UgcXVpdGUgYSB0YXNrLgoKTmFoLCBpdCdzIGEgZHJvcCBpbiB0aGUgb2NlYW4gY29tcGFyZWQg
dG8gd3JpdGluZyB0aGUgYmVuY2htYXJraW5nCmZyYW1ld29yayAvIGludGVncmF0aW5nIGludG8g
YW4gZXhpc3Rpbmcgb25lIGxpa2UgZXpiZW5jaC4KIAo+IFRvIHdlYW4gZ2VtX3dzaW0gb2ZmIG1v
c3QgaWd0XyBzdHVmZiBuZWVkcyBkZWNpc2lvbiB0byBiZSBtYWRlIG9uIHRoZSAKPiBmb3JtZXIg
LSB3aGF0IGlzIGNvcmUgYXBpLCBhbmQgd2hhdCBpcyB0ZXN0IHJlbGF0ZWQuCj4gCj4gVG8gbWUg
cHJvYmxlbXMgb3V0d2VpZ2ggdGhlIGJlbmVmaXQuIDooIElmIGdlbV93c2ltIHdhcyB1bmRlciB0
b29scywgCj4gbGlrZSBpbnRlbF9ncHVfdG9wLCB0aGVuIHllYWgsIGl0IHdvdWxkIGJlIGp1c3Rp
ZmlhYmxlLiBTaW5jZSBpdCBpcyBpbiAKPiBiZW5jaG1hcmtzIEkgZG9uJ3QgdGhpbmsgd2Ugc2hv
dWxkIGJvdGhlci4KCkkgZHJlYW0gb25lIGRheSB3ZSB3aWxsIGdldCBtaWNyb2JlbmNobWFya3Mg
YXMgcGFydCBvZiBDSS4gTm90IG9ubHkKd291bGQgdGhhdCByZXF1aXJlIGEgcmFkaWNhbCBvdmVy
aGF1bCBvZiB0aGUgYmVuY2htYXJrcy8gYnV0IGEKc3Vic3RhbnRpYWwgaW52ZXN0bWVudCBvZiBo
dyAmIG1haW50ZW5hbmNlLiBJbiBteSBkcmVhbSwgSSBhbHNvIGhhdmUgYQp2aXNpb24gb2YgbGlr
ZS1mb3ItbGlrZSBjb21wYXJpc29ucyBhZ2FpbnN0IG90aGVyIGRyaXZlcnMuCi1DaHJpcwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
