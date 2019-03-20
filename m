Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973EF89C6A
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2019 09:24:49 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
In-Reply-To: <f12816c03dbd699376fc974c0d16a14d07fc17c6.camel@intel.com>
References: <f12816c03dbd699376fc974c0d16a14d07fc17c6.camel@intel.com>
Date: Wed, 20 Mar 2019 11:26:32 +0200
Message-ID: <874l7xgalz.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/testdisplay: fix heap overflow
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
To: "Ser, Simon" <simon.ser@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCAyMCBNYXIgMjAxOSwgIlNlciwgU2ltb24iIDxzaW1vbi5zZXJAaW50ZWwuY29tPiB3
cm90ZToKPiBXZSBuZWVkIHRvIGNvcHkgdGhlIHRlcm1pbmF0aW5nIE5VTEwgYnl0ZSB0b28uCj4K
PiBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBTZXIgPHNpbW9uLnNlckBpbnRlbC5jb20+Cj4gLS0tCj4g
IHRlc3RzL3Rlc3RkaXNwbGF5LmMgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvdGVzdGRp
c3BsYXkuYyBiL3Rlc3RzL3Rlc3RkaXNwbGF5LmMKPiBpbmRleCBiMzY1NzI2NC4uZmYyMDgzODQg
MTAwNjQ0Cj4gLS0tIGEvdGVzdHMvdGVzdGRpc3BsYXkuYwo+ICsrKyBiL3Rlc3RzL3Rlc3RkaXNw
bGF5LmMKPiBAQCAtNTYzLDE3ICs1NjMsMTcgQEAgc3RhdGljIGdib29sZWFuIGlucHV0X2V2ZW50
KEdJT0NoYW5uZWwgKnNvdXJjZSwKPiBHSU9Db25kaXRpb24gY29uZGl0aW9uLAo+ICAJcmV0dXJu
IFRSVUU7Cj4gIH0KPiAgCj4gLXN0YXRpYyB2b2lkIGVudGVyX2V4ZWNfcGF0aCggY2hhciAqKmFy
Z3YgKQo+ICtzdGF0aWMgdm9pZCBlbnRlcl9leGVjX3BhdGgoY2hhciAqKmFyZ3YpCj4gIHsKPiAg
CWNoYXIgKmV4ZWNfcGF0aCA9IE5VTEw7Cj4gIAljaGFyICpwb3MgPSBOVUxMOwo+ICAJc2hvcnQg
bGVuX3BhdGggPSAwOwo+ICAJaW50IHJldDsKPiAgCj4gLQlsZW5fcGF0aCA9IHN0cmxlbiggYXJn
dlswXSApOwo+IC0JZXhlY19wYXRoID0gKGNoYXIqKSBtYWxsb2MobGVuX3BhdGgpOwo+ICsJbGVu
X3BhdGggPSBzdHJsZW4oYXJndlswXSk7Cj4gKwlleGVjX3BhdGggPSAoY2hhciopIG1hbGxvYyhs
ZW5fcGF0aCArIDEpOwo+ICAKPiAtCW1lbWNweShleGVjX3BhdGgsIGFyZ3ZbMF0sIGxlbl9wYXRo
KTsKPiArCW1lbWNweShleGVjX3BhdGgsIGFyZ3ZbMF0sIGxlbl9wYXRoICsgMSk7CgpEaXRjaCBh
bGwgb2YgdGhlIGFib3ZlIGFuZCByZXBsYWNlIHdpdGgKCglleGVjX3BhdGggPSBzdHJkdXAoYXJn
dlswXSk7CgpCUiwKSmFuaS4KCgo+ICAJcG9zID0gc3RycmNocihleGVjX3BhdGgsICcvJyk7Cj4g
IAlpZiAocG9zICE9IE5VTEwpCj4gIAkJKihwb3MrMSkgPSAnXDAnOwoKLS0gCkphbmkgTmlrdWxh
LCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2
