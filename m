Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B02089AF3
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2020 03:40:40 +0000 (UTC)
Date: Tue, 29 Sep 2020 05:40:34 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20200929034034.GB2711@zkempczy-mobl2>
References: <20200928131502.41354-1-zbigniew.kempczynski@intel.com>
 <20200928152920.GV7444@platvala-desk.ger.corp.intel.com>
 <20200928173712.znki3ef7kcvhutg7@hatecraft.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200928173712.znki3ef7kcvhutg7@hatecraft.localdomain>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_core: Reinitialize print mutex
 in child process
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
To: Arkadiusz Hiler <arek@hiler.eu>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBTZXAgMjgsIDIwMjAgYXQgMDg6Mzc6MTJQTSArMDMwMCwgQXJrYWRpdXN6IEhpbGVy
IHdyb3RlOgo+IE9uIE1vbiwgU2VwIDI4LCAyMDIwIGF0IDA2OjI5OjIwUE0gKzAzMDAsIFBldHJp
IExhdHZhbGEgd3JvdGU6Cj4gPiBPbiBNb24sIFNlcCAyOCwgMjAyMCBhdCAwMzoxNTowMlBNICsw
MjAwLCBaYmlnbmlldyBLZW1wY3p5xYRza2kgd3JvdGU6Cj4gPiA+IElHVCBhcmUgcHJvbmUgdG8g
ZGVhZGxvY2sgaW4gaWd0X2xvZygpIGluIGZvbGxvd2luZyBzY2VuYXJpbzoKPiA+ID4gCj4gPiA+
IDEuIFBhcmVudCBwcm9jZXNzIGNyZWF0ZXMgYWRkaXRpb25hbCB0aHJlYWQgd2hpY2ggZm9yIGV4
YW1wbGUKPiA+ID4gICAgaXMgZG9pbmcgZW5kbGVzcyBsb29wCj4gPiA+IDIuIFRocmVhZCBzb21l
dGltZXMgaXMgbG9nZ2luZyB0byBjb25zb2xlIHVzaW5nIGlndF9pbmZvKCkuCj4gPiA+ICAgIFRo
aXMgbG9ja3MgYW5kIHVubG9ja3MgcHJpbnRfbXV0ZXguCj4gPiA+IDMuIElmIGluIHRoZSBtZWFu
dGltZSBwYXJlbnQgcHJvY2VzcyB3aWxsIHNwYXduIGl0IGNhbiBiZQo+ID4gPiAgICBzcGF3bmVk
IHdpdGggcHJpbnRfbXV0ZXggbG9ja2VkLiBJZiBpbiB0aGUgY2hpbGQgcHJvY2Vzcwo+ID4gPiAg
ICBpdCB3aWxsIGRvIGlndF9pbmZvKCkgaXQgd2lsbCBkZWFkbG9jay4KPiA+ID4gCj4gPiA+IFdl
IHNob3VsZCByZWluaXRpYWxpemUgcHJpbnRfbXV0ZXggaW4gY2hpbGQgcHJvY2VzcyB0byBhdm9p
ZAo+ID4gPiB1c2UgaW5oZXJpdGVkIHZhbHVlLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTog
WmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+Cj4g
PiA+IENjOiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KPiA+ID4gLS0t
Cj4gPiAKPiA+IEFyZSB5b3UgYWJsZSB0byB0eXBlIHVwIGEgdW5pdCB0ZXN0IGluIGxpYi90ZXN0
cy8gdGhhdCByZXByb2R1Y2VzIHRoaXMKPiA+IGRlYWRsb2NrPwo+ID4gCj4gPiBDb2RlIExHVE0s
IEFyZWssIGRvIHlvdSBzcG90IGFueXRoaW5nIGFtaXNzIHdpdGggdGhpcz8KPiAKPiBPdGhlciB0
aGFuIHRoZSByYW5kb20gd2hpdGVzcGFjZSBjaGFuZ2VzIHRoZSBwYXRjaCBsb29rcyBnb29kLiBU
aGFua3MhCgpJJ20gc29ycnksIEkndmUgdHJhbnNwbGFudGVkIHRoYXQgZnJvbSBjb2RlIEknbSB3
b3JraW5nIG9uIGFuZCB0aGF0IHdhcwpub3QgYXdhcmUgc29tZXRoaW5nIGdvdCBjYXVnaHQgdXAu
CgotLQpaYmlnbmlldwoKPiAKPiBNaXhpbmcgdGhyZWFkaW5nIGFuZCBmb3JraW5nIGlzIGFsd2F5
cyAnZnVuJyBhbmQgcGVvcGxlIHJhcmVseSB0aGluawo+IGFib3V0IGl0IHVwZnJvbnQuIEkgd29u
J3QgYmUgc3VycHJpc2VkIGlmIHdlIHdpbGwgZmluZCBtb3JlIHRoaW5ncyBsaWtlCj4gdGhpcyA6
LSkKPiAKPiAtLSAKPiBDaGVlcnMsCj4gQXJlawpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXYK
