Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D65A310E0E3
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 10:42:10 +0000 (UTC)
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Thu, 1 Jun 2023 10:42:02 +0000
Message-ID: <8c8f99e86bfd03f388491d9cd71f452cfc1b8e78.camel@intel.com>
References: <20230601050928.2487611-1-kunal1.joshi@intel.com>
 <20230601050928.2487611-4-kunal1.joshi@intel.com>
In-Reply-To: <20230601050928.2487611-4-kunal1.joshi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <A1CF2367DB984348AB5116B6537107A6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/6] RFC
 tests/i915/kms_frontbuffer_tracking: xe doesn't support tiling as of now
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

T24gVGh1LCAyMDIzLTA2LTAxIGF0IDEwOjM5ICswNTMwLCBLdW5hbCBKb3NoaSB3cm90ZToKPiBY
RSBkb2Vzbid0IHN1cHBvcnQgdGlsaW5nIGFzIG9mIG5vdywgc28gc2V0IHRpbGluZyB0byBsaW5l
YXIKCk1heWJlIHRoaXMgc2hvdWxkIGJlIHRha2VuIGludG8gYWNjb3VudCBpbiBvcHRfaGFuZGxl
ciBhcyB3ZWxsPyBJLmUuClRyeWluZyB0byB1c2UgdGlsaW5nIG90aGVyIHRoYW4gbGluZXIgZm9y
IFhlIHNob3VsZCByZXN1bHQgZXJyb3IuCgo+IAo+IHYyOiBtaXNzZWQgb25lIHRpbGluZyBjYXNl
Cj4gCj4gU2lnbmVkLW9mZi1ieTogS3VuYWwgSm9zaGkgPGt1bmFsMS5qb3NoaUBpbnRlbC5jb20+
Cj4gLS0tCj4gwqB0ZXN0cy9pOTE1L2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jIHwgOSArKysr
KysrKysKPiDCoDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvdGVzdHMvaTkxNS9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYwo+IGIvdGVzdHMvaTkxNS9r
bXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYwo+IGluZGV4IDNiZWY0NmI2Li5kZTFhODJhOSAxMDA2
NDQKPiAtLS0gYS90ZXN0cy9pOTE1L2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jCj4gKysrIGIv
dGVzdHMvaTkxNS9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYwo+IEBAIC0xMzQ5LDYgKzEzNDks
MTIgQEAgc3RhdGljIHZvaWQgc2V0dXBfZHJtKHZvaWQpCj4gwqDCoMKgwqDCoMKgwqDCoCAqLwo+
IMKgwqDCoMKgwqDCoMKgwqBpc194ZSA9IGlzX3hlX2RldmljZShkcm0uZmQpOwo+IMKgCj4gK8Kg
wqDCoMKgwqDCoMKgLyoKPiArwqDCoMKgwqDCoMKgwqAgKiBYRSBvbmx5IHN1cHBvcnQgbGluZWFy
IHRpbGluZwo+ICvCoMKgwqDCoMKgwqDCoCAqLwo+ICvCoMKgwqDCoMKgwqDCoGlmIChpc194ZSkK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgb3B0LnRpbGluZyA9IFRJTElOR19MSU5F
QVI7Cj4gKwo+IMKgwqDCoMKgwqDCoMKgwqBrbXN0ZXN0X3NldF92dF9ncmFwaGljc19tb2RlKCk7
Cj4gwqDCoMKgwqDCoMKgwqDCoGlndF9kaXNwbGF5X3JlcXVpcmUoJmRybS5kaXNwbGF5LCBkcm0u
ZmQpOwo+IMKgCj4gQEAgLTM2NDIsNiArMzY0OCw5IEBAIGlndF9tYWluX2FyZ3MoIiIsIGxvbmdf
b3B0aW9ucywgaGVscF9zdHIsCj4gb3B0X2hhbmRsZXIsIE5VTEwpCj4gwqAKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmb3IgKHQudGlsaW5nID0gVElM
SU5HX0xJTkVBUjsgdC50aWxpbmcgPAo+IFRJTElOR19DT1VOVDsKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0LnRpbGluZysrKSB7Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgaWYgKGlzX3hlICYmIHQudGlsaW5nICE9Cj4gVElMSU5HX0xJTkVBUikKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgY29udGludWU7Cj4gKwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAodC50aWxpbmcgPT0gVElM
SU5HX1gpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjb250aW51ZTsKPiDCoAoK
