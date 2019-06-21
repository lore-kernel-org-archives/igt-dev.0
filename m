Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E73B8926E
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2019 10:51:57 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20190621100345.20019-1-ramalingam.c@intel.com>
 <20190621100345.20019-2-ramalingam.c@intel.com>
 <156111135684.13036.13495378042286390942@skylake-alporthouse-com>
 <489729d6-52a4-6396-152d-a5e358da6165@linux.intel.com>
In-Reply-To: <489729d6-52a4-6396-152d-a5e358da6165@linux.intel.com>
Message-ID: <156111431248.2401.7697793605757183513@skylake-alporthouse-com>
Date: Fri, 21 Jun 2019 11:51:52 +0100
Subject: Re: [igt-dev] [RFC v2 01/43] test/i915: gem_bad_reloc: use the
 gem_engine_topology library
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
To: Ramalingam C <ramalingam.c@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, andi@etezian.org, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOS0wNi0yMSAxMTowNTo0NikKPiAKPiBPbiAyMS8w
Ni8yMDE5IDExOjAyLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBRdW90aW5nIFJhbWFsaW5nYW0g
QyAoMjAxOS0wNi0yMSAxMTowMzowMykKPiA+PiBAQCAtMTkzLDEyICsxOTMsMTIgQEAgaWd0X21h
aW4KPiA+PiAgICAgICAgICAgICAgICAgIGlndF9yZXF1aXJlX2dlbShmZCk7Cj4gPj4gICAgICAg
ICAgfQo+ID4+ICAgCj4gPj4gLSAgICAgICBmb3IgKGUgPSBpbnRlbF9leGVjdXRpb25fZW5naW5l
czsgZS0+bmFtZTsgZSsrKSB7Cj4gPj4gKyAgICAgICBfX2Zvcl9lYWNoX3BoeXNpY2FsX2VuZ2lu
ZShmZCwgZSkgewo+ID4gCj4gPiB1QUJJIHRlc3Rpbmcgbm90IHBoeXNpY2FsIGVuZ2luZXMuCj4g
Cj4gU2hvdWxkIHdlIGFkZCBzb21ldGhpbmcgbGlrZSBmb3JfZWFjaF9sZWdhY3lfYWJpX2VuZ2lu
ZSB0byB1c2UgaW4gdGhlc2UgCj4gdGVzdHMgc28gaXQgaXMgbW9yZSBzZWxmLWRvY3VtZW50aW5n
PyAoQW5kIGdldCByaWQgb2YgcmF3IGFjY2VzcyB0byAKPiBpbnRlbF9leGVjdXRpb25fZW5naW5l
cy4pCgpZZXMsIGEgZm9yX2VhY2hfbGVnYWN5X2FiaV9lbmdpbmUgd291bGQgYmUgbW9zdCB3ZWxj
b21lLiBUaGUgYmFzaWMKcGFyYW1ldGVyIHRlc3Rpbmcgc2hvdWxkIGV4aXN0IGZvciBib3RoIC4g
QWJvdmUgdGhhdCBJIHdvdWxkIGxpa2UgdG8Ka2VlcCBzb21lIGJhc2ljIGJlaGF2aW91cmFsIGNo
ZWNraW5nIHN1ZmZpY2llbnQgc28gdGhhdCB3ZSBjYW4gYmUKY29uZmlkZW50IHRoYXQgeWVzdGVy
ZGF5J3MgbWVzYS9ldGMga2VlcHMgb24gd29ya2luZyBvbiB0b21vcnJvdydzCmtlcm5lbC4gQWZ0
ZXIgdGhhdCwgc28gbG9uZyBhcyB3ZSBjYW4gc2F5ICJ3ZSBjYW4gdGVzdGVkIHRoaXMgYmVoYXZp
b3VyCndpdGggdGhlIG5ldyBBQkkgYW5kIGhhdmUgcHJvdmVuIHRoZSBlcXVpdmFsZW5jZSB2aWEg
dGhpcyBhbmQgdGhpcyB0ZXN0LAplcmdvIHdlIGNhbiBiZSBjb25maWRlbnQgdGhlIGxlZ2FjeSBB
Qkkgd2lsbCB3b3JrIChpZiBhcHBsaWNhYmxlKSIuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2lndC1kZXY=
