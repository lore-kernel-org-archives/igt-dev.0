Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BE189D5C
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Nov 2018 12:08:28 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20181119110528.12877-1-maarten.lankhorst@linux.intel.com>
 <20181119110528.12877-2-maarten.lankhorst@linux.intel.com>
 <154262911851.24263.4715261876810617834@skylake-alporthouse-com>
In-Reply-To: <154262911851.24263.4715261876810617834@skylake-alporthouse-com>
Message-ID: <154262930387.24263.15805233795880904500@skylake-alporthouse-com>
Date: Mon, 19 Nov 2018 12:08:24 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/i915/gem_render_tiled_blits:
 Make sure igt_buf is initially zero'd
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTgtMTEtMTkgMTI6MDU6MTgpCj4gUXVvdGluZyBNYWFy
dGVuIExhbmtob3JzdCAoMjAxOC0xMS0xOSAxMTowNToyOCkKPiA+IGdlbjhfYmluZF9idWYgbG9v
a3MgYXQgYnVmLT5hdXguc3RyaWRlL29mZnNldCwgd2hpY2ggaXMgbm90IHNldCBieSB0aGUKPiA+
IHRlc3QuIFdoZW4gSSBhZGRlZCB0aGUgYnBwIGZpZWxkLCBpdCB3YXMgZW5vdWdoIHRvIG1ha2Ug
dGhlIHRlc3QgZmFpbCwKPiA+IGZpeCB0aGlzIGJ5IG1ha2luZyBzdXJlIHRoYXQgdGhlIGJ1ZiBp
cyBpbml0aWFsbHkgemVybydkIGV4cGxpY2l0bHksCj4gPiB3aGljaCBmaXhlcyB0aGUgdGVzdCB0
byBydW4gcmVsaWFibHkgMTAwJSBvZiB0aGUgdGltZS4KPiAKPiBXaGF0PwoKTm90IGdlbV90aWxl
ZF9mZW5jZV9ibGl0cywgd2hpY2ggZG9lc24ndCB1c2UgbGliZHJtLgotQ2hyaXMKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
