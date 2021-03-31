Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28F26E9F9
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Mar 2021 07:32:52 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id dm8so21115701edb.2
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Mar 2021 00:32:52 -0700 (PDT)
References: <20210330161848.18186-1-ville.syrjala@linux.intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <e64803f4-adfc-7741-a527-ce20bb512edf@gmail.com>
Date: Wed, 31 Mar 2021 10:32:43 +0300
MIME-Version: 1.0
In-Reply-To: <20210330161848.18186-1-ville.syrjala@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_atomic_transition: Fix the
 is_atomic check
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEp1aGEtUGVra2EgSGVpa2tpbGEgPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFp
bC5jb20+CgpPbiAzMC4zLjIwMjEgMTkuMTgsIFZpbGxlIFN5cmphbGEgd3JvdGU6Cj4gRnJvbTog
VmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiAKPiBXZSB3
YW50IHRvIGNoZWNrIHRoZSB2YWx1ZSBvZiBpc19hdG9taWMsIG5vdCBpdHMgYWRkcmVzcy4gU2hv
dWxkCj4gbWFrZSB0aGUgdGVzdCBza2lwIGNvcnJlY3RseSBhZ2FpbiB3aGVuIHRoZSBkcml2ZXIg
ZG9lc24ndCBhZHZlcnRpc2UKPiBhdG9taWMgc3VwcG9ydC4KPiAKPiBDYzogTmlkaGkgR3VwdGEg
PG5pZGhpMS5ndXB0YUBpbnRlbC5jb20+Cj4gRml4ZXM6IGU3OTZjYTdjZTZmZSAoInRlc3RzL2tt
c19hdG9taWNfdHJhbnNpdGlvbjpyZWR1Y2UgZXhlY3V0aW9uIHRpbWUiKQo+IFNpZ25lZC1vZmYt
Ynk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gLS0t
Cj4gICB0ZXN0cy9rbXNfYXRvbWljX3RyYW5zaXRpb24uYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0
cy9rbXNfYXRvbWljX3RyYW5zaXRpb24uYyBiL3Rlc3RzL2ttc19hdG9taWNfdHJhbnNpdGlvbi5j
Cj4gaW5kZXggNDMxODI0ZDBjZGI0Li5iZTYwOTQwZDcxYmYgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMv
a21zX2F0b21pY190cmFuc2l0aW9uLmMKPiArKysgYi90ZXN0cy9rbXNfYXRvbWljX3RyYW5zaXRp
b24uYwo+IEBAIC05OTMsNyArOTkzLDcgQEAgaWd0X21haW5fYXJncygiIiwgbG9uZ19vcHRzLCBo
ZWxwX3N0ciwgb3B0X2hhbmRsZXIsICZkYXRhKQo+ICAgCQlrbXN0ZXN0X3NldF92dF9ncmFwaGlj
c19tb2RlKCk7Cj4gICAKPiAgIAkJaWd0X2Rpc3BsYXlfcmVxdWlyZSgmZGF0YS5kaXNwbGF5LCBk
YXRhLmRybV9mZCk7Cj4gLQkJaWd0X3JlcXVpcmUoJmRhdGEuZGlzcGxheS5pc19hdG9taWMpOwo+
ICsJCWlndF9yZXF1aXJlKGRhdGEuZGlzcGxheS5pc19hdG9taWMpOwo+ICAgCj4gICAJCWlndF9k
aXNwbGF5X3JlcXVpcmVfb3V0cHV0KCZkYXRhLmRpc3BsYXkpOwo+ICAgCj4gCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlz
dAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
