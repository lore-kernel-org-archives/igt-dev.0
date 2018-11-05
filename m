Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id E424989CFA
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Nov 2018 15:41:33 +0000 (UTC)
Date: Mon, 5 Nov 2018 16:41:22 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20181105154122.wseakszicqvtsm5j@flea>
References: <20181102190651.25969-4-ville.syrjala@linux.intel.com>
 <20181102193731.27330-1-ville.syrjala@linux.intel.com>
 <20181105151929.pefmgc7rltfygaif@flea>
 <281c75e8-6f99-50fc-756f-65add07328c0@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <281c75e8-6f99-50fc-756f-65add07328c0@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 4/4] lib/igt_fb: Generalize the slow
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBOb3YgMDUsIDIwMTggYXQgMDQ6MzM6MjhQTSArMDEwMCwgTWFhcnRlbiBMYW5raG9y
c3Qgd3JvdGU6Cj4gT3AgMDUtMTEtMTggb20gMTY6MTkgc2NocmVlZiBNYXhpbWUgUmlwYXJkOgo+
ID4gT24gRnJpLCBOb3YgMDIsIDIwMTggYXQgMDk6Mzc6MzFQTSArMDIwMCwgVmlsbGUgU3lyamFs
YSB3cm90ZToKPiA+PiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXgu
aW50ZWwuY29tPgo+ID4+Cj4gPj4gTWFrZSB0aGUgaGFuZGxpbmcgb2Ygc2xvdyBndHQgbW1hcCBy
ZWFkcyBnZW5lcmljLCBhbmQgZXh0ZW5kIGl0IHRvCj4gPj4gdGhlIHBpeG1hbiBjb252ZXJ0ZXIu
IE1ha2VzIHRoZSBwaXhtYW4gcGF0aCBhIGJpdCBmYXN0ZXIuCj4gPj4KPiA+PiBXaXRoIHRlc3Rp
bmcganVzdCBYUkdCODg4OCBhbmQgWEJHUjg4ODggb24gS0JMOgo+ID4+ICQgdGltZSBrbXNfcGxh
bmUgLS1yIHBpeGVsLWZvcm1hdC1waXBlLUEtcGxhbmVzCj4gPj4gLSByZWFsCTBtMTgsNzU3cwo+
ID4+ICsgcmVhbAkwbTIsNjM1cwo+ID4+Cj4gPj4gdjI6IFVzZSB0aGUgb3JpZ2luYWwgc3JjIGJ1
ZmZlciBpZiB0aGUgbWFsbG9jIGZhaWxzIChDaHJpcykKPiA+PiAgICAgRHJvcCB0aGUgZHVwbGlj
YXRlZCBjb21tZW50IGFib3V0IHRoaW5ncyBiZWluZyBzbG93Cj4gPj4KPiA+PiBDYzogQ2hyaXMg
V2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gPj4gQ2M6IE1heGltZSBSaXBhcmQg
PG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gPj4gQ2M6IEFya2FkaXVzeiBIaWxlciA8YXJr
YWRpdXN6LmhpbGVyQGludGVsLmNvbT4KPiA+PiBDYzogSnVoYS1QZWtrYSBIZWlra2lsYSA8anVo
YXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT4KPiA+PiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1h
YXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBWaWxs
ZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+ID4gRm9yIHRoZSA0
IHBhdGNoZXMsCj4gPiBSZXZpZXdlZC1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBi
b290bGluLmNvbT4KPiA+Cj4gPiBUaGFua3MhCj4gPiBNYXhpbWUKPiA+Cj4gUmV2aWV3ZWQtYnk6
IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4g
Cj4gSSBhbHJlYWR5IGhhZCBhIHNpbWlsYXIgZml4IHRvIDEvNCBpbiBteSB0cmVlIGJ1dCBkaWRu
J3Qgc2VuZCBpdCBvdXQgeWV0LiA6KQoKSSdtIGN1cmlvdXMsIGhvdyBkaWQgeW91IGZpbmQgdGhh
dCBpc3N1ZSBpbiB0aGUgZmlyc3QgcGxhY2U/CgpJdCB3ZW50IHRocm91Z2ggQ0kgYW5kIEkgY291
bGQgcnVuIHRoZSBrbXNfcGxhbmUgdGVzdHMgb24gbXkgdGVzdApsYXB0b3AsIHNvIEknbSBjb25m
dXNlZC4KCk1heGltZQoKLS0gCk1heGltZSBSaXBhcmQsIEJvb3RsaW4KRW1iZWRkZWQgTGludXgg
YW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
