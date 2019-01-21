Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1E689AB6
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jan 2019 11:43:02 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190121113338.31017-1-petri.latvala@intel.com>
References: <20190118103404.4330-1-petri.latvala@intel.com>
 <20190121113338.31017-1-petri.latvala@intel.com>
Message-ID: <154807088055.8776.13052297472694706722@skylake-alporthouse-com>
Date: Mon, 21 Jan 2019 11:41:20 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v3 01/21] lib: Introduce
 BUILD_BUG_ON_INVALID and igt_assume()
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBQZXRyaSBMYXR2YWxhICgyMDE5LTAxLTIxIDExOjMzOjM4KQo+IEJVSUxEX0JVR19P
Tl9JTlZBTElEKCkgaXMgYSBtYWNybyB0aGF0LCBsaWtlIHRoZSBrZXJuZWwgY291bnRlcnBhcnQs
Cj4gZXhwYW5kcyB0byBhbiBleHByZXNzaW9uIHRoYXQgZ2VuZXJhdGVzIG5vIGNvZGUuIFVzZWZ1
bCBmb3IgbWFraW5nCj4gc3VyZSBhbiBleHByZXNzaW9uIGlzIHZhbGlkIGNvZGUgd2hpbGUgcHJv
ZHVjaW5nIG5vIHNpZGUgZWZmZWN0cy4KPiAKPiBpZ3RfYXNzdW1lKCkgaXMgYW4gYXNzZXJ0LWxp
a2UgbWFjcm8gdGhhdCBpcyB1c2VkIHRvIGdpdmUgaGludHMgdG8KPiBzdGF0aWMgYW5hbHlzaXMg
b2YgY29kZS4gSWYgc3RhdGljIGFuYWx5c2lzIGlzIG5vdCB1c2VkIChhcyBkZXRlY3RlZAo+IGJ5
IFNUQVRJQ19BTkFMWVNJU19CVUlMRCksIGlndF9hc3N1bWUoKSBleHBhbmRzIHRvIGEKPiBCVUlM
RF9CVUdfT05fSU5WQUxJRCwgb3RoZXJ3aXNlIGV4cGFuZHMgdG8gYW4gYXNzZXJ0KCkuCj4gCj4g
djI6IE1ha2Ugc3VyZSB0aGUgZXhwcmVzc2lvbiBpbiBpZ3RfYXNzdW1lIGlzIHN0aWxsIHBhcnNl
ZCB3aXRob3V0Cj4gICAgIHN0YXRpYyBhbmFseXNpcy4gKENocmlzKQo+IAo+IHYzOiBBbHNvIGlu
dHJvZHVjZSBCVUlMRF9CVUdfT05fSU5WQUxJRCBhcyBzdGFuZGFsb25lCj4gCj4gU2lnbmVkLW9m
Zi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Cj4gQ2M6IEFya2Fk
aXVzeiBIaWxlciA8YXJrYWRpdXN6LmhpbGVyQGludGVsLmNvbT4KPiBDYzogQ2hyaXMgV2lsc29u
IDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gQ2M6IE1pY2hhxYIgV2luaWFyc2tpIDxtaWNo
YWwud2luaWFyc2tpQGludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNA
Y2hyaXMtd2lsc29uLmNvLnVrPgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2Cg==
