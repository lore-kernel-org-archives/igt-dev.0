Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id B807A6ED1F
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jan 2019 15:47:04 +0000 (UTC)
Message-ID: <94385ef3b70d2b1475475a4eb60f696622ccf479.camel@bootlin.com>
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Tue, 22 Jan 2019 16:46:53 +0100
In-Reply-To: <20190122142844.20899-8-maxime.ripard@bootlin.com>
References: <20190122142844.20899-1-maxime.ripard@bootlin.com>
 <20190122142844.20899-8-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v4 07/14] igt: fb: Account for all
 planes bpp
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

SGksCgpPbiBUdWUsIDIwMTktMDEtMjIgYXQgMTU6MjggKzAxMDAsIE1heGltZSBSaXBhcmQgd3Jv
dGU6Cj4gV2hlbiBhbGxvY2F0aW5nIGEgZHVtYiBidWZmZXIgZm9yIGEgZm9ybWF0IHdpdGggbXVs
dGlwbGUgcGxhbmUsIHdlIG5lZWQgdG8KPiBhY2NvdW50IGZvciBhbGwgcGxhbmUncyBicHAgaW4g
b3JkZXIgdG8gYWxsb2NhdGUgdGhlIHByb3BlciBzaXplLgo+IAo+IExldCdzIGFkZCBhbGwgdGhl
IHBsYW5lcyBicHAgYW5kIHVzZSB0aGUgcmVzdWx0IHRvIGFsbG9jYXRlIG91ciBidWZmZXIuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNv
bT4KClJldmlld2VkLWJ5OiBQYXVsIEtvY2lhbGtvd3NraSA8cGF1bC5rb2NpYWxrb3dza2lAYm9v
dGxpbi5jb20+CgpDaGVlcnMsCgpQYXVsCgo+IC0tLQo+ICBsaWIvaWd0X2ZiLmMgfCA5ICsrKysr
KystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9saWIvaWd0X2ZiLmMgYi9saWIvaWd0X2ZiLmMKPiBpbmRleCAwZjQw
MjFiNzdlNWYuLjBmMDQzYWNjZTI5ZCAxMDA2NDQKPiAtLS0gYS9saWIvaWd0X2ZiLmMKPiArKysg
Yi9saWIvaWd0X2ZiLmMKPiBAQCAtNTI4LDcgKzUyOCw5IEBAIHN0YXRpYyB2b2lkIGNsZWFyX3l1
dl9idWZmZXIoc3RydWN0IGlndF9mYiAqZmIpCj4gIC8qIGhlbHBlcnMgdG8gY3JlYXRlIG5pY2Ut
bG9va2luZyBmcmFtZWJ1ZmZlcnMgKi8KPiAgc3RhdGljIGludCBjcmVhdGVfYm9fZm9yX2ZiKHN0
cnVjdCBpZ3RfZmIgKmZiKQo+ICB7Cj4gKwljb25zdCBzdHJ1Y3QgZm9ybWF0X2Rlc2Nfc3RydWN0
ICpmbXQgPSBsb29rdXBfZHJtX2Zvcm1hdChmYi0+ZHJtX2Zvcm1hdCk7Cj4gIAl1aW50NjRfdCBz
aXplID0gY2FsY19mYl9zaXplKGZiKTsKPiArCXVuc2lnbmVkIGludCBwbGFuZSwgYnBwOwo+ICAJ
aW50IGZkID0gZmItPmZkOwo+ICAKPiAgCS8qIHJlc3BlY3QgdGhlIHNpemUgcmVxdWVzdGVkIGJ5
IHRoZSBjYWxsZXIgKi8KPiBAQCAtNTU3LDEwICs1NTksMTMgQEAgc3RhdGljIGludCBjcmVhdGVf
Ym9fZm9yX2ZiKHN0cnVjdCBpZ3RfZmIgKmZiKQo+ICAJCX0KPiAgCX0KPiAgCj4gKwlmb3IgKHBs
YW5lID0gMDsgcGxhbmUgPCBmYi0+bnVtX3BsYW5lczsgcGxhbmUrKykKPiArCQlicHAgKz0gRElW
X1JPVU5EX1VQKGZiLT5wbGFuZV9icHBbcGxhbmVdLAo+ICsJCQkJICAgIHBsYW5lID8gZm10LT5o
c3ViICogZm10LT52c3ViIDogMSk7Cj4gKwo+ICAJZmItPmlzX2R1bWIgPSB0cnVlOwo+ICAJZmIt
PmdlbV9oYW5kbGUgPSBrbXN0ZXN0X2R1bWJfY3JlYXRlKGZkLCBmYi0+d2lkdGgsIGZiLT5oZWln
aHQsCj4gLQkJCQkJICAgICBmYi0+cGxhbmVfYnBwWzBdLAo+IC0JCQkJCSAgICAgJmZiLT5zdHJp
ZGVzWzBdLCAmZmItPnNpemUpOwo+ICsJCQkJCSAgICAgYnBwLCAmZmItPnN0cmlkZXNbMF0sICZm
Yi0+c2l6ZSk7Cj4gIAo+ICAJcmV0dXJuIGZiLT5nZW1faGFuZGxlOwo+ICB9Ci0tIApQYXVsIEtv
Y2lhbGtvd3NraSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQga2VybmVsIGVuZ2luZWVyaW5n
Cmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldgo=
