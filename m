Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE44589BF5
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 13:37:10 +0000 (UTC)
Date: Tue, 13 Apr 2021 15:37:05 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210413133705.GB83024@zkempczy-mobl2>
References: <20210413084226.41287-1-zbigniew.kempczynski@intel.com>
 <20210413084226.41287-3-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210413084226.41287-3-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v33 02/39] lib/igt_list: Add
 igt_list_for_each_entry_safe_reverse
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

T24gVHVlLCBBcHIgMTMsIDIwMjEgYXQgMTA6NDE6NDlBTSArMDIwMCwgWmJpZ25pZXcgS2VtcGN6
ecWEc2tpIHdyb3RlOgo+IEZyb206IERvbWluaWsgR3J6ZWdvcnplayA8ZG9taW5pay5ncnplZ29y
emVrQGludGVsLmNvbT4KPiAKPiBBZGRlZCBzYWZlIHZlcnNpb24gb2YgcmV2ZXJzZWQgaXRlcmF0
aW9uIG92ZXIgaWd0X2xpc3QuCj4gCj4gU2lnbmVkLW9mZi1ieTogRG9taW5payBHcnplZ29yemVr
IDxkb21pbmlrLmdyemVnb3J6ZWtAaW50ZWwuY29tPgo+IENjOiBaYmlnbmlldyBLZW1wY3p5xYRz
a2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4KPiBDYzogQ2hyaXMgV2lsc29uIDxj
aHJpc0BjaHJpcy13aWxzb24uY28udWs+CgpUaGlzIHBhdGNoIGlzIGNvcnJlY3QgaW1vOgoKUmV2
aWV3ZWQtYnk6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50
ZWwuY29tPgoKLS0KWmJpZ25pZXcKCj4gLS0tCj4gIGxpYi9pZ3RfbGlzdC5oIHwgNiArKysrKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9saWIv
aWd0X2xpc3QuaCBiL2xpYi9pZ3RfbGlzdC5oCj4gaW5kZXggY2M5M2Q3YTBkLi5iZTYzZmQ4MDYg
MTAwNjQ0Cj4gLS0tIGEvbGliL2lndF9saXN0LmgKPiArKysgYi9saWIvaWd0X2xpc3QuaAo+IEBA
IC0xMDgsNiArMTA4LDEyIEBAIGJvb2wgaWd0X2xpc3RfZW1wdHkoY29uc3Qgc3RydWN0IGlndF9s
aXN0X2hlYWQgKmhlYWQpOwo+ICAJICAgICAmcG9zLT5tZW1iZXIgIT0gKGhlYWQpOwkJCQkJXAo+
ICAJICAgICBwb3MgPSBpZ3RfY29udGFpbmVyX29mKChwb3MpLT5tZW1iZXIucHJldiwgcG9zLCBt
ZW1iZXIpKQo+ICAKPiArI2RlZmluZSBpZ3RfbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlX3JldmVy
c2UocG9zLCB0bXAsIGhlYWQsIG1lbWJlcikJXAo+ICsJZm9yIChwb3MgPSBpZ3RfY29udGFpbmVy
X29mKChoZWFkKS0+cHJldiwgcG9zLCBtZW1iZXIpLAkJXAo+ICsJICAgICB0bXAgPSBpZ3RfY29u
dGFpbmVyX29mKChwb3MpLT5tZW1iZXIucHJldiwgdG1wLCBtZW1iZXIpOwlcCj4gKwkgICAgICZw
b3MtPm1lbWJlciAhPSAoaGVhZCk7CQkJCQlcCj4gKwkgICAgIHBvcyA9IHRtcCwJCQkJCQkJXAo+
ICsJICAgICB0bXAgPSBpZ3RfY29udGFpbmVyX29mKChwb3MpLT5tZW1iZXIucHJldiwgdG1wLCBt
ZW1iZXIpKQo+ICAKPiAgLyogSUdUIGN1c3RvbSBoZWxwZXJzICovCj4gIAo+IC0tIAo+IDIuMjYu
MAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
aWd0LWRldiBtYWlsaW5nIGxpc3QKPiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
