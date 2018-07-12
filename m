Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32836E2F4
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jul 2018 13:05:55 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180712130031.GA5565@intel.com>
References: <20180712101245.20683-1-chris@chris-wilson.co.uk>
 <20180712130031.GA5565@intel.com>
Message-ID: <153140075027.10340.16597532340645405311@skylake-alporthouse-com>
Date: Thu, 12 Jul 2018 14:05:50 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] igt/kms_flip_tiling: Check GEM
 availability before use
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
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBWaWxsZSBTeXJqw6Rsw6QgKDIwMTgtMDctMTIgMTQ6MDA6MzEpCj4gT24gVGh1LCBK
dWwgMTIsIDIwMTggYXQgMTE6MTI6NDVBTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4g
V2UgdXNlIHRoZSBHUFUgdG8gY29udmVydCBiZXR3ZWVuIHRpbGluZyBmb3JtYXRzLCBpbmRpcmVj
dGx5IHZpYSB0aGUKPiA+IGNhbGwgdG8gaWd0X2NyZWF0ZV9wYXR0ZXJuX2ZiLiBTbyBiZWZvcmUg
d2UgdHJ5IGFuZCBleGVjdXRlIGNvbW1hbmRzIG9uCj4gPiB0aGUgR1BVLCB3ZSBzaG91bGQgY2hl
Y2sgdGhhdCB0aGUgR1BVIGlzIGF2YWlsYWJsZS4KPiAKPiBTaG91bGQgdGhpcyBvbmUgYmUgaW4g
dGhlIGFjdHVhbHkgc3BvdCBpbiBpZ3RfZmIuYyB3aGVyZSB3ZSBkbwo+IHRoZSBnZW0gc3R1ZmY/
IEkgY291bGQgaW1hZ2luZSBvdGhlciBkcml2ZXJzIG1pZ2h0IHdhbnQgdG8gYWRkCj4gdGhlaXIg
b3duIG1lY2hhbmlzbXMgdGhlcmUuCgpNYXliZS4uLiBUaGVyZSdzIGEgY2F0Y2ggaW4gdGhhdCBp
Z3RfcmVxdWlyZV9nZW0oKSBpcyBxdWl0ZSBoZWF2eSBhbmQKZG9lcyB0aGluZ3MgKHJlc2V0IHRo
ZSBncHUsIHJlc2V0IHNlcW5vKSB0aGF0IHlvdSBvcmRpbmFyaWx5IGRvbid0IHdhbnQKdG8gaGFw
cGVuIGluIHRoZSBtaWRkbGUgb2YgdGhlIHRlc3QgKGFuZCBjYW4gY2F1c2UgaXNzdWVzIGlmIGNh
dWdodAp1bmF3YXJlLCBpbiBwYXJ0aWN1bGFyIGlmIHlvdSBoYXBwZW4gdG8gaGF2ZSBhIHNwaW5i
YXRjaCBpbiBmbGlnaHQpLgoKPiBPciB3ZSBhZGQgc29tZSBraW5kIG9mIGlndF9yZXF1aXJlX2Zi
KCkgdG8gaW5kaWNhdGUgaWd0X2ZiCj4gd2lsbCBiZSB1c2VkPwoKWXVwLCBzb21ldGhpbmcgYWxv
bmcgdGhvc2UgbGluZXMgd2lsbCBiZSBiZXR0ZXIuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2lndC1kZXYK
