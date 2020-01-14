Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7AD6E35D
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jan 2020 11:15:02 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <87eew2zig5.wl-ashutosh.dixit@intel.com>
References: <20200114052728.13313-1-zbigniew.kempczynski@intel.com>
 <87eew2zig5.wl-ashutosh.dixit@intel.com>
Message-ID: <157900049765.27314.15743110141892570457@skylake-alporthouse-com>
Date: Tue, 14 Jan 2020 11:14:57 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915/gem_mman.c: add cpu coherency
 mapping wrapper
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBEaXhpdCwgQXNodXRvc2ggKDIwMjAtMDEtMTQgMDU6NTk6NTQpCj4gT24gTW9uLCAx
MyBKYW4gMjAyMCAyMToyNzoyOCAtMDgwMCwgWmJpZ25pZXcgS2VtcGN6ecWEc2tpIHdyb3RlOgo+
ID4KPiA+IEZvciByZWR1Y2UgY29kZSByZWR1bmRhbmN5IGFkZGluZyBhIHdyYXBwZXIgZm9yIGNw
dSBtZW1vcnkgbWFwcGluZy4KPiA+Cj4gPiArdm9pZCAqX19nZW1fbW1hcF9fY3B1X2NvaGVyZW50
KGludCBmZCwgdWludDMyX3QgaGFuZGxlLCB1aW50NjRfdCBvZmZzZXQsCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVpbnQ2NF90IHNpemUsIHVuc2lnbmVkIHByb3QpCj4gPiArewo+
ID4gKyAgICAgdm9pZCAqcHRyID0gX19nZW1fbW1hcF9vZmZzZXRfX2NwdShmZCwgaGFuZGxlLCBv
ZmZzZXQsIHNpemUsIHByb3QpOwo+ID4gKwo+ID4gKyAgICAgaWYgKCFwdHIpCj4gPiArICAgICAg
ICAgICAgIHB0ciA9IF9fZ2VtX21tYXBfX2NwdShmZCwgaGFuZGxlLCBvZmZzZXQsIHNpemUsIHBy
b3QpOwo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIHB0cjsKPiA+ICt9Cj4gCj4gV2UgbmVlZCBzaW1p
bGFyIHdyYXBwZXJzIGZvciBXQyBhbmQgR1RUIHRvby4gU28gd2h5IGRvbid0IHdlIHB1dCB0aGlz
IGNvZGUKClRoYXQncyBnZW1fbW1hcF9fZGV2aWNlX2NvaGVyZW50LgoKPiBpbiBfX2dlbV9tbWFw
X19jcHUoKSBpdHNlbGYgYW5kIHdlIGNhbiBkbyB0aGUgc2FtZSBmb3IgX19nZW1fbW1hcF9fd2Mo
KSBhbmQKPiBfX2dlbV9tbWFwX19ndHQoKSB0b28/IE90aGVyd2lzZSB3aGF0IGFyZSB3ZSBnb2lu
ZyB0byBjYWxsIHRob3NlIGZ1bmN0aW9ucz8KPiBTb21ldGhpbmcgbGlrZToKPiAKPiB2b2lkICpf
X2dlbV9tbWFwX19jcHUoaW50IGZkLCB1aW50MzJfdCBoYW5kbGUsIHVpbnQ2NF90IG9mZnNldCwg
dWludDY0X3Qgc2l6ZSwgdW5zaWduZWQgcHJvdCkKPiB7Cj4gICAgICAgICBpZiAoZ2VtX2hhc19t
bWFwX29mZnNldChmZCkpCj4gICAgICAgICAgICAgICAgIHJldHVybiBfX2dlbV9tbWFwX29mZnNl
dChmZCwgaGFuZGxlLCBvZmZzZXQsIHNpemUsIHByb3QsIEk5MTVfTU1BUF9PRkZTRVRfV0IpOwo+
ICAgICAgICAgZWxzZQo+ICAgICAgICAgICAgICAgICByZXR1cm4gX19nZW1fbW1hcChmZCwgaGFu
ZGxlLCBvZmZzZXQsIHNpemUsIHByb3QsIDApOwo+IH0KPiAKPiBTbyBJIGFtIG5vdCBzdXJlIG9m
IHRoZSBwb2ludCBvZiBpbnRyb2R1Y2luZyBuZXcgd3JhcHBlcnMsIHRoaXMgY29kZSBjb3VsZAo+
IGp1c3QgYmUgcHV0IGluIHRoZSBvbGQgZXhpc3Rpbmcgd3JhcHBlcnMuCgpUaGUgcG9pbnQgaXMg
dGhhdCB3ZSBhcmUgc2VwYXJhdGluZyBpbnRlbnQgZnJvbSBpbXBsZW1lbnRhdGlvbi4gV2hlcmUg
YQp0ZXN0IGlzIG5vdCBsb29raW5nIGF0IHRoZSBtbWFwIGlvY3RsLCBidXQganVzdCB3YW50cyBh
Y2Nlc3MgdG8gYQpidWZmZXIsIGhvdyBpdCB3YW50cyB0byBhY2Nlc3MgdGhhdCBidWZmZXIgaXMg
dGhlIGltcG9ydGFudCBiaXQgb2YKaW5mb3JtYXRpb24uCi1DaHJpcwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
