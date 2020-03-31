Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C10B6E81C
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2020 11:28:05 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200331111911.122768-1-michal@hardline.pl>
References: <20200331111911.122768-1-michal@hardline.pl>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158565406100.18289.9399073868962768391@build.alporthouse.com>
Date: Tue, 31 Mar 2020 12:27:41 +0100
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
CgpPZmYgaGFuZCwgZG8geW91IGhhdmUgYSBmZWVsaW5nIG9uIGhvdyBhY2N1cmF0ZSB0aGlzIG1l
dGhvZCBpcz8gSSBrZWVwCnJ1bm5pbmcgaW4gc2l0dWF0aW9ucyB3aGVyZSB0aGUgU0lHRVZfVEhS
RUFEIGRpZCBub3Qgc2VlbSByZWxpYWJsZSBhbmQKdGhlIHNwaW5uZXIgbmV2ZXIgdGVybWluYXRl
ZCAtLSBzbyBJIHdlbGNvbWUgYSBjaGFuY2UgdG8gZG8gc29tZXRoaW5nCmRpZmZlcmVudCAoZXZl
biBpZiB1c2luZyB0aW1lcmZkICsgdGhyZWFkIGlzIGVmZmVjdGl2ZWx5IHdoYXQgZ2xpYmMgaXMK
ZG9pbmcgYmVoaW5kIHRoZSBzY2VuZXMsIGFuZCB3aHkgSSBkaWRuJ3QgcmVhbGx5IGNvbmNlcm4g
bXlzZWxmIHdpdGgKdHJ5aW5nIHRvIGRvIGJldHRlci4pCi1DaHJpcwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
