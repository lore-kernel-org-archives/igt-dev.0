Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A30C6EB9A
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Feb 2019 22:57:00 +0000 (UTC)
References: <20190215154202.26053-1-antonio.argenziano@intel.com>
 <155026185352.18261.8067419542114316140@skylake-alporthouse-com>
Message-ID: <71b337d7-9b87-8e31-526f-1b8379d377c0@intel.com>
Date: Fri, 15 Feb 2019 14:56:59 -0800
MIME-Version: 1.0
In-Reply-To: <155026185352.18261.8067419542114316140@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v5] tests/i915/gem_exec_schedule.c:
 Switch to gem_sync and gem_read
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
From: Antonio Argenziano via igt-dev <igt-dev@lists.freedesktop.org>
Reply-To: Antonio Argenziano <antonio.argenziano@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAxNS8wMi8xOSAxMjoxNywgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgQW50b25p
byBBcmdlbnppYW5vICgyMDE5LTAyLTE1IDE1OjQyOjAyKQo+PiB1c2UgSU9DVExzIGdlbV9yZWFk
IGZvciByZWFkaW5nIGFuZCwgZ2VtX3N5bmMgdG8gd2FpdCBvbiBhIGJhdGNoLCB0aGlzCj4+IHdp
bGwgaGVscCB0ZXN0aW5nIHBsYXRmb3JtcyB0aGF0IG1pZ2h0IG5vdCBleHBvc2UgZ3R0IG1hcHBp
bmcuCj4+Cj4+IHYyOgo+PiAgICAgICAgICAtIHVzZSBhIGxvY2FsIGhlbHBlciBmb3IgcmVhZGlu
ZyBmcm9tIEJPcy4gKENocmlzKQo+PiAgICAgICAgICAtIEFsd2F5cyBzeW5jIGJlZm9yZSByZWFk
aW5nLiAoQ2hyaXMpCj4+Cj4+IHYzOgo+PiAgICAgICAgICAtIEJldHRlciBoZWxwZXIgbmFtaW5n
LiAoQ2hyaXMpCj4+ICAgICAgICAgIC0gU3RhcnQgcmVhZCBmcm9tIGFjdHVhbCBvZmZzZXQuIChD
aHJpcykKPj4KPj4gdjQ6Cj4+ICAgICAgICAgIC0gQWx3YXlzIHVzZSBieXRlIHNpemUgaW4gaGVs
cGVyLiAoQ2hyaXMpCj4+Cj4+IHY1Ogo+PiAgICAgICAgICAtIEZpeCBieXRlPC0+Y291bnQgY29u
dmVyc2lvbi4gKENocmlzKQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbnRvbmlvIEFyZ2Vuemlhbm8g
PGFudG9uaW8uYXJnZW56aWFub0BpbnRlbC5jb20+Cj4+Cj4+IENjOiBDaHJpcyBXaWxzb24gPGNo
cmlzQGNocmlzLXdpbHNvbi5jby51az4KPiAKPiBTZWVtcyBzYWZlIG5vdyEKClRoYW5rcywgcHVz
aGVkLgoKQW50b25pbwoKPiBSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13
aWxzb24uY28udWs+Cj4gLUNocmlzCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldg==
