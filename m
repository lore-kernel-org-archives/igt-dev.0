Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0444C6EAF1
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2018 01:49:35 +0000 (UTC)
MIME-Version: 1.0
Message-ID: <151926417234.18172.7705946186663590661@jljusten-skl>
From: Jordan Justen <jordan.l.justen@intel.com>
In-Reply-To: <877er53knr.fsf@intel.com>
References: <20180221231905.15580-1-jordan.l.justen@intel.com>
 <20180221231905.15580-3-jordan.l.justen@intel.com> <877er53knr.fsf@intel.com>
Date: Wed, 21 Feb 2018 17:49:33 -0800
Subject: Re: [igt-dev] [PATCH i-g-t 3/6] aubdump: For gen10+ support
 addresses up to 4GB
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
To: IGT GPU Tools <igt-dev@lists.freedesktop.org>, Scott D Phillips <scott.d.phillips@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gMjAxOC0wMi0yMSAxNjo1ODoxNiwgU2NvdHQgRCBQaGlsbGlwcyB3cm90ZToKPiBKb3JkYW4g
SnVzdGVuIDxqb3JkYW4ubC5qdXN0ZW5AaW50ZWwuY29tPiB3cml0ZXM6Cj4gCj4gPiBGb3IgZ2Vu
MTAsIHdlIG5vdyBhZGQgbWFwcGluZ3MgZm9yIGJ1ZmZlcnMgYXMgdGhleSBhcmUgbmVlZGVkLgo+
ID4KPiA+IEluc3RlYWQgb2YgZG9pbmcgdGhpcyBkeW5hbWljYWxseSwgd2UgY291bGQgYWx3YXlz
IG1hcCB0aGUgZW50aXJlIDRHQi4KPiA+IFdpdGggNEtCIHBhZ2VzLCB0aGUgdGFibGVzIHdvdWxk
IHRha2UgdXAgOE1CIGluIGV2ZXJ5IEFVQi4gQVVCcyBhcmUKPiA+IG9mdGVuIHF1aXRlIGh1Z2Ug
Y29tcGFyZWQgdG8gOE1CLCBidXQgdGhleSBjYW4gYWxzbyBiZSBqdXN0IGEgZmV3Cj4gPiBodW5k
cmVkIEtCLgo+ID4KPiA+IFRoaXMgc2hvdWxkIGFsbG93IHRoZSBBVUIgdG8gY3JlYXRlIHVwIHRv
IGFib3V0IDRHQiBvZiBhbGxvY2F0ZWQKPiA+IGJ1ZmZlcnMsIHdoZXJlYXMgYmVmb3JlIHdlIHdl
cmUgbGltaXRlZCB0byBhYm91dCA2NE1CLgo+ID4KPiA+IFdoaWxlIGl0IGlzIHVubGlrZWx5IHRo
YXQgd2UnbGwgdHJ5IHRvIGNhcHR1cmUgQVVCcyB0aGF0IGdlbmVyYXRlCj4gPiBidWZmZXJzIHVw
IHRvIDRHQiBpbiBzaXplLCB0aGlzIGNoYW5nZSBhbHNvIHNob3VsZCBhbGxvdyBwaW5uZWQKPiA+
IGJ1ZmZlcnMgdG8gYmUgdXNlZCBhbnl3aGVyZSBpbiB0aGUgZmlyc3QgNEdCLiAoSSB0ZXN0ZWQg
YSBwaW5uZWQKPiA+IGJ1ZmZlciBhdCAweGYwMDAwMDAwLikKPiAKPiBXaWxsIHdlIG5lZWQgdG8g
ZG8gUElQRV9DT05UUk9MIHdpdGggVExCIEludmFsaWRhdGUgYXMgZW50cmllcyBnZXQgYWRkZWQK
PiBmb3IgdGhlIHNpbXVsYXRvciB0byBkbyB0aGUgcmlnaHQgdGhpbmcgd2l0aCB0aGUgZ2VuZXJh
dGVkIGZpbGU/CgpNYXliZT8gU2luY2Ugd2Ugb25seSBhZGQgbWFwcGluZ3MgKG5ldmVyIGNoYW5n
ZSBvciBkZWxldGUpLCBJIHdvdWxkbid0CmV4cGVjdCBhbiBpbnZhbGlkYXRlIHdvdWxkIGJlIHJl
cXVpcmVkLgoKLUpvcmRhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
