Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9166E44E
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Mar 2021 08:49:18 +0000 (UTC)
Date: Wed, 24 Mar 2021 10:49:59 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YFr9N8rLA43O3cDd@platvala-desk.ger.corp.intel.com>
References: <20210323181845.49571-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323181845.49571-1-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/api_intel_bb: Fix invalid munmap
 in render-ccs
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
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBNYXIgMjMsIDIwMjEgYXQgMDc6MTg6NDVQTSArMDEwMCwgWmJpZ25pZXcgS2VtcGN6
ecWEc2tpIHdyb3RlOgo+IEZpeCBidWcgd2hpY2ggbGVhZHMgdG8gU0lHU0VHViBpbiBhcGlfaW50
ZWxfYmJAcmVuZGVyLWNjcyB0ZXN0Lgo+IEluc3RlYWQgb2YgcG9pbnRlciB1bm1hcCB3YXMgZG9u
ZSBvbiBpbnRlbF9idWYgd2hhdCB3YXMgd3JvbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogWmJpZ25p
ZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+Cj4gQ2M6IFBl
dHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgo+IENjOiBDaHJpcyBXaWxzb24g
PGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KClJldmlld2VkLWJ5OiBQZXRyaSBMYXR2YWxhIDxw
ZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KCgo+IC0tLQo+ICB0ZXN0cy9pOTE1L2FwaV9pbnRlbF9i
Yi5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9hcGlfaW50ZWxfYmIuYyBiL3Rlc3RzL2k5
MTUvYXBpX2ludGVsX2JiLmMKPiBpbmRleCBjYzFkMWJlNmUuLjkxMTVkM2Y4ZiAxMDA2NDQKPiAt
LS0gYS90ZXN0cy9pOTE1L2FwaV9pbnRlbF9iYi5jCj4gKysrIGIvdGVzdHMvaTkxNS9hcGlfaW50
ZWxfYmIuYwo+IEBAIC0xMDY4LDcgKzEwNjgsNyBAQCBzdGF0aWMgdWludDMyX3QgY291bnRfY29t
cHJlc3NlZChpbnQgZ2VuLCBzdHJ1Y3QgaW50ZWxfYnVmICpidWYpCj4gIAkJaWYgKHB0cltidWYt
PmNjc1swXS5vZmZzZXQgKyBpXSkKPiAgCQkJY29tcHJlc3NlZCsrOwo+ICAKPiAtCW11bm1hcChi
dWYsIGludGVsX2J1Zl9ib19zaXplKGJ1ZikpOwo+ICsJbXVubWFwKHB0ciwgaW50ZWxfYnVmX2Jv
X3NpemUoYnVmKSk7Cj4gIAo+ICAJcmV0dXJuIGNvbXByZXNzZWQ7Cj4gIH0KPiAtLSAKPiAyLjI2
LjAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
