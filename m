Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E48897E7
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2019 21:21:52 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id v10so15431803lji.3
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2019 14:21:52 -0700 (PDT)
References: <1552907710-4345-1-git-send-email-juhapekka.heikkila@gmail.com>
 <1552907710-4345-2-git-send-email-juhapekka.heikkila@gmail.com>
 <20190318143230.GN3888@intel.com>
From: =?UTF-8?Q?Juha-Pekka_Heikkil=c3=a4?= <juhapekka.heikkila@gmail.com>
Message-ID: <48753759-5908-fc2d-2180-d6dc04506575@gmail.com>
Date: Mon, 18 Mar 2019 23:21:48 +0200
MIME-Version: 1.0
In-Reply-To: <20190318143230.GN3888@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/igt_kms: reset plane alpha and
 blend in igt_plane_reset()
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
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpWaWxsZSBTeXJqw6Rsw6Qga2lyam9pdHRpIDE4LjMuMjAxOSBrbG8gMTYuMzI6Cj4gT24gTW9u
LCBNYXIgMTgsIDIwMTkgYXQgMDE6MTU6MTBQTSArMDIwMCwgSnVoYS1QZWtrYSBIZWlra2lsYSB3
cm90ZToKPj4gcGxhbmUgYWxwaGEgYW5kIGJsZW5kIHdvdWxkIGFmZmVjdCBvdGhlciB0ZXN0cyBp
ZiBsZWZ0Cj4+IGluIHVuZXhwZWN0ZWQgc3RhdGVzCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1aGEt
UGVra2EgSGVpa2tpbGEgPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+Cj4+IC0tLQo+PiAg
IGxpYi9pZ3Rfa21zLmMgfCA3ICsrKysrKysKPj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9saWIvaWd0X2ttcy5jIGIvbGliL2lndF9rbXMuYwo+
PiBpbmRleCBlMWVhY2MxLi5jZGI1YWJhIDEwMDY0NAo+PiAtLS0gYS9saWIvaWd0X2ttcy5jCj4+
ICsrKyBiL2xpYi9pZ3Rfa21zLmMKPj4gQEAgLTE3ODEsNiArMTc4MSwxMyBAQCBzdGF0aWMgdm9p
ZCBpZ3RfcGxhbmVfcmVzZXQoaWd0X3BsYW5lX3QgKnBsYW5lKQo+PiAgIAlpZiAoaWd0X3BsYW5l
X2hhc19wcm9wKHBsYW5lLCBJR1RfUExBTkVfUk9UQVRJT04pKQo+PiAgIAkJaWd0X3BsYW5lX3Nl
dF9wcm9wX3ZhbHVlKHBsYW5lLCBJR1RfUExBTkVfUk9UQVRJT04sIElHVF9ST1RBVElPTl8wKTsK
Pj4gICAKPj4gKwlpZiAoaWd0X3BsYW5lX2hhc19wcm9wKHBsYW5lLCBJR1RfUExBTkVfUElYRUxf
QkxFTkRfTU9ERSkpCj4+ICsJCWlndF9wbGFuZV9zZXRfcHJvcF9lbnVtKHBsYW5lLCBJR1RfUExB
TkVfUElYRUxfQkxFTkRfTU9ERSwgIk5vbmUiKTsKPiAKPiAiUHJlLW11bHRpcGxpZWQiIGlzIHRo
ZSBkZWZhdWx0IHZhbHVlIGZvciB0aGlzIHByb3AuCgphaC4gSSdsbCBmaXggYW5kIHJlc3VibWl0
LiBUaGFua3MgZm9yIGxvb2tpbmcgYXQgdGhpcy4KCj4gCj4+ICsKPj4gKwlpZiAoaWd0X3BsYW5l
X2hhc19wcm9wKHBsYW5lLCBJR1RfUExBTkVfQUxQSEEpKQo+PiArCQlpZ3RfcGxhbmVfc2V0X3By
b3BfdmFsdWUocGxhbmUsIElHVF9QTEFORV9BTFBIQSwgMHhmZmZmKTsKPj4gKwo+PiArCj4+ICAg
CWlndF9wbGFuZV9jbGVhcl9wcm9wX2NoYW5nZWQocGxhbmUsIElHVF9QTEFORV9JTl9GRU5DRV9G
RCk7Cj4+ICAgCXBsYW5lLT52YWx1ZXNbSUdUX1BMQU5FX0lOX0ZFTkNFX0ZEXSA9IH4wVUxMOwo+
PiAgIAlwbGFuZS0+Z2VtX2hhbmRsZSA9IDA7Cj4+IC0tIAo+PiAyLjcuNAo+Pgo+PiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBpZ3QtZGV2IG1haWxp
bmcgbGlzdAo+PiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYKPiAKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
