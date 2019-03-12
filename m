Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042B78953E
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2019 13:43:51 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id g19so2351366edp.2
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2019 06:43:50 -0700 (PDT)
Date: Tue, 12 Mar 2019 14:43:46 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190312134346.GC2665@phenom.ffwll.local>
References: <20190216182959.8760-1-marius.vlad@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190216182959.8760-1-marius.vlad@collabora.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_kms: Add zpos plane
 property.
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
To: Marius Vlad <marius.vlad@collabora.com>
Cc: igt-dev@lists.freedesktop.org, Marius Vlad <marius.vlad0@gmail.com>, daniel@ffwll.ch, p.zabel@pengutronix.de
List-ID: <igt-dev@lists.freedesktop.org>

T24gU2F0LCBGZWIgMTYsIDIwMTkgYXQgMDg6Mjk6NThQTSArMDIwMCwgTWFyaXVzIFZsYWQgd3Jv
dGU6Cj4gRnJvbTogTWFyaXVzIFZsYWQgPG1hcml1cy52bGFkMEBnbWFpbC5jb20+Cj4gCj4gU2ln
bmVkLW9mZi1ieTogTWFyaXVzIFZsYWQgPG1hcml1cy52bGFkQGNvbGxhYm9yYS5jb20+CgpTaW5j
ZSB5b3UgYWxyZWFkeSBoYXZlIGEgcGlsZSBvZiBpZ3QgcGF0Y2hlcyBtZXJnZWQsIHdhbnQgY29t
bWl0IHJpZ2h0cz8KRnJvbSBhIHF1aWNrIGxvb2sgeW91IGRvbid0IGhhdmUgYWNjZXNzIHRvIHRo
ZSBnaXRsYWIgcmVwbyB5ZXQuCgpDaGVlcnMsIERhbmllbAo+IC0tLQo+ICBsaWIvaWd0X2ttcy5j
IHwgMSArCj4gIGxpYi9pZ3Rfa21zLmggfCAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9rbXMuYyBiL2xpYi9pZ3Rfa21zLmMK
PiBpbmRleCA4NWE5MTFlMS4uODdmYTViZmYgMTAwNjQ0Cj4gLS0tIGEvbGliL2lndF9rbXMuYwo+
ICsrKyBiL2xpYi9pZ3Rfa21zLmMKPiBAQCAtMTc3LDYgKzE3Nyw3IEBAIGNvbnN0IGNoYXIgKiBj
b25zdCBpZ3RfcGxhbmVfcHJvcF9uYW1lc1tJR1RfTlVNX1BMQU5FX1BST1BTXSA9IHsKPiAgCVtJ
R1RfUExBTkVfQ09MT1JfUkFOR0VdID0gIkNPTE9SX1JBTkdFIiwKPiAgCVtJR1RfUExBTkVfUElY
RUxfQkxFTkRfTU9ERV0gPSAicGl4ZWwgYmxlbmQgbW9kZSIsCj4gIAlbSUdUX1BMQU5FX0FMUEhB
XSA9ICJhbHBoYSIsCj4gKwlbSUdUX1BMQU5FX1pQT1NdID0gInpwb3MiLAo+ICB9Owo+ICAKPiAg
Y29uc3QgY2hhciAqIGNvbnN0IGlndF9jcnRjX3Byb3BfbmFtZXNbSUdUX05VTV9DUlRDX1BST1BT
XSA9IHsKPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9rbXMuaCBiL2xpYi9pZ3Rfa21zLmgKPiBpbmRl
eCA2NzlkNGU4NC4uMjI3ZmEwMjAgMTAwNjQ0Cj4gLS0tIGEvbGliL2lndF9rbXMuaAo+ICsrKyBi
L2xpYi9pZ3Rfa21zLmgKPiBAQCAtMjcyLDYgKzI3Miw3IEBAIGVudW0gaWd0X2F0b21pY19wbGFu
ZV9wcm9wZXJ0aWVzIHsKPiAgICAgICAgIElHVF9QTEFORV9DT0xPUl9SQU5HRSwKPiAgICAgICAg
IElHVF9QTEFORV9QSVhFTF9CTEVORF9NT0RFLAo+ICAgICAgICAgSUdUX1BMQU5FX0FMUEhBLAo+
ICsgICAgICAgSUdUX1BMQU5FX1pQT1MsCj4gICAgICAgICBJR1RfTlVNX1BMQU5FX1BST1BTCj4g
IH07Cj4gIAo+IC0tIAo+IDIuMTkuMgo+IAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5n
aW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
