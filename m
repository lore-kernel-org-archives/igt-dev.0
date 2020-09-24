Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9FA6EA7D
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2020 05:47:40 +0000 (UTC)
Date: Thu, 24 Sep 2020 07:47:35 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20200924054735.GA5125@zkempczy-mobl2>
References: <20200922115229.28371-1-dominik.grzegorzek@intel.com>
 <20200922115229.28371-17-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200922115229.28371-17-dominik.grzegorzek@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 16/25] tests/kms_psr2_su.c: Get rid
 of unused bufmgr
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
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBTZXAgMjIsIDIwMjAgYXQgMDE6NTI6MjBQTSArMDIwMCwgRG9taW5payBHcnplZ29y
emVrIHdyb3RlOgo+IFJlbW92YWwgb2YgYnVmbWdyIHRoYXQgd2FzIG9ubHkgc2V0IGJ1dCBub3Qg
dXNlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsuZ3J6
ZWdvcnpla0BpbnRlbC5jb20+Cj4gQ2M6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcu
a2VtcGN6eW5za2lAaW50ZWwuY29tPgo+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdp
bHNvbi5jby51az4KClJldmlld2VkLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3
LmtlbXBjenluc2tpQGludGVsLmNvbT4KCj4gLS0tCj4gIHRlc3RzL2ttc19wc3IyX3N1LmMgfCA3
IC0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL3Rlc3RzL2ttc19wc3IyX3N1LmMgYi90ZXN0cy9rbXNfcHNyMl9zdS5jCj4gaW5kZXggZDU0
OWQ5YTMuLjkyMTVjNTlkIDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2ttc19wc3IyX3N1LmMKPiArKysg
Yi90ZXN0cy9rbXNfcHNyMl9zdS5jCj4gQEAgLTMwLDcgKzMwLDYgQEAKPiAgI2luY2x1ZGUgPHN0
ZGlvLmg+Cj4gICNpbmNsdWRlIDxzdHJpbmcuaD4KPiAgI2luY2x1ZGUgPHN5cy90aW1lcmZkLmg+
Cj4gLSNpbmNsdWRlICJpbnRlbF9idWZtZ3IuaCIKPiAgCj4gIElHVF9URVNUX0RFU0NSSVBUSU9O
KCJUZXN0IFBTUjIgc2VsZWN0aXZlIHVwZGF0ZSIpOwo+ICAKPiBAQCAtNjUsNyArNjQsNiBAQCB0
eXBlZGVmIHN0cnVjdCB7Cj4gIAlpbnQgZHJtX2ZkOwo+ICAJaW50IGRlYnVnZnNfZmQ7Cj4gIAlp
Z3RfZGlzcGxheV90IGRpc3BsYXk7Cj4gLQlkcm1faW50ZWxfYnVmbWdyICpidWZtZ3I7Cj4gIAlk
cm1Nb2RlTW9kZUluZm8gKm1vZGU7Cj4gIAlpZ3Rfb3V0cHV0X3QgKm91dHB1dDsKPiAgCXN0cnVj
dCBpZ3RfZmIgZmJbMl07Cj4gQEAgLTI0NywxMCArMjQ1LDYgQEAgaWd0X21haW4KPiAgCQkJCQkg
ICAgICAgZGF0YS5kZWJ1Z2ZzX2ZkLCBQU1JfTU9ERV8yKSwKPiAgCQkJICAgICAgIlNpbmsgZG9l
cyBub3Qgc3VwcG9ydCBQU1IyXG4iKTsKPiAgCj4gLQkJZGF0YS5idWZtZ3IgPSBkcm1faW50ZWxf
YnVmbWdyX2dlbV9pbml0KGRhdGEuZHJtX2ZkLCA0MDk2KTsKPiAtCQlpZ3RfYXNzZXJ0KGRhdGEu
YnVmbWdyKTsKPiAtCQlkcm1faW50ZWxfYnVmbWdyX2dlbV9lbmFibGVfcmV1c2UoZGF0YS5idWZt
Z3IpOwo+IC0KPiAgCQlkaXNwbGF5X2luaXQoJmRhdGEpOwo+ICAKPiAgCQkvKiBUZXN0IGlmIFBT
UjIgY2FuIGJlIGVuYWJsZWQgKi8KPiBAQCAtMjg3LDcgKzI4MSw2IEBAIGlndF9tYWluCj4gIAo+
ICAJaWd0X2ZpeHR1cmUgewo+ICAJCWNsb3NlKGRhdGEuZGVidWdmc19mZCk7Cj4gLQkJZHJtX2lu
dGVsX2J1Zm1ncl9kZXN0cm95KGRhdGEuYnVmbWdyKTsKPiAgCQlkaXNwbGF5X2ZpbmkoJmRhdGEp
Owo+ICAJfQo+ICB9Cj4gLS0gCj4gMi4yMC4xCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldgo=
