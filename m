Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA266E67C
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Feb 2019 09:22:43 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190213011029.GC4740@intel.intel>
References: <20190212235437.1218-1-andi.shyti@intel.com>
 <20190212235437.1218-5-andi.shyti@intel.com>
 <155001714462.13414.756418260848193187@skylake-alporthouse-com>
 <20190213011029.GC4740@intel.intel>
Message-ID: <155004974235.11832.14981214483747676067@skylake-alporthouse-com>
Date: Wed, 13 Feb 2019 09:22:22 +0000
Subject: Re: [igt-dev] [RFC PATCH v8 4/5] lib: ioctl_wrappers: reach engines
 by index as well
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
To: Andi Shyti <andi.shyti@intel.com>
Cc: IGT dev <igt-dev@lists.freedesktop.org>, Andi Shyti <andi@etezian.org>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbmRpIFNoeXRpICgyMDE5LTAyLTEzIDAxOjExOjAzKQo+IEhpIENocmlzLAo+IAo+
ID4gPiAtYm9vbCBnZW1faGFzX3JpbmcoaW50IGZkLCB1bnNpZ25lZCByaW5nKQo+ID4gPiArYm9v
bCBnZW1faGFzX3JpbmdfYnlfaWR4KGludCBmZCwgdW5zaWduZWQgaWR4LCB1bnNpZ25lZCByc3Zk
MSkKPiA+IAo+ID4gX19nZW1faGFzX3JpbmcoaW50IGZkLCB1aW50MzJfdCBjdHgsIHVuc2lnbmVk
IGludCByaW5nKQo+ID4gCj4gPiAjZGVmaW5lIGdlbV9oYXNfcmluZyhmZCwgcmluZykgX19nZW1f
aGFzX3JpbmcoZmQsIDAsIHJpbmcpCj4gPiAKPiA+ICogbXV0dGVycyByc3ZkMSEKPiAKPiBZZXMs
IHRoYXQncyBxdWl0ZSBhIGNvbnRyb3ZlcnN5OiB0aGUgY29uY2VwdCBvZiAncmluZycgaXMgc3dh
cHBlZAo+IGRlcGVuZGluZyBvbiB3aGV0aGVyIHlvdSBjYWxsICdnZW1faGFzX3JpbmcnIG9yCj4g
J2dlbV9oYXNfcmluZ19ieV9pZHgnIGFuZCBJIGJldCB0aGVyZSBpcyBubyBuYW1pbmcgY2hvaWNl
IHRoYXQKPiB3b3VsZCBwbGVhc2UgYm90aCBjYWxsZXJzLiBVbmxlc3MgSSB1c2UgbmV1dHJhbCBu
YW1lcywgbGlrZSAnYScKPiBhbmQgJ2InLCBvciAneCcgYW5kICd5Jy4KPiAKPiBUaGF0J3Mgd2h5
IG9yaWdpbmFsbHkgSSBjYWxsZWQgaXQgJ2ZsYWdzJyBhbmQgJ3JzdmQxJyBhcyB0aGV5IGFyZQo+
IGNhbGxlZCBpbiB0aGUgJ2RybV9pOTE1X2dlbV9leGVjYnVmZmVyMicgc3RydWN0dXJlLCBpbiBv
cmRlciB0bwo+IG1pbmltaXplIGNvbmZ1c2lvbi4KCnJzdmQxIGlzIHRoZSBjdHggaWQuCgpUaGlz
IHNob3VsZCBiZSBnZW1fY29udGV4dF9oYXNfZW5naW5lKCkgYW5kCiNkZWZpbmUgZ2VtX2hhc19y
aW5nKGZkLCByaW5nKSBnZW1fY29udGV4dF9oYXNfZW5naW5lKGZkLCAwLCByaW5nKQoKVGhlIHdo
b2xlIGRlc2lnbmVkIGlzIHRoYXQgdGhlIGZsYWdzL2luZGV4IHNob3VsZCBiZSB0cmFuc3BhcmVu
dCB0byB0aGUKY2FsbGVyLCBzbyBfYnlfaWR4IGlzIGFuYXRoZW1hLgotQ2hyaXMKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
