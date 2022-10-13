Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0921C10E4B6
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Oct 2022 07:40:31 +0000 (UTC)
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 13 Oct 2022 07:37:59 +0000
Message-ID: <cf87e0016c83d3c512bb91c17c813684d1cf5a49.camel@intel.com>
References: <20221011191525.20756-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20221011191525.20756-1-juhapekka.heikkila@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <E48559C13B73B145A858326DA8F1952F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_addfb_basic: avoid excessive
 logging on legacy format test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCAyMDIyLTEwLTExIGF0IDIyOjE1ICswMzAwLCBKdWhhLVBla2thIEhlaWtraWxhIHdy
b3RlOgo+IGxlZ2FjeSBmb3JtYXQgYWRkZmIgdGVzdCB0cnkgdG8gZnV6eiBrZXJuZWwgd2l0aCBy
YW5kb20gcGFyYW1ldGVycywKPiB0aGVzZSByYW5kb20gcGFyYW1ldGVycyBjYXVzZSBsb2dnaW5n
IGludG8gZG1lc2cuIExpbWl0IGZ1enppbmcKPiByb3VuZHMgdG8gbWF4aW11bSBvZiAxMGsgKG9y
IDEgc2Vjb25kKSB0byBsaW1pdCBzaXplIG9mIGNyZWF0ZWQgbG9nLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEp1aGEtUGVra2EgSGVpa2tpbGEgPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+CgpS
ZXZpZXdlZC1ieTogVmlub2QgR292aW5kYXBpbGxhaSA8dmlub2QuZ292aW5kYXBpbGxhaUBpbnRl
bC5jb20+Cgo+IC0tLQo+IMKgdGVzdHMva21zX2FkZGZiX2Jhc2ljLmMgfCA3ICsrKysrKysKPiDC
oDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMv
a21zX2FkZGZiX2Jhc2ljLmMgYi90ZXN0cy9rbXNfYWRkZmJfYmFzaWMuYwo+IGluZGV4IGFmYjRi
ZGY2Zi4uZjkxMTUzYjViIDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2ttc19hZGRmYl9iYXNpYy5jCj4g
KysrIGIvdGVzdHMva21zX2FkZGZiX2Jhc2ljLmMKPiBAQCAtMjQxLDYgKzI0MSwxMyBAQCBzdGF0
aWMgdm9pZCBpbnZhbGlkX3Rlc3RzKGludCBmZCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjb3VudCsrOwo+ICsKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiB0byBhdm9pZCBleGVzc2l2ZSBsb2dnaW5nIHN0b3Ag
YWZ0ZXIgMTBrIGxvb3BzCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgKi8KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGlmIChjb3VudCA+PSAxMDAwMCkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgfQo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiBB
ZnRlciBhbGwgdGhlIGFidXNlLCBjb25maXJtIHRoZSBrbm93bl9mb3JtYXRzICovCgo=
