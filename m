Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D654489991
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Nov 2020 12:08:47 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20201109120632.389212-2-imre.deak@intel.com>
References: <20201109120632.389212-1-imre.deak@intel.com>
 <20201109120632.389212-2-imre.deak@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 09 Nov 2020 12:08:43 +0000
Message-ID: <160492372394.28777.4238415753044387552@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_batchbuffer: Fix relocs
 across the 4GB address boundary
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
To: Imre Deak <imre.deak@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBJbXJlIERlYWsgKDIwMjAtMTEtMDkgMTI6MDY6MzIpCj4gSWYgdGhlIGRlbHRhIG9m
IGEgcmVsb2NhdGlvbiB0YXJnZXQgd3J0LiB0aGUgb2JqZWN0IGJhc2UgYWRkcmVzcyBjcm9zc2Vz
Cj4gdGhlIDRHQiBhZGRyZXNzIGJvdW5kYXJ5IHRoZSB1cHBlciAzMmJpdCBvZiB0aGUgdGFyZ2V0
IGFkZHJlc3Mgd2lsbCBiZQo+IGluY29ycmVjdCwgZml4IHRoaXMuCj4gCj4gQ2M6IFpiaWduaWV3
IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPgo+IENjOiBDaHJp
cyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiBTaWduZWQtb2ZmLWJ5OiBJbXJl
IERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+CgpaYmlnbmlldywgZmFuY3kgd3JpdGluZyBhIHRl
c3QgY2FzZSBmb3IgdGhpcz8KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldgo=
