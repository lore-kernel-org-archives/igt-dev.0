Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70A66E83A
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2020 16:01:40 +0000 (UTC)
References: <20200421182237.7743-1-umesh.nerlige.ramappa@intel.com>
 <5559c6ff-8cba-7f84-0490-879a5dc3e2dc@intel.com>
 <20200422154745.GA27960@orsosgc001.amr.corp.intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <73157a64-e11a-b62e-0d2c-6ac8d9e4b320@intel.com>
Date: Wed, 22 Apr 2020 19:01:22 +0300
MIME-Version: 1.0
In-Reply-To: <20200422154745.GA27960@orsosgc001.amr.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/perf: Fix B0 counter check in
 gen12-mi-rpc
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
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gMjIvMDQvMjAyMCAxODo0NywgVW1lc2ggTmVybGlnZSBSYW1hcHBhIHdyb3RlOgo+IE9uIFR1
ZSwgQXByIDIxLCAyMDIwIGF0IDExOjA2OjI3UE0gKzAzMDAsIExpb25lbCBMYW5kd2VybGluIHdy
b3RlOgo+PiBPbiAyMS8wNC8yMDIwIDIxOjIyLCBVbWVzaCBOZXJsaWdlIFJhbWFwcGEgd3JvdGU6
Cj4+PiBUaGUgZ2VuMTItbWktcnBjIHRlc3QgY2hlY2tzIGZvciBCMCBjb3VudGVyIHRvIGJlIHpl
cm8sIGhvd2V2ZXIsCj4+PiBvY2Nhc3Npb25hbGx5IHRoZSBjb3VudGVyIHJlYWRzIGEgbm9uLXpl
cm8gdmFsdWUuIFRvIGVuc3VyZSB0aGUgdGVzdAo+Pj4gd29ya3MgYXMgZXhwZWN0ZWQsIHdlIGNo
ZWNrIEIwIHdpdGggdGhlIHByZXNldCB2YWx1ZS4KPj4KPj4KPj4gV2hhdCB0aGUgdmFsdWUgYmVp
bmcgcmVwb3J0ZWQ/Cj4+Cj4+Cj4+IFNvdW5kcyBsaWtlIHdlIHNob3VsZCBhc2sgYXJvdW5kIHNl
ZSBpZiB0aGVyZSBpc24ndCBhIGRlZXBlciBwcm9ibGVtIAo+PiB3aXRoIHRoZSBIVyBjb25maWd1
cmF0aW9uLgo+Pgo+Cj4gSSBoYXZlIHNlZW4gdmFsdWVzIDB4MTIxIGFuZCAweDFlYy4gVGhlIGlz
c3VlIG9jY3VycyBzb21ldGltZXMgb24gCj4gcmVib290cy4gU3Vic2VxdWVudCBydW5zIEkgc2Vl
IHRoYXQgdGhlIGNvdW50ZXIgaXMgMC4KPgo+IFRoYW5rcywKPiBVbWVzaAoKCk9oLi4uIEkgdGhv
dWdodCB0aGlzIHRlc3Qgd2FzIHVzaW5nIHNhbml0eV9jaGVja19yZXBvcnRzKCkgb24gZGVsdGFz
IApiZXR3ZWVuIDIgcmVwb3J0cy4KClllYWggSSBndWVzcyB5b3VyIGNoYW5nZSBpcyBmaW5lIHRo
ZW4uCgpUaGUgdGVzdCBjb3VsZCBiZSBpbXByb3ZlZCB3aXRoIHNhbml0eV9jaGVja19yZXBvcnRz
LgoKCi1MaW9uZWwKCgo+Cj4+Cj4+IC1MaW9uZWwKPj4KPj4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBVbWVzaCBOZXJsaWdlIFJhbWFwcGEgPHVtZXNoLm5lcmxpZ2UucmFtYXBwYUBpbnRlbC5jb20+
Cj4+PiBGaXhlczogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pbnRlbC8tL2lz
c3Vlcy8xMDg1Cj4+PiAtLS0KPj4+IMKgdGVzdHMvcGVyZi5jIHwgMiArLQo+Pj4gwqAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0
IGEvdGVzdHMvcGVyZi5jIGIvdGVzdHMvcGVyZi5jCj4+PiBpbmRleCBiN2Q1ZTUwZS4uOWQwZWQ0
NWMgMTAwNjQ0Cj4+PiAtLS0gYS90ZXN0cy9wZXJmLmMKPj4+ICsrKyBiL3Rlc3RzL3BlcmYuYwo+
Pj4gQEAgLTMwMDIsNyArMzAwMiw3IEBAIGdlbjEyX3Rlc3RfbWlfcnBjKHZvaWQpCj4+PiDCoMKg
wqDCoMKgICovCj4+PiDCoMKgwqDCoCBpZ3RfYXNzZXJ0X2VxKHJlcG9ydDMyWzBdLCBSRVBPUlRf
SUQpOwo+Pj4gwqDCoMKgwqAgaWd0X2Fzc2VydF9uZXEocmVwb3J0MzJbMV0sIDApOwo+Pj4gLcKg
wqDCoCBpZ3RfYXNzZXJ0X2VxKHJlcG9ydDMyW2Zvcm1hdC5iX29mZiA+PiAyXSwgMCk7Cj4+PiAr
wqDCoMKgIGlndF9hc3NlcnRfbmVxKHJlcG9ydDMyW2Zvcm1hdC5iX29mZiA+PiAyXSwgMHg4MDgw
ODA4MCk7Cj4+PiDCoMKgwqDCoCBpZ3RfYXNzZXJ0X2VxKHJlcG9ydDMyW2Zvcm1hdF9zaXplXzMy
XSwgMHg4MDgwODA4MCk7Cj4+PiDCoMKgwqDCoCBkcm1faW50ZWxfYm9fdW5tYXAoYm8pOwo+Pgo+
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
