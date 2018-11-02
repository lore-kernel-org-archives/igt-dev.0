Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65A46E5C7
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Nov 2018 19:32:07 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20181102193029.GD9144@intel.com>
References: <20181102190651.25969-1-ville.syrjala@linux.intel.com>
 <20181102190651.25969-4-ville.syrjala@linux.intel.com>
 <154118622365.30246.6205579277916811232@skylake-alporthouse-com>
 <20181102193029.GD9144@intel.com>
Message-ID: <154118712205.30246.6540566950532000022@skylake-alporthouse-com>
Date: Fri, 02 Nov 2018 19:32:02 +0000
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
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBWaWxsZSBTeXJqw6Rsw6QgKDIwMTgtMTEtMDIgMTk6MzA6MjkpCj4gT24gRnJpLCBO
b3YgMDIsIDIwMTggYXQgMDc6MTc6MDNQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4g
UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDE4LTExLTAyIDE5OjA2OjUxKQo+ID4gPiArc3RhdGlj
IHZvaWQgKmNvbnZlcnRfc3JjX2dldChjb25zdCBzdHJ1Y3QgZmJfY29udmVydCAqY3Z0KQo+ID4g
PiArewo+ID4gPiArICAgICAgIHZvaWQgKmJ1ZjsKPiA+ID4gKwo+ID4gPiArICAgICAgIGlmICgh
Y3Z0LT5zcmMuc2xvd19yZWFkcykKPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBjdnQtPnNy
Yy5wdHI7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAvKgo+ID4gPiArICAgICAgICAqIFJlYWRpbmcg
ZnJvbSB0aGUgQk8gaXMgYXdmdWxseSBzbG93IGJlY2F1c2Ugb2YgbGFjayBvZiByZWFkIGNhY2hp
bmcsCj4gPiA+ICsgICAgICAgICogaXQncyBmYXN0ZXIgdG8gY29weSB0aGUgd2hvbGUgQk8gdG8g
YSB0ZW1wb3JhcnkgYnVmZmVyIGFuZCBjb252ZXJ0Cj4gPiA+ICsgICAgICAgICogZnJvbSB0aGVy
ZS4KPiA+ID4gKyAgICAgICAgKi8KPiA+ID4gKyAgICAgICBidWYgPSBtYWxsb2MoY3Z0LT5zcmMu
ZmItPnNpemUpOwo+ID4gCj4gPiBpZiAoIWJ1ZikKPiA+ICAgICAgIHJldHVybiBjdnQtPnNyYy5w
dHI7Cj4gCj4gU3VyZSwgd2h5IG5vdC4KClRoZSBvdGhlciBjaG9pY2UgYmVpbmcgaWd0X2Fzc2Vy
dChidWYpIG9yIGlndF94bWFsbG9jKCkgOikKLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldgo=
