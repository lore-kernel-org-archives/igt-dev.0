Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F16656E158
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Mar 2021 16:40:40 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id dx17so3678048ejb.2
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Mar 2021 09:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210317144610.108372-1-zbigniew.kempczynski@intel.com>
 <20210317144610.108372-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210317144610.108372-2-zbigniew.kempczynski@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 17 Mar 2021 11:40:28 -0500
Message-ID: <CAOFGe97pMucpRHvYg3rg0kO=VcBVQ3t9sz4c_B2hc3DvSkzAyA@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v26 01/35] lib/igt_list: Add
 igt_list_del_init()
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
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEphc29uIEVrc3RyYW5kIDxqYXNvbkBqbGVrc3RyYW5kLm5ldD4KCk9uIFdl
ZCwgTWFyIDE3LCAyMDIxIGF0IDk6NDYgQU0gWmJpZ25pZXcgS2VtcGN6ecWEc2tpCjx6Ymlnbmll
dy5rZW1wY3p5bnNraUBpbnRlbC5jb20+IHdyb3RlOgo+Cj4gQWRkIGhlbHBlciBmdW5jdGlvbiBm
b3IgZGVsZXRlIGFuZCByZWluaXRpYWxpemUgbGlzdCBlbGVtZW50Lgo+Cj4gU2lnbmVkLW9mZi1i
eTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+
Cj4gQ2M6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgo+IENjOiBDaHJp
cyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiBSZXZpZXdlZC1ieTogQ2hyaXMg
V2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gLS0tCj4gIGxpYi9pZ3RfbGlzdC5j
IHwgNiArKysrKysKPiAgbGliL2lndF9saXN0LmggfCAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9saWIvaWd0X2xpc3QuYyBiL2xpYi9pZ3Rf
bGlzdC5jCj4gaW5kZXggNWUzMGIxOWI2Li4zN2FlMTM5YzQgMTAwNjQ0Cj4gLS0tIGEvbGliL2ln
dF9saXN0LmMKPiArKysgYi9saWIvaWd0X2xpc3QuYwo+IEBAIC00Niw2ICs0NiwxMiBAQCB2b2lk
IGlndF9saXN0X2RlbChzdHJ1Y3QgaWd0X2xpc3RfaGVhZCAqZWxlbSkKPiAgICAgICAgIGVsZW0t
PnByZXYgPSBOVUxMOwo+ICB9Cj4KPiArdm9pZCBpZ3RfbGlzdF9kZWxfaW5pdChzdHJ1Y3QgaWd0
X2xpc3RfaGVhZCAqZWxlbSkKPiArewo+ICsgICAgICAgaWd0X2xpc3RfZGVsKGVsZW0pOwo+ICsg
ICAgICAgSUdUX0lOSVRfTElTVF9IRUFEKGVsZW0pOwo+ICt9Cj4gKwo+ICB2b2lkIGlndF9saXN0
X21vdmUoc3RydWN0IGlndF9saXN0X2hlYWQgKmVsZW0sIHN0cnVjdCBpZ3RfbGlzdF9oZWFkICps
aXN0KQo+ICB7Cj4gICAgICAgICBpZ3RfbGlzdF9kZWwoZWxlbSk7Cj4gZGlmZiAtLWdpdCBhL2xp
Yi9pZ3RfbGlzdC5oIGIvbGliL2lndF9saXN0LmgKPiBpbmRleCBkYmY1ZjgwMmMuLmNjOTNkN2Ew
ZCAxMDA2NDQKPiAtLS0gYS9saWIvaWd0X2xpc3QuaAo+ICsrKyBiL2xpYi9pZ3RfbGlzdC5oCj4g
QEAgLTc1LDYgKzc1LDcgQEAgc3RydWN0IGlndF9saXN0X2hlYWQgewo+ICB2b2lkIElHVF9JTklU
X0xJU1RfSEVBRChzdHJ1Y3QgaWd0X2xpc3RfaGVhZCAqaGVhZCk7Cj4gIHZvaWQgaWd0X2xpc3Rf
YWRkKHN0cnVjdCBpZ3RfbGlzdF9oZWFkICplbGVtLCBzdHJ1Y3QgaWd0X2xpc3RfaGVhZCAqaGVh
ZCk7Cj4gIHZvaWQgaWd0X2xpc3RfZGVsKHN0cnVjdCBpZ3RfbGlzdF9oZWFkICplbGVtKTsKPiAr
dm9pZCBpZ3RfbGlzdF9kZWxfaW5pdChzdHJ1Y3QgaWd0X2xpc3RfaGVhZCAqZWxlbSk7Cj4gIHZv
aWQgaWd0X2xpc3RfbW92ZShzdHJ1Y3QgaWd0X2xpc3RfaGVhZCAqZWxlbSwgc3RydWN0IGlndF9s
aXN0X2hlYWQgKmxpc3QpOwo+ICB2b2lkIGlndF9saXN0X21vdmVfdGFpbChzdHJ1Y3QgaWd0X2xp
c3RfaGVhZCAqZWxlbSwgc3RydWN0IGlndF9saXN0X2hlYWQgKmxpc3QpOwo+ICBpbnQgaWd0X2xp
c3RfbGVuZ3RoKGNvbnN0IHN0cnVjdCBpZ3RfbGlzdF9oZWFkICpoZWFkKTsKPiAtLQo+IDIuMjYu
MAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
