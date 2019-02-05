Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1546D6E6D3
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Feb 2019 12:52:52 +0000 (UTC)
Message-ID: <d91bff93682acf7e7b05f928c049be5af51245da.camel@bootlin.com>
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Tue, 05 Feb 2019 13:52:48 +0100
In-Reply-To: <20190125145842.15738-3-maxime.ripard@bootlin.com>
References: <20190125145842.15738-1-maxime.ripard@bootlin.com>
 <20190125145842.15738-3-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v5 02/13] igt: fb: Reduce tile size
 alignment for non intel platforms
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
To: Maxime Ripard <maxime.ripard@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>, eben@raspberrypi.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

SGksCgpPbiBGcmksIDIwMTktMDEtMjUgYXQgMTU6NTggKzAxMDAsIE1heGltZSBSaXBhcmQgd3Jv
dGU6Cj4gQWxpZ25pbmcgdGhlIHdpZHRoIG9uIDY0IHBpeGVscyBvbmx5IG1ha2Ugc2Vuc2Ugb24g
aW50ZWwgcGxhdGZvcm1zLCBtYWtlCj4gc3VyZSB0byBhZGQgYSBjaGVjayBhZ2FpbnN0IHRoaXMu
CgpQdXNoZWQsIHRoYW5rcyEKCkNoZWVycywKClBhdWwKCj4gUmV2aWV3ZWQtYnk6IFBhdWwgS29j
aWFsa293c2tpIDxwYXVsLmtvY2lhbGtvd3NraUBib290bGluLmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgo+IC0tLQo+ICBsaWIv
aWd0X2ZiLmMgfCA2ICsrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZmIuYyBiL2xpYi9pZ3RfZmIu
Ywo+IGluZGV4IGUyMzkwOGUyOGMwNy4uMWE1YzMzOGVhNTMyIDEwMDY0NAo+IC0tLSBhL2xpYi9p
Z3RfZmIuYwo+ICsrKyBiL2xpYi9pZ3RfZmIuYwo+IEBAIC0yMDQsNyArMjA0LDExIEBAIHZvaWQg
aWd0X2dldF9mYl90aWxlX3NpemUoaW50IGZkLCB1aW50NjRfdCB0aWxpbmcsIGludCBmYl9icHAs
Cj4gIHsKPiAgCXN3aXRjaCAodGlsaW5nKSB7Cj4gIAljYXNlIExPQ0FMX0RSTV9GT1JNQVRfTU9E
X05PTkU6Cj4gLQkJKndpZHRoX3JldCA9IDY0Owo+ICsJCWlmIChpc19pOTE1X2RldmljZShmZCkp
Cj4gKwkJCSp3aWR0aF9yZXQgPSA2NDsKPiArCQllbHNlCj4gKwkJCSp3aWR0aF9yZXQgPSAxOwo+
ICsKPiAgCQkqaGVpZ2h0X3JldCA9IDE7Cj4gIAkJYnJlYWs7Cj4gIAljYXNlIExPQ0FMX0k5MTVf
Rk9STUFUX01PRF9YX1RJTEVEOgotLSAKUGF1bCBLb2NpYWxrb3dza2ksIEJvb3RsaW4KRW1iZWRk
ZWQgTGludXggYW5kIGtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
