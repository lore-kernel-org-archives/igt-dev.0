Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD1F6F8EC
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 05:11:56 +0000 (UTC)
Date: Thu, 30 Jan 2020 06:11:54 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20200130051154.GA8026@zkempczy-desk.igk.intel.com>
References: <7ca4c47dcf1e463fab2d54a7fec7b04bb4cfdea4.1580358863.git.ashutosh.dixit@intel.com>
 <bd104efb959aeb6b752ef1be8a0d69a152952e1d.1580358863.git.ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bd104efb959aeb6b752ef1be8a0d69a152952e1d.1580358863.git.ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] benchmarks/gem_busy: use
 gem_mmap__device_coherent()
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
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBKYW4gMjksIDIwMjAgYXQgMDg6MzY6NDJQTSAtMDgwMCwgQXNodXRvc2ggRGl4aXQg
d3JvdGU6Cj4gVXNlIGdlbV9tbWFwX19kZXZpY2VfY29oZXJlbnQoKSBpbiBiZW5jaG1hcmtzL2dl
bV9idXN5IGZvciB1c2Ugd2l0aAo+IGRldmljZXMgd2l0aG91dCBhIG1hcHBhYmxlIGFwZXJ0dXJl
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFzaHV0b3NoIERpeGl0IDxhc2h1dG9zaC5kaXhpdEBpbnRl
bC5jb20+Cj4gLS0tCj4gIGJlbmNobWFya3MvZ2VtX2J1c3kuYyB8IDUgKy0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9iZW5jaG1hcmtzL2dlbV9idXN5LmMgYi9iZW5jaG1hcmtzL2dlbV9idXN5LmMKPiBpbmRleCAy
ZmIxZWRmOTguLjQwNWNjOWIwOSAxMDA2NDQKPiAtLS0gYS9iZW5jaG1hcmtzL2dlbV9idXN5LmMK
PiArKysgYi9iZW5jaG1hcmtzL2dlbV9idXN5LmMKPiBAQCAtMTg1LDEwICsxODUsNyBAQCBzdGF0
aWMgaW50IGxvb3AodW5zaWduZWQgcmluZywgaW50IHJlcHMsIGludCBuY3B1cywgdW5zaWduZWQg
ZmxhZ3MpCj4gIAlpZiAoZmxhZ3MgJiBXUklURSkKPiAgCQlvYmpbMF0uZmxhZ3MgPSBFWEVDX09C
SkVDVF9XUklURTsKPiAgCW9ialsxXS5oYW5kbGUgPSBnZW1fY3JlYXRlKGZkLCA0MDk2KTsKPiAt
CWlmIChnZW1fbW1hcF9faGFzX3djKGZkKSkKPiAtCQliYXRjaCA9IGdlbV9tbWFwX193YyhmZCwg
b2JqWzFdLmhhbmRsZSwgMCwgNDA5NiwgUFJPVF9XUklURSk7Cj4gLQllbHNlCj4gLQkJYmF0Y2gg
PSBnZW1fbW1hcF9fZ3R0KGZkLCBvYmpbMV0uaGFuZGxlLCA0MDk2LCBQUk9UX1dSSVRFKTsKPiAr
CWJhdGNoID0gZ2VtX21tYXBfX2RldmljZV9jb2hlcmVudChmZCwgb2JqWzFdLmhhbmRsZSwgMCwg
NDA5NiwgUFJPVF9XUklURSk7Cj4gIAlnZW1fc2V0X2RvbWFpbihmZCwgb2JqWzFdLmhhbmRsZSwK
PiAgCQkJSTkxNV9HRU1fRE9NQUlOX0dUVCwgSTkxNV9HRU1fRE9NQUlOX0dUVCk7Cj4gIAliYXRj
aFswXSA9IE1JX0JBVENIX0JVRkZFUl9FTkQ7Cj4gLS0gCj4gMi4yNS4wCj4KCkxHVE0uClJldmll
d2VkLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVs
LmNvbT4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
