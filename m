Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426396E6BE
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Mar 2018 10:59:16 +0000 (UTC)
References: <20180313104512.51407-1-maarten.lankhorst@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <b4700e5b-a7dc-1a8d-ae46-3ee5ae8e5c43@linux.intel.com>
Date: Wed, 14 Mar 2018 11:59:13 +0100
MIME-Version: 1.0
In-Reply-To: <20180313104512.51407-1-maarten.lankhorst@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_frontbuffer_tracking: Respect
 mode when collecting CRCs.
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMTMtMDMtMTggb20gMTE6NDUgc2NocmVlZiBNYWFydGVuIExhbmtob3JzdDoKPiBTaWduZWQt
b2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwu
Y29tPgo+IFJlcG9ydGVkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51
az4KPiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gLS0tCj4g
IHRlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19mcm9udGJ1ZmZlcl90
cmFja2luZy5jIGIvdGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMKPiBpbmRleCBhMmFh
YjVjNzYyYWMuLjJiMjg3MDczMTNlMCAxMDA2NDQKPiAtLS0gYS90ZXN0cy9rbXNfZnJvbnRidWZm
ZXJfdHJhY2tpbmcuYwo+ICsrKyBiL3Rlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jCj4g
QEAgLTEzNzEsNiArMTM3MSw3IEBAIHN0YXRpYyB2b2lkIGluaXRfY3JjcyhlbnVtIHBpeGVsX2Zv
cm1hdCBmb3JtYXQsCj4gIAl9Cj4gIAo+ICAJaWd0X291dHB1dF9zZXRfcGlwZShwcmltX21vZGVf
cGFyYW1zLm91dHB1dCwgcHJpbV9tb2RlX3BhcmFtcy5waXBlKTsKPiArCWlndF9vdXRwdXRfb3Zl
cnJpZGVfbW9kZShwcmltX21vZGVfcGFyYW1zLm91dHB1dCwgcHJpbV9tb2RlX3BhcmFtcy5tb2Rl
KTsKPiAgCWZvciAociA9IDA7IHIgPCBwYXR0ZXJuLT5uX3JlY3RzOyByKyspIHsKPiAgCQlpZ3Rf
cGxhbmVfc2V0X2ZiKHByaW1fbW9kZV9wYXJhbXMucHJpbWFyeS5wbGFuZSwgJnRtcF9mYnNbcl0p
Owo+ICAJCWlndF9kaXNwbGF5X2NvbW1pdCgmZHJtLmRpc3BsYXkpOwoKUHVzaGVkIHdpdGggQ2hy
aXMnIGlyYyByLWIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
