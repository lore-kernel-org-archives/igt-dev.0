Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936F56E2F9
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2019 09:59:36 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <bec74d84-d112-2b44-a620-f741e55eb418@linux.intel.com>
References: <20190321160528.4131-1-andi.shyti@intel.com>
 <20190321160528.4131-5-andi.shyti@intel.com>
 <6b531677-8e74-c51c-535a-bb5e1c1f2ac7@linux.intel.com>
 <155324155883.26447.7921522281863006035@skylake-alporthouse-com>
 <bec74d84-d112-2b44-a620-f741e55eb418@linux.intel.com>
Message-ID: <155324875415.26447.4292180559780097374@skylake-alporthouse-com>
Date: Fri, 22 Mar 2019 09:59:14 +0000
Subject: Re: [igt-dev] [PATCH v15 4/5] lib/i915: add gem_engine_topology
 library and for_each loop definition
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
To: Andi Shyti <andi.shyti@intel.com>, IGT dev <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOS0wMy0yMiAwOTo1Njo0OSkKPiAKPiBPbiAyMi8w
My8yMDE5IDA3OjU5LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBRdW90aW5nIFR2cnRrbyBVcnN1
bGluICgyMDE5LTAzLTIyIDA3OjQ3OjAyKQo+ID4+PiArdm9pZCBpbnRlbF9uZXh0X2VuZ2luZShz
dHJ1Y3QgaW50ZWxfZW5naW5lX2RhdGEgKmVkKTsKPiA+Pj4gKwo+ID4+PiArI2RlZmluZSBJU19Q
SFlTSUNBTF9FTkdJTkUoZTIpICgoZTItPmNsYXNzID49IDApICYmIChlMi0+aW5zdGFuY2UgPj0g
MCkpCj4gPj4KPiA+PiBDaHJpcywgZG8geW91IHRoaW5rIHRoaXMgd2lsbCBiZSBmdXR1cmUgcHJv
b2YgZW5vdWdoPwo+ID4gCj4gPiBBdCB0aGUgbW9tZW50LCB3ZSd2ZSByZXNlcnZlZCBqdXN0IHRo
ZSBvbmUgaWRlbnRpZmllciBmb3IgcGxhY2Vob2xkZXJzCj4gPiAoY2xhc3MgPT0gSTkxNV9FTkdJ
TkVfQ0xBU1NfSU5WQUxJRCkuIEFuZCBJIGZlZWwgY29uZmlkZW50IHRoYXQgc2hvdWxkCj4gPiBi
ZSBlbm91Z2guCj4gPiAKPiA+IFRoZSBwcm9ibGVtIGlzIGlmIHNvbWV0aGluZyBlbHNlIGdhdmUg
dXMgbXVsdGlwbGUgaW5zdGFuY2VzIG9mIGEgbG9naWNhbAo+ID4gZW5naW5lIGZvciB3aGljaCB3
ZSBoYXZlIG5vIG1lYW5zIHRvIGRldGVybWluZSB0aGUgcGh5c2ljYWwgbWFwcGluZywKPiA+IHdo
aWNoIGlzIHZ2dgo+ID4gCj4gPj4gSSByZW1lbWJlcmVkIGhvdyBhdCBvbmUgcG9pbnQgSSBoYWQg
IklTX1BIWVNJQ0FMIiBhcyBhIGZsYWcgaW4gZW5naW5lIHF1ZXJ5Lgo+ID4+Cj4gPj4gT3Igd2Ug
bWFrZSB0aGlzIGhlcmUgbW9yZSBleHBsaWNpdCBieSBiZWluZyAiSVNfVklSVFVBTCIgYW5kIGlu
dmVydCB0aGUKPiA+PiB0ZXN0IGluIHRoZSBjYWxsZXI/Cj4gPiAKPiA+IEF5ZS4gSSB0aGluayB5
b3UgYXJlIHJpZ2h0IGhlcmUsIGFuZCB3ZSBuZWVkIHRvIHB1dCBhIGNhcHMgZmllbGQgaW50bwo+
ID4gdGhlIGVuZ2luZV9kYXRhIChmaWxsZWQgaW4gYnkgaTkxNV9xdWVyeSBmb3IgdmFsaWQgY2xh
c3NlcyBhbmQgZGVmYXVsdAo+ID4gdG8gIXBoeXMgZm9yIGludmFsaWQgc2xvdHMpLiBBIGxvdCBv
ZiB0aGUgZm9yX2VhY2hfcGh5c2ljYWxfZW5naW5lKCkKPiA+IHRlc3RzIGRvIG5vdCBtYWtlIHNl
bnNlIGlmIHRoZXJlIGlzIGF1dG9tYWdpYyBlbmdpbmUgbWFwcGluZyBnb2luZyBvbgo+ID4gYmVo
aW5kIHRoZSBzY2VuZXMuCj4gCj4gWW91IGFyZSBzaW1wbHkgc2F5aW5nIHRvIG1vdmUgdGhlICJJ
U19QSFlJU0lDQUwiIHRlc3QgdG8gaW5pdF9lbmdpbmUgCj4gaGVyZSBhbmQgc3RvcmUgaXQgaW4g
YSBmbGFnIHBlciBlbmdpbmU/CgpZZXMsIHdpdGggYSB2aWV3IHRvIHN1cHBseWluZyB0aGF0IGlu
Zm9ybWF0aW9uIGZyb20gdGhlIGtlcm5lbCBpZiB0aGUKZnV0dXJlIGxhbmRzY2FwZSBjaGFuZ2Vz
IGZvciB0aGUgYWN0dWFsIGVuZ2luZXMuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXY=
