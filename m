Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Wed, 4 Sep 2019 09:47:39 +0300
From: Andi Shyti <andi.shyti@intel.com>
Message-ID: <20190904064739.GD22095@intel.intel>
References: <20190902041548.14919-3-chris@chris-wilson.co.uk>
 <20190903193151.3132-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903193151.3132-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_tiled_swapping: Tweak mlocked
 size
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
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

SGkgQ2hyaXMsCgpPbiBUdWUsIFNlcCAwMywgMjAxOSBhdCAwODozMTo1MVBNICswMTAwLCBDaHJp
cyBXaWxzb24gd3JvdGU6Cj4gT24gbXkgc3lzdGVtcyB3aXRoIGxvdHMgb2YgbWVtZGVidWcgZW5h
YmxlZCwgd2Ugd291bGQgaGl0IHRoZSBvb21raWxsZXIKPiA5MCUgb2YgdGhlIHRpbWUgZHVyaW5n
IHRoZSBpbml0aWFsIG1sb2NrIHByaW9yIHRvIGFsbG9jYXRpbmcgYW55IG9iamVjdHMKPiAoYW5k
IGFib3V0IDIwJSBvZiB0aGUgdGltZSBsb2NrdXAgLyBwYW5pYykuIFR3ZWFrIHRoZSB0YXJnZXQg
YWxsb2NhdGlvbgo+IHNpemVzLCBhbmQgaW5jbHVkZSBhIGZldyBtb3JlIGJyZWFkY3J1bWJzIHRy
YWNpbmcgdGhlIGFsbG9jYXRpb25zIHNvCj4gdGhhdCB3ZSBjYW4gcmVsaWFibHkgc3RhcnQgdGhl
IHRlc3RzLiBXZSBzdGlsbCBkbyBoaXQgb3VyIHNocmlua2VyIGFuZAo+IGV2ZW4gdGhlIG9vbSBu
b3RpZmllciwgc28gc3RpbGwgYWNoaWV2aW5nIGl0cyBnb2FsIG9mIGV4ZXJjaXNpbmcgbG93Cj4g
bWVtb3J5IGFuZCBzd2FwIHByZXNzdXJlLgo+IAo+IFRvIHNsaWdodGx5IGNvbXBlbnNhdGUgZm9y
IHRoZSByZWR1Y2VkIG1lbXByZXNzdXJlIChhbGJlaXQgd2UgZG8gbm90Cj4gcmVtb3ZlIHRoZSBz
d2FwcGluZywgdGhlIHJhaXNvbiBkJ2V0cmUgb2YgdGhlIHRlc3QpLCB3ZSBpbmNyZWFzZSB0aGUK
PiBudW1iZXIgb2YgdGhyZWFkcyB0byBmb3JjZSB0aGUgc3lzdGVtIHRvIHJldXNlIGFjdGl2ZSBm
ZW5jZXMsIG1ha2luZyBpdAo+IG1vcmUgc3RyZXNzZnVsIG9uIHRoZSBmZW5jZSBjb2RlLgoKQWgu
Li4gT0sgOikKCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxz
b24uY28udWs+Cj4gQ2M6IEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlAaW50ZWwuY29tPgoKUmV2aWV3
ZWQtYnk6IEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlAaW50ZWwuY29tPgoKQW5kaQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlz
dAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
