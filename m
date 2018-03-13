Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E4106E459
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Mar 2018 10:45:38 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20180313091755.2916-1-lionel.g.landwerlin@intel.com>
 <20180313091755.2916-2-lionel.g.landwerlin@intel.com>
 <152093464424.515.9396485667878944242@mail.alporthouse.com>
 <8ce22074-ecfe-6cb2-c489-bf9abfa4671d@intel.com>
In-Reply-To: <8ce22074-ecfe-6cb2-c489-bf9abfa4671d@intel.com>
Message-ID: <152093793148.515.11233526635724018046@mail.alporthouse.com>
Date: Tue, 13 Mar 2018 10:45:31 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/i915_query: split garbage test
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBMaW9uZWwgTGFuZHdlcmxpbiAoMjAxOC0wMy0xMyAxMDozNzoxOCkKPiBPbiAxMy8w
My8xOCAwOTo1MCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4gUXVvdGluZyBMaW9uZWwgTGFuZHdl
cmxpbiAoMjAxOC0wMy0xMyAwOToxNzo1NSkKPiA+PiBVbmZvcnR1bmF0ZWx5IEkgZm9yZ290IHRo
YXQgc29tZSBvZiB0aG9zZSB0ZXN0cyByZXF1aXJlIHJjcyB0b3BvbG9neQo+ID4+IHN1cHBvcnQg
d2hpY2ggd2UgZG9uJ3QgaGF2ZSBvbiBTYW5keWJyaWRnZS4gVGhpcyBjaGFuZ2Ugc3BsaXQgdGhl
IHRlc3QKPiA+PiBpbiAyIChmaXJzdCBwYXJ0IGF2YWlsYWJsZSBvbiBhbGwgcGxhdGZvcm1zLCBz
ZWNvbmQgcGFydCBvbmx5IHdpdGggcmNzCj4gPj4gdG9wb2xvZ3kgc3VwcG9ydCkuCj4gPj4KPiA+
PiBCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9
MTA1NDc1Cj4gPj4gU2lnbmVkLW9mZi1ieTogTGlvbmVsIExhbmR3ZXJsaW4gPGxpb25lbC5nLmxh
bmR3ZXJsaW5AaW50ZWwuY29tPgo+ID4gQXNpZGUsIHdoeSBhcmUgdGhlIGZsYWdzIHByZWZpeGVk
IHdpdGggRFJNX0k5MTVfUVVFUlkgYW5kIG5vdCBqdXN0Cj4gPiBJOTE1X1FVRVJZIG1hdGNoaW5n
IHRoZSByZXN0IG9mIHRoZSB1QVBJPyBJbiBmYWN0LCB0aGUgd2hvbGUgcGVyZiBhYmkgaXMKPiA+
IHNwZWNpYWwuIEFSR0guCj4gCj4gQXJnaC4uLgo+IAo+IElzIGl0IHRvbyBsYXRlIGZvciB0byBz
ZW5kIGEgZml4PwoKWWVzLiBJdCdzIGJlZW4gc2VhbGVkIGFzIGl0IGhhcyBiZWVuIHNlbnQgZm9y
IDQuMTcgaW5jbHVzaW9uLiBGcm9tIG91cgpwZXJzcGVjdGl2ZSwgaXQgaXMgdXBzdHJlYW0gYWxy
ZWFkeSBhbmQgc28gbm93IHBhcnQgb2YgdGhlIHN0YWJsZSBBQkkuCkNoYW5naW5nIGRlZmluZXMg
aXMganVzdCBhcyBtZXNzeSBhcyBpdCBjYW4gY2F1c2Ugc291cmNlIGNvZGUKaW5jb21wYXRpYmls
aXR5OyBhZG1pdHRlZGx5IHRoYXQgaXMgZ3JlYXRseSByZWR1Y2VkIGJ5IG91ciB1c2VycyBwdWxs
aW5nCmluIGNvcGllcyBvZiBpOTE1X2RybS5oIGFuZCBzbyBjYW4gY29vcmRpbmF0ZSB0aGUgY2hh
bmdlcy4gSG1tLCBidXQgaXQKc3RpbGwgbG9va3MgdWdseSBhbmQgbGlrZSB3ZSBhcmUgY2hhbmdp
bmcgdUFQSSB0byBhbiBvdXRzaWRlIG9ic2VydmVyLgogCj4gU2luY2UgaXQncyBvbmx5IG9uZSBE
Uk1fSTkxNV9RVUVSWV9UT1BPTE9HWV9JTkZPLCBjYW4gd2UgYWRkIGEgbmV3IAo+IGRlZmluZSBw
cm9wZXJseSBuYW1lZCBhbiBtYWtlIHRoZSB3cm9uZ2x5IG5hbWVkIG9uZSBhIG1hY3JvIHRvIHRo
YXQ/Cj4gQW5kIG1ha2Ugc3VyZSBpdCBkb2Vzbid0IGhhcHBlbiBpbiB0aGUgZnV0dXJlPyAoYXQg
bGVhc3QgZm9yIHRoaXMgZGVmaW5lKQoKTmFoLCB3aGF0J3MgZG9uZSBpcyBkb25lIGFuZCB3ZSBs
aXZlIHdpdGggaXQuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXYK
