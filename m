Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0ED56E026
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2019 08:13:01 +0000 (UTC)
Date: Wed, 17 Apr 2019 11:12:58 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190417081258.GN22949@platvala-desk.ger.corp.intel.com>
References: <d7db4af933e3f86f7d589517dd4de05a7d46eb54.1555430163.git.caz.yokoyama@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d7db4af933e3f86f7d589517dd4de05a7d46eb54.1555430163.git.caz.yokoyama@intel.com>
Subject: Re: [igt-dev] [PATCH 1/1] lib: consolidate duplicated define of
 vfs_file_max(void)
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
To: Caz Yokoyama <caz.yokoyama@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBBcHIgMTYsIDIwMTkgYXQgMDg6NTc6MzVBTSAtMDcwMCwgQ2F6IFlva295YW1hIHdy
b3RlOgo+IFNpZ25lZC1vZmYtYnk6IENheiBZb2tveWFtYSA8Y2F6Lnlva295YW1hQGludGVsLmNv
bT4KPiBDYzogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPgo+IC0t
LQo+ICBsaWIvaWd0X2F1eC5jICAgICAgICAgICAgICAgfCAxNCArKysrKysrKysrKysrKwo+ICBs
aWIvaWd0X2F1eC5oICAgICAgICAgICAgICAgfCAgMiArKwo+ICBsaWIvaW50ZWxfb3MuYyAgICAg
ICAgICAgICAgfCAxNCAtLS0tLS0tLS0tLS0tLQo+ICB0ZXN0cy9pOTE1L2dlbV9leGVjX3JldXNl
LmMgfCAxNCArLS0tLS0tLS0tLS0tLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMo
KyksIDI3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvaWd0X2F1eC5jIGIvbGli
L2lndF9hdXguYwo+IGluZGV4IDA1NTI4MzUyLi5hYzMzODc1ZSAxMDA2NDQKPiAtLS0gYS9saWIv
aWd0X2F1eC5jCj4gKysrIGIvbGliL2lndF9hdXguYwo+IEBAIC0xNjE1LDMgKzE2MTUsMTcgQEAg
Ym9vbCBpZ3RfYWxsb3dfdW5saW1pdGVkX2ZpbGVzKHZvaWQpCj4gIAlybGltLnJsaW1fbWF4ID0g
bm9maWxlX3JsaW07Cj4gIAlyZXR1cm4gc2V0cmxpbWl0KFJMSU1JVF9OT0ZJTEUsICZybGltKSA9
PSAwOwo+ICB9Cj4gKwo+ICt1aW50NjRfdCB2ZnNfZmlsZV9tYXgodm9pZCkKPiArewo+ICsJc3Rh
dGljIGxvbmcgbG9uZyB1bnNpZ25lZCBtYXg7Cj4gKwlpZiAobWF4ID09IDApIHsKPiArCQlGSUxF
ICpmaWxlID0gZm9wZW4oIi9wcm9jL3N5cy9mcy9maWxlLW1heCIsICJyIik7Cj4gKwkJbWF4ID0g
ODAwMDA7Cj4gKwkJaWYgKGZpbGUpIHsKPiArCQkJaWd0X2Fzc2VydChmc2NhbmYoZmlsZSwgIiVs
bHUiLCAmbWF4KSA9PSAxKTsKPiArCQkJZmNsb3NlKGZpbGUpOwo+ICsJCX0KPiArCX0KPiArCXJl
dHVybiBtYXg7Cj4gK30KCgpEb2N1bWVudGF0aW9uIGZvciBmdW5jdGlvbnMgYWRkZWQgdG8gbGli
LCBwbGVhc2UuCgoKLS0gClBldHJpIExhdHZhbGEKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2
