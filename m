Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C196EADE
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Mar 2021 07:38:54 +0000 (UTC)
From: "Sharma, Swati2" <swati2.sharma@intel.com>
References: <20210305064421.23388-1-nidhi1.gupta@intel.com>
 <0cdc8f51-75c4-24ff-ba64-9bd4a47db478@intel.com>
Message-ID: <ab4b0bec-516e-0ee9-aaf2-a5dfb533885b@intel.com>
Date: Fri, 5 Mar 2021 13:08:49 +0530
MIME-Version: 1.0
In-Reply-To: <0cdc8f51-75c4-24ff-ba64-9bd4a47db478@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v2]
 tests/kms_rotation_crc@exhaust-fences: added check for HW detiler
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
To: Nidhi Gupta <nidhi1.gupta@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

VGhhbmtzIGZvciB0aGUgcGF0Y2guIFB1c2hlZC4KCk9uIDA1LU1hci0yMSAxMjo1OCBQTSwgU2hh
cm1hLCBTd2F0aTIgd3JvdGU6Cj4gTEdUTS4KPiBSZXZpZXdlZC1ieTogU3dhdGkgU2hhcm1hIDxz
d2F0aTIuc2hhcm1hQGludGVsLmNvbT4KPiAKPiBPbiAwNS1NYXItMjEgMTI6MTQgUE0sIE5pZGhp
IEd1cHRhIHdyb3RlOgo+PiBIVyBkZXRpbGVyIG5vdCBzdXBwb3J0ZWQgb24gcGxhdGZvcm1zIHcv
byBhcGVydHVyZS4KPj4gQWRkZWQgZmVhdHVyZSB0ZXN0IG1hY3JvIHRvIHF1ZXJ5IHRoZSBrZXJu
ZWwgZm9yIHRoZQo+PiBnbG9iYWwgZ3B1IGFwZXJ0dXJlIHNpemUuIEFwZXJ0dXJlIHNpemUgc2hv
dWxkIGJlCj4+IGdyZWF0ZXIgdGhhbiB6ZXJvIHRvIHN1cHBvcnQgSFcgZGV0aWxlciwgaWYgbm90
IHNraXAKPj4gdGhlIHRlc3QuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE5pZGhpIEd1cHRhIDxuaWRo
aTEuZ3VwdGFAaW50ZWwuY29tPgo+PiAtLS0KPj4gwqAgdGVzdHMva21zX3JvdGF0aW9uX2NyYy5j
IHwgMSArCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvdGVzdHMva21zX3JvdGF0aW9uX2NyYy5jIGIvdGVzdHMva21zX3JvdGF0aW9uX2NyYy5j
Cj4+IGluZGV4IGFkZGRiNjkwLi5iY2JiOWJkYyAxMDA2NDQKPj4gLS0tIGEvdGVzdHMva21zX3Jv
dGF0aW9uX2NyYy5jCj4+ICsrKyBiL3Rlc3RzL2ttc19yb3RhdGlvbl9jcmMuYwo+PiBAQCAtODg0
LDYgKzg4NCw3IEBAIHN0YXRpYyB2b2lkIAo+PiB0ZXN0X3BsYW5lX3JvdGF0aW9uX2V4aGF1c3Rf
ZmVuY2VzKGRhdGFfdCAqZGF0YSwKPj4gwqDCoMKgwqDCoCBpbnQgaTsKPj4gwqDCoMKgwqDCoCBp
Z3RfcmVxdWlyZShpZ3RfcGxhbmVfaGFzX3Byb3AocGxhbmUsIElHVF9QTEFORV9ST1RBVElPTikp
Owo+PiArwqDCoMKgIGlndF9yZXF1aXJlKGdlbV9hdmFpbGFibGVfZmVuY2VzKGRpc3BsYXktPmRy
bV9mZCkgPiAwKTsKPj4gwqDCoMKgwqDCoCBwcmVwYXJlX2NydGMoZGF0YSwgb3V0cHV0LCBwaXBl
LCBwbGFuZSwgZmFsc2UpOwo+Pgo+IAoKLS0gCn5Td2F0aSBTaGFybWEKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
