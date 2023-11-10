Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6A610E93C
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Nov 2023 07:36:37 +0000 (UTC)
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Fri, 10 Nov 2023 07:35:43 +0000
Message-ID: <bd0dd6cae329d579704e566dae9fcec18ad6ba6e.camel@intel.com>
References: <20231110071624.1365998-1-kunal1.joshi@intel.com>
 <20231110071624.1365998-6-kunal1.joshi@intel.com>
In-Reply-To: <20231110071624.1365998-6-kunal1.joshi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <33DF6747B7BC2B4FAB7A7D1D77724E5C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 5/7] lib/igt_psr: modified psr_get_mode
 for pr compatability
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Murthy, Arun R" <arun.r.murthy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTExLTEwIGF0IDEyOjQ2ICswNTMwLCBLdW5hbCBKb3NoaSB3cm90ZToKPiBN
b2RpZmllZCBwc3JfZ2V0X21vZGUgZm9yIFBSX01PREUKPiAKPiBDYzogSm91bmkgSMO2Z2FuZGVy
IDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+Cj4gQ2M6IEFuaW1lc2ggTWFubmEgPGFuaW1lc2gu
bWFubmFAaW50ZWwuY29tPgo+IENjOiBBcnVuIFIgTXVydGh5IDxhcnVuLnIubXVydGh5QGludGVs
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBLdW5hbCBKb3NoaSA8a3VuYWwxLmpvc2hpQGludGVsLmNv
bT4KClJldmlld2VkLWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNv
bT4KPiAtLS0KPiDCoGxpYi9pZ3RfcHNyLmMgfCA0ICsrKy0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9w
c3IuYyBiL2xpYi9pZ3RfcHNyLmMKPiBpbmRleCA0MTA5N2I0OTYuLmE4ODJkNzc0ZiAxMDA2NDQK
PiAtLS0gYS9saWIvaWd0X3Bzci5jCj4gKysrIGIvbGliL2lndF9wc3IuYwo+IEBAIC0zODYsNyAr
Mzg2LDkgQEAgZW51bSBwc3JfbW9kZSBwc3JfZ2V0X21vZGUoaW50IGRlYnVnZnNfZmQpCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gUFNSX0RJU0FCTEVEOwo+IMKgwqDC
oMKgwqDCoMKgwqB9Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqBpZiAoc3Ryc3RyKGJ1ZiwgIlBTUjIg
c2VsZWN0aXZlIGZldGNoOiBlbmFibGVkIikpCj4gK8KgwqDCoMKgwqDCoMKgaWYgKHN0cnN0cihi
dWYsICJQYW5lbCBSZXBsYXkgRW5hYmxlZCIpKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqByZXR1cm4gUFJfTU9ERTsKPiArwqDCoMKgwqDCoMKgwqBlbHNlIGlmIChzdHJzdHIoYnVm
LCAiUFNSMiBzZWxlY3RpdmUgZmV0Y2g6IGVuYWJsZWQiKSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHJldHVybiBQU1JfTU9ERV8yX1NFTF9GRVRDSDsKPiDCoMKgwqDCoMKgwqDC
oMKgZWxzZSBpZiAoc3Ryc3RyKGJ1ZiwgIlBTUjIgZW5hYmxlZCIpKQo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIFBTUl9NT0RFXzI7Cgo=
