Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD7C89C53
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Feb 2019 09:54:19 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190226002020.21550-1-antonio.argenziano@intel.com>
References: <20190226002020.21550-1-antonio.argenziano@intel.com>
Message-ID: <155117484487.24929.10245086846965787500@skylake-alporthouse-com>
Date: Tue, 26 Feb 2019 09:54:04 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/i915: Move mmap IOCTLs wrappers
 into separate file
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTktMDItMjYgMDA6MjA6MTkpCj4gTW92ZSBh
bGwgbW1hcCBmbGF2b3VycyBhbmQgc3VwcG9ydCBmdW5jdGlvbiB0byBzZXBhcmF0ZSBmaWxlIGlu
IGk5MTUKPiBmb2xkZXIuIFRoaXMgaGVscHMgd2l0aCBtb3ZpbmcgaTkxNSBzcGVjaWZpYyBmdW5j
dGlvbnMgYXdheSBmcm9tIGNvbW1vbgo+IGxpYnJhcmllcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBB
bnRvbmlvIEFyZ2Vuemlhbm8gPGFudG9uaW8uYXJnZW56aWFub0BpbnRlbC5jb20+Cj4gQ2M6IENo
cmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IC0tLQo+IGRpZmYgLS1naXQg
YS9saWIvaW9jdGxfd3JhcHBlcnMuaCBiL2xpYi9pb2N0bF93cmFwcGVycy5oCj4gaW5kZXggYjIy
YjM2YjAuLjU0NzAzMjM1IDEwMDY0NAo+IC0tLSBhL2xpYi9pb2N0bF93cmFwcGVycy5oCj4gKysr
IGIvbGliL2lvY3RsX3dyYXBwZXJzLmgKPiBAQCAtMzgsNiArMzgsNyBAQAo+ICAKPiAgI2luY2x1
ZGUgImk5MTUvZ2VtX2NvbnRleHQuaCIKPiAgI2luY2x1ZGUgImk5MTUvZ2VtX3NjaGVkdWxlci5o
Igo+ICsjaW5jbHVkZSAiaTkxNS9nZW1fbW1hbi5oIgoKTm9vb28hISEgSSBoYWRuJ3Qgc3BvdHRl
ZCB3ZSBjb21taXR0ZWQgdGhpcyBzaW4gYmVmb3JlLCBidXQgbm93IGl0IG11c3QKZ28hCi1DaHJp
cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
