Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0823898FA
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2019 16:39:04 +0000 (UTC)
References: <20190516143950.2379-1-lionel.g.landwerlin@intel.com>
 <20190516143950.2379-5-lionel.g.landwerlin@intel.com>
 <155803703764.12244.7038339565301348228@skylake-alporthouse-com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <226ace36-705b-0c24-ba1f-e1c3ee02be97@intel.com>
Date: Fri, 17 May 2019 17:39:03 +0100
MIME-Version: 1.0
In-Reply-To: <155803703764.12244.7038339565301348228@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 4/5] igt: add timeline test cases
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: Chunming Zhou <david1.zhou@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gMTYvMDUvMjAxOSAyMTowMywgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgTGlvbmVs
IExhbmR3ZXJsaW4gKDIwMTktMDUtMTYgMTU6Mzk6NDkpCj4+ICtzdGF0aWMgaW50Cj4+ICtfX3N5
bmNvYmpfdGltZWxpbmVfc2lnbmFsKGludCBmZCwgdWludDMyX3QgKmhhbmRsZXMsIHVpbnQ2NF90
ICpwb2ludHMsIHVpbnQzMl90IGNvdW50KQo+PiArewo+PiArICAgICAgIHN0cnVjdCBkcm1fc3lu
Y29ial90aW1lbGluZV9hcnJheSBhcnJheSA9IHsgMCB9Owo+IE5vdGUgeW91IGNhbiB1c2UgdGhl
IGdjYyB7fSBleHRlbnNpb24gaGVyZS4KPgo+PiArICAgICAgIGludCBlcnIgPSAwOwo+PiArCj4+
ICsgICAgICAgYXJyYXkuaGFuZGxlcyA9IHRvX3VzZXJfcG9pbnRlcihoYW5kbGVzKTsKPj4gKyAg
ICAgICBhcnJheS5wb2ludHMgPSB0b191c2VyX3BvaW50ZXIocG9pbnRzKTsKPj4gKyAgICAgICBh
cnJheS5jb3VudF9oYW5kbGVzID0gY291bnQ7Cj4+ICsgICAgICAgaWYgKGRybUlvY3RsKGZkLCBE
Uk1fSU9DVExfU1lOQ09CSl9USU1FTElORV9TSUdOQUwsICZhcnJheSkpCj4+ICsgICAgICAgICAg
ICAgICBlcnIgPSAtZXJybm87Cj4gQ2xlYXIgZXJybm8gYWZ0ZXJ3YXJkcywgaXQganVzdCBnZXRz
IGxlZnQgYXJvdW5kIGFuZCBtZXNzZXMgdXAgYXNzZXJ0Cj4gc3RyaW5ncy4KPgo+IFVzZSBpZ3Rf
YXNzdW1lKGVycikgb3RoZXJ3aXNlIFBldHJpIHdpbGwgaGF2ZSB0byBzaWxlbmNlIGNvdmVyaXR5
IGxhdGVyLgo+Cj4gVXNlIGlndF9pb2N0bCgpIGluc3RlYWQgb2YgZHJtSW9jdGwoKSBzbyB0aGF0
IHdlIGNhbiByZXBsYWNlIHRoZQo+IGRybUlvY3RsKCkgd2l0aCB0aGUgZmFuY3kgZXJyb3Ivc2ln
bmFsIGluamVjdGlvbiB3cmFwcGVycyBvciB3aGF0ZXZlcgo+IHRha2VzIG91ciBmYW5jeSBsYXRl
ci4KPiAtQ2hyaXMKPgpUaGFua3MsCgpBcHBsaWVkIHRoZSBjaGFuZ2VzIGxvY2FsbHksIHdpbGwg
cmVzZW5kIG5leHQgd2VlayBqdXN0IGluIGNhc2UgbW9yZSAKY29tbWVudHMgYXBwZWFyLgoKCi1M
aW9uZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
