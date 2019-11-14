Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53316EE18
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2019 17:12:46 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191114170830.9620-1-zbigniew.kempczynski@intel.com>
References: <20191114170830.9620-1-zbigniew.kempczynski@intel.com>
Message-ID: <157375154766.6809.16567334001371893078@skylake-alporthouse-com>
Date: Thu, 14 Nov 2019 17:12:27 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_pread/pwrite: Skip gtt test on
 self for missing mappable gtt
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBaYmlnbmlldyBLZW1wY3p5xYRza2kgKDIwMTktMTEtMTQgMTc6MDg6MzApCj4gU29t
ZSB0ZXN0cyBhcmUgZGVzaWduZWQgdG8gdXNlIEdHVFQgQVBJIHdoaWNoIHNob3VsZCBiZSBza2lw
cGVkCj4gd2hlbiBIVyBkb2Vzbid0IHN1cHBvcnQgbWFwcGFibGUgYXBlcnR1cmUuCj4gCj4gR2Vt
IHByZWFkIC8gcHdyaXRlICJzZWxmIiB0ZXN0IGlzIG9uZSBvZiB0aGVtLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwu
Y29tPgo+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KUmV2aWV3
ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotQ2hyaXMKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
