Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33DB6E5CB
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Nov 2018 19:17:10 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20181102190651.25969-1-ville.syrjala@linux.intel.com>
 <20181102190651.25969-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20181102190651.25969-4-ville.syrjala@linux.intel.com>
Message-ID: <154118622365.30246.6205579277916811232@skylake-alporthouse-com>
Date: Fri, 02 Nov 2018 19:17:03 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] lib/igt_fb: Generalize the slow
 read from gtt mmap handling
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

UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDE4LTExLTAyIDE5OjA2OjUxKQo+ICtzdGF0aWMgdm9p
ZCAqY29udmVydF9zcmNfZ2V0KGNvbnN0IHN0cnVjdCBmYl9jb252ZXJ0ICpjdnQpCj4gK3sKPiAr
ICAgICAgIHZvaWQgKmJ1ZjsKPiArCj4gKyAgICAgICBpZiAoIWN2dC0+c3JjLnNsb3dfcmVhZHMp
Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBjdnQtPnNyYy5wdHI7Cj4gKwo+ICsgICAgICAgLyoK
PiArICAgICAgICAqIFJlYWRpbmcgZnJvbSB0aGUgQk8gaXMgYXdmdWxseSBzbG93IGJlY2F1c2Ug
b2YgbGFjayBvZiByZWFkIGNhY2hpbmcsCj4gKyAgICAgICAgKiBpdCdzIGZhc3RlciB0byBjb3B5
IHRoZSB3aG9sZSBCTyB0byBhIHRlbXBvcmFyeSBidWZmZXIgYW5kIGNvbnZlcnQKPiArICAgICAg
ICAqIGZyb20gdGhlcmUuCj4gKyAgICAgICAgKi8KPiArICAgICAgIGJ1ZiA9IG1hbGxvYyhjdnQt
PnNyYy5mYi0+c2l6ZSk7CgppZiAoIWJ1ZikKCXJldHVybiBjdnQtPnNyYy5wdHI7Cgo+ICsgICAg
ICAgaWd0X21lbWNweV9mcm9tX3djKGJ1ZiwgY3Z0LT5zcmMucHRyLCBjdnQtPnNyYy5mYi0+c2l6
ZSk7Cj4gKwo+ICsgICAgICAgcmV0dXJuIGJ1ZjsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgY29u
dmVydF9zcmNfcHV0KGNvbnN0IHN0cnVjdCBmYl9jb252ZXJ0ICpjdnQsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHZvaWQgKnNyY19idWYpCj4gK3sKPiArICAgICAgIC8qCj4gKyAgICAg
ICAgKiBSZWFkaW5nIGZyb20gdGhlIEJPIGlzIGF3ZnVsbHkgc2xvdyBiZWNhdXNlIG9mIGxhY2sg
b2YgcmVhZCBjYWNoaW5nLAo+ICsgICAgICAgICogaXQncyBmYXN0ZXIgdG8gY29weSB0aGUgd2hv
bGUgQk8gdG8gYSB0ZW1wb3JhcnkgYnVmZmVyIGFuZCBjb252ZXJ0Cj4gKyAgICAgICAgKiBmcm9t
IHRoZXJlLgo+ICsgICAgICAgICovCj4gKyAgICAgICBpZiAoY3Z0LT5zcmMuc2xvd19yZWFkcykK
CglpZiAoc3JjX2J1ZiAhPSBjdnQtPnNyYy5wdHIpCgo+ICsgICAgICAgICAgICAgICBmcmVlKHNy
Y19idWYpOwo+ICt9Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
