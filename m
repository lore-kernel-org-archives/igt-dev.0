Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24D26E60F
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Mar 2018 09:53:33 +0000 (UTC)
References: <1520328099-19034-1-git-send-email-vidya.srinivas@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <eac736a6-1adc-a66c-7c7c-57f12d350552@linux.intel.com>
Date: Tue, 6 Mar 2018 10:53:30 +0100
MIME-Version: 1.0
In-Reply-To: <1520328099-19034-1-git-send-email-vidya.srinivas@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] [i-g-t] tests/kms_plane_scaling: Change
 minimum fb height for YUV 420 planar
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
To: Vidya Srinivas <vidya.srinivas@intel.com>, igt-dev@lists.freedesktop.org
Cc: sunil.kamath@intel.com, ville.syrjala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMDYtMDMtMTggb20gMTA6MjEgc2NocmVlZiBWaWR5YSBTcmluaXZhczoKPiBXaGVuIHRoZSBw
bGFuZSBzY2FsaW5nIGlzIHVzZWQgd2l0aCBZVVYgNDIwIHBsYW5hciBmb3JtYXRzLAo+IHRoZSBo
ZWlnaHQgc2hvdWxkIGJlIGEgbWluaW11bSBvZiAxNiBzY2FubGluZXMgYXMgcGVyIEJTcGVjCj4g
TWluaW11bSBvZiA4IHNjYW5saW5lcyBpcyBmb3Igbm9uLVlVViA0MjAgcGxhbmFyIGZvcm1hdHMu
Cj4gUGF0Y2ggY2hhbmdlcyB0aGUgbWluaW11bSBmYiBoZWlnaHQgYmVpbmcgdXNlZCBpbiB0aGUg
dGVzdAo+IGluIGNhc2Ugb2YgWVVWIDQyMCBwbGFuYXIgKGZvciBub3cgTlYxMiBhcyBvbmx5IHRo
YXQgaXMgc3VwcG9ydGVkKS4KPgo+IFNpZ25lZC1vZmYtYnk6IFVtYSBTaGFua2FyIDx1bWEuc2hh
bmthckBpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVmlkeWEgU3Jpbml2YXMgPHZpZHlhLnNy
aW5pdmFzQGludGVsLmNvbT4KPiAtLS0KPiAgdGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYyB8IDIg
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL3Rl
c3RzL2ttc19wbGFuZV9zY2FsaW5nLmMgYi90ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jCj4gaW5k
ZXggNDQwOGU1Yy4uY2Y0OTAxNSAxMDA2NDQKPiAtLS0gYS90ZXN0cy9rbXNfcGxhbmVfc2NhbGlu
Zy5jCj4gKysrIGIvdGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYwo+IEBAIC0xMzEsNiArMTMxLDgg
QEAgc3RhdGljIHZvaWQgY2hlY2tfc2NhbGluZ19waXBlX3BsYW5lX3JvdChkYXRhX3QgKmQsIGln
dF9wbGFuZV90ICpwbGFuZSwKPiAgCj4gIAkvKiBjcmVhdGUgYnVmZmVyIGluIHRoZSByYW5nZSBv
ZiAgbWluIGFuZCBtYXggc291cmNlIHNpZGUgbGltaXQuKi8KPiAgCXdpZHRoID0gaGVpZ2h0ID0g
OTsKPiArCWlmIChwaXhlbF9mb3JtYXQgPT0gRFJNX0ZPUk1BVF9OVjEyKQo+ICsJCWhlaWdodCA9
IDE2Owo+ICAJaWd0X2NyZWF0ZV9jb2xvcl9mYihkaXNwbGF5LT5kcm1fZmQsIHdpZHRoLCBoZWln
aHQsCj4gIAkJICAgICAgIHBpeGVsX2Zvcm1hdCwgdGlsaW5nLCAwLjAsIDEuMCwgMC4wLCAmZC0+
ZmJbMF0pOwo+ICAJaWd0X3BsYW5lX3NldF9mYihwbGFuZSwgJmQtPmZiWzBdKTsKCkFuZCBzaG91
bGRuJ3Qgd2UgcmVqZWN0IHRoaXMgaW4gdGhlIGtlcm5lbD8KCn5NYWFydGVuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlz
dAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
