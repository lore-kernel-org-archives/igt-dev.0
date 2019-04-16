Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7820891F2
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2019 17:09:23 +0000 (UTC)
References: <20190416151128.2465-1-andi.shyti@intel.com>
 <20190416151128.2465-3-andi.shyti@intel.com>
 <155542807532.25605.2177591647583083834@skylake-alporthouse-com>
 <20190416152827.GA2611@intel.intel>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <fe5d2206-7163-4d99-6a55-7cfd22663662@linux.intel.com>
Date: Tue, 16 Apr 2019 18:09:20 +0100
MIME-Version: 1.0
In-Reply-To: <20190416152827.GA2611@intel.intel>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH v21 2/6] lib/i915: add gem_engine_topology
 library and for_each loop definition
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Andi Shyti <andi.shyti@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: IGT dev <igt-dev@lists.freedesktop.org>, Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDE2LzA0LzIwMTkgMTY6MjgsIEFuZGkgU2h5dGkgd3JvdGU6Cj4+PiArdm9pZCBnZW1fdW5z
ZXRfY29udGV4dF9lbmdpbmVzKGludCBmZCwgdWludDMyX3QgY3R4KQo+Pj4gK3sKPj4+ICsgICAg
ICAgZ2VtX2NvbnRleHRfZGVzdHJveShmZCwgY3R4KTsKPj4+ICt9Cj4+Cj4+IFRoYXQncyBhIGxp
dHRsZSBzdXJwcmlzaW5nLiBJIGNlcnRhaW5seSB3b3VsZCBub3QgZXhwZWN0IG15IGNvbnRleHQg
dG8KPj4gYmUgZGVzdHJveWVkIGp1c3QgdG8gcmVzZXQgdGhlIGVuZ2luZXMgYmFjayB0byBkZWZh
dWx0Lgo+Pgo+PiBPbiB0aGUgUnVzdHkgc2NhbGUgdGhhdCB3b3VsZCBiZQo+PiAJLTcuIFRoZSBv
YnZpb3VzIHVzZSBpcyB3cm9uZy4KPiAKPiBpZiBJIGhhdmUgYSBjb250ZXh0IGNyZWF0b3IgJ2dl
bV9tYWtlX2NvbnRleHRfc2V0X2FsbF9lbmdpbmVzKCknCj4gKHdoaWNoIHlvdSBhbHJlYWR5IGRp
ZG4ndCBsaWtlIGF0IHRoZSBwcmV2aW91cyB2ZXJzaW9uKSwgSSBzaG91bGQKPiBoYXZlIGEgY29u
dGV4dCBkZXN0cm95ZXIuCj4gCj4gSSB1bmRlcnN0YW5kIHlvdXIgY29uY2VybiwgSSB3aWxsIHJl
bW92ZSB0aGUgY29udGV4dCBjcmVhdGlvbiBhbmQKPiBkZXN0cnVjdGlvbiBmcm9tIGdlbV9lbmdp
bmVfdG9wb2xvZ3kuCgpZZXMgSSBvbmx5IGFza2VkIGZvciBhIGhlbHBlciB0byBjcmVhdGUgYSBk
ZWZhdWx0L2Z1bGwgZW5naW5lIG1hcCBvbiBhIApjb250ZXh0LiA6KSAoU28gb25lIGNhbGwgc2l0
ZSBkb2VzIG5vdCBoYXZlIHRvIGFidXNlIHRoZSAKaW50ZWxfaW5pdF9lbmdpbmVzIG9yIHNvLikK
ClJlZ2FyZHMsCgpUdnJ0a28KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
