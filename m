Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6058981D
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2019 15:22:24 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id f19so2614052eds.12
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2019 08:22:24 -0700 (PDT)
Date: Tue, 12 Mar 2019 16:22:20 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190312152220.GD2665@phenom.ffwll.local>
References: <20190216182959.8760-1-marius.vlad@collabora.com>
 <20190312134346.GC2665@phenom.ffwll.local>
 <20190312141831.GA11883@xpredator>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190312141831.GA11883@xpredator>
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
Cc: igt-dev@lists.freedesktop.org, Marius Vlad <marius.vlad0@gmail.com>, p.zabel@pengutronix.de, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBNYXIgMTIsIDIwMTkgYXQgMDQ6MTg6MzFQTSArMDIwMCwgTWFyaXVzIFZsYWQgd3Jv
dGU6Cj4gT24gVHVlLCBNYXIgMTIsIDIwMTkgYXQgMDI6NDM6NDZQTSArMDEwMCwgRGFuaWVsIFZl
dHRlciB3cm90ZToKPiA+IE9uIFNhdCwgRmViIDE2LCAyMDE5IGF0IDA4OjI5OjU4UE0gKzAyMDAs
IE1hcml1cyBWbGFkIHdyb3RlOgo+ID4gPiBGcm9tOiBNYXJpdXMgVmxhZCA8bWFyaXVzLnZsYWQw
QGdtYWlsLmNvbT4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1hcml1cyBWbGFkIDxtYXJp
dXMudmxhZEBjb2xsYWJvcmEuY29tPgo+ID4gCj4gPiBTaW5jZSB5b3UgYWxyZWFkeSBoYXZlIGEg
cGlsZSBvZiBpZ3QgcGF0Y2hlcyBtZXJnZWQsIHdhbnQgY29tbWl0IHJpZ2h0cz8KPiA+IEZyb20g
YSBxdWljayBsb29rIHlvdSBkb24ndCBoYXZlIGFjY2VzcyB0byB0aGUgZ2l0bGFiIHJlcG8geWV0
Lgo+IFN1cmUhIG1hcml1cy52bGFkMCBpcyBteSB1c2VybmFtZSBvbiBmZG8gZ2l0bGFiLgoKRG9u
ZSEKLURhbmllbAoKPiAKPiBUaGFua3MhCj4gPiAKPiA+IENoZWVycywgRGFuaWVsCj4gPiA+IC0t
LQo+ID4gPiAgbGliL2lndF9rbXMuYyB8IDEgKwo+ID4gPiAgbGliL2lndF9rbXMuaCB8IDEgKwo+
ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+ID4gCj4gPiA+IGRpZmYg
LS1naXQgYS9saWIvaWd0X2ttcy5jIGIvbGliL2lndF9rbXMuYwo+ID4gPiBpbmRleCA4NWE5MTFl
MS4uODdmYTViZmYgMTAwNjQ0Cj4gPiA+IC0tLSBhL2xpYi9pZ3Rfa21zLmMKPiA+ID4gKysrIGIv
bGliL2lndF9rbXMuYwo+ID4gPiBAQCAtMTc3LDYgKzE3Nyw3IEBAIGNvbnN0IGNoYXIgKiBjb25z
dCBpZ3RfcGxhbmVfcHJvcF9uYW1lc1tJR1RfTlVNX1BMQU5FX1BST1BTXSA9IHsKPiA+ID4gIAlb
SUdUX1BMQU5FX0NPTE9SX1JBTkdFXSA9ICJDT0xPUl9SQU5HRSIsCj4gPiA+ICAJW0lHVF9QTEFO
RV9QSVhFTF9CTEVORF9NT0RFXSA9ICJwaXhlbCBibGVuZCBtb2RlIiwKPiA+ID4gIAlbSUdUX1BM
QU5FX0FMUEhBXSA9ICJhbHBoYSIsCj4gPiA+ICsJW0lHVF9QTEFORV9aUE9TXSA9ICJ6cG9zIiwK
PiA+ID4gIH07Cj4gPiA+ICAKPiA+ID4gIGNvbnN0IGNoYXIgKiBjb25zdCBpZ3RfY3J0Y19wcm9w
X25hbWVzW0lHVF9OVU1fQ1JUQ19QUk9QU10gPSB7Cj4gPiA+IGRpZmYgLS1naXQgYS9saWIvaWd0
X2ttcy5oIGIvbGliL2lndF9rbXMuaAo+ID4gPiBpbmRleCA2NzlkNGU4NC4uMjI3ZmEwMjAgMTAw
NjQ0Cj4gPiA+IC0tLSBhL2xpYi9pZ3Rfa21zLmgKPiA+ID4gKysrIGIvbGliL2lndF9rbXMuaAo+
ID4gPiBAQCAtMjcyLDYgKzI3Miw3IEBAIGVudW0gaWd0X2F0b21pY19wbGFuZV9wcm9wZXJ0aWVz
IHsKPiA+ID4gICAgICAgICBJR1RfUExBTkVfQ09MT1JfUkFOR0UsCj4gPiA+ICAgICAgICAgSUdU
X1BMQU5FX1BJWEVMX0JMRU5EX01PREUsCj4gPiA+ICAgICAgICAgSUdUX1BMQU5FX0FMUEhBLAo+
ID4gPiArICAgICAgIElHVF9QTEFORV9aUE9TLAo+ID4gPiAgICAgICAgIElHVF9OVU1fUExBTkVf
UFJPUFMKPiA+ID4gIH07Cj4gPiA+ICAKPiA+ID4gLS0gCj4gPiA+IDIuMTkuMgo+ID4gPiAKPiA+
IAo+ID4gLS0gCj4gPiBEYW5pZWwgVmV0dGVyCj4gPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwg
Q29ycG9yYXRpb24KPiA+IGh0dHA6Ly9ibG9nLmZmd2xsLmNoCgoKCi0tIApEYW5pZWwgVmV0dGVy
ClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5j
aApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
