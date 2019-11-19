Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33566E799
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2019 11:54:02 +0000 (UTC)
References: <20191119110117.13209-1-venkata.s.dhanalakota@intel.com>
 <157416170876.10169.1533103631591014444@skylake-alporthouse-com>
 <6a08f957-6897-0db2-1ee7-e2b49e40744e@linux.intel.com>
 <157416330678.10169.7529772480987205839@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <c300efbe-d283-1b83-434c-23b7bcfc5edc@linux.intel.com>
Date: Tue, 19 Nov 2019 11:41:46 +0000
MIME-Version: 1.0
In-Reply-To: <157416330678.10169.7529772480987205839@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] test/i915: gem_ctx_exec: Fix for
 using context engine map
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
To: Chris Wilson <chris@chris-wilson.co.uk>, Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDE5LzExLzIwMTkgMTE6MzUsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIFR2cnRr
byBVcnN1bGluICgyMDE5LTExLTE5IDExOjI0OjE3KQo+Pgo+PiBPbiAxOS8xMS8yMDE5IDExOjA4
LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4+PiBRdW90aW5nIFZlbmthdGEgU2FuZGVlcCBEaGFuYWxh
a290YSAoMjAxOS0xMS0xOSAxMTowMToxNikKPj4+PiBTaW5jZSBlbmdpbmVzIGFyZSBub3cgbG9v
a2VkIHVwIGJhc2VkIG9uIGNvbnRleHQgZW5naW5lIG1hcCwKPj4+PiBjb250ZXh0IHNob3VsZCBi
ZSBzZXR1cCB3aXRoIGVuZ2luZXMgYmVmb3JlIHVzaW5nIGluIGV4ZWNidWYuCj4+Pj4KPj4+PiBG
aXhlczogMWE3ZjJlNTkgaWd0KCJnZW1fY3R4X2V4ZWM6IHVzZSB0aGUgZ2VtX2VuZ2luZV90b3Bv
bG9neSIKPj4+Pgo+Pj4+IENjOiBBbmRpIFNoeXRpIDxhbmRpLnNoeXRpQGludGVsLmNvbT4KPj4+
PiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4+Pj4gQ2M6IFR2
cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBsaW51eC5pbnRlbC5jb20+Cj4+Pj4gU2lnbmVk
LW9mZi1ieTogVmVua2F0YSBTYW5kZWVwIERoYW5hbGFrb3RhIDx2ZW5rYXRhLnMuZGhhbmFsYWtv
dGFAaW50ZWwuY29tPgo+Pj4+IC0tLQo+Pj4+ICAgIHRlc3RzL2k5MTUvZ2VtX2N0eF9leGVjLmMg
fCAxICsKPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4+Pgo+Pj4+IGRp
ZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9jdHhfZXhlYy5jIGIvdGVzdHMvaTkxNS9nZW1fY3R4
X2V4ZWMuYwo+Pj4+IGluZGV4IDZjMmNkOTIyLi4yYmY0N2NmMiAxMDA2NDQKPj4+PiAtLS0gYS90
ZXN0cy9pOTE1L2dlbV9jdHhfZXhlYy5jCj4+Pj4gKysrIGIvdGVzdHMvaTkxNS9nZW1fY3R4X2V4
ZWMuYwo+Pj4+IEBAIC0xMzIsNiArMTMyLDcgQEAgc3RhdGljIHZvaWQgaW52YWxpZF9jb250ZXh0
KGludCBmZCwgY29uc3Qgc3RydWN0IGludGVsX2V4ZWN1dGlvbl9lbmdpbmUyICplLAo+Pj4+ICAg
ICAgICAgICBnZW1fZXhlY2J1ZihmZCwgJmV4ZWNidWYpOwo+Pj4+ICAgIAo+Pj4+ICAgICAgICAg
ICBjdHggPSBnZW1fY29udGV4dF9jcmVhdGUoZmQpOwo+Pj4+ICsgICAgICAgZ2VtX2NvbnRleHRf
c2V0X2FsbF9lbmdpbmVzKGZkLCBjdHgpOwo+Pj4KPj4+IElycmVsZXZhbnQuCj4+Cj4+IEkgZ3Vl
c3MgaXQgaXMgYSBiaXQsIGJ1dCBpdCBjb21wbGV0ZXMgdGhlIHRlc3QgY29udmVyc2lvbiB0byBi
ZSBjb3JyZWN0Lgo+PiBZb3Ugd291bGQgd2FudCB0byBzcGxpdCB0aGUgbGVnYWN5LXZzLW5ldyBl
bmdpbmUgc2VsZWN0aW9uIGluIHRoaXMgb25lPwo+IAo+IE5vLCB0aGVyZSBzaG91bGRuJ3QgYmUg
YSBwZXItZW5naW5lIGNvbXBvbmVudCB0byB0aGlzIHRlc3QgYXQgYWxsLgo+IFRoZSB3YXkgd2Ug
aGF2ZSBzZXBhcmF0ZWQgdGhlIGNvbnRleHQgc3RhdGUgaXMgdGhhdCBpdCBpcyBha2luIHRvIHRo
ZQo+IHByb2Nlc3Mgc3RhdGUuIE5vdyB3aGV0aGVyIG9yIG5vdCB0aGUgY29udGV4dCBoYXMgYW4g
ZW5naW5lIGlzIGFub3RoZXIKPiBxdWVzdGlvbiAoYW5kIGFuc3dlcmVkIGVsc2V3aGVyZSksIHRo
ZSBxdWVzdGlvbiBpcyBtb3N0IGNlcnRhaW5seSBub3QKPiB3aGV0aGVyIGFuIGVuZ2luZSBoYXMg
YSBjb250ZXh0IGFzIGlzIGJlaW5nIGFza2VkIGhlcmUuCgpPa2F5LCBvcHRpb24gMywgZHJvcCB0
aGUgcGVyLWVuZ2luZSBuYXR1cmUgb2YgdGhpcyBzdWJ0ZXN0IGFsdG9nZXRoZXIuCgpSZWdhcmRz
LAoKVHZydGtvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
