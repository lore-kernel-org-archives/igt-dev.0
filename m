Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D88796EEB7
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jul 2018 18:43:27 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20180704161646.2626-6-ville.syrjala@linux.intel.com>
 <20180705182741.4224-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20180705182741.4224-1-ville.syrjala@linux.intel.com>
Message-ID: <153081620256.7594.3538600058650704456@cwilso3-mobl.ger.corp.intel.com>
Date: Thu, 05 Jul 2018 19:43:22 +0100
Subject: Re: [igt-dev] [PATCH i-g-t v2 6/7] tests/gem_render_copy: Add
 subtests for different tiling modes
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDE4LTA3LTA1IDE5OjI3OjQxKQo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gTWFrZSBzdXJl
IG91ciByZW5kZXJjb3B5IGltcGxlbWVudGF0aW9ucyBkbyB0aGUgcmlnaHQgdGhpbmcgd2l0aAo+
IHRpbGVkIGJ1ZmZlcnMuCj4gCj4gRm9yIG5vdyB3ZSdsbCBqdXN0IGRvIGxpbmVhci0+bGluZWFy
LCB4LXRpbGVkLT54LXRpbGVkLCBhbmQKPiB5LXRpbGVkLT55LXRpbGVkLiBOb3Qgc3VyZSB0aGVy
ZSdzIG11Y2ggcG9pbnQgaW4gYWRkaW5nIHRlc3RzCj4gZm9yIGRpZmZlcmVudCBzcmMgdnMuIGRz
dCB0aWxpbmcgbW9kZXM/Cj4gCj4gdjI6IFRlc3QgYWxsIHRpbGluZyBjb21ib3MgKENocmlzKQo+
ICAgICBBbGxvY2F0ZSB3aXRoIGRybV9pbnRlbF9ib19hbGxvY190aWxlZCgpIChDaHJpcykKPiAK
PiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50
ZWwuY29tPgpSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28u
dWs+Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
