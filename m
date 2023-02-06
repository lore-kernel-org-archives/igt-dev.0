Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD7B10E16B
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Feb 2023 08:14:36 +0000 (UTC)
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Mon, 6 Feb 2023 08:14:24 +0000
Message-ID: <4813573b164f9f77df77ed16bdefa08ca836d93b.camel@intel.com>
References: <20230125045522.18169-1-ville.syrjala@linux.intel.com>
 <20230125045522.18169-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20230125045522.18169-2-ville.syrjala@linux.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <AEEC27C0C904BE4E8BCE9ABD66EECFB1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 02/10] tools/intel_watermark: Don't do
 intel_register_access_fini() too early on hsw/bdw
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

T24gV2VkLCAyMDIzLTAxLTI1IGF0IDA2OjU1ICswMjAwLCBWaWxsZSBTeXJqYWxhIHdyb3RlOgo+
IEZyb206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4g
Cj4gVGhlIHRvb2wgd2lsbCBzZWdmYXVsdCBpZiB3ZSB0cnkgdG8gdGhlIFdNX0RCRyByZWFkL3dy
aXRlIGFmdGVyCj4gaW50ZWxfcmVnaXN0ZXJfYWNjZXNzX2ZpbmkoKS4gU28gbW92ZSBpbnRlbF9y
ZWdpc3Rlcl9hY2Nlc3NfZmluaSgpCj4gdG8gdGhlIHZlcnkgZW5kLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gLS0t
Cj4gwqB0b29scy9pbnRlbF93YXRlcm1hcmsuYyB8IDQgKystLQo+IMKgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBWaW5vZCBHb3Zp
bmRhcGlsbGFpIDx2aW5vZC5nb3ZpbmRhcGlsbGFpQGludGVsLmNvbT4KCj4gCj4gZGlmZiAtLWdp
dCBhL3Rvb2xzL2ludGVsX3dhdGVybWFyay5jIGIvdG9vbHMvaW50ZWxfd2F0ZXJtYXJrLmMKPiBp
bmRleCAxODE4ZDc5ZDBiZWUuLmQ2MTM3OWM2ZGM3ZiAxMDA2NDQKPiAtLS0gYS90b29scy9pbnRl
bF93YXRlcm1hcmsuYwo+ICsrKyBiL3Rvb2xzL2ludGVsX3dhdGVybWFyay5jCj4gQEAgLTY0NCw4
ICs2NDQsNiBAQCBzdGF0aWMgdm9pZCBpbGtfd21fZHVtcCh2b2lkKQo+IMKgwqDCoMKgwqDCoMKg
wqBpZiAoSVNfQlJPQURXRUxMKGRldmlkKSB8fCBJU19IQVNXRUxMKGRldmlkKSkKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHdtX21pc2MgPSByZWFkX3JlZygweDQ1MjYwKTsKPiDC
oAo+IC3CoMKgwqDCoMKgwqDCoGludGVsX3JlZ2lzdGVyX2FjY2Vzc19maW5pKCZtbWlvX2RhdGEp
Owo+IC0KPiDCoMKgwqDCoMKgwqDCoMKgZm9yIChpID0gMDsgaSA8IG51bV9waXBlczsgaSsrKQo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcHJpbnRmKCLCoMKgwqAgV01fUElQRV8l
YyA9IDB4JTA4eFxuIiwgcGlwZV9uYW1lKGkpLCB3bV9waXBlW2ldKTsKPiDCoMKgwqDCoMKgwqDC
oMKgaWYgKElTX0JST0FEV0VMTChkZXZpZCkgfHwgSVNfSEFTV0VMTChkZXZpZCkpIHsKPiBAQCAt
NzY1LDYgKzc2Myw4IEBAIHN0YXRpYyB2b2lkIGlsa193bV9kdW1wKHZvaWQpCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiBjbGVhciB0aGUgc3RpY2t5IGJpdHMgKi8KPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHdyaXRlX3JlZygweDQ1MjgwLCB3bV9kYmcpOwo+
IMKgwqDCoMKgwqDCoMKgwqB9Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGludGVsX3JlZ2lzdGVyX2Fj
Y2Vzc19maW5pKCZtbWlvX2RhdGEpOwo+IMKgfQo+IMKgCj4gwqBzdGF0aWMgdm9pZCB2bHZfd21f
ZHVtcCh2b2lkKQoK
