Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8FF8929B
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Apr 2019 16:10:34 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20190408155038.2389-1-ramalingam.c@intel.com>
 <0af7234a-5e45-c0fb-3f27-6201ee7fa15b@linux.intel.com>
In-Reply-To: <0af7234a-5e45-c0fb-3f27-6201ee7fa15b@linux.intel.com>
Message-ID: <155473982972.26510.15407723830372754424@skylake-alporthouse-com>
Date: Mon, 08 Apr 2019 17:10:29 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_mmap: test for non
 pagealingned mmaps
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
To: Ramalingam C <ramalingam.c@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOS0wNC0wOCAxNzowMTowMCkKPiAKPiBPbiAwOC8w
NC8yMDE5IDE2OjUwLCBSYW1hbGluZ2FtIEMgd3JvdGU6Cj4gPiBLZXJuZWwgc3VwcG9ydHMgdGhl
IG5vbiBwYWdlIGFsaWduZWQgbW1hcHMuIEhlbmNlIHRoaXMgbmV3IHN1YnRlc3QKPiAKPiBzL0tl
cm5lbC9pOTE1LyB0byBtYWtlIENocmlzIGhhcHB5LiBNYXliZSBhbHNvIGV4cGFuZCB3aXRoICJi
eSBtaXN0YWtlIiAKPiBhbmQgY2xhcmlmeSB0aGlzIGFwcGxpZXMgb25seSB0byBDUFUgV0MgbW1h
cCBmbGF2b3VyLgo+IAo+IFVubGVzcyBDaHJpcyBpcyBvYmplY3RpbmcgdG8gdGVzdGluZyB0aGlz
IHRvIHN0YXJ0IHdpdGg/CgpDb3JyZWN0LiBUaGlzIGlzIG5vdCBiZWhhdmlvdXIgd2UgZXhwZWN0
IHRvIGJlIGVuc2hyaW5lZCBpbiB0aGUgQUJJIGZvcgpmdXR1cmUgZ2VuZXJhdGlvbnMuCi1DaHJp
cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
