Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10A16EE34
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Feb 2019 15:51:27 +0000 (UTC)
Message-ID: <1b255e85e0b929f4b37f24879a1a366a12e2afdf.camel@bootlin.com>
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Fri, 08 Feb 2019 16:51:17 +0100
In-Reply-To: <20190208131901.1400-3-maxime.ripard@bootlin.com>
References: <20190208131901.1400-1-maxime.ripard@bootlin.com>
 <20190208131901.1400-3-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v6 02/10] igt: fb: Add size checks and
 recalculation before dumb allocation
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

SGksCgpPbiBGcmksIDIwMTktMDItMDggYXQgMTQ6MTggKzAxMDAsIE1heGltZSBSaXBhcmQgd3Jv
dGU6Cj4gU2luY2Ugd2Ugd2FudCB0byB1c2UgdGhlIGR1bWIgYnVmZmVycyB0byBzdG9yZSBmcmFt
ZXMgaW4gZm9ybWF0cyB3aXRoCj4gbXVsdGlwbGUgcGxhbmVzLCB3ZSBuZWVkIHRvIGFkZCBjaGVj
a3MgZm9yIHVuc3VwcG9ydGVkIGNvcm5lciBjYXNlcywgYW5kIHdlCj4gbmVlZCB0byBjYWxjdWxh
dGUgdGhlIG9mZnNldHMgYW5kIHNpemVzIG9mIGVhY2ggcGxhbmVzLiBMZXQncyB1c2UKPiBjYWxj
X2ZiX3NpemUgZm9yIHRoYXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4
aW1lLnJpcGFyZEBib290bGluLmNvbT4KCkxvb2tzIGdvb2QgdG8gbWUsIHRoYW5rcyEKClJldmll
d2VkLWJ5OiBQYXVsIEtvY2lhbGtvd3NraSA8cGF1bC5rb2NpYWxrb3dza2lAYm9vdGxpbi5jb20+
CgpDaGVlcnMsCgpQYXVsCgo+IC0tLQo+ICBsaWIvaWd0X2ZiLmMgfCAxMCArKysrKysrKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9p
Z3RfZmIuYyBiL2xpYi9pZ3RfZmIuYwo+IGluZGV4IGM2MWU2ODA1ZmY3YS4uY2E0ODY1NTE5YzEz
IDEwMDY0NAo+IC0tLSBhL2xpYi9pZ3RfZmIuYwo+ICsrKyBiL2xpYi9pZ3RfZmIuYwo+IEBAIC01
NjEsNiArNTYxLDE2IEBAIHN0YXRpYyBpbnQgY3JlYXRlX2JvX2Zvcl9mYihzdHJ1Y3QgaWd0X2Zi
ICpmYikKPiAgCQl9Cj4gIAl9Cj4gIAo+ICsJLyoKPiArCSAqIFRoZSBjdXJyZW50IGR1bWIgYnVm
ZmVyIGFsbG9jYXRpb24gQVBJIGRvZXNuJ3QgcmVhbGx5IGFsbG93IHRvCj4gKwkgKiBzcGVjaWZ5
IGEgY3VzdG9tIHNpemUgb3Igc3RyaWRlLiBZZXQgdGhlIGNhbGxlciBpcyBmcmVlIHRvIHNwZWNp
ZnkKPiArCSAqIHRoZW0sIHNvIHdlIG5lZWQgdG8gbWFrZSBzdXJlIHRvIGVycm9yIG91dCBpbiB0
aGlzIGNhc2UuCj4gKwkgKi8KPiArCWlndF9hc3NlcnQoZmItPnNpemUgPT0gMCk7Cj4gKwlpZ3Rf
YXNzZXJ0KGZiLT5zdHJpZGVzWzBdID09IDApOwo+ICsKPiArCWZiLT5zaXplID0gY2FsY19mYl9z
aXplKGZiKTsKPiArCj4gIAlmYi0+aXNfZHVtYiA9IHRydWU7Cj4gIAlmYi0+Z2VtX2hhbmRsZSA9
IGttc3Rlc3RfZHVtYl9jcmVhdGUoZmQsIGZiLT53aWR0aCwgZmItPmhlaWdodCwKPiAgCQkJCQkg
ICAgIGZiLT5wbGFuZV9icHBbMF0sCi0tIApQYXVsIEtvY2lhbGtvd3NraSwgQm9vdGxpbgpFbWJl
ZGRlZCBMaW51eCBhbmQga2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
