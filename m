Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from 3.mo68.mail-out.ovh.net (3.mo68.mail-out.ovh.net [46.105.58.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A356C890B0
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Apr 2019 18:22:02 +0000 (UTC)
Received: from player787.ha.ovh.net (unknown [10.109.146.132])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 22A82120DCA
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Apr 2019 20:21:59 +0200 (CEST)
Date: Mon, 8 Apr 2019 21:21:52 +0300
From: Andi Shyti <andi@etezian.org>
Message-ID: <20190408182152.GA4158@jack.zhora.eu>
References: <20190408161533.2421-1-andi.shyti@intel.com>
 <20190408161533.2421-3-andi.shyti@intel.com>
 <1c87195a-5d14-5e43-414b-eab934a0cd67@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1c87195a-5d14-5e43-414b-eab934a0cd67@linux.intel.com>
Subject: Re: [igt-dev] [PATCH v19 2/6] lib/i915: add gem_engine_topology
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: IGT dev <igt-dev@lists.freedesktop.org>, Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

SGkgVHZydGtvLAoKSSBmb3Jnb3QgdG8gYW5zd2VyIHRvIHRoaXMgb25lLAoKPiA+ICtzdHJ1Y3Qg
aW50ZWxfZXhlY3V0aW9uX2VuZ2luZTIKPiA+ICsqaW50ZWxfZ2V0X2N1cnJlbnRfZW5naW5lKHN0
cnVjdCBpbnRlbF9lbmdpbmVfZGF0YSAqZWQpCj4gPiArewo+IAo+IE91ciBjb2Rpbmcgc3R5bGUg
aXMKPiAKPiB0eXBlICoKPiBmdW5jX25hbWUoLi4pCgpZZXMuCgo+IChUYWtlIGNhcmUgb2YgYWxs
IGluc3RhbmNlcyBpbiBzb3VyY2UgYW5kIGhlYWRlci4pCgpZb3Uga25vdyBJIG1pZ2h0IGZvcmdl
dCA6KQoKPiA+ICsJaWYgKGlndF9vbmx5X2xpc3Rfc3VidGVzdHMoKSkKPiA+ICsJCXJldHVybiAt
RVBFUk07Cj4gCj4gUHV6emxpbmcgY2hvaWNlIG9mIGVycm5vLCBub3QgdGhhdCBpdCBtYXR0ZXJz
LCBidXQgSSBhbSB0ZW1wdGVkIHRvIHN1Z2dlc3QKPiAtRU5PREVWLgoKSSB3aWxsIGNhbiBjaGFu
Z2UgaXQgdG8gRU5PREVWLiBJdCBsb29rZWQgbW9yZSBhcHByb3ByaWF0ZQpiZWNhdXNlIGlmIHdl
IGZhbGwgaW50byB0aGlzIGNhc2UgaXQgZG9lc24ndCBtZWFuIHRoYXQgdGhlcmUgaXMKbm8gZGV2
aWNlLCBidXQgdGhhdCBhbnkgaW9jdGwgdG8gdGhlIGRldmljZSBpcyAiZm9yYmlkZGVuIi4KCkJ1
dCwgT0ssIEkgZG9uJ3QgcmVhbGx5IG1pbmQuCgo+ID4gKwkJCWlmICghaWd0X29ubHlfbGlzdF9z
dWJ0ZXN0cygpKSB7Cj4gPiArCQkJCV9fZTItPmZsYWdzID0gZ2VtX2NsYXNzX2luc3RhbmNlX3Rv
X2ViX2ZsYWdzKGZkLAo+ID4gKwkJCQkJCWUyLT5jbGFzcywgZTItPmluc3RhbmNlKTsKPiAKPiBX
b3VsZCBpdCBtYWtlIHNlbnNlIHRvICJwb2lzb24iIGZsYWdzIHdpdGggbGlrZSAtMSAod2hlbiBs
aXN0aW5nIHN1YnRlc3RzKQo+IHNvIGFueSBtaXN0YWtlcyB3b3VsZCBuZXZlciBoYXZlIGEgY2hh
bmNlIHRvIHdvcms/Cgp5ZXMsIG1ha2VzIHNlbnNlLgoKPiA+ICsvKgo+ID4gKyAqIExpbWl0IHdo
YXQgd2Ugc3VwcG9ydCBmb3Igc2ltcGxpY2l0eSBkdWUgbGltaXRhdGlvbiBpbiBob3cgbXVjaCB3
ZQo+ID4gKyAqIGNhbiBhZGRyZXNzIHZpYSBleGVjYnVmMi4KPiA+ICsgKi8KPiA+ICsjZGVmaW5l
IFNJWkVPRl9DVFhfUEFSQU0Jb2Zmc2V0b2Yoc3RydWN0IGk5MTVfY29udGV4dF9wYXJhbV9lbmdp
bmVzLCBcCj4gPiArCQkJCQljbGFzc19pbnN0YW5jZVtHRU1fTUFYX0VOR0lORVNdKQo+ID4gKyNk
ZWZpbmUgU0laRU9GX1FVRVJZCQlvZmZzZXRvZihzdHJ1Y3QgZHJtX2k5MTVfcXVlcnlfZW5naW5l
X2luZm8sIFwKPiA+ICsJCQkJCWVuZ2luZXNbR0VNX01BWF9FTkdJTkVTXSkKPiAKPiBEbyB5b3Ug
bmVlZCB0aGVzZSB0d28gaW4gdGhlIGhlYWRlciBmaWxlPwoKWW91IGRlZmluZWQgdGhlIHNhbWUg
aW4geW91ciAiZml4dXAiIHBhdGNoLCBzbyB0aGF0IEkgdGhvdWdodCB0bwpkZWZpbmUgaSBvbmNl
IGFuZCBoZXJlLgoKPiA+ICsjZGVmaW5lIEdFTV9NQVhfRU5HSU5FUwkJSTkxNV9FWEVDX1JJTkdf
TUFTSyArIDEKPiA+ICsKPiA+ICtzdHJ1Y3QgaW50ZWxfZW5naW5lX2RhdGEgewo+ID4gKwl1aW50
MzJfdCBuZW5naW5lczsKPiA+ICsJdWludDMyX3QgbjsKPiA+ICsJaW50IGVycm9yOwo+IAo+IFVu
dXNlZD8KCkl0J3MgYSBsZWZ0b3ZlciBmcm9tIG9uZSBvZiB0aGUgcHJldmlvdXMgcmV3b3Jrcywg
aXQgd2FzIGFkZGVkIHRvCmNoZWNrIGluIHRoZSBmb3JfZWFjaCB3aGV0aGVyIEkgd2FzIHJlY2Vp
dmluZyBtb3JlIGVuZ2luZXMgdGhhbgp0aGUgbGltaXQuCgpJJ2xsIHJlbW92ZSBpdC4KCj4gQ29k
aW5nIHN0eWxlIGFuZCBxdWVzdGlvbiBhZ2FpbnN0IHRoZSBoZWFkZXIgZmlsZSBhcmUgdGhlIG9u
bHkgcmVhbCBvbmVzCj4gbGVmdC4gT3RoZXJ3aXNlIGxvb2tzIGdvb2QuCj4gCj4gUmVnYXJkcywK
ClRoYW5rcyEKQW5kaQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
