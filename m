Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86D989760
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Nov 2020 13:02:24 +0000 (UTC)
Date: Mon, 9 Nov 2020 14:02:14 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20201109130214.GB30774@zkempczy-mobl2>
References: <20201109120632.389212-1-imre.deak@intel.com>
 <20201109120632.389212-2-imre.deak@intel.com>
 <160492372394.28777.4238415753044387552@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160492372394.28777.4238415753044387552@build.alporthouse.com>
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBOb3YgMDksIDIwMjAgYXQgMTI6MDg6NDNQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgSW1yZSBEZWFrICgyMDIwLTExLTA5IDEyOjA2OjMyKQo+ID4gSWYgdGhl
IGRlbHRhIG9mIGEgcmVsb2NhdGlvbiB0YXJnZXQgd3J0LiB0aGUgb2JqZWN0IGJhc2UgYWRkcmVz
cyBjcm9zc2VzCj4gPiB0aGUgNEdCIGFkZHJlc3MgYm91bmRhcnkgdGhlIHVwcGVyIDMyYml0IG9m
IHRoZSB0YXJnZXQgYWRkcmVzcyB3aWxsIGJlCj4gPiBpbmNvcnJlY3QsIGZpeCB0aGlzLgo+ID4g
Cj4gPiBDYzogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRl
bC5jb20+Cj4gPiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+Cj4gCj4gWmJp
Z25pZXcsIGZhbmN5IHdyaXRpbmcgYSB0ZXN0IGNhc2UgZm9yIHRoaXM/Cj4gLUNocmlzCgpTdXJl
LCBlbnF1ZXVlZC4gCgpBcGFydCBvZiBmaXggaXMgY29ycmVjdCAtIEkgdGhvdWdodCB3ZSdyZSBt
b3N0bHkgdXNpbmcgZGVsdGEKdG8gc2V0IHNvbWUgYml0cyBpbiBjb21tYW5kcy4gV2hhdCdzIHRo
ZSByZWFsIHVzYWdlPwoKLS0KWmJpZ25pZXcKCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBpZ3QtZGV2IG1haWxpbmcgbGlzdAo+IGlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dgo=
