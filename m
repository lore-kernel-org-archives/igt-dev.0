Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9A889A4B
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Nov 2020 13:12:14 +0000 (UTC)
Date: Mon, 9 Nov 2020 15:12:09 +0200
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20201109131209.GA382706@ideak-desk.fi.intel.com>
References: <20201109120632.389212-1-imre.deak@intel.com>
 <20201109120632.389212-2-imre.deak@intel.com>
 <160492372394.28777.4238415753044387552@build.alporthouse.com>
 <20201109130214.GB30774@zkempczy-mobl2>
 <160492712972.28777.15098942844906841840@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160492712972.28777.15098942844906841840@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_batchbuffer: Fix relocs
 across the 4GB address boundary
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBOb3YgMDksIDIwMjAgYXQgMDE6MDU6MjlQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgWmJpZ25pZXcgS2VtcGN6ecWEc2tpICgyMDIwLTExLTA5IDEzOjAyOjE0
KQo+ID4gT24gTW9uLCBOb3YgMDksIDIwMjAgYXQgMTI6MDg6NDNQTSArMDAwMCwgQ2hyaXMgV2ls
c29uIHdyb3RlOgo+ID4gPiBRdW90aW5nIEltcmUgRGVhayAoMjAyMC0xMS0wOSAxMjowNjozMikK
PiA+ID4gPiBJZiB0aGUgZGVsdGEgb2YgYSByZWxvY2F0aW9uIHRhcmdldCB3cnQuIHRoZSBvYmpl
Y3QgYmFzZSBhZGRyZXNzIGNyb3NzZXMKPiA+ID4gPiB0aGUgNEdCIGFkZHJlc3MgYm91bmRhcnkg
dGhlIHVwcGVyIDMyYml0IG9mIHRoZSB0YXJnZXQgYWRkcmVzcyB3aWxsIGJlCj4gPiA+ID4gaW5j
b3JyZWN0LCBmaXggdGhpcy4KPiA+ID4gPiAKPiA+ID4gPiBDYzogWmJpZ25pZXcgS2VtcGN6ecWE
c2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+Cj4gPiA+ID4gQ2M6IENocmlzIFdp
bHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IElt
cmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4KPiA+ID4gCj4gPiA+IFpiaWduaWV3LCBmYW5j
eSB3cml0aW5nIGEgdGVzdCBjYXNlIGZvciB0aGlzPwo+ID4gPiAtQ2hyaXMKPiA+IAo+ID4gU3Vy
ZSwgZW5xdWV1ZWQuIAo+ID4gCj4gPiBBcGFydCBvZiBmaXggaXMgY29ycmVjdCAtIEkgdGhvdWdo
dCB3ZSdyZSBtb3N0bHkgdXNpbmcgZGVsdGEKPiA+IHRvIHNldCBzb21lIGJpdHMgaW4gY29tbWFu
ZHMuIFdoYXQncyB0aGUgcmVhbCB1c2FnZT8KPiAKPiBMYXJnZSBvZmZzZXRzIHdvdWxkIG1vc3Qg
Y29tbW9ubHkgYmUgdXNlZCBmb3Igc3Vic3VyZmFjZXMgb3IgYXV4aWxpYXJ5Cj4gc3RhdGUgY29u
dGFpbmVkIHdpdGhpbiBvbmUgYnVmZmVyLgoKWWVzLCBpdCBjYW1lIHVwIHdpdGggYSByZWxvY2F0
aW9uIG5lZWRlZCBmb3IgdGhlIGNvbG9yIGNsZWFyIHZhbHVlCmFkZHJlc3Mgd2l0aGluIGEgZnJh
bWVidWZmZXIgb2JqZWN0LgoKPiAtQ2hyaXMKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGlndC1kZXYgbWFpbGluZyBsaXN0Cj4gaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXYKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
Cg==
