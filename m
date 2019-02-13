Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F206E703
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Feb 2019 00:19:29 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190212235437.1218-5-andi.shyti@intel.com>
References: <20190212235437.1218-1-andi.shyti@intel.com>
 <20190212235437.1218-5-andi.shyti@intel.com>
Message-ID: <155001714462.13414.756418260848193187@skylake-alporthouse-com>
Date: Wed, 13 Feb 2019 00:19:04 +0000
Subject: Re: [igt-dev] [RFC PATCH v8 4/5] lib: ioctl_wrappers: reach engines
 by index as well
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

UXVvdGluZyBBbmRpIFNoeXRpICgyMDE5LTAyLTEyIDIzOjU0OjM1KQo+IFdpdGggdGhlIG5ldyBl
bmdpbmUgcXVlcnkgbWV0aG9kIGVuZ2luZXMgYXJlIHJlYWNoYWJsZSB0aHJvdWdoCj4gYW4gaW5k
ZXggYW5kIGNvbnRleHQgdGhleSBhcmUgY29tYmluZWQgd2l0aC4KPiAKPiBUaGUgJ2dlbV9oYXNf
cmluZygpJyBiZWNvbWVzICdnZW1faGFzX3JpbmdfYnlfaWR4KCknIHRoYXQKPiByZXF1aXJlcyB0
aGUgaW5kZXggdGhhdCB0aGUgZW5naW5lIGlzIG1hcHBlZCB3aXRoIGluIHRoZSBkcml2ZXIuCj4g
Cj4gVGhlIHByZXZpb3VzIGZ1bmN0aW9uIGJlY29tZXMgYSB3cmFwcGVyIHRvIHRoZSBuZXcKPiAn
Z2VtX2hhc19yaW5nX2J5X2lkeCgpJy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRpIFNoeXRpIDxh
bmRpLnNoeXRpQGludGVsLmNvbT4KPiAtLS0KPiAgbGliL2lvY3RsX3dyYXBwZXJzLmMgfCAxMCAr
KysrKystLS0tCj4gIGxpYi9pb2N0bF93cmFwcGVycy5oIHwgIDQgKysrLQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
bGliL2lvY3RsX3dyYXBwZXJzLmMgYi9saWIvaW9jdGxfd3JhcHBlcnMuYwo+IGluZGV4IDQwNGMy
ZmJmOTM1NS4uMmRkODYwZGJkOWQ2IDEwMDY0NAo+IC0tLSBhL2xpYi9pb2N0bF93cmFwcGVycy5j
Cj4gKysrIGIvbGliL2lvY3RsX3dyYXBwZXJzLmMKPiBAQCAtMTQ2NSwxNCArMTQ2NSwxNCBAQCB2
b2lkIGlndF9yZXF1aXJlX2dlbShpbnQgZmQpCj4gICAgICAgICBpZ3RfcmVxdWlyZV9mKGVyciA9
PSAwLCAiVW5yZXNwb25zaXZlIGk5MTUvR0VNIGRldmljZVxuIik7Cj4gIH0KPiAgCj4gLWJvb2wg
Z2VtX2hhc19yaW5nKGludCBmZCwgdW5zaWduZWQgcmluZykKPiArYm9vbCBnZW1faGFzX3Jpbmdf
YnlfaWR4KGludCBmZCwgdW5zaWduZWQgaWR4LCB1bnNpZ25lZCByc3ZkMSkKCl9fZ2VtX2hhc19y
aW5nKGludCBmZCwgdWludDMyX3QgY3R4LCB1bnNpZ25lZCBpbnQgcmluZykKCiNkZWZpbmUgZ2Vt
X2hhc19yaW5nKGZkLCByaW5nKSBfX2dlbV9oYXNfcmluZyhmZCwgMCwgcmluZykKCiogbXV0dGVy
cyByc3ZkMSEKLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
