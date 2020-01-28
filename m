Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BBB6ED42
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2020 09:22:06 +0000 (UTC)
Date: Tue, 28 Jan 2020 10:22:04 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20200128092204.GA11349@zkempczy-desk.igk.intel.com>
References: <20200128090022.10547-1-zbigniew.kempczynski@intel.com>
 <158020271085.525.13300871984135519604@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158020271085.525.13300871984135519604@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_tiled_wc: skip on
 platforms without GGTT
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgMDk6MTE6NTBBTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgWmJpZ25pZXcgS2VtcGN6ecWEc2tpICgyMDIwLTAxLTI4IDA5OjAwOjIy
KQo+ID4gT24gcGxhdGZvcm1zIHdpdGhvdXQgYXBlcnR1cmUgZW5zdXJlIHRlc3QgaXMgc2tpcHBl
ZC4gTG9jYWxpemUKPiA+IEdFTV9NTUFQIGlvY3RsKCkgdG8gbWFrZSBzdXJlIHRoaXMgaW50ZXJm
YWNlIGlzIHRlc3RlZC4KPiAKPiBBY3R1YWxseSB0aGlzIHdvdWxkIGJlIG9rIHdpdGggZGV2aWNl
IGNvaGVyZW50LiBOb3Qgc3VyZSBpZiBpdCdzCj4gcmVsZXZhbnQuLi4gWW91IGNvdWxkIGNlcnRh
aW5seSB3cml0ZSB0aGUgZXF1aXZhbGVudCBmb3IgbW1hcF9vZmZzZXQsCj4gdGhhdCBpcyB0aGUg
R1RUIHBhdGggdGFrZXMgdGhlIGZlbmNlLCBhbmQgdGhlIG90aGVycyBkbyBub3QuCj4gCj4gPiBT
aWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tp
QGludGVsLmNvbT4KPiA+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51
az4KPiBSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+
Cj4gCj4gSSB3b3VsZCBtb3ZlIHRoaXMgaW50byBnZW1fbW1hcF93YyBqdXN0IHRvIG1ha2UgaXQg
bW9yZSBzZWxmLWNvbnRhaW5lZCwKPiBpZ3Rfc3VidGVzdCgidGlsZWQiKS4KCllvdSB0aGluayBq
dXN0IHRvIHJlbW92ZSB0aGlzIHRlc3QgYWZ0ZXIgbWlncmF0aW5nIHRvIGdlbV9tbWFwX3djPyAK
T25seSBjb25zIEkgc2VlIG5vdyBpcyB0aGF0IHdlIGRvbid0IHN1cHBvcnQgb2Zmc2V0IGluIGdl
bV9tbWFwX29mZnNldF9fd2MoKQpzbyBJIHdvdWxkIGRlZmVyIGl0IHdoZW4gdGhpcyBhcmd1bWVu
dCB3aWxsIGJlIGhhbmRsZWQuCgotLQpaYmlnbmlldwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXYK
