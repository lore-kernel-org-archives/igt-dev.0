Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B936E0EA
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jul 2018 16:36:34 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20180704161646.2626-1-ville.syrjala@linux.intel.com>
 <20180704161646.2626-6-ville.syrjala@linux.intel.com>
In-Reply-To: <20180704161646.2626-6-ville.syrjala@linux.intel.com>
Message-ID: <153072218898.15734.680834958961315302@skylake.alporthouse.com>
Date: Wed, 04 Jul 2018 17:36:29 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 6/7] tests/gem_render_copy: Add subtests
 for different tiling modes
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

UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDE4LTA3LTA0IDE3OjE2OjQ1KQo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gTWFrZSBzdXJl
IG91ciByZW5kZXJjb3B5IGltcGxlbWVudGF0aW9ucyBkbyB0aGUgcmlnaHQgdGhpbmcgd2l0aAo+
IHRpbGVkIGJ1ZmZlcnMuCj4gCj4gRm9yIG5vdyB3ZSdsbCBqdXN0IGRvIGxpbmVhci0+bGluZWFy
LCB4LXRpbGVkLT54LXRpbGVkLCBhbmQKPiB5LXRpbGVkLT55LXRpbGVkLiBOb3Qgc3VyZSB0aGVy
ZSdzIG11Y2ggcG9pbnQgaW4gYWRkaW5nIHRlc3RzCj4gZm9yIGRpZmZlcmVudCBzcmMgdnMuIGRz
dCB0aWxpbmcgbW9kZXM/CgpJIHZhbHVlIGludGVyLXRpbGluZyB0ZXN0cyBtb3JlIHRoYW4gc3Jj
X3RpbGluZyA9PSBkc3RfdGlsaW5nLiBJdCB3b3VsZApiZSBxdWl0ZSBlYXN5IGZvciB0d28gbWlz
dGFrZXMgdG8gY2FuY2VsIHRoZW1zZWx2ZXMgb3V0IGlmIHRoZSB0aWxpbmcgb3AKd2FzIHJldmVy
c2libGUuIElmIHlvdSB3YW50IHRvIHNhdmUgYSBiaXQgb2YgdGltZSwga2VlcCB0aGUgZGVzdGlu
YXRpb24KdGhlIHNhbWUgYW5kIHVzZSAzIHNvdXJjZXMgaW4gZWFjaCBwYXNzICh0ciwgYmwsIGJy
PykuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
