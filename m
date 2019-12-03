Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0D26E84C
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Dec 2019 16:25:54 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20191203153555.12948-1-ville.syrjala@linux.intel.com>
 <20191203153555.12948-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20191203153555.12948-3-ville.syrjala@linux.intel.com>
Message-ID: <157539035038.9581.8071448473284135719@skylake-alporthouse-com>
Date: Tue, 03 Dec 2019 16:25:50 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] lib/igt_kms: Rework forced
 connector handling
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

UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDE5LTEyLTAzIDE1OjM1OjU0KQo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gTGV0J3MgdXNl
IGlndF9jb25uZWN0b3Jfc3lzZnNfb3BlbigpIGZvciBjb25uZWN0b3IgZm9yY2luZy4KPiBTaW5j
ZSB3ZSdyZSBnZXR0aW5nIHJpZCBvZiB0aGUgYWxsY29hdGVkIGNvbm5lY3RvciAncGF0aCcgd2Un
bGwKPiBjaGFuZ2UgdGhlIHRyYWNraW5nIHRvIHVzZSB0aGUgY29ubmVjdG9yIHR5cGUgYW5kIHR5
cGVfaWQsCj4gYW5kIHdlJ2xsIGNob3AgdGhpbmdzIHVwIGEgYml0IHRvIG1ha2UgdGhlIGNvZGUg
ZWFzaWVyIHRvIGZvbGxvdy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxj
aHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXY=
