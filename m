Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580AC6E354
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2019 13:30:04 +0000 (UTC)
Message-ID: <1552051801.4009.11.camel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Fri, 08 Mar 2019 14:30:01 +0100
In-Reply-To: <20190216182959.8760-1-marius.vlad@collabora.com>
References: <20190216182959.8760-1-marius.vlad@collabora.com>
Mime-Version: 1.0
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
To: Marius Vlad <marius.vlad@collabora.com>, igt-dev@lists.freedesktop.org
Cc: Marius Vlad <marius.vlad0@gmail.com>, daniel@ffwll.ch
List-ID: <igt-dev@lists.freedesktop.org>

T24gU2F0LCAyMDE5LTAyLTE2IGF0IDIwOjI5ICswMjAwLCBNYXJpdXMgVmxhZCB3cm90ZToKPiBG
cm9tOiBNYXJpdXMgVmxhZCA8bWFyaXVzLnZsYWQwQGdtYWlsLmNvbT4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBNYXJpdXMgVmxhZCA8bWFyaXVzLnZsYWRAY29sbGFib3JhLmNvbT4KPiAtLS0KPiAgbGli
L2lndF9rbXMuYyB8IDEgKwo+ICBsaWIvaWd0X2ttcy5oIHwgMSArCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3Rfa21zLmMgYi9saWIv
aWd0X2ttcy5jCj4gaW5kZXggODVhOTExZTEuLjg3ZmE1YmZmIDEwMDY0NAo+IC0tLSBhL2xpYi9p
Z3Rfa21zLmMKPiArKysgYi9saWIvaWd0X2ttcy5jCj4gQEAgLTE3Nyw2ICsxNzcsNyBAQCBjb25z
dCBjaGFyICogY29uc3QgaWd0X3BsYW5lX3Byb3BfbmFtZXNbSUdUX05VTV9QTEFORV9QUk9QU10g
PSB7Cj4gIAlbSUdUX1BMQU5FX0NPTE9SX1JBTkdFXSA9ICJDT0xPUl9SQU5HRSIsCj4gIAlbSUdU
X1BMQU5FX1BJWEVMX0JMRU5EX01PREVdID0gInBpeGVsIGJsZW5kIG1vZGUiLAo+ICAJW0lHVF9Q
TEFORV9BTFBIQV0gPSAiYWxwaGEiLAo+ICsJW0lHVF9QTEFORV9aUE9TXSA9ICJ6cG9zIiwKPiAg
fTsKPiAgCj4gIGNvbnN0IGNoYXIgKiBjb25zdCBpZ3RfY3J0Y19wcm9wX25hbWVzW0lHVF9OVU1f
Q1JUQ19QUk9QU10gPSB7Cj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3Rfa21zLmggYi9saWIvaWd0X2tt
cy5oCj4gaW5kZXggNjc5ZDRlODQuLjIyN2ZhMDIwIDEwMDY0NAo+IC0tLSBhL2xpYi9pZ3Rfa21z
LmgKPiArKysgYi9saWIvaWd0X2ttcy5oCj4gQEAgLTI3Miw2ICsyNzIsNyBAQCBlbnVtIGlndF9h
dG9taWNfcGxhbmVfcHJvcGVydGllcyB7Cj4gICAgICAgICBJR1RfUExBTkVfQ09MT1JfUkFOR0Us
Cj4gICAgICAgICBJR1RfUExBTkVfUElYRUxfQkxFTkRfTU9ERSwKPiAgICAgICAgIElHVF9QTEFO
RV9BTFBIQSwKPiArICAgICAgIElHVF9QTEFORV9aUE9TLAo+ICAgICAgICAgSUdUX05VTV9QTEFO
RV9QUk9QUwo+ICB9Owo+ICAKClJldmlld2VkLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBl
bmd1dHJvbml4LmRlPgoKcmVnYXJkcwpQaGlsaXBwCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldg==
