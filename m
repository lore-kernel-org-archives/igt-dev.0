Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B1D6EB01
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2020 18:07:40 +0000 (UTC)
Date: Fri, 24 Apr 2020 11:07:24 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Message-ID: <20200424180724.GB27960@orsosgc001.amr.corp.intel.com>
References: <20200421182237.7743-1-umesh.nerlige.ramappa@intel.com>
 <5559c6ff-8cba-7f84-0490-879a5dc3e2dc@intel.com>
 <20200422154745.GA27960@orsosgc001.amr.corp.intel.com>
 <73157a64-e11a-b62e-0d2c-6ac8d9e4b320@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <73157a64-e11a-b62e-0d2c-6ac8d9e4b320@intel.com>
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBBcHIgMjIsIDIwMjAgYXQgMDc6MDE6MjJQTSArMDMwMCwgTGlvbmVsIExhbmR3ZXJs
aW4gd3JvdGU6Cj5PbiAyMi8wNC8yMDIwIDE4OjQ3LCBVbWVzaCBOZXJsaWdlIFJhbWFwcGEgd3Jv
dGU6Cj4+T24gVHVlLCBBcHIgMjEsIDIwMjAgYXQgMTE6MDY6MjdQTSArMDMwMCwgTGlvbmVsIExh
bmR3ZXJsaW4gd3JvdGU6Cj4+Pk9uIDIxLzA0LzIwMjAgMjE6MjIsIFVtZXNoIE5lcmxpZ2UgUmFt
YXBwYSB3cm90ZToKPj4+PlRoZSBnZW4xMi1taS1ycGMgdGVzdCBjaGVja3MgZm9yIEIwIGNvdW50
ZXIgdG8gYmUgemVybywgaG93ZXZlciwKPj4+Pm9jY2Fzc2lvbmFsbHkgdGhlIGNvdW50ZXIgcmVh
ZHMgYSBub24temVybyB2YWx1ZS4gVG8gZW5zdXJlIHRoZSB0ZXN0Cj4+Pj53b3JrcyBhcyBleHBl
Y3RlZCwgd2UgY2hlY2sgQjAgd2l0aCB0aGUgcHJlc2V0IHZhbHVlLgo+Pj4KPj4+Cj4+PldoYXQg
dGhlIHZhbHVlIGJlaW5nIHJlcG9ydGVkPwo+Pj4KPj4+Cj4+PlNvdW5kcyBsaWtlIHdlIHNob3Vs
ZCBhc2sgYXJvdW5kIHNlZSBpZiB0aGVyZSBpc24ndCBhIGRlZXBlciAKPj4+cHJvYmxlbSB3aXRo
IHRoZSBIVyBjb25maWd1cmF0aW9uLgo+Pj4KPj4KPj5JIGhhdmUgc2VlbiB2YWx1ZXMgMHgxMjEg
YW5kIDB4MWVjLiBUaGUgaXNzdWUgb2NjdXJzIHNvbWV0aW1lcyBvbiAKPj5yZWJvb3RzLiBTdWJz
ZXF1ZW50IHJ1bnMgSSBzZWUgdGhhdCB0aGUgY291bnRlciBpcyAwLgo+Pgo+PlRoYW5rcywKPj5V
bWVzaAo+Cj4KPk9oLi4uIEkgdGhvdWdodCB0aGlzIHRlc3Qgd2FzIHVzaW5nIHNhbml0eV9jaGVj
a19yZXBvcnRzKCkgb24gZGVsdGFzIAo+YmV0d2VlbiAyIHJlcG9ydHMuCj4KPlllYWggSSBndWVz
cyB5b3VyIGNoYW5nZSBpcyBmaW5lIHRoZW4uCj4KPlRoZSB0ZXN0IGNvdWxkIGJlIGltcHJvdmVk
IHdpdGggc2FuaXR5X2NoZWNrX3JlcG9ydHMuCj4KCkFncmVlZC4gRm9yIG5vdywgdGhlIHRlc3Qg
aXMgb25seSBjaGVja2luZyBpZiB0aGUgcmVwb3J0IGxhbmRlZCAKZW50aXJlbHkuIFBsZWFzZSBs
ZXQgbWUga25vdyBpZiB0aGlzIGlzIGdvb2QgZW5vdWdoIGZvciBhbiBSLWIuCgpUaGFua3MsClVt
ZXNoCgo+Cj4tTGlvbmVsCj4KPgo+Pgo+Pj4KPj4+LUxpb25lbAo+Pj4KPj4+Cj4+Pj4KPj4+PlNp
Z25lZC1vZmYtYnk6IFVtZXNoIE5lcmxpZ2UgUmFtYXBwYSA8dW1lc2gubmVybGlnZS5yYW1hcHBh
QGludGVsLmNvbT4KPj4+PkZpeGVzOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJt
L2ludGVsLy0vaXNzdWVzLzEwODUKPj4+Pi0tLQo+Pj4+wqB0ZXN0cy9wZXJmLmMgfCAyICstCj4+
Pj7CoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pj4+Cj4+
Pj5kaWZmIC0tZ2l0IGEvdGVzdHMvcGVyZi5jIGIvdGVzdHMvcGVyZi5jCj4+Pj5pbmRleCBiN2Q1
ZTUwZS4uOWQwZWQ0NWMgMTAwNjQ0Cj4+Pj4tLS0gYS90ZXN0cy9wZXJmLmMKPj4+PisrKyBiL3Rl
c3RzL3BlcmYuYwo+Pj4+QEAgLTMwMDIsNyArMzAwMiw3IEBAIGdlbjEyX3Rlc3RfbWlfcnBjKHZv
aWQpCj4+Pj7CoMKgwqDCoMKgICovCj4+Pj7CoMKgwqDCoCBpZ3RfYXNzZXJ0X2VxKHJlcG9ydDMy
WzBdLCBSRVBPUlRfSUQpOwo+Pj4+wqDCoMKgwqAgaWd0X2Fzc2VydF9uZXEocmVwb3J0MzJbMV0s
IDApOwo+Pj4+LcKgwqDCoCBpZ3RfYXNzZXJ0X2VxKHJlcG9ydDMyW2Zvcm1hdC5iX29mZiA+PiAy
XSwgMCk7Cj4+Pj4rwqDCoMKgIGlndF9hc3NlcnRfbmVxKHJlcG9ydDMyW2Zvcm1hdC5iX29mZiA+
PiAyXSwgMHg4MDgwODA4MCk7Cj4+Pj7CoMKgwqDCoCBpZ3RfYXNzZXJ0X2VxKHJlcG9ydDMyW2Zv
cm1hdF9zaXplXzMyXSwgMHg4MDgwODA4MCk7Cj4+Pj7CoMKgwqDCoCBkcm1faW50ZWxfYm9fdW5t
YXAoYm8pOwo+Pj4KPj4+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
Cg==
