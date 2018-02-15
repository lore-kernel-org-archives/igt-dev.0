Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2886E510
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2018 13:53:15 +0000 (UTC)
References: <20180215123400.52281-1-maarten.lankhorst@linux.intel.com>
 <20180215124905.kv2qytryek62k4ow@platvala-desk.ger.corp.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <3ce1ce83-40b0-c2a9-1463-fc0380a34575@linux.intel.com>
Date: Thu, 15 Feb 2018 14:53:13 +0100
MIME-Version: 1.0
In-Reply-To: <20180215124905.kv2qytryek62k4ow@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_debugfs: Fix
 igt_pipe_get_crcs.
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMTUtMDItMTggb20gMTM6NDkgc2NocmVlZiBQZXRyaSBMYXR2YWxhOgo+IE9uIFRodSwgRmVi
IDE1LCAyMDE4IGF0IDAxOjMzOjU5UE0gKzAxMDAsIE1hYXJ0ZW4gTGFua2hvcnN0IHdyb3RlOgo+
PiByZWFkX2NyYyByZXR1cm5zIGFuIGVycm9yIGluc3RlYWQgb2YgMCBvbiB0aW1lb3V0IG5vdywg
c28gaGFuZGxlCj4+IHRoaXMgY29ycmVjdGx5LiBUaGlzIGlzIGEgc21hbGwgZXJyb3IgaW50cm9k
dWNlZCBpbgo+Pgo+PiBjb21taXQgN2Q0OGMwMjUyYzM4NGQxODMxOGRlODljNTQ4MTdiZGZlOWM4
MzJmYwo+PiBBdXRob3I6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51
eC5pbnRlbC5jb20+Cj4+IERhdGU6ICAgRnJpIEZlYiAyIDEzOjM0OjI1IDIwMTggKzAxMDAKPj4K
Pj4gICAgIGxpYi9pZ3RfZGVidWdmczogQWRkIGlndF9waXBlX2NyY19nZXRfc2luZ2xlIGFuZCBp
Z3RfcGlwZV9jcmNfZHJhaW4sIHY0Lgo+Pgo+PiBJdCBjYXVzZXMgdGhlIGttc19jaHZfY3Vyc29y
X2ZhaWwgdG8gdGFrZSAyNyBtaW51dGVzLCBzbyBmaXggdGhpcy4uCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+
Cj4gUmV2aWV3ZWQtYnk6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgo+
Cj4KPj4gLS0tCj4+ICBsaWIvaWd0X2RlYnVnZnMuYyB8IDUgKysrLS0KPj4gIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9s
aWIvaWd0X2RlYnVnZnMuYyBiL2xpYi9pZ3RfZGVidWdmcy5jCj4+IGluZGV4IGUyYjE1ZjliZGEw
Yi4uNGExMTk5ODVmMTAyIDEwMDY0NAo+PiAtLS0gYS9saWIvaWd0X2RlYnVnZnMuYwo+PiArKysg
Yi9saWIvaWd0X2RlYnVnZnMuYwo+PiBAQCAtNzk0LDEwICs3OTQsMTEgQEAgaWd0X3BpcGVfY3Jj
X2dldF9jcmNzKGlndF9waXBlX2NyY190ICpwaXBlX2NyYywgaW50IG5fY3JjcywKPj4gIAkJaW50
IHJldDsKPj4gIAo+PiAgCQlyZXQgPSByZWFkX2NyYyhwaXBlX2NyYywgY3JjKTsKPj4gKwkJaWYg
KHJldCA9PSAtRUFHQUlOKQo+PiArCQkJYnJlYWs7Cj4+ICsKPj4gIAkJaWYgKHJldCA8IDApCj4+
ICAJCQljb250aW51ZTsKPj4gLQkJaWYgKHJldCA9PSAwKQo+PiAtCQkJYnJlYWs7Cj4+ICAKPj4g
IAkJbisrOwo+PiAgCX0gd2hpbGUgKG4gPCBuX2NyY3MpOwo+PiAtLSAKPj4gMi4xNi4xCj4+Cj4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGlndC1k
ZXYgbWFpbGluZyBsaXN0Cj4+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgoKUHVzaGVk
IGZpcnN0IHBhdGNoLCB0aGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXYK
