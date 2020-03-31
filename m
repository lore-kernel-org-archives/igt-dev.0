Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47F76E82E
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2020 13:53:02 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200331111911.122768-1-michal@hardline.pl>
References: <20200331111911.122768-1-michal@hardline.pl>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158566277770.5852.214994794630023972@build.alporthouse.com>
Date: Tue, 31 Mar 2020 14:52:57 +0100
Subject: Re: [igt-dev] [PATCH] lib/igt_dummyload: Use timerfd rather than
 SIGEV_THREAD
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
To: michal@hardline.pl, igt-dev@lists.freedesktop.org
Cc: michal.winiarski@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBNaWNoYcWCIFdpbmlhcnNraSAoMjAyMC0wMy0zMSAxMjoxOToxMSkKPiBGcm9tOiBN
aWNoYcWCIFdpbmlhcnNraSA8bWljaGFsLndpbmlhcnNraUBpbnRlbC5jb20+Cj4gCj4gU2luY2Ug
dGltZXJfZGVsZXRlIGRvZXNuJ3QgZ2l2ZSB1cyBhbnkgZ3VhcmFudGVlcyB0aGF0IHRoZSB0aHJl
YWQgYW5kCj4gaXRzIG5vdGlmeV9mdW5jdGlvbiBpc24ndCBjdXJyZW50bHkgcnVubmluZywgd2Ug
Y2FuIGhpdCBhIHVzZS1hZnRlci1mcmVlCj4gaW4gYSByYWNlIGNvbmRpdGlvbiBzY2VuYXJpby4K
PiBUaGlzIGNhdXNlcyBhIHNlZW1pbmdseSByYW5kb20gc2VnZmF1bHQgd2hlbiBpZ3Rfc3Bpbl9l
bmQgZnJvbSBub3RpZnkKPiB0aHJlYWQgaXMgY2FsbGVkIGFmdGVyIGlndF9zcGluX2ZyZWUgd2Fz
IGFscmVhZHkgY2FsbGVkIGZyb20gdGhlIG1haW4KPiB0aHJlYWQuCj4gTGV0J3MgZml4IHRoYXQg
YnkgdXNpbmcgdGltZXJmZCBhbmQgbWFuYWdpbmcgdGhlIHRpbWVyIHRocmVhZCBvdXJzZWx2ZXMu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogTWljaGHFgiBXaW5pYXJza2kgPG1pY2hhbC53aW5pYXJza2lA
aW50ZWwuY29tPgo+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4K
ClNlZW1zIEkgd2FzIGNvbmZ1c2VkIHdpdGggdGhlIG1lYW5pbmcgb2YgdGltZXJmZF9jYW5jZWxl
ZCgpIGFuZCBpbWJ1ZWQKaXQgd2l0aCBwcm9wZXJ0aWVzIGl0IGRpZCBub3QgaGF2ZSwKUmV2aWV3
ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotQ2hyaXMKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
