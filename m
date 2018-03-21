Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475BC6E91E
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Mar 2018 12:01:36 +0000 (UTC)
Date: Wed, 21 Mar 2018 14:01:32 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20180321120132.GV5453@intel.com>
References: <20180321110948.11816-1-daniels@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180321110948.11816-1-daniels@collabora.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Don't fail if plane IN_FORMATS not
 present
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
To: Daniel Stone <daniels@collabora.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBNYXIgMjEsIDIwMTggYXQgMTE6MDk6NDhBTSArMDAwMCwgRGFuaWVsIFN0b25lIHdy
b3RlOgo+IGlndF9kaXNwbGF5X2luaXQoKSBub3cgdW5jb25kaXRpb25hbGx5IHRyaWVzIHRvIGdl
dCB0aGUgcGxhbmUgSU5fRk9STUFUUwo+IGJsb2IsIHdoaWNoIGNhdXNlcyBhIGhhcmQgYXNzZXJ0
IGZhaWx1cmUgaWYgd2UgZG9uJ3QgaGF2ZSB0aGUgcHJvcGVydHkKPiBwcmVzZW50LgoKVGhhdCdz
IHF1aXRlIG9kZC4gSSdtIHByZXR0eSBzdXJlIEkgdGVzdGVkIHRoaXMgd2l0aCBibG9iaWZpZXJz
IGRpc2FibGVkCmluIGk5MTUgd2hlbiBJIGRpZCBodHRwczovL3BhdGNod29yay5mcmVlZGVza3Rv
cC5vcmcvc2VyaWVzLzQwMTEzLyBidXQKc29tZWhvdyBJIGRpZCBub3QgaGl0IHRoYXQgYXNzZXJ0
LiBNYWtlcyBtZSB3b25kZXIgd2hhdCBJIGFjdHVhbGx5CnRlc3RlZC4KClJldmlld2VkLWJ5OiBW
aWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgoKPiAKPiBDaGVj
ayBpZiBpdCdzIHRoZXJlIGFuZCByZXR1cm4gZWFybHkgaWYgbm90Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IERhbmllbCBTdG9uZSA8ZGFuaWVsc0Bjb2xsYWJvcmEuY29tPgo+IEZpeGVzOiA5OGY3NjE0
YmQ3MjUgKCJsaWI6IFBhcnNlIHBsYW5lIElOX0ZPUk1BVFMgYmxvYmlmaWVycyBpbnRvIGEgbmlj
ZXIgZm9ybSIpCj4gQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRl
bC5jb20+Cj4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+IC0t
LQo+ICBsaWIvaWd0X2ttcy5jIHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvaWd0X2ttcy5jIGIvbGliL2lndF9rbXMuYwo+IGlu
ZGV4IDcyMjI2NDJlLi45MzI0MDQyNyAxMDA2NDQKPiAtLS0gYS9saWIvaWd0X2ttcy5jCj4gKysr
IGIvbGliL2lndF9rbXMuYwo+IEBAIC0zOTU3LDYgKzM5NTcsOSBAQCBzdGF0aWMgdm9pZCBpZ3Rf
ZmlsbF9wbGFuZV9mb3JtYXRfbW9kKGlndF9kaXNwbGF5X3QgKmRpc3BsYXksIGlndF9wbGFuZV90
ICpwbGFuZQo+ICAJaW50IGlkeCA9IDA7Cj4gIAlpbnQgY291bnQ7Cj4gIAo+ICsJaWYgKCFpZ3Rf
cGxhbmVfaGFzX3Byb3AocGxhbmUsIElHVF9QTEFORV9JTl9GT1JNQVRTKSkKPiArCQlyZXR1cm47
Cj4gKwo+ICAJYmxvYl9pZCA9IGlndF9wbGFuZV9nZXRfcHJvcChwbGFuZSwgSUdUX1BMQU5FX0lO
X0ZPUk1BVFMpOwo+ICAKPiAgCWJsb2IgPSBkcm1Nb2RlR2V0UHJvcGVydHlCbG9iKGRpc3BsYXkt
PmRybV9mZCwgYmxvYl9pZCk7Cj4gLS0gCj4gMi4xNi4yCgotLSAKVmlsbGUgU3lyasOkbMOkCklu
dGVsIE9UQwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
