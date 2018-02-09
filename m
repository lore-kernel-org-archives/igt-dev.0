Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 871F96E78F
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2018 09:43:18 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180209002157.6375-1-antonio.argenziano@intel.com>
References: <20180209002157.6375-1-antonio.argenziano@intel.com>
Message-ID: <151816938507.28809.7532935648440423669@mail.alporthouse.com>
Date: Fri, 09 Feb 2018 09:43:05 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] igt: Use lib gem_execbuf where possible
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTgtMDItMDkgMDA6MjE6NTcpCj4gZGlmZiAt
LWdpdCBhL3Rlc3RzL2dlbV9idXN5LmMgYi90ZXN0cy9nZW1fYnVzeS5jCj4gaW5kZXggYzM0OWMy
OTEuLjQ0NGMxZGQxIDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2dlbV9idXN5LmMKPiArKysgYi90ZXN0
cy9nZW1fYnVzeS5jCj4gQEAgLTMzMiwxMSArMzMyLDYgQEAgc3RhdGljIHZvaWQgYWxhcm1faGFu
ZGxlcihpbnQgc2lnKQo+ICB7Cj4gIH0KPiAgCj4gLXN0YXRpYyBpbnQgX19leGVjYnVmKGludCBm
ZCwgc3RydWN0IGRybV9pOTE1X2dlbV9leGVjYnVmZmVyMiAqZXhlY2J1ZikKPiAtewo+IC0gICAg
ICAgcmV0dXJuIGlvY3RsKGZkLCBEUk1fSU9DVExfSTkxNV9HRU1fRVhFQ0JVRkZFUjIsIGV4ZWNi
dWYpOwo+IC19CgpXcm9uZy4gVGhlcmUncyBhbiBpbXBvcnRhbnQgZGlmZmVyZW5jZSBoZXJlLCBj
YW4geW91IHNlZSBpdD8gSXQncyBhbGwgdG8KZG8gd2l0aCBzaWduYWwgaGFuZGxpbmcuLi4KLUNo
cmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
