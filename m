Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FDE6E0ED
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2020 16:11:31 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <159845814671.19114.2454977424539666999@build.alporthouse.com>
References: <20200820063030.10741-1-zbigniew.kempczynski@intel.com>
 <20200820063030.10741-14-zbigniew.kempczynski@intel.com>
 <159845814671.19114.2454977424539666999@build.alporthouse.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 26 Aug 2020 17:11:28 +0100
Message-ID: <159845828810.19114.16643798877520555947@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t v31 13/32] lib/igt_fb: Removal of libdrm
 dependency
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
To: zbigniew.kempczynski@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMjAtMDgtMjYgMTc6MDk6MDYpCj4gUXVvdGluZyBaYmln
bmlldyBLZW1wY3p5xYRza2kgKDIwMjAtMDgtMjAgMDc6MzA6MTEpCj4gPiArICAgICAgIGJvX25h
bWUgPSBnZW1fZmxpbmsoYmxpdC0+ZmQsIGZiLT5nZW1faGFuZGxlKTsKPiA+ICsgICAgICAgaGFu
ZGxlID0gZ2VtX29wZW4oYmxpdC0+ZmQsIGJvX25hbWUpOwo+ID4gKyAgICAgICBidWYgPSBjYWxs
b2MoMSwgc2l6ZW9mKCpidWYpKTsKPiA+ICsgICAgICAgaWd0X2Fzc2VydChidWYpOwo+ID4gKyAg
ICAgICBpbnRlbF9idWZfaW5pdF91c2luZ19oYW5kbGUoYmxpdC0+Ym9wcywgaGFuZGxlLCBidWYs
IGZiLT53aWR0aCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZiLT5o
ZWlnaHQsIGZiLT5wbGFuZV9icHBbMF0sIDAsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBpZ3RfZmJfbW9kX3RvX3RpbGluZyhmYi0+bW9kaWZpZXIpLAo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29tcHJlc3Npb24pOwo+ID4gKyAgICAgICBp
bnRlbF9idWZfc2V0X25hbWUoYnVmLCBuYW1lKTsKPiAKPiBJJ2Qgd3JhcCB0aGlzIGludG8gYSBs
b2NhbCBidWZfY3JlYXRlX2Zvcl9oYW5kbGUgcm91dGluZS4gV2hpY2ggZG9lcyBiZWcKPiB0aGUg
cXVlc3Rpb24gd2hlcmUgYXJlIHdlIGNyZWF0aW5nIGEgbmV3IGhhbmRsZSBpZiB3ZSBhbHJlYWR5
IGhhdmUgYQo+IGdlbV9oYW5kbGU/IExpZmV0aW1lIHdvcnJpZXM/IFRoYXQncyBub3QgZXhwbGFp
bmVkLi4uCj4gCj4gSSdkIGd1ZXNzIGxpZmV0aW1lLiBJbiB3aGljaCBjYXNlIHRoYXQgd291bGQg
YmUgYW4gaW50ZXJuYWwgZGV0YWlsIG9mCj4gaW50ZWxfYnVmIGxlYWtpbmcgdGhyb3VnaCwgYW5k
IEkgd291bGQgc3VnZ2VzdCBwdXNoaW5nIHRoZSByb3V0aW5lIGludG8KPiB0aGUgbGlicmFyeSBp
ZiBpdCB0YWtlcyBvd25lcnNoaXAgb2YgdGhlIGhhbmRsZS4KClRvIGJlIGNsZWFyLCBpdCdzIG5v
dCBpbW1lZGlhdGVseSBvYnZpb3VzIHRvIG1lIHRoYXQKaW50ZWxfYnVmX2luaXRfdXNpbmdfaGFu
ZGxlKCkgdGFrZXMgb3duZXJzaGlwLiBNeSBleHBlcmllbmNlIHdvdWxkIGJlIGEKcm91dGluZSB0
aGF0IGFja25vd2xlZGdlcyBpdCBpcyB1c2luZyBhbiBleHRlcm5hbCByZXNvdXJjZSB3b3VsZCBi
ZSBub3QKdG8gZGVzdHJveSB0aGF0IHJlc291cmNlIG9uIGNsZWFudXAuCi1DaHJpcwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcg
bGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
