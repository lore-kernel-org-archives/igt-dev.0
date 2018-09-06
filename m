Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31AFF6E60B
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Sep 2018 08:51:04 +0000 (UTC)
References: <20180905090705.12829-1-chris@chris-wilson.co.uk>
 <764be659-3d3c-6f8b-da8d-ace2b49526f1@linux.intel.com>
 <153616042048.28292.14573089888419717635@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <92eaeb05-2d94-5b2c-eadb-4c1d54606b0d@linux.intel.com>
Date: Thu, 6 Sep 2018 09:51:00 +0100
MIME-Version: 1.0
In-Reply-To: <153616042048.28292.14573089888419717635@skylake-alporthouse-com>
Content-Language: en-GB
Subject: Re: [igt-dev] [PATCH i-g-t] lib/pm: Fail gracefully if CONFIG_PM is
 not built into the kernel
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDA1LzA5LzIwMTggMTY6MTMsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIFR2cnRr
byBVcnN1bGluICgyMDE4LTA5LTA1IDE2OjAxOjA0KQo+Pgo+PiBPbiAwNS8wOS8yMDE4IDEwOjA3
LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4+PiBXZSByZXBvcnQgdGhlIGZhaWx1cmUgZnJvbSBpZ3Rf
c2V0dXBfcnVudGltZV9wbSgpIHNvIHRoYXQgdGhlIGNhbGxlciBjYW4KPj4+IGRlY2lkZSBob3cg
dGhleSBtYXkgcHJvY2VlZCwgc28gcmVwbGFjZSB0aGUgaGFyZCBhc3NlcnQgd2l0aCB0aGUgZXJy
b3IKPj4+IHByb3BhZ2F0aW9uLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8
Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+Pj4gQ2M6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28u
dXJzdWxpbkBpbnRlbC5jb20+Cj4+PiBDYzogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29t
Pgo+Pj4gLS0tCj4+PiAgICBsaWIvaWd0X3BtLmMgfCAxNSArKysrKysrKysrLS0tLS0KPj4+ICAg
IDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pj4KPj4+
IGRpZmYgLS1naXQgYS9saWIvaWd0X3BtLmMgYi9saWIvaWd0X3BtLmMKPj4+IGluZGV4IDYxNTQ2
M2EwOC4uNDkwMjcyMzhiIDEwMDY0NAo+Pj4gLS0tIGEvbGliL2lndF9wbS5jCj4+PiArKysgYi9s
aWIvaWd0X3BtLmMKPj4+IEBAIC01MTEsMTIgKzUxMSwxNiBAQCBib29sIGlndF9zZXR1cF9ydW50
aW1lX3BtKHZvaWQpCj4+PiAgICAKPj4+ICAgICAgICBpZ3RfcG1fZW5hYmxlX2F1ZGlvX3J1bnRp
bWVfcG0oKTsKPj4+ICAgIAo+Pj4gLSAgICAgLyogT3VyIGltcGxlbWVudGF0aW9uIHVzZXMgYXV0
b3N1c3BlbmQuIFRyeSB0byBzZXQgaXQgdG8gMG1zIHNvIHRoZSB0ZXN0Cj4+PiAtICAgICAgKiBz
dWl0ZSBnb2VzIGZhc3RlciBhbmQgd2UgaGF2ZSBhIGhpZ2hlciBwcm9iYWJpbGl0eSBvZiB0cmln
Z2VyaW5nIHJhY2UKPj4+IC0gICAgICAqIGNvbmRpdGlvbnMuICovCj4+PiArICAgICAvKgo+Pj4g
KyAgICAgICogT3VyIGltcGxlbWVudGF0aW9uIHVzZXMgYXV0b3N1c3BlbmQuIFRyeSB0byBzZXQg
aXQgdG8gMG1zIHNvIHRoZQo+Pj4gKyAgICAgICogdGVzdCBzdWl0ZSBnb2VzIGZhc3RlciBhbmQg
d2UgaGF2ZSBhIGhpZ2hlciBwcm9iYWJpbGl0eSBvZgo+Pj4gKyAgICAgICogdHJpZ2dlcmluZyBy
YWNlIGNvbmRpdGlvbnMuCj4+PiArICAgICAgKi8KPj4+ICAgICAgICBmZCA9IG9wZW4oUE9XRVJf
RElSICIvYXV0b3N1c3BlbmRfZGVsYXlfbXMiLCBPX1JEV1IpOwo+Pj4gLSAgICAgaWd0X2Fzc2Vy
dF9mKGZkID49IDAsCj4+PiAtICAgICAgICAgICAgICAgICAgIkNhbid0IG9wZW4gIiBQT1dFUl9E
SVIgIi9hdXRvc3VzcGVuZF9kZWxheV9tc1xuIik7Cj4+PiArICAgICBpZiAoZmQgPCAwKSB7Cj4+
PiArICAgICAgICAgICAgIGlndF9wbV9hdWRpb19yZXN0b3JlX3J1bnRpbWVfcG0oKTsKPj4+ICsg
ICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+Pgo+PiBXb3J0aCByb2J1c3RpZnlpbmcgd2l0aCBh
biBpZ3RfYXNzZXJ0X2VxKGVycm5vLCBFTk9FTlQpID8KPiAKPiBZb3UgYXJlIGp1c3QgZHlpbmcg
dG8gZGVidWcgYWxsIHRoZSB0cmFuc2llbnQgRU5PTUVNIGFuZCBFTUZJTEUgYXJlbid0Cj4geW91
ISA6KQoKT3V0IG9mIG1lbW9yeSBvciBmaWxlIGRlc2NyaXB0b3JzIGR1cmluZyB0ZXN0IHN0YXJ0
IHJlYWxseT8gV2UgYXJlIGluIAp0ZXJyaWJsZSBzdGF0ZSB0aGVuLi4KClJlZ2FyZHMsCgpUdnJ0
a28KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
