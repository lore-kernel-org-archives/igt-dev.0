Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA546E216
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Apr 2018 17:55:15 +0000 (UTC)
Message-ID: <1523296514.2939.8.camel@intel.com>
From: Paulo Zanoni <paulo.r.zanoni@intel.com>
Date: Mon, 09 Apr 2018 10:55:14 -0700
In-Reply-To: <20180406121907.22114-1-marta.lofstedt@intel.com>
References: <20180406121907.22114-1-marta.lofstedt@intel.com>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_frontbuffer_tracking: Save
 runtime by removing sleep.
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
To: Marta Lofstedt <marta.lofstedt@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

RW0gU2V4LCAyMDE4LTA0LTA2IMOgcyAxNToxOSArMDMwMCwgTWFydGEgTG9mc3RlZHQgZXNjcmV2
ZXU6Cj4gVGhlIGttc19mcm9udGJ1ZmZlcl90cmFja2luZ0Aqc3VzcGVuZCBzdWJ0ZXN0cyBzcGVu
ZCAyMCBzZWNvbmRzCj4gc2xlZXBpbmcgYXJvdW5kIGlndF9zeXN0ZW1fc3VzcGVuZF9hdXRvcmVz
dW1lLiBJIGZpbmQgbm8gb3RoZXIKPiBpZ3QgdGVzdCB0aGF0IHJlcXVpcmUgc2xlZXBpbmcgaW4g
cmVsYXRpb24gdG8gc3VzcGVuZC1yZXN1bWUsIHNvCj4gaXQgc2hvdWxkIGJlIHJlbW92ZWQuCgpJ
ZiwgYW5kIG9ubHkgaWYsIHlvdSBoYXZlIGRhdGEgc2hvd2luZyB0aGlzIHdvbid0IGNhdXNlIHBy
b2JsZW1zIG9uIENJOgpSZXZpZXdlZC1ieTogUGF1bG8gWmFub25pIDxwYXVsby5yLnphbm9uaUBp
bnRlbC5jb20+Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hcnRhIExvZnN0ZWR0IDxtYXJ0YS5sb2Zz
dGVkdEBpbnRlbC5jb20+Cj4gLS0tCj4gIHRlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5j
IHwgNCAtLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS90ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYwo+IGIvdGVzdHMva21zX2Zyb250
YnVmZmVyX3RyYWNraW5nLmMKPiBpbmRleCBhMjBlNzExOC4uZDI2MDc4Y2MgMTAwNjQ0Cj4gLS0t
IGEvdGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMKPiArKysgYi90ZXN0cy9rbXNfZnJv
bnRidWZmZXJfdHJhY2tpbmcuYwo+IEBAIC0yODMwLDE1ICsyODMwLDExIEBAIHN0YXRpYyB2b2lk
IHN1c3BlbmRfc3VidGVzdChjb25zdCBzdHJ1Y3QKPiB0ZXN0X21vZGUgKnQpCj4gIAlzdHJ1Y3Qg
bW9kZXNldF9wYXJhbXMgKnBhcmFtcyA9IHBpY2tfcGFyYW1zKHQpOwo+ICAKPiAgCXByZXBhcmVf
c3VidGVzdCh0LCBOVUxMKTsKPiAtCXNsZWVwKDUpOwo+ICAJaWd0X3N5c3RlbV9zdXNwZW5kX2F1
dG9yZXN1bWUoU1VTUEVORF9TVEFURV9NRU0sCj4gU1VTUEVORF9URVNUX05PTkUpOwo+IC0Jc2xl
ZXAoNSk7Cj4gIAlkb19hc3NlcnRpb25zKEFTU0VSVF9EUlJTX0xPVyk7Cj4gIAo+ICAJdW5zZXRf
YWxsX2NydGNzKCk7Cj4gLQlzbGVlcCg1KTsKPiAgCWlndF9zeXN0ZW1fc3VzcGVuZF9hdXRvcmVz
dW1lKFNVU1BFTkRfU1RBVEVfTUVNLAo+IFNVU1BFTkRfVEVTVF9OT05FKTsKPiAtCXNsZWVwKDUp
Owo+ICAJZG9fYXNzZXJ0aW9ucyhBU1NFUlRfRkJDX0RJU0FCTEVEIHwgQVNTRVJUX1BTUl9ESVNB
QkxFRCB8Cj4gIAkJICAgICAgRE9OVF9BU1NFUlRfQ1JDIHwgQVNTRVJUX0RSUlNfSU5BQ1RJVkUp
Owo+ICAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
