Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3092989856
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Nov 2020 13:05:40 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20201109130214.GB30774@zkempczy-mobl2>
References: <20201109120632.389212-1-imre.deak@intel.com>
 <20201109120632.389212-2-imre.deak@intel.com>
 <160492372394.28777.4238415753044387552@build.alporthouse.com>
 <20201109130214.GB30774@zkempczy-mobl2>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 09 Nov 2020 13:05:29 +0000
Message-ID: <160492712972.28777.15098942844906841840@build.alporthouse.com>
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
To: zbigniew.kempczynski@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBaYmlnbmlldyBLZW1wY3p5xYRza2kgKDIwMjAtMTEtMDkgMTM6MDI6MTQpCj4gT24g
TW9uLCBOb3YgMDksIDIwMjAgYXQgMTI6MDg6NDNQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdyb3Rl
Ogo+ID4gUXVvdGluZyBJbXJlIERlYWsgKDIwMjAtMTEtMDkgMTI6MDY6MzIpCj4gPiA+IElmIHRo
ZSBkZWx0YSBvZiBhIHJlbG9jYXRpb24gdGFyZ2V0IHdydC4gdGhlIG9iamVjdCBiYXNlIGFkZHJl
c3MgY3Jvc3Nlcwo+ID4gPiB0aGUgNEdCIGFkZHJlc3MgYm91bmRhcnkgdGhlIHVwcGVyIDMyYml0
IG9mIHRoZSB0YXJnZXQgYWRkcmVzcyB3aWxsIGJlCj4gPiA+IGluY29ycmVjdCwgZml4IHRoaXMu
Cj4gPiA+IAo+ID4gPiBDYzogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5
bnNraUBpbnRlbC5jb20+Cj4gPiA+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNv
bi5jby51az4KPiA+ID4gU2lnbmVkLW9mZi1ieTogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwu
Y29tPgo+ID4gCj4gPiBaYmlnbmlldywgZmFuY3kgd3JpdGluZyBhIHRlc3QgY2FzZSBmb3IgdGhp
cz8KPiA+IC1DaHJpcwo+IAo+IFN1cmUsIGVucXVldWVkLiAKPiAKPiBBcGFydCBvZiBmaXggaXMg
Y29ycmVjdCAtIEkgdGhvdWdodCB3ZSdyZSBtb3N0bHkgdXNpbmcgZGVsdGEKPiB0byBzZXQgc29t
ZSBiaXRzIGluIGNvbW1hbmRzLiBXaGF0J3MgdGhlIHJlYWwgdXNhZ2U/CgpMYXJnZSBvZmZzZXRz
IHdvdWxkIG1vc3QgY29tbW9ubHkgYmUgdXNlZCBmb3Igc3Vic3VyZmFjZXMgb3IgYXV4aWxpYXJ5
CnN0YXRlIGNvbnRhaW5lZCB3aXRoaW4gb25lIGJ1ZmZlci4KLUNocmlzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
