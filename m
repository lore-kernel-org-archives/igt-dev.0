Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC7D6E43A
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Feb 2021 08:41:27 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20210201083104.GB57585@zkempczy-mobl2>
References: <20210129144454.121178-1-zbigniew.kempczynski@intel.com>
 <20210129144454.121178-25-zbigniew.kempczynski@intel.com>
 <161193537822.17568.9240258879108551707@build.alporthouse.com>
 <20210201083104.GB57585@zkempczy-mobl2>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 01 Feb 2021 08:41:18 +0000
Message-ID: <161216887891.30865.5797511947437126688@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t v18 24/31] tests/gem_linear_blits: Use
 intel allocator
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

UXVvdGluZyBaYmlnbmlldyBLZW1wY3p5xYRza2kgKDIwMjEtMDItMDEgMDg6MzE6MDQpCj4gT24g
RnJpLCBKYW4gMjksIDIwMjEgYXQgMDM6NDk6MzhQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdyb3Rl
Ogo+ID4gV2h5IGxlYXZlIHRoZW0gYXMgemVybyB0aG91Z2g/IFlvdSBjYW4gc2VlZCB0aGVtIHdp
dGggc2Vuc2libGUKPiA+IHBsYWNlbWVudHMuIFNlbGwgbWUgb24gc29tZSBiZW5lZml0cyBvZiB0
aGlzIGFsbG9jYXRvci4KPiAKPiBGb3IgcmVsb2NzIHVzaW5nIGFsbG9jYXRvciBkb2Vzbid0IG1h
a2VzIHNlbnNlIChidWZmZXJzIG9mZnNldHMgY2FuIGJlCj4gbWlncmF0ZWQgd2l0aGluIHRoZSBr
ZXJuZWwpLiBBbmQgd2UgaGF2ZSBubyBtZXRob2QgdG8gc3luY2hyb25pemUgaXQuCj4gSSBzZWUg
bm8gYWRkaXRpb25hbCB2YWx1ZSBvZiB1c2luZyBvZmZzZXRzIHBhc3NlZCBieSBhbGxvY2F0b3Ig
d2hpY2gKPiBjb3VsZCBsZWFkIHRvIGNvbmZ1c2lvbiBvbiB0aGUgcmVhZGVyIHNpZGUuCgpDb25m
dXNpb24gb3IgdHJ5aW5nIHRvIGZpbmQgZWRnZSBjYXNlcyBpbiB0aGUga2VybmVsPyA6KQoKRm9y
IHRoaXMsIEkgd2FzIGp1c3QgbG9va2luZyBmb3IKCnNyY19vZmZzZXQgPSAoKmxhc3RfYXNzaWdu
ZWRfYWRkcmVzcyArPSBBTElHTihzcmNfc2l6ZSwgV09SU1RBTElHTikpICUgZ3R0X3NpemU7CmRz
dF9vZmZzZXQgPSAoKmxhc3RfYXNzaWduZWRfYWRkcmVzcyArPSBBTElHTihkc3Rfc2l6ZSwgV09S
U1RBTElHTikpICUgZ3R0X3NpemU7CgpBcyBhIG1lYW5zIG9mIHByZS1zZWVkaW5nIHRoZSBiYXRj
aCBidWZmZXIuIFdoaWNoIGlzIFttb3JlIG9yIGxlc3NdIHRoZQpzaW1wbGUgYWxsb2NhdG9yLiBD
YWxsIGl0IHRoZSBkdW1iIGFsbG9jYXRvciA6KSBPciB3ZSBqdXN0IHVzZSB0aGUKcmFuZG9tIGFs
bG9jYXRvciwgYnV0IGluIHRoaXMgY2FzZSBkdW1iIHdvdWxkIGFjdHVhbGx5IGJlIGJldHRlci4K
LUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
