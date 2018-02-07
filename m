Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A696E516
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2018 08:27:19 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180207002714.4892-1-antonio.argenziano@intel.com>
References: <20180207002714.4892-1-antonio.argenziano@intel.com>
Message-ID: <151799203311.17167.17071651480558225444@mail.alporthouse.com>
Date: Wed, 07 Feb 2018 08:27:13 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v6] lib: Move __gem_context_create to
 common ioctl wrapper library.
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
Cc: Antonio@freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTgtMDItMDcgMDA6Mjc6MTQpCj4gVGhpcyBw
YXRjaCBhZGRzIGEgY29udGV4dCBjcmVhdGlvbiBpb2N0bCB3cmFwcGVyIHRoYXQgcmV0dXJucyB0
aGUgZXJyb3IKPiBmb3IgdGhlIGNhbGxlciB0byBjb25zdW1lLiBNdWx0aXBsZSB0ZXN0cyB0aGF0
IGltcGxlbWVudGVkIHRoaXMgYWxyZWFkeSwKPiBoYXZlIGJlZW4gY2hhbmdlZCB0byB1c2UgdGhl
IG5ldyBsaWJyYXJ5IGZ1bmN0aW9uLgo+IAo+IHYyOgo+ICAgICAgICAgLSBBZGQgZ2VtX3JlcXVp
cmVfY29udGV4dHMoKSB0byBjaGVjayBmb3IgY29udGV4dHMgc3VwcG9ydCAoQ2hyaXMpCj4gCj4g
djM6Cj4gICAgICAgICAtIEFkZCBnZW1faGFzX2NvbnRleHRzIHRvIGNoZWNrIGZvciBjb250ZXh0
cyBzdXBwb3J0IGFuZCBjaGFuZ2UKPiAgICAgICAgICAgZ2VtX3JlcXVpcmVfY29udGV4dHMgdG8g
c2tpcCBpZiBjb250ZXN0cyBzdXBwb3J0IGlzIG5vdCBhdmFpbGFibGUuCj4gICAgICAgICAgIChD
aHJpcykKPiAKPiB2NDoKPiAgICAgICAgIC0gQ29zbWV0aWMgY2hhbmdlcyBhbmQgdXNlIGxpYiBm
dW5jdGlvbiBpbiBnZW1fY3R4X2NyZWF0ZSB3aGVyZQo+ICAgICAgICAgICBwb3NzaWJsZS4gKE1p
Y2hhbCkKPiAKPiB2NToKPiAgICAgICAgIC0gVXNlIGdlbV9jb250ZXh0c19yZXF1aXJlKCkgaW4g
dGVzdHMgYW5kIGZpeHR1cmVzLiAoQ2hyaXMpCj4gCj4gU2lnbmVkLW9mZi1ieTogQW50b25pbyBB
cmdlbnppYW5vIDxhbnRvbmlvLmFyZ2Vuemlhbm9AaW50ZWwuY29tPgo+IAo+IENjOiBDaHJpcyBX
aWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiBDYzogTWljaGHFgiBXaW5pYXJza2kg
PG1pY2hhbC53aW5pYXJza2lAaW50ZWwuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBNaWNoYcWCIFdp
bmlhcnNraSA8bWljaGFsLndpbmlhcnNraUBpbnRlbC5jb20+CgpQdXNoZWQgd2hpbGUgaXQgd2Fz
IHN0aWxsIGhvdC4gVGhhbmtzIGZvciBmaXhpbmcgdXAgdGhlIHJlcXVpcmVzLCB0aGF0CmhhcyBi
ZWVuIGJ1Z2dpbmcgbWUgZm9yIGEgZmV3IHllYXJzIQotQ2hyaXMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
