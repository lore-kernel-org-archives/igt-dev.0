Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB266E220
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Nov 2018 15:33:31 +0000 (UTC)
References: <20181102190651.25969-4-ville.syrjala@linux.intel.com>
 <20181102193731.27330-1-ville.syrjala@linux.intel.com>
 <20181105151929.pefmgc7rltfygaif@flea>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <281c75e8-6f99-50fc-756f-65add07328c0@linux.intel.com>
Date: Mon, 5 Nov 2018 16:33:28 +0100
MIME-Version: 1.0
In-Reply-To: <20181105151929.pefmgc7rltfygaif@flea>
Content-Language: en-US
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
To: Maxime Ripard <maxime.ripard@bootlin.com>, Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMDUtMTEtMTggb20gMTY6MTkgc2NocmVlZiBNYXhpbWUgUmlwYXJkOgo+IE9uIEZyaSwgTm92
IDAyLCAyMDE4IGF0IDA5OjM3OjMxUE0gKzAyMDAsIFZpbGxlIFN5cmphbGEgd3JvdGU6Cj4+IEZy
b206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4+Cj4+
IE1ha2UgdGhlIGhhbmRsaW5nIG9mIHNsb3cgZ3R0IG1tYXAgcmVhZHMgZ2VuZXJpYywgYW5kIGV4
dGVuZCBpdCB0bwo+PiB0aGUgcGl4bWFuIGNvbnZlcnRlci4gTWFrZXMgdGhlIHBpeG1hbiBwYXRo
IGEgYml0IGZhc3Rlci4KPj4KPj4gV2l0aCB0ZXN0aW5nIGp1c3QgWFJHQjg4ODggYW5kIFhCR1I4
ODg4IG9uIEtCTDoKPj4gJCB0aW1lIGttc19wbGFuZSAtLXIgcGl4ZWwtZm9ybWF0LXBpcGUtQS1w
bGFuZXMKPj4gLSByZWFsCTBtMTgsNzU3cwo+PiArIHJlYWwJMG0yLDYzNXMKPj4KPj4gdjI6IFVz
ZSB0aGUgb3JpZ2luYWwgc3JjIGJ1ZmZlciBpZiB0aGUgbWFsbG9jIGZhaWxzIChDaHJpcykKPj4g
ICAgIERyb3AgdGhlIGR1cGxpY2F0ZWQgY29tbWVudCBhYm91dCB0aGluZ3MgYmVpbmcgc2xvdwo+
Pgo+PiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4+IENjOiBN
YXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgo+PiBDYzogQXJrYWRpdXN6
IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPgo+PiBDYzogSnVoYS1QZWtrYSBIZWlr
a2lsYSA8anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT4KPj4gQ2M6IE1hYXJ0ZW4gTGFua2hv
cnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6
IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gRm9yIHRo
ZSA0IHBhdGNoZXMsCj4gUmV2aWV3ZWQtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRA
Ym9vdGxpbi5jb20+Cj4KPiBUaGFua3MhCj4gTWF4aW1lCj4KUmV2aWV3ZWQtYnk6IE1hYXJ0ZW4g
TGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CgpJIGFscmVhZHkg
aGFkIGEgc2ltaWxhciBmaXggdG8gMS80IGluIG15IHRyZWUgYnV0IGRpZG4ndCBzZW5kIGl0IG91
dCB5ZXQuIDopCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
