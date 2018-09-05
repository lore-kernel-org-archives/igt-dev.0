Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F708918A
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Sep 2018 10:14:55 +0000 (UTC)
Date: Wed, 5 Sep 2018 13:14:34 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20180905101434.GL5565@intel.com>
References: <cover.2608afc0c4c8efaee37268ea6e9dee558c619b13.1535721136.git-series.maxime.ripard@bootlin.com>
 <646c39734b6dde4b74f215b64f094cddc9e00ebe.1535721136.git-series.maxime.ripard@bootlin.com>
 <20180831134218.GZ5565@intel.com>
 <20180905093549.2sv3ggjp5j6yiihz@flea>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180905093549.2sv3ggjp5j6yiihz@flea>
Subject: Re: [igt-dev] [PATCH v6 05/13] fb: Fix ARGB8888 color depth
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
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, eben@raspberrypi.org, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBTZXAgMDUsIDIwMTggYXQgMTE6MzU6NDlBTSArMDIwMCwgTWF4aW1lIFJpcGFyZCB3
cm90ZToKPiBPbiBGcmksIEF1ZyAzMSwgMjAxOCBhdCAwNDo0MjoxOFBNICswMzAwLCBWaWxsZSBT
eXJqw6Rsw6Qgd3JvdGU6Cj4gPiBPbiBGcmksIEF1ZyAzMSwgMjAxOCBhdCAwMzoxMjoxNFBNICsw
MjAwLCBNYXhpbWUgUmlwYXJkIHdyb3RlOgo+ID4gPiBUaGUgQVJHQjg4ODggaGFzIGJlZW4gbGlz
dGVkIGFzIGhhdmluZyBhIDMyIGJpdHMgZGVwdGgsIHdoaWxlIGl0IGFjdHVhbGx5Cj4gPiA+IGlz
IGEgMjQgYml0cyBmb3JtYXQuIEZpeCB0aGlzLgo+ID4gCj4gPiBJIHRoaW5rIDMyIGlzIHRoZSBt
b3JlIHVzdWFsIGRlZmluaXRpb24gZm9yIHRoaXMuCj4gCj4gSXNuJ3QgY29sb3IgZGVwdGggYWJv
dXQgdGhlIGNvbG9yIGl0c2VsZj8gSSBndWVzcyBhbHBoYSB3b3VsZG4ndCBhcHBseQo+IGluIHRo
aXMgY2FzZS4KCk5vdCBhY2NvcmRpbmcgdG8gWCBhdCBsZWFzdC4KCiAgdmlzdWFsOgogICAgdmlz
dWFsIGlkOiAgICAweDZkCiAgICBjbGFzczogICAgVHJ1ZUNvbG9yCiAgICBkZXB0aDogICAgMzIg
cGxhbmVzCiAgICBhdmFpbGFibGUgY29sb3JtYXAgZW50cmllczogICAgMjU2IHBlciBzdWJmaWVs
ZAogICAgcmVkLCBncmVlbiwgYmx1ZSBtYXNrczogICAgMHhmZjAwMDAsIDB4ZmYwMCwgMHhmZgog
ICAgc2lnbmlmaWNhbnQgYml0cyBpbiBjb2xvciBzcGVjaWZpY2F0aW9uOiAgICA4IGJpdHMKClNh
bWUgZm9yIGVnLiBkcm1fbW9kZV9sZWdhY3lfZmJfZm9ybWF0KCkuCgo+IAo+IEluIHRoZSBzYW1l
IGZvcm1hdCBsaXN0Ogo+ICAgLSBSR0I1NjUgaGFzIGEgZGVwdGggb2YgMTYKPiAgIC0gWFJHQjg4
ODggaGFzIGEgZGVwdGggb2YgMjQKPiAgIC0gWFJHQjIxMDEwMTAgaGFzIGEgZGVwdGggb2YgMzAK
PiAgIC0gQVJHQjg4ODggaGFzIGEgZGVwdGggb2YgMzIKPiAKPiBXaGljaCBzZWVtcyB0byBpbmRp
Y2F0ZSB0aGF0IHRoZSBsaXN0IGluZGVlZCBtZWFudCB0aGF0IHRoZSBjb2xvcgo+IGRlcHRoIGlz
IGFib3V0IHRoZSBjb2xvciwgYW5kIHRoYXQgQVJHQjg4ODggaXMgd3JvbmcuCgpOb25lIG9mIHRo
b3NlIG90aGVyIHRoaW5ncyBoYXZlIGFscGhhLCBzbyB0aGV5IGFyZSBzdGlsbApjb25zaXN0ZW50
IHdpdGggdGhlIGRlcHRoPT0zMiBkZWZpbml0aW9uIGZvciBBUkdCODg4LgoKLS0gClZpbGxlIFN5
cmrDpGzDpApJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
