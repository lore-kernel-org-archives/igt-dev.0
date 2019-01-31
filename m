Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A93889DBF
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Jan 2019 09:16:56 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20190130221833.19999-1-chris@chris-wilson.co.uk>
 <87k1ilyyxu.fsf@intel.com>
In-Reply-To: <87k1ilyyxu.fsf@intel.com>
Message-ID: <154892621142.14784.8571013382627732055@skylake-alporthouse-com>
Date: Thu, 31 Jan 2019 09:16:51 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] sw_sync: Initialise struct before use
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
To: Jani Nikula <jani.nikula@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBKYW5pIE5pa3VsYSAoMjAxOS0wMS0zMSAwOToxMDo1MykKPiBPbiBXZWQsIDMwIEph
biAyMDE5LCBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4gd3JvdGU6Cj4g
PiBzd19zeW5jOiAuLi9saWIvaWd0X2NvcmUuYzoxNTkyOiBfX2lndF9mb3JrX2hlbHBlcjogQXNz
ZXJ0aW9uIGAhcHJvYy0+cnVubmluZycKPiA+Cj4gPiBCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmZy
ZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA4ODg5Cj4gPiBTaWduZWQtb2ZmLWJ5OiBD
aHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiAKPiBTbyB0aGUgY29tcGls
ZXIgc2VlcyB0aGUgdmFyaWFibGUgaXMgdW5pbml0aWFsaXplZCwgYnV0IGl0J3MgYmVpbmcKPiBw
YXNzZWQgdG8gYSBmdW5jdGlvbi4uLiBqb2xseSBnb29kLCB0aGF0IG11c3QgZG8gdGhlIGluaXRp
YWxpemF0aW9uLiA6Lwo+IAo+IEkgdHJ1c3QgeW91IGNoZWNrZWQgdGhlIG90aGVyIGNhbGwgc2l0
ZXMuCgpJbiB0aGlzIGZpbGUgb25seS4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldgo=
