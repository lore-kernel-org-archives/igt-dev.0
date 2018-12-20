Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ACA46E35F
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Dec 2018 12:04:43 +0000 (UTC)
References: <20181217130740.10826-1-petri.latvala@intel.com>
 <20181220120209.45fdrt4u5uw6l5br@ahiler-desk1.fi.intel.com>
From: Martin Peres <martin.peres@linux.intel.com>
Message-ID: <963f1a1f-71e7-b428-1bdd-9b1751324ecb@linux.intel.com>
Date: Thu, 20 Dec 2018 14:04:39 +0200
MIME-Version: 1.0
In-Reply-To: <20181220120209.45fdrt4u5uw6l5br@ahiler-desk1.fi.intel.com>
Content-Language: en-GB
Subject: Re: [igt-dev] [PATCH i-g-t v2] runner: Add explicit "notrun"
 results for tests that were not executed
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>, Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gMjAvMTIvMjAxOCAxNDowMiwgQXJrYWRpdXN6IEhpbGVyIHdyb3RlOgo+IE9uIE1vbiwgRGVj
IDE3LCAyMDE4IGF0IDAzOjA3OjQwUE0gKzAyMDAsIFBldHJpIExhdHZhbGEgd3JvdGU6Cj4+IFdo
ZW4gcG9zc2libGUsIGFsbCB0ZXN0cyB3ZSBrbm93IHdlIHdlcmUgZ29pbmcgdG8gYXR0ZW1wdCB0
byBleGVjdXRlCj4+IG5vdyBhcHBlYXIgaW4gdGhlIHJlc3VsdHMgYXMgIm5vdHJ1biIuIFRoZSBv
bmx5IGtub3duIGNhc2Ugd2hlcmUgaXQncwo+PiBub3QgcG9zc2libGUgdG8gYWRkIGFuIGV4cGxp
Y2l0ICJub3RydW4iIGlzIHdoZW4gcnVubmluZyBpbgo+PiBtdWx0aXBsZS1tb2RlLCBiZWNhdXNl
ICJubyBzdWJ0ZXN0cyIgYW5kICJydW4gYWxsIHN1YnRlc3RzLCB3ZSBkaWRuJ3QKPj4gbGlzdCB0
aGVtIGJlZm9yZWhhbmQiIGFyZSByZXByZXNlbnRlZCB0aGUgc2FtZS4KPj4KPj4gTm90ZTogQSBm
dW5jdGlvbiBjYWxsIGlzIGNvbW1lbnRlZCBvdXQgaW4gcmVzdWx0Z2VuLmMgYmVjYXVzZSBpdCBu
ZWVkcwo+PiB0aGUgZnVuY3Rpb24gdG8gZXhpc3QsIGFuZCB0aGF0J3MgaW4gYSBwYXRjaCB0aGF0
IGlzIHN0aWxsIGluIGZsaWdodC4KPj4KPj4gdjI6IFJlYmFzZSBhbmQgYWRqdXN0IHRvIGFscmVh
ZHkgbGFuZGVkIGpzb24gY2hhbmdlcwo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2YWxh
IDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KPj4gQ2M6IE1hcnRpbiBQZXJlcyA8bWFydGluLnBl
cmVzQGxpbnV4LmludGVsLmNvbT4KPj4gQ2M6IEFya2FkaXVzeiBIaWxlciA8YXJrYWRpdXN6Lmhp
bGVyQGludGVsLmNvbT4KPj4gQWNrZWQtYnk6IE1hcnRpbiBQZXJlcyA8bWFydGluLnBlcmVzQGxp
bnV4LmludGVsLmNvbT4KPiBSZXZpZXdlZC1ieTogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ou
aGlsZXJAaW50ZWwuY29tPgo+IAoKQW5kIHRoZSBmYWlsdXJlIGNhdWdodCBpbiBDSSBpcyBhY3R1
YWxseSBmcm9tIHRoaXMga25vd24gYnVnOgpodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3No
b3dfYnVnLmNnaT9pZD0xMDkxMTkKClNvLCBnb29kIGZvciBwdXNoaW5nIQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdApp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
