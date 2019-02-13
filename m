Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF946E704
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Feb 2019 00:23:27 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190212235437.1218-6-andi.shyti@intel.com>
References: <20190212235437.1218-1-andi.shyti@intel.com>
 <20190212235437.1218-6-andi.shyti@intel.com>
Message-ID: <155001739294.13414.4413937487335739365@skylake-alporthouse-com>
Date: Wed, 13 Feb 2019 00:23:13 +0000
Subject: Re: [igt-dev] [RFC PATCH v8 5/5] tests: gem_exec_basic: add
 "exec-ctx" buffer execution demo test
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
To: Andi Shyti <andi.shyti@intel.com>, IGT dev <igt-dev@lists.freedesktop.org>
Cc: Andi Shyti <andi@etezian.org>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbmRpIFNoeXRpICgyMDE5LTAyLTEyIDIzOjU0OjM2KQo+IFRoZSAiZXhlYy1jdHgi
IGlzIGEgZGVtbyBzdWJ0ZXN0IGluc2VydGVkIGluIHRoZSBnZW1fZXhlY19iYXNpYwo+IHRlc3Qu
IFRoZSBtYWluIGdvYWwgb2YgdGhlIHRlc3QgaXMgdG8gZ2V0IHRvIHRoZSBlbmdpbmVzIGJ5IHVz
aW5nCj4gdGhlIG5ldyBBUEkgYXMgaW1wbGVtZW50ZWQgaW4gaW4gY29tbWl0IDg3MDc5ZTA0ICgi
bGliOiBpbXBsZW1lbnQKPiBuZXcgZW5naW5lIGRpc2NvdmVyeSBpbnRlcmZhY2UiKS4KPiAKPiBU
aGUgImV4ZWMtY3R4IiBzdWJ0ZXN0IHNpbXBseSBnZXRzIHRoZSBsaXN0IG9mIGVuZ2luZXMsIGJp
bmRzCj4gdGhlbSB0byBhIGNvbnRleHQgYW5kIGV4ZWN1dGVzIGEgYnVmZmVyLiBUaGlzIGlzIGRv
bmUgdGhyb3VnaCBhCj4gbmV3ICJmb3JfZWFjaF9lbmdpbmVfY3R4IiBsb29wIHdoaWNoIGl0ZXJh
dGVzIHRocm91Z2ggdGhlCj4gZW5naW5lcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRpIFNoeXRp
IDxhbmRpLnNoeXRpQGludGVsLmNvbT4KPiAtLS0KPiAgdGVzdHMvaTkxNS9nZW1fZXhlY19iYXNp
Yy5jIHwgMTUgKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25z
KCspCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfYmFzaWMuYyBiL3Rlc3Rz
L2k5MTUvZ2VtX2V4ZWNfYmFzaWMuYwo+IGluZGV4IGRjYjgzODY0YjFjMS4uZGMyZDc5YTBjNzNi
IDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfYmFzaWMuYwo+ICsrKyBiL3Rlc3Rz
L2k5MTUvZ2VtX2V4ZWNfYmFzaWMuYwo+IEBAIC0xMzUsNiArMTM1LDIxIEBAIGlndF9tYWluCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgZ3R0KGZkLCBlLT5leGVjX2lkIHwgZS0+ZmxhZ3MpOwo+
ICAgICAgICAgfQo+ICAKPiArICAgICAgIGlndF9zdWJ0ZXN0KCJleGVjLWN0eCIpIHsKPiArICAg
ICAgICAgICAgICAgdWludDMyX3QgY3R4X2lkOwo+ICsgICAgICAgICAgICAgICBzdHJ1Y3QgaW50
ZWxfZXhlY3V0aW9uX2VuZ2luZTIgKmUyOwo+ICsgICAgICAgICAgICAgICBpbnQgaW5kZXhfbWFw
ID0gMDsKPiArCj4gKyAgICAgICAgICAgICAgIGlndF9yZXF1aXJlX2dlbV9lbmdpbmVfbGlzdChm
ZCk7Cj4gKyAgICAgICAgICAgICAgIGN0eF9pZCA9IGdlbV9jb250ZXh0X2NyZWF0ZShmZCk7Cj4g
Kwo+ICsgICAgICAgICAgICAgICBmb3JfZWFjaF9lbmdpbmUyKGZkLCBjdHhfaWQsIGUyKQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGlndF9hc3NlcnQoZ2VtX2hhc19yaW5nX2J5X2lkeChmZCwg
KytpbmRleF9tYXAsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGN0eF9pZCkpOwoKU2luY2UgdGhlIGl0ZXJhdG9yIGhlcmUgaXMgZTIsIGl0
IGxvb2tzIHF1aXRlIGFidXNpdmUgbm90IHRvIHVzZSB0aGUKaXRlcmF0b3IuLi4gSSBkb24ndCB0
aGluayB0aGlzIHNlcnZlcyBhcyBhIGdvb2QgZXhhbXBsZSBvZgpmb3JfZWFjaF9lbmdpbmUyKCku
Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
