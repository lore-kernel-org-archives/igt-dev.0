Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972846E193
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2020 09:47:03 +0000 (UTC)
References: <20200925042613.18301-1-karthik.b.s@intel.com>
 <20200925042613.18301-2-karthik.b.s@intel.com>
 <20200925150806.GQ6112@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <e06e0eb4-ce07-8cce-363b-d5afe13e4425@intel.com>
Date: Tue, 29 Sep 2020 15:16:56 +0530
MIME-Version: 1.0
In-Reply-To: <20200925150806.GQ6112@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v11 1/2] lib/igt_ioctl_wrappers: Add
 igt_has_drm_cap ioctl wrapper
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
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: michel@daenzer.net, igt-dev@lists.freedesktop.org, daniel.vetter@intel.com, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiA5LzI1LzIwMjAgODozOCBQTSwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+IE9uIEZyaSwg
U2VwIDI1LCAyMDIwIGF0IDA5OjU2OjEyQU0gKzA1MzAsIEthcnRoaWsgQiBTIHdyb3RlOgo+PiBB
ZGQgYSBnZW5lcmljIGhlbHBlciBmb3IgRFJNX0lPQ1RMX0dFVF9DQVAgaW9jdGwuCj4+Cj4+IHYx
MDogLU5vIGNoYW5nZXMuCj4+Cj4+IHYxMTogLVBhc3MgY2FwIElEIGluc3RlYWQgb2YgdGhlIHdo
b2xlIHN0cnVjdHVyZS4gKFZpbGxlKQo+PiAgICAgICAtRml4IHRoZSBwYXRjaCBvcmRlcmluZy4g
KFZpbGxlKQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBLYXJ0aGlrIEIgUyA8a2FydGhpay5iLnNAaW50
ZWwuY29tPgo+PiAtLS0KPj4gICBsaWIvaW9jdGxfd3JhcHBlcnMuYyB8IDE3ICsrKysrKysrKysr
KysrKysrCj4+ICAgbGliL2lvY3RsX3dyYXBwZXJzLmggfCAgMSArCj4+ICAgMiBmaWxlcyBjaGFu
Z2VkLCAxOCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9saWIvaW9jdGxfd3JhcHBl
cnMuYyBiL2xpYi9pb2N0bF93cmFwcGVycy5jCj4+IGluZGV4IDM3ODEyODZkLi4zZjM1NjA5YSAx
MDA2NDQKPj4gLS0tIGEvbGliL2lvY3RsX3dyYXBwZXJzLmMKPj4gKysrIGIvbGliL2lvY3RsX3dy
YXBwZXJzLmMKPj4gQEAgLTEzMTgsMyArMTMxOCwyMCBAQCBpbnQgX19rbXNfYWRkZmIoaW50IGZk
LCB1aW50MzJfdCBoYW5kbGUsCj4+ICAgCj4+ICAgCXJldHVybiByZXQgPCAwID8gLWVycm5vIDog
cmV0Owo+PiAgIH0KPj4gKwo+PiArLyoqCj4+ICsgKiBpZ3RfaGFzX2RybV9jYXA6Cj4+ICsgKiBA
ZmQ6IE9wZW4gRFJNIGZpbGUgZGVzY3JpcHRvci4KPj4gKyAqIEBjYXA6IGRybV9nZXRfY2FwIHN0
cnVjdHVyZS4KPj4gKyAqCj4+ICsgKiBUaGlzIGhlbHBlciB2ZXJpZmllcyBpZiB0aGUgcGFzc2Vk
IGNhcCBpcyBzdXBwb3J0ZWQgYnkgdGhlIGtlcm5lbAo+PiArICoKPj4gKyAqIFJldHVybnM6IFdo
ZXRoZXIgdGhlIGNhcCBpcyBzdXBwb3J0ZWQgb3Igbm90Lgo+PiArICovCj4+ICtib29sIGlndF9o
YXNfZHJtX2NhcChpbnQgZmQsIHVpbnQ2NF90IGZsYWcpCj4gCj4gVGhlIGRvY3MgYW5kIGNvZGUg
aGVyZSBkb24ndCBtYXRjaC4gSSBmaXhlZCB0aGF0IHVwIGFuZAo+IHMvZmxhZy9jYXBhYmlsaXR5
LyBmb3IgY2xhcml0eS4KPiAKPiBUaGVyZSB3YXMgYWxzbyBhbiBpbnQgdnMuIHBvaW50ZXIgY29t
cGlsZXIgd2FybmluZyBpbiB0aGUKPiBvdGhyIHBhdGNoICB3aGljaCBJIGZpeGVkLgo+IAo+IFNl
cmllcyBwdXNoZWQgdG8gbWFzdGVyLiBUaGFua3MuCj4gCgpUaGFua3MgZm9yIHRoZSBtZXJnZS4K
ClRoYW5rcywKS2FydGhpay5CLlMKPj4gK3sKPj4gKwlzdHJ1Y3QgZHJtX2dldF9jYXAgY2FwID0g
eyAuY2FwYWJpbGl0eSA9IGZsYWcgfTsKPj4gKwo+PiArCWlndF9hc3NlcnQoZHJtSW9jdGwoZmQs
IERSTV9JT0NUTF9HRVRfQ0FQLCAmY2FwKSA9PSAwKTsKPj4gKwlyZXR1cm4gY2FwLnZhbHVlOwo+
PiArfQo+PiBkaWZmIC0tZ2l0IGEvbGliL2lvY3RsX3dyYXBwZXJzLmggYi9saWIvaW9jdGxfd3Jh
cHBlcnMuaAo+PiBpbmRleCA4NzBhYzhiNy4uZTBlYzIwM2QgMTAwNjQ0Cj4+IC0tLSBhL2xpYi9p
b2N0bF93cmFwcGVycy5oCj4+ICsrKyBiL2xpYi9pb2N0bF93cmFwcGVycy5oCj4+IEBAIC0xOTYs
NiArMTk2LDcgQEAgc3RydWN0IGxvY2FsX2RybV9tb2RlX2ZiX2NtZDIgewo+PiAgIAo+PiAgIGJv
b2wgaWd0X2hhc19mYl9tb2RpZmllcnMoaW50IGZkKTsKPj4gICB2b2lkIGlndF9yZXF1aXJlX2Zi
X21vZGlmaWVycyhpbnQgZmQpOwo+PiArYm9vbCBpZ3RfaGFzX2RybV9jYXAoaW50IGZkLCB1aW50
NjRfdCBmbGFnKTsKPj4gICAKPj4gICAvKioKPj4gICAgKiBfX2ttc19hZGRmYjoKPj4gLS0gCj4+
IDIuMjIuMAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
