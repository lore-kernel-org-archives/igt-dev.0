Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CA46E705
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Sep 2018 19:24:52 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180913192226.GT5565@intel.com>
References: <20180913190942.24201-1-chris@chris-wilson.co.uk>
 <20180913192226.GT5565@intel.com>
Message-ID: <153686668817.23741.15691356066176702305@skylake-alporthouse-com>
Date: Thu, 13 Sep 2018 20:24:48 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] igt/kms_addfb_basic: Skip if the KMS
 interface is not supported
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
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBWaWxsZSBTeXJqw6Rsw6QgKDIwMTgtMDktMTMgMjA6MjI6MjYpCj4gT24gVGh1LCBT
ZXAgMTMsIDIwMTggYXQgMDg6MDk6NDJQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4g
U29tZSBkcml2ZXJzIGFuZCBzb21lIGhhcmR3YXJlIGRvIG5vdCBzdXBwb3J0IEtNUyBhbmQgc28g
dGhlIGFkZGZiCj4gPiBpb2N0bHMgYXJlIGV4cGVjdGVkIHRvIGZhaWwuIEhvd2V2ZXIsIHNpbmNl
IHRoZXkgYXJlIGV4cGVjdGVkIHRvIGZhaWwKPiA+IHdpdGggYSBzcGVjaWZpYyBlcnJubyAoRU5P
VFNVUFApIGluIHRoZSBjYXNlIEtNUyBpcyBub3Qgc3VwcG9ydGVkIG9uIHRoZQo+ID4gZmQsIHdl
IGNhbiBjaGVjayBmb3IgdGhhdCBhbmQgc2tpcCB0aGUgdGVzdHMgd2hlcmUgdGhleSBhcmUgbm90
Cj4gPiBhcHByb3ByaWF0ZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxj
aHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4KPiA+IC0tLQo+ID4gIHRlc3RzL2ttc19hZGRmYl9iYXNpYy5jIHwgMjcg
KysrKysrKysrKysrKysrKysrKysrKysrKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDI2IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19h
ZGRmYl9iYXNpYy5jIGIvdGVzdHMva21zX2FkZGZiX2Jhc2ljLmMKPiA+IGluZGV4IGNlNDhkMjRm
YS4uNDAwMjQxYTkyIDEwMDY0NAo+ID4gLS0tIGEvdGVzdHMva21zX2FkZGZiX2Jhc2ljLmMKPiA+
ICsrKyBiL3Rlc3RzL2ttc19hZGRmYl9iYXNpYy5jCj4gPiBAQCAtNjY3LDEyICs2NjcsMzcgQEAg
c3RhdGljIHZvaWQgcHJvcF90ZXN0cyhpbnQgZmQpCj4gPiAgCj4gPiAgfQo+ID4gIAo+ID4gK3N0
YXRpYyBib29sIGhhc19hZGRmYjJfaWZhY2UoaW50IGZkKQo+ID4gK3sKPiA+ICsgICAgIHN0cnVj
dCBsb2NhbF9kcm1fbW9kZV9mYl9jbWQyIGYgPSB7fTsKPiA+ICsgICAgIGludCBlcnI7Cj4gPiAr
Cj4gPiArICAgICBlcnIgPSAwOwo+ID4gKyAgICAgaWYgKGRybUlvY3RsKGZkLCBEUk1fSU9DVExf
TU9ERV9BRERGQjIsICZmKSkKPiA+ICsgICAgICAgICAgICAgZXJyID0gLWVycm5vOwo+ID4gKyAg
ICAgc3dpdGNoIChlcnIpIHsKPiA+ICsgICAgIGNhc2UgLUVOT1RUWTogLyogaW9jdGwgdW5yZWNv
Z25pc2VkIChrZXJuZWwgdG9vIG9sZCkgKi8KPiA+ICsgICAgIGNhc2UgLUVOT1RTVVA6IC8qIGRy
aXZlciBkb2Vzbid0IHN1cHBvcnQgS01TICovCj4gCj4gUCBvbmNlIG9yIFAgdHdpY2U/Cj4gCj4g
T2gsIEVOT1RTVVBQIG5vdCBpbiB1YXBpIGhlYWRlcnMgQUZBSUNTLiBJcyB0aGlzIHRoZSBzYW1l
IHRoaW5nIGV2ZW4/CgpOby4gSXQgd2Fzbid0LiBUaGUgZGFuZ2VyIGluIHRlc3RpbmchIEkgaGFk
IHRvIHNlbmQgdjMgd2l0aCB0aGUKY29ycmVjdGlvbiBhcyB0aGUga2VybmVsIGNhbGxzIHRoaXMg
RU9QTk9UU1VQUCwgbXVjaCB0byBQT1NJWCdzIGNoYWdyaW4uCi1DaHJpcwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdApp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
