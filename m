Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from 18.mo3.mail-out.ovh.net (18.mo3.mail-out.ovh.net
 [87.98.172.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7442489319
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2019 08:10:59 +0000 (UTC)
Received: from player711.ha.ovh.net (unknown [10.109.143.225])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id A4A2321A9B1
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2019 09:52:41 +0200 (CEST)
Date: Thu, 20 Jun 2019 10:52:32 +0300
From: Andi Shyti <andi@etezian.org>
Message-ID: <20190620075232.GA10328@jack.zhora.eu>
References: <20190619221911.2684-1-andi.shyti@intel.com>
 <f841495e-b5cd-9249-2d18-282885fb5945@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f841495e-b5cd-9249-2d18-282885fb5945@linux.intel.com>
Subject: Re: [igt-dev] [PATCH] lib/i915: gem_engine_topology: get eb flags
 from engine's coordiantes
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

SGkgVHZydGtvLAoKPiA+ICsJc3RydWN0IGludGVsX2V4ZWN1dGlvbl9lbmdpbmUyICplOwo+ID4g
Kwo+ID4gKwlmb3JfZWFjaF9jb250ZXh0X2VuZ2luZShmZCwgY3R4X2lkLCBlKQo+ID4gKwkJaWYg
KGNsYXNzID09IGUtPmNsYXNzICYmIGluc3RhbmNlID09IGUtPmluc3RhbmNlKQo+ID4gKwkJCXJl
dHVybiBlLT5mbGFnczsKPiAKPiBBbmQgbW9zdCBpbXBvcnRhbnQgZGlmZmVyZW5jZSwgSSB3b3Vs
ZG4ndCBjb25maWd1cmUgdGhlIGNvbnRleHQgZnJvbSB0aGlzIGhlbHBlci4gSW5zdGVhZCBJIHRo
aW5rIGFsbCB3ZSBuZWVkIGlzOgo+IAo+IGludCBnZW1fY29udGV4dF9nZXRfZWJfZmxhZ3MoaW50
IGZkLCB1aW50MzJfdCBjdHgsIHN0cnVjdCBpOTE1X2VuZ2luZV9jbGFzc19pbnN0YW5jZSBjaSkK
PiB7Cj4gCURFRklORV9DT05URVhUX0VOR0lORVNfUEFSQU0oZW5naW5lcywgcGFyYW0sIGN0eCwg
R0VNX01BWF9FTkdJTkVTKTsKPiAJaW50IHJldAo+IAo+IAlyZXQgPSBnZW1fdG9wb2xvZ3lfZ2V0
X3BhcmFtKGZkLCAmcGFyYW0pOwo+IAlpZiAocmV0KSB7Cj4gCQljb25zdCBzdHJ1Y3QgaW50ZWxf
ZXhlY3V0aW9uX2VuZ2luZTIgKmU7Cj4gCj4gCQkvKiBMZWdhY3kga2VybmVscy4gKi8KPiAJCV9f
Zm9yX2VhY2hfc3RhdGljX2VuZ2luZShlKSB7Cj4gCQkJaWYgKGUtPmNsYXNzID09IGNpLmVuZ2lu
ZV9jbGFzcyAmJgo+IAkJCSAgICBlLT5pbnN0YW5jZSA9PSBjaS5lbmdpbmVfaW5zdGFuY2UpCj4g
CQkJCXJldHVybiBlLT5mbGFnczsKPiAJCX0KPiAKPiAJCXJldHVybiAtRUlOVkFMOwo+IAl9Cj4g
Cj4gCS8qIEVuZ2luZSBtYXAgd2l0aCBubyBlbmdpbmVzLiAqLwo+IAlpZiAoIXBhcmFtLnNpemUp
Cj4gCQlyZXR1cm4gLUVJTlZBTDsKCnRoaXMgbWVhbnMgdGhhdCB0ZXN0cyBoYXZlIHJlc3BvbnNp
YmlsaXR5IHRvIGFsd2F5IGNyZWF0ZSBhCmNvbnRleHQgYW5kIGRvIHRoZSBtYXBwaW5nIGJlZm9y
ZSAod2UgaGF2ZW4ndCBhbHdheXMgYXNzdW1lZCBpdAppbiBvdGhlciB0ZXN0cykuCgo+IAkvKiBF
bmdpbmUgbWFwIGxvb2t1cC4gKi8KPiAJZm9yICh1bnNpZ25lZCBpbnQgaSA9IDA7IGkgPCBwYXJh
bS5zaXplOyBpKyspIHsKPiAJCWlmIChlbmdpbmVzLmVuZ2luZXNbaV0uZW5naW5lX2NsYXNzID09
IGNpLmVuZ2luZV9jbGFzcyAmJgo+IAkJICAgIGVuZ2luZXMuZW5naW5lc1tpXS5lbmdpbmVfaW5z
dGFuY2UgPT0gY2kuZW5naW5lX2luc3RhbmNlKQo+IAkJCXJldHVybiBpOwo+IAl9Cj4gCj4gCXJl
dHVybiAtRUlOVkFMOwo+IH0KClRoaXMgdmVyc2lvbiwgYSB0aGUgZW5kLCBiZWNvbWVzIGEgc2xp
bSB2ZXJzaW9uIG9mCidpbnRlbF9pbml0X2VuZ2luZV9saXN0Jywgd2l0aCB0aGUgb25seSBkaWZm
ZXJlbmNlIHRoYXQgaXQKd291bGRuJ3QgZG8gYW55IG1hcHBpbmcgKHdoaWNoIEkgYWdyZWUgd291
bGQgYmUgdG9vIG11Y2ggYnV0IHdlCmRpZCBpdCBpbiBvdGhlciB0ZXN0cyksIHRoYXQncyB3aHks
IGF0IHRoZSBlbmQgSSBwcmVmZXJyZWQgdGhlCnNob3J0IHZlcnNpb24gSSBzZW50LgoKT0ssIHdl
IGNhbiBkZWZpbml0ZWx5IGRvIGl0IHRoaXMgd2F5LCB0b28KCkFuZGkKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
