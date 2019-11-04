Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2976E4F1
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Nov 2019 14:49:03 +0000 (UTC)
Date: Mon, 4 Nov 2019 16:47:21 +0200
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20191104144721.GB883@ideak-desk.fi.intel.com>
References: <20191101201311.7309-1-imre.deak@intel.com>
 <157286704378.4041.16174637084826801331@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157286704378.4041.16174637084826801331@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/rendercopy: Add AUX page table
 support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, Brian Welty <brian.welty@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMTE6MzA6NDNBTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgSW1yZSBEZWFrICgyMDE5LTExLTAxIDIwOjEzOjA5KQo+ID4gK3N0YXRp
YyBkcm1faW50ZWxfYm8gKgo+ID4gK2dlbjEyX2NyZWF0ZV9hdXhfcGd0YWJsZV9ibyhkcm1faW50
ZWxfYnVmbWdyICpidWZtZ3IsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qg
c3RydWN0IGlndF9idWYgKmRzdF9idWYsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
Y29uc3Qgc3RydWN0IGlndF9idWYgKnNyY19idWYpCj4gPiArewo+ID4gKyAgICAgICBzdHJ1Y3Qg
aWd0X2F1eF9wZ3RhYmxlX3JhbmdlIHJhbmdlc1syXTsKPiA+ICsgICAgICAgaW50IHJhbmdlX2Nv
dW50Owo+ID4gKyAgICAgICB1aW50NjRfdCBwaW5fb2Zmc2V0Owo+ID4gKyAgICAgICBkcm1faW50
ZWxfYm8gKmdlbV9ibzsKPiA+ICsKPiA+ICsgICAgICAgcmFuZ2VfY291bnQgPSAwOwo+ID4gKyAg
ICAgICBwaW5fb2Zmc2V0ID0gMDsKPiA+ICsKPiA+ICsgICAgICAgcmFuZ2VfY291bnQgKz0gYWRk
X2F1eF9wZ3RhYmxlX3JhbmdlKGRzdF9idWYsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAmcmFuZ2VzW3JhbmdlX2NvdW50XSwgJnBpbl9vZmZzZXQpOwo+
ID4gKyAgICAgICByYW5nZV9jb3VudCArPSBhZGRfYXV4X3BndGFibGVfcmFuZ2Uoc3JjX2J1ZiwK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZyYW5nZXNb
cmFuZ2VfY291bnRdLCAmcGluX29mZnNldCk7Cj4gPiArCj4gPiArICAgICAgIGlmICghcmFuZ2Vf
Y291bnQpCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gCj4gU28gZXZlcnkgYmF0
Y2ggdXNlcyB0aGUgc2FtZSBsb2NhdGlvbnMgZm9yIHRoZWlyIHBhaXIgb2Ygc3VyZmFjZXM7Cj4g
Y2F1c2luZyBhIGNvbXBsZXRlIGV2aWN0aW9uIHN0YWxsIGJldHdlZW4gZWFjaCBiYXRjaC4gVGhh
dCdzIGEgbmFzdHkKPiBzaWRlLWVmZmVjdCB0aGF0IHdpbGwgaGlkZSBmbHVzaGluZyBidWdzIGJl
dHdlZW4gYmF0Y2hlcy4KCk9rLiBBcyBkaXNjdXNzZWQgb24gSVJDIEknbGwgcmFuZG9taXplIHRo
ZSBvZmZzZXQgZm9yIGVpdGhlciBvYmplY3Qgd2l0aAphIDAgYm8tPm9mZnNldDY0LgoKPiAtQ2hy
aXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
