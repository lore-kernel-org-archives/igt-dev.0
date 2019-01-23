Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63C76E015
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jan 2019 07:54:53 +0000 (UTC)
From: Jani Nikula <jani.nikula@intel.com>
In-Reply-To: <154816244782.1277.8411319537664432112@skylake-alporthouse-com>
References: <20190122125940.13898-1-jani.nikula@intel.com>
 <154816244782.1277.8411319537664432112@skylake-alporthouse-com>
Date: Wed, 23 Jan 2019 09:56:32 +0200
Message-ID: <87pnsn3iz3.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [UNTESTED RFC] tests: drop openssl dependency in
 favor of glib sha1 implementation
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCAyMiBKYW4gMjAxOSwgQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28u
dWs+IHdyb3RlOgo+IFF1b3RpbmcgSmFuaSBOaWt1bGEgKDIwMTktMDEtMjIgMTI6NTk6NDApCj4+
IFdlIGFscmVhZHkgZGVwZW5kIG9uIGdsaWIgd2hpY2ggaGFzIHNoYTEsIHNvIHdlIGRvbid0IHJl
YWxseSBuZWVkCj4+IG9wZW5zc2wganVzdCBmb3Igc2hhMS4KPj4gCj4+IENjOiBDaHJpcyBXaWxz
b24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPj4gQ2M6IFR2cnRrbyBVcnN1bGluIDx0dnJ0
a28udXJzdWxpbkBsaW51eC5pbnRlbC5jb20+Cj4+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+Cj4+IENjOiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgo+
PiBTaWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgo+PiAK
Pj4gLS0tCj4+IAo+PiBVbnRlc3RlZC4KPgo+IE5vdyB0ZXN0ZWQuCj4KPiBJIGp1c3Qgd2lzaCBn
bGliIHdhcyB0aGUgQyBsaWJyYXJ5IEkgd2lzaGVkIGl0IHRvIGJlIDooCgpJIGZlZWwgeW91LgoK
PiBSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CgpU
aGFua3MsIHB1c2hlZCB3aXRoIGEgcmVmZXJlbmNlIHRvIGNhZWE5YzViM2FhMSAoImlndC9nZW1f
dXNlcnB0cjogQ2hlY2sKcmVhZC1vbmx5IG1hcHBpbmdzIikgYWRkZWQgaW4gdGhlIGNvbW1pdCBt
ZXNzYWdlLgoKQlIsCkphbmkuCgoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBH
cmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
