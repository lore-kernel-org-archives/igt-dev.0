Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0EE8945B
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2019 13:27:37 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190305131611.2367-5-andi.shyti@intel.com>
References: <20190305131611.2367-1-andi.shyti@intel.com>
 <20190305131611.2367-5-andi.shyti@intel.com>
Message-ID: <155179244010.27405.17731016653746178909@skylake-alporthouse-com>
Date: Tue, 05 Mar 2019 13:27:20 +0000
Subject: Re: [igt-dev] [RFC PATCH v10 4/6] lib: ioctl_wrappers: reach
 engines by index as well
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
Cc: Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbmRpIFNoeXRpICgyMDE5LTAzLTA1IDEzOjE2OjA5KQo+IFdpdGggdGhlIG5ldyBl
bmdpbmUgcXVlcnkgbWV0aG9kIGVuZ2luZXMgYXJlIHJlYWNoYWJsZSB0aHJvdWdoCj4gYW4gaW5k
ZXggYW5kIGNvbnRleHQgdGhleSBhcmUgY29tYmluZWQgd2l0aC4KPiAKPiBUaGUgJ2dlbV9oYXNf
cmluZygpJyBiZWNvbWVzICdnZW1fY29udGV4dF9oYXNfZW5naW5lKCknIHRoYXQKPiByZXF1aXJl
cyB0aGUgaW5kZXggdGhhdCB0aGUgZW5naW5lIGlzIG1hcHBlZCB3aXRoaW4gdGhlIGRyaXZlci4K
PiAKPiBUaGUgcHJldmlvdXMgJ2dlbV9oYXNfcmluZygpJyBmdW5jdGlvbiBiZWNvbWVzIGEgd3Jh
cHBlciB0byB0aGUgbmV3Cj4gJ2dlbV9jb250ZXh0X2hhc19lbmdpbmUoKScuCj4gCj4gU2lnbmVk
LW9mZi1ieTogQW5kaSBTaHl0aSA8YW5kaS5zaHl0aUBpbnRlbC5jb20+Cj4gLS0tCj4gIGxpYi9p
b2N0bF93cmFwcGVycy5jIHwgNCArKystCj4gIGxpYi9pb2N0bF93cmFwcGVycy5oIHwgNCArKyst
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9saWIvaW9jdGxfd3JhcHBlcnMuYyBiL2xpYi9pb2N0bF93cmFwcGVycy5j
Cj4gaW5kZXggMzk5MjBmODcwN2QyLi5hMjU5N2UyODI3MDQgMTAwNjQ0Cj4gLS0tIGEvbGliL2lv
Y3RsX3dyYXBwZXJzLmMKPiArKysgYi9saWIvaW9jdGxfd3JhcHBlcnMuYwo+IEBAIC0xMjUyLDcg
KzEyNTIsNyBAQCB2b2lkIGlndF9yZXF1aXJlX2dlbShpbnQgZmQpCj4gICAgICAgICBpZ3RfcmVx
dWlyZV9mKGVyciA9PSAwLCAiVW5yZXNwb25zaXZlIGk5MTUvR0VNIGRldmljZVxuIik7Cj4gIH0K
PiAgCj4gLWJvb2wgZ2VtX2hhc19yaW5nKGludCBmZCwgdW5zaWduZWQgcmluZykKPiArYm9vbCBn
ZW1fY29udGV4dF9oYXNfZW5naW5lKGludCBmZCwgdW5zaWduZWQgcmluZywgdW5zaWduZWQgY3R4
KQoKZ2VtX2NvbnRleHRfaGFzX2VuZ2luZSA6PT4gY3R4LCBlbmdpbmUKCkFuZCByZWNsYWltIGZy
b20gaW9jdGxfd3JhcHBlcnMuCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXY=
