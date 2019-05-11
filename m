Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2EE089C9A
 for <igt-dev@lists.freedesktop.org>; Sat, 11 May 2019 15:17:33 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id z1so7480805ljb.3
 for <igt-dev@lists.freedesktop.org>; Sat, 11 May 2019 08:17:33 -0700 (PDT)
References: <20190429160557.17889-1-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Juha-Pekka_Heikkil=c3=a4?= <juhapekka.heikkila@gmail.com>
Message-ID: <8f2230b4-c3b7-7ad5-dd05-fb7c3a9798e6@gmail.com>
Date: Sat, 11 May 2019 18:17:29 +0300
MIME-Version: 1.0
In-Reply-To: <20190429160557.17889-1-maarten.lankhorst@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 0/4] kms_cursor_crc test improvements
 and cleanups.
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBzZXQgbG9vayBhbGwgZ29vZCB0byBtZSwgSSBkaWRuJ3Qgbm90aWNlIGFueXRoaW5nIEkn
ZCBjb21tZW50IGFib3V0IApvdGhlciB0aGFuOgoKUmV2aWV3ZWQtYnk6IEp1aGEtUGVra2EgSGVp
a2tpbGEgPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+CgpNYWFydGVuIExhbmtob3JzdCBr
aXJqb2l0dGkgMjkuNC4yMDE5IGtsbyAxOS4wNToKPiBUaGUgdGVzdHMgd2VyZSBydW5uaW5nIG9u
IGVhY2ggb3V0cHV0IG9uIGVhY2ggcGlwZSwgYW5kIGRpZCBzb21lIGNsZWFudXAKPiB0aGF0IHNo
b3VsZCBiZSBkb25lIGluIGlndF9kaXNwbGF5X3Jlc2V0KCkuIEZpeCB0aGUgdGVzdCB0byB1c2Ug
aWd0X2ttcwo+IGNhbGxzIGFsbCB0aGUgdGltZSwgYW5kIHJlbW92ZSBhbGwgaGFuZC1yb2xsZWQg
Y2xlYW51cC4KPiAKPiBBcyBhIGJvbnVzLCB3ZSBjYW4gbm93IHJ1biB0aGUgc2FtZSB0ZXN0IG9u
IGFuIG92ZXJsYXkgcGxhbmUgd2l0aCBhCj4gcy9DVVJTT1IvT1ZFUkxBWS8gYXMgYSBzYW5pdHkg
Y2hlY2sgdGhhdCB0aGUgdGVzdCB0aGVtc2VsdmVzIGFyZSBjb3JyZWN0Lgo+IAo+IE1hYXJ0ZW4g
TGFua2hvcnN0ICg0KToKPiAgICB0ZXN0cy9rbXNfY3Vyc29yX2NyYzogUnVuIHRlc3RzIG9uY2Ug
cGVyIHBpcGUKPiAgICB0ZXN0cy9rbXNfY3Vyc29yX2NyYzogSGFuZGxlIGRpc3BsYXkgY2xlYW51
cCBpbiBpbml0Cj4gICAgbGliL2lndF9rbXM6IFVwZGF0ZSBjdXJzb3Igd2hlbiBmYiB3aWR0aC9o
ZWlnaHQgY2hhbmdlcyB0b28uCj4gICAgdGVzdHMva21zX2N1cnNvcl9jcmM6IFVzZSBpZ3Rfa21z
IGNhbGxzIGZvciBldmVyeXRoaW5nLgo+IAo+ICAgbGliL2lndF9rbXMuYyAgICAgICAgICB8ICAg
NCArLQo+ICAgdGVzdHMva21zX2N1cnNvcl9jcmMuYyB8IDIzOCArKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMTQgaW5zZXJ0aW9u
cygrKSwgMTI4IGRlbGV0aW9ucygtKQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXY=
