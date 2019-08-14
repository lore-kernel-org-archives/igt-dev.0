Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 992C36E1E5
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2019 13:58:55 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <156578875256.11719.18174907787229551822@jlahtine-desk.ger.corp.intel.com>
References: <20190814102140.3275-1-lukasz.kalamarz@intel.com>
 <20190814102140.3275-2-lukasz.kalamarz@intel.com>
 <156578875256.11719.18174907787229551822@jlahtine-desk.ger.corp.intel.com>
Message-ID: <156579112068.2714.949707816520439873@skylake-alporthouse-com>
Date: Wed, 14 Aug 2019 14:58:40 +0100
Subject: Re: [igt-dev] [RFC PATCH 1/4] lib/i915/gem_mman: add mmap_offset
 support
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
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Lukasz Kalamarz <lukasz.kalamarz@intel.com>, igt-dev@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBKb29uYXMgTGFodGluZW4gKDIwMTktMDgtMTQgMTQ6MTk6MTIpCj4gVGhpcyBsb2dp
YyBzaG91bGRuJ3QgYmUgbmVlZGVkIGVpdGhlciwgaWYgd2UgaGF2ZSBtbWFwX29mZnNldCwgd2Un
bGwKPiBoYXZlIFdDIHN1cHBvcnQuIFdoYXQgdGhpcyBsb2dpYyBjaGVja3MgaXMgaWYgZGVmYXVs
dCBwbGFjZWQgb2JqZWN0IHdpbGwKPiBzdXBwb3J0IFdDIG1tYXAsIHdoaWNoIGlzIHZlcnkgZGlm
ZmVyZW50IGZyb20gd2hhdCB0aGlzIGZ1bmN0aW9uCj4gb3JpZ2luYWxseSBkaWQuCgpGd2l3LCB0
aGF0J3Mgbm90IGFsd2F5cyB0cnVlLiBPbmNlIHlvdSBrbm93IHdoaWNoIGlvY3RsIHlvdSBoYXZl
LAp5b3UgbmVlZCB0byBxdWVyeSB0aGUgV0MgZmxhZ3MgdG8gdmVyaWZ5IHRoZSBwcm9jZXNzb3Ig
c3VwcG9ydHMgV0MKYWNjZXNzLiBXaXRoIFhlbiBldmVuIHJlY2VudCBwcm9jZXNzb3JzIG1heSBi
ZSBsYWNraW5nIGEgZmV3IGVzc2VudGlhbHMuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXY=
