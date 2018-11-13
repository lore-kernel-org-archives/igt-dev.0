Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29556E3A6
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Nov 2018 11:57:59 +0000 (UTC)
From: Jani Nikula <jani.nikula@intel.com>
In-Reply-To: <1541676018-6502-1-git-send-email-jyoti.r.yadav@intel.com>
References: <1541676018-6502-1-git-send-email-jyoti.r.yadav@intel.com>
Date: Tue, 13 Nov 2018 13:57:55 +0200
Message-ID: <875zx1gpfg.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/pm_backlight.c: Fix brightness
 failure with system suspend
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
To: Jyoti Yadav <jyoti.r.yadav@intel.com>, igt-dev@lists.freedesktop.org
Cc: Jyoti Yadav <jyoti.r.yadav@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCAwOCBOb3YgMjAxOCwgSnlvdGkgWWFkYXYgPGp5b3RpLnIueWFkYXZAaW50ZWwuY29t
PiB3cm90ZToKPiBUaGlzIHBhdGNoIHRyaWVzIHRvIGZpeCB0aGUgZmFsaXVyZSBvY2N1cmluZyBk
dXJpbmcgc3VidGVzdAo+ICJmYWRlX3dpdGhfc3VzcGVuZCIuIEZhaWx1cmUgaXMgb2NjdXJpbmcg
YmVjYXVzZSwgYnJpZ2h0bmVzcwo+IHZhbHVlIGlzIGJlaW5nIGNoZWNrZWQgYmVmb3JlIGRyaXZl
ciBpbml0aWFsaXplcyBmdWxseSBhZnRlciByZXN1bWUuCj4KPiBCdWd6aWxsYTogaHR0cHM6Ly9i
dWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA3ODQ3Cj4gU2lnbmVkLW9mZi1i
eTogSnlvdGkgWWFkYXYgPGp5b3RpLnIueWFkYXZAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+CgpUaGF0J3Mgbm90IGhvdyBTaWdu
ZWQtb2ZmLWJ5IHdvcmtzLiBQbGVhc2UgcmVhZCBbMV0gYW5kIFsyXSB3aXRoIGNhcmUuCgpCUiwK
SmFuaS4KCgpbMV0gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvcHJvY2Vz
cy9zdWJtaXR0aW5nLXBhdGNoZXMuaHRtbCNzaWduLXlvdXItd29yay10aGUtZGV2ZWxvcGVyLXMt
Y2VydGlmaWNhdGUtb2Ytb3JpZ2luClsyXSBodHRwczovL2RldmVsb3BlcmNlcnRpZmljYXRlLm9y
Zy8KCj4gLS0tCj4gIHRlc3RzL3BtX2JhY2tsaWdodC5jIHwgNiArLS0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3Rl
c3RzL3BtX2JhY2tsaWdodC5jIGIvdGVzdHMvcG1fYmFja2xpZ2h0LmMKPiBpbmRleCAzMjgwOGNk
Li4xNTkzNjZjIDEwMDY0NAo+IC0tLSBhL3Rlc3RzL3BtX2JhY2tsaWdodC5jCj4gKysrIGIvdGVz
dHMvcG1fYmFja2xpZ2h0LmMKPiBAQCAtMTc3LDEyICsxNzcsOCBAQCB0ZXN0X2ZhZGVfd2l0aF9z
dXNwZW5kKHN0cnVjdCBjb250ZXh0ICpjb250ZXh0LCBpZ3Rfb3V0cHV0X3QgKm91dHB1dCkKPiAg
ewo+ICAJaWd0X3JlcXVpcmUoaWd0X3NldHVwX3J1bnRpbWVfcG0oKSk7Cj4gIAo+IC0Ja21zdGVz
dF9zZXRfY29ubmVjdG9yX2RwbXMob3V0cHV0LT5kaXNwbGF5LT5kcm1fZmQsCj4gLQkJCQkgICBv
dXRwdXQtPmNvbmZpZy5jb25uZWN0b3IsCj4gLQkJCQkgICBEUk1fTU9ERV9EUE1TX09GRik7Cj4g
LQlpZ3RfcmVxdWlyZShpZ3Rfd2FpdF9mb3JfcG1fc3RhdHVzKElHVF9SVU5USU1FX1BNX1NUQVRV
U19TVVNQRU5ERUQpKTsKPiAtCj4gIAlpZ3Rfc3lzdGVtX3N1c3BlbmRfYXV0b3Jlc3VtZShTVVNQ
RU5EX1NUQVRFX01FTSwgU1VTUEVORF9URVNUX05PTkUpOwo+ICsJaWd0X3JlcXVpcmUoaWd0X3dh
aXRfZm9yX3BtX3N0YXR1cyhJR1RfUlVOVElNRV9QTV9TVEFUVVNfQUNUSVZFKSk7Cj4gIAo+ICAJ
dGVzdF9mYWRlKGNvbnRleHQpOwo+ICB9CgotLSAKSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291
cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXYK
