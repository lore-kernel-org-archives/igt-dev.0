Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0D910E478
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Oct 2023 11:42:59 +0000 (UTC)
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Tue, 31 Oct 2023 11:42:39 +0000
Message-ID: <d5ce8fea8ba42396408b68c32c088d6de2819ccb.camel@intel.com>
References: <20231031080949.1145422-1-kunal1.joshi@intel.com>
 <20231031080949.1145422-5-kunal1.joshi@intel.com>
In-Reply-To: <20231031080949.1145422-5-kunal1.joshi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <95415E60A1D2E64583344E1C40CF6AED@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 4/7] lib/igt_psr: modified psr_set for
 pr compatability
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

T24gVHVlLCAyMDIzLTEwLTMxIGF0IDEzOjM5ICswNTMwLCBLdW5hbCBKb3NoaSB3cm90ZToKPiBN
b2RpZmllZCBwc3Jfc2V0IHRvIGFkZCBzdXBwb3J0IFBSX01PREUgYW5kCj4gUFJfTU9ERV9TRUxf
RkVUQ0gKPiAKPiBDYzogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+
Cj4gQ2M6IEFuaW1lc2ggTWFubmEgPGFuaW1lc2gubWFubmFAaW50ZWwuY29tPgo+IENjOiBBcnVu
IFIgTXVydGh5IDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBLdW5h
bCBKb3NoaSA8a3VuYWwxLmpvc2hpQGludGVsLmNvbT4KCkxldCdzIHNlZSB3aGF0IGFyZSB0aGUg
ZmluYWwgdmFsdWVzIGZvciBQUiBpbiBpOTE1X2VkcF9wc3JfZGVidWcKaW50ZXJmYWNlLiA1IGFu
ZCA2IGFyZSBvayBmb3Igbm93OgoKUmV2aWV3ZWQtYnk6IEpvdW5pIEjDtmdhbmRlciA8am91bmku
aG9nYW5kZXJAaW50ZWwuY29tPgoKPiAtLS0KPiDCoGxpYi9pZ3RfcHNyLmMgfCA2ICsrKysrKwo+
IMKgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9saWIv
aWd0X3Bzci5jIGIvbGliL2lndF9wc3IuYwo+IGluZGV4IDY2NWIyOGE3Ni4uYzJiMmE0MTQ4IDEw
MDY0NAo+IC0tLSBhL2xpYi9pZ3RfcHNyLmMKPiArKysgYi9saWIvaWd0X3Bzci5jCj4gQEAgLTE2
OCw2ICsxNjgsMTIgQEAgc3RhdGljIGJvb2wgcHNyX3NldChpbnQgZGV2aWNlLCBpbnQgZGVidWdm
c19mZCwKPiBpbnQgbW9kZSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNhc2Ug
UFNSX01PREVfMl9TRUxfRkVUQ0g6Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgZGVidWdfdmFsID0gIjB4NCI7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGNhc2UgUFJfTU9ERToKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGRlYnVnX3ZhbCA9ICIweDUiOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGNhc2UgUFJfTU9ERV9TRUxfRkVUQ0g6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZWJ1Z192YWwgPSAiMHg2IjsKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgZGVmYXVsdDoKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiBEaXNhYmxlcyBQU1IgKi8KPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZWJ1Z192YWwgPSAiMHgxIjsKCg==
