Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95AB6EB68
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2020 22:35:13 +0000 (UTC)
References: <20200421182237.7743-1-umesh.nerlige.ramappa@intel.com>
 <5559c6ff-8cba-7f84-0490-879a5dc3e2dc@intel.com>
 <20200422154745.GA27960@orsosgc001.amr.corp.intel.com>
 <73157a64-e11a-b62e-0d2c-6ac8d9e4b320@intel.com>
 <20200424180724.GB27960@orsosgc001.amr.corp.intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <0c68a5d3-35a2-3f94-e6a7-77cb1df7bb31@intel.com>
Date: Sat, 25 Apr 2020 01:34:56 +0300
MIME-Version: 1.0
In-Reply-To: <20200424180724.GB27960@orsosgc001.amr.corp.intel.com>
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

T24gMjQvMDQvMjAyMCAyMTowNywgVW1lc2ggTmVybGlnZSBSYW1hcHBhIHdyb3RlOgo+IE9uIFdl
ZCwgQXByIDIyLCAyMDIwIGF0IDA3OjAxOjIyUE0gKzAzMDAsIExpb25lbCBMYW5kd2VybGluIHdy
b3RlOgo+PiBPbiAyMi8wNC8yMDIwIDE4OjQ3LCBVbWVzaCBOZXJsaWdlIFJhbWFwcGEgd3JvdGU6
Cj4+PiBPbiBUdWUsIEFwciAyMSwgMjAyMCBhdCAxMTowNjoyN1BNICswMzAwLCBMaW9uZWwgTGFu
ZHdlcmxpbiB3cm90ZToKPj4+PiBPbiAyMS8wNC8yMDIwIDIxOjIyLCBVbWVzaCBOZXJsaWdlIFJh
bWFwcGEgd3JvdGU6Cj4+Pj4+IFRoZSBnZW4xMi1taS1ycGMgdGVzdCBjaGVja3MgZm9yIEIwIGNv
dW50ZXIgdG8gYmUgemVybywgaG93ZXZlciwKPj4+Pj4gb2NjYXNzaW9uYWxseSB0aGUgY291bnRl
ciByZWFkcyBhIG5vbi16ZXJvIHZhbHVlLiBUbyBlbnN1cmUgdGhlIHRlc3QKPj4+Pj4gd29ya3Mg
YXMgZXhwZWN0ZWQsIHdlIGNoZWNrIEIwIHdpdGggdGhlIHByZXNldCB2YWx1ZS4KPj4+Pgo+Pj4+
Cj4+Pj4gV2hhdCB0aGUgdmFsdWUgYmVpbmcgcmVwb3J0ZWQ/Cj4+Pj4KPj4+Pgo+Pj4+IFNvdW5k
cyBsaWtlIHdlIHNob3VsZCBhc2sgYXJvdW5kIHNlZSBpZiB0aGVyZSBpc24ndCBhIGRlZXBlciAK
Pj4+PiBwcm9ibGVtIHdpdGggdGhlIEhXIGNvbmZpZ3VyYXRpb24uCj4+Pj4KPj4+Cj4+PiBJIGhh
dmUgc2VlbiB2YWx1ZXMgMHgxMjEgYW5kIDB4MWVjLiBUaGUgaXNzdWUgb2NjdXJzIHNvbWV0aW1l
cyBvbiAKPj4+IHJlYm9vdHMuIFN1YnNlcXVlbnQgcnVucyBJIHNlZSB0aGF0IHRoZSBjb3VudGVy
IGlzIDAuCj4+Pgo+Pj4gVGhhbmtzLAo+Pj4gVW1lc2gKPj4KPj4KPj4gT2guLi4gSSB0aG91Z2h0
IHRoaXMgdGVzdCB3YXMgdXNpbmcgc2FuaXR5X2NoZWNrX3JlcG9ydHMoKSBvbiBkZWx0YXMgCj4+
IGJldHdlZW4gMiByZXBvcnRzLgo+Pgo+PiBZZWFoIEkgZ3Vlc3MgeW91ciBjaGFuZ2UgaXMgZmlu
ZSB0aGVuLgo+Pgo+PiBUaGUgdGVzdCBjb3VsZCBiZSBpbXByb3ZlZCB3aXRoIHNhbml0eV9jaGVj
a19yZXBvcnRzLgo+Pgo+Cj4gQWdyZWVkLiBGb3Igbm93LCB0aGUgdGVzdCBpcyBvbmx5IGNoZWNr
aW5nIGlmIHRoZSByZXBvcnQgbGFuZGVkIAo+IGVudGlyZWx5LiBQbGVhc2UgbGV0IG1lIGtub3cg
aWYgdGhpcyBpcyBnb29kIGVub3VnaCBmb3IgYW4gUi1iLgo+Cj4gVGhhbmtzLAo+IFVtZXNoCgoK
UmV2aWV3ZWQtYnk6IExpb25lbCBMYW5kd2VybGluIDxsaW9uZWwuZy5sYW5kd2VybGluQGludGVs
LmNvbT4KCgo+Cj4+Cj4+IC1MaW9uZWwKPj4KPj4KPj4+Cj4+Pj4KPj4+PiAtTGlvbmVsCj4+Pj4K
Pj4+Pgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBVbWVzaCBOZXJsaWdlIFJhbWFwcGEgCj4+
Pj4+IDx1bWVzaC5uZXJsaWdlLnJhbWFwcGFAaW50ZWwuY29tPgo+Pj4+PiBGaXhlczogaHR0cHM6
Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pbnRlbC8tL2lzc3Vlcy8xMDg1Cj4+Pj4+IC0t
LQo+Pj4+PiDCoHRlc3RzL3BlcmYuYyB8IDIgKy0KPj4+Pj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL3Rlc3Rz
L3BlcmYuYyBiL3Rlc3RzL3BlcmYuYwo+Pj4+PiBpbmRleCBiN2Q1ZTUwZS4uOWQwZWQ0NWMgMTAw
NjQ0Cj4+Pj4+IC0tLSBhL3Rlc3RzL3BlcmYuYwo+Pj4+PiArKysgYi90ZXN0cy9wZXJmLmMKPj4+
Pj4gQEAgLTMwMDIsNyArMzAwMiw3IEBAIGdlbjEyX3Rlc3RfbWlfcnBjKHZvaWQpCj4+Pj4+IMKg
wqDCoMKgwqAgKi8KPj4+Pj4gwqDCoMKgwqAgaWd0X2Fzc2VydF9lcShyZXBvcnQzMlswXSwgUkVQ
T1JUX0lEKTsKPj4+Pj4gwqDCoMKgwqAgaWd0X2Fzc2VydF9uZXEocmVwb3J0MzJbMV0sIDApOwo+
Pj4+PiAtwqDCoMKgIGlndF9hc3NlcnRfZXEocmVwb3J0MzJbZm9ybWF0LmJfb2ZmID4+IDJdLCAw
KTsKPj4+Pj4gK8KgwqDCoCBpZ3RfYXNzZXJ0X25lcShyZXBvcnQzMltmb3JtYXQuYl9vZmYgPj4g
Ml0sIDB4ODA4MDgwODApOwo+Pj4+PiDCoMKgwqDCoCBpZ3RfYXNzZXJ0X2VxKHJlcG9ydDMyW2Zv
cm1hdF9zaXplXzMyXSwgMHg4MDgwODA4MCk7Cj4+Pj4+IMKgwqDCoMKgIGRybV9pbnRlbF9ib191
bm1hcChibyk7Cj4+Pj4KPj4+Pgo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2Cg==
