Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCBCE88647
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2019 15:51:40 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20191122130300.558951-1-lionel.g.landwerlin@intel.com>
 <20191122130300.558951-9-lionel.g.landwerlin@intel.com>
 <157443636615.2524.3175030323013777744@skylake-alporthouse-com>
 <7191fc53-f4a3-48ba-0557-edafd4ff66ee@intel.com>
In-Reply-To: <7191fc53-f4a3-48ba-0557-edafd4ff66ee@intel.com>
Message-ID: <157443789518.2524.2012790618955207394@skylake-alporthouse-com>
Date: Fri, 22 Nov 2019 15:51:35 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v2 08/10] tests/i915/exec_fence: add
 timeline fence tests
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBMaW9uZWwgTGFuZHdlcmxpbiAoMjAxOS0xMS0yMiAxNTo0MzoxMSkKPiBPbiAyMi8x
MS8yMDE5IDE3OjI2LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBRdW90aW5nIExpb25lbCBMYW5k
d2VybGluICgyMDE5LTExLTIyIDEzOjAyOjU4KQo+ID4+IFdlIGNhbiBub3cgZ2l2ZSBhIHR1cGxl
IChoYW5kbGUsIHBvaW50X3ZhbHVlKSBmb3IgdGltZWxpbmUgc2VtYXBob3Jlcy4KPiA+Pgo+ID4+
IHYyOiBGaXggdXAgc3luY29iai10aW1lbGluZS1yZXBlYXQgdGVzdCAoTGlvbmVsKQo+ID4+ICAg
ICAgVXBkYXRlIGZvbGxvd2luZyBrZXJuZWwgcmVuYW1lCj4gPj4KPiA+PiB2MzogQWRkIG1vcmUg
b3JkZXJpbmcgdGVzdHMgZm9yIHN5bmNvYmovYnVmZmVyIGhhbmRsZSBzdGF0ZSAoQ2hyaXMpCj4g
PiBBbm90aGVyIHF1ZXN0aW9uLCBkbyB3ZSB3b3JyeSBhYm91dCBzd19zeW5jIGltcG9ydGVkIGZl
bmNlcyBiZWluZwo+ID4gaGFuZGxlcyBkaWZmZXJlbnRseSB0byBuYXRpdmU/Cj4gPiAtQ2hyaXMK
PiAKPiBXaGF0IGRvIHlvdSBtZWFuIGJ5IGRpZmZlcmVudGx5PwoKV2UgaGF2ZSBpc19pOTE1X2Zl
bmNlKCkgd2l0aCBicmFuY2hpbmcgcGF0aHMgZm9yIGludGVybmFsL2V4dGVybmFsLCBhbmQKd2l0
aGluIHRoZSBzeW5jb2JqIHRpbWVsaW5lIG1peGVkIGZlbmNlIGNvbnRleHRzIGNhdXNlIGEgaGFy
ZCBiYXJyaWVyLApzbyBtYXkgcHJlc2VudCBpbnRlcmVzdGluZyBlZmZlY3RzIGF0IHRoZSB1QVBJ
IGxheWVyPwoKPiBUaGluZyBpcyBzd19zeW5jIGNhbiBkZWxheSB0aGUgc2lnbmFsaW5nIGZvcmV2
ZXIgc28geW91IGNvdWxkIGJ1aWxkIGEgCj4gY2FzZSBleGhhdXN0aW5nIG1lbW9yeSBpZiB5b3Ug
cmVhbGx5IHdhbnRlZC4KCkV4Y2VwdCB3ZSBkb24ndCBhbGxvdyBpbmRlZmluaXRlIHdhaXRzIGZv
ciBleHRlcm5hbCBmZW5jZXMgc3VjaCBhcwpzd19zeW5jIGFuZCB3cmFwIHRoZW0gaW4gYXV0by1l
eHBpcmluZyBmZW5jZXMuCgo+IFdoZXJlYXMgbXkgdW5kZXJzdGFuZCBvZiBvdGhlciBkbWEtZmVu
Y2VzIGlzIHRoYXQgdGhleSBzaG91bGQgYmUgc2hvcnQgCj4gbGl2ZWQuCgpFbmRsZXNzLiBIb3cn
cyB0aGF0IGdvaW5nIHRvIGVuZD8gQmFkbHkuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXY=
