Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF106E3A9
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Feb 2019 01:02:39 +0000 (UTC)
Date: Wed, 13 Feb 2019 03:02:36 +0200
Message-ID: <20190213010236.GB4740@intel.intel>
References: <20190212235437.1218-1-andi.shyti@intel.com>
 <20190212235437.1218-6-andi.shyti@intel.com>
 <155001739294.13414.4413937487335739365@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <155001739294.13414.4413937487335739365@skylake-alporthouse-com>
Subject: Re: [igt-dev] [RFC PATCH v8 5/5] tests: gem_exec_basic: add
 "exec-ctx" buffer execution demo test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
From: Andi Shyti via igt-dev <igt-dev@lists.freedesktop.org>
Reply-To: Andi Shyti <andi.shyti@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: IGT dev <igt-dev@lists.freedesktop.org>, Andi Shyti <andi@etezian.org>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

SGkgQ2hyaXMsCgo+ID4gKyAgICAgICBpZ3Rfc3VidGVzdCgiZXhlYy1jdHgiKSB7Cj4gPiArICAg
ICAgICAgICAgICAgdWludDMyX3QgY3R4X2lkOwo+ID4gKyAgICAgICAgICAgICAgIHN0cnVjdCBp
bnRlbF9leGVjdXRpb25fZW5naW5lMiAqZTI7Cj4gPiArICAgICAgICAgICAgICAgaW50IGluZGV4
X21hcCA9IDA7Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgaWd0X3JlcXVpcmVfZ2VtX2VuZ2lu
ZV9saXN0KGZkKTsKPiA+ICsgICAgICAgICAgICAgICBjdHhfaWQgPSBnZW1fY29udGV4dF9jcmVh
dGUoZmQpOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgIGZvcl9lYWNoX2VuZ2luZTIoZmQsIGN0
eF9pZCwgZTIpCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBpZ3RfYXNzZXJ0KGdlbV9oYXNf
cmluZ19ieV9pZHgoZmQsICsraW5kZXhfbWFwLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGN0eF9pZCkpOwo+IAo+IFNpbmNlIHRoZSBp
dGVyYXRvciBoZXJlIGlzIGUyLCBpdCBsb29rcyBxdWl0ZSBhYnVzaXZlIG5vdCB0byB1c2UgdGhl
Cj4gaXRlcmF0b3IuLi4gSSBkb24ndCB0aGluayB0aGlzIHNlcnZlcyBhcyBhIGdvb2QgZXhhbXBs
ZSBvZgo+IGZvcl9lYWNoX2VuZ2luZTIoKS4KCkkgdGhvdWdodCBhYm91dCBoaWRpbmcgZTIgaW5z
aWRlIGZvcl9lYWNoX2VuZ2luZTIsIGJ1dCBJIGFsc28KdGhvdWdodCB0aGUgdXNlciBtaWdodCB3
YW50IHRvIHVzZSBpdCwgZS5nLjoKCiAgZm9yX2VhY2hfZW5naW5lMihmZCwgY3R4X2lkLCBlMikK
ICAgIHByaW50ZigiJXNcbiIsIGUyLT5uYW1lKTsKCmlmIEkga2VlcCBpdCBoaWRkZW4gdGhlbiwg
YWx0aG91Z2ggaXQncyB0aGVyZSwgaXQncyBub3QgdmlzaWJsZS4KQnV0LCB5ZXMsIEkgY2FuIGhp
ZGUgaXQgaW5zaWRlIHRoZSBmb3JfZWFjaF9lbmdpbmUyIGFuZCBwZXJoYXBzCmhhdmUgYW5vdGhl
ciBpdGVyYXRvciB3aGVyZSBlMiBpcyBtZWFudCB0byBiZSB1c2VkLgoKVGhhbmtzLApBbmRpCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
