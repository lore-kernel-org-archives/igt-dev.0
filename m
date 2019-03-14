Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0600589762
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2019 07:46:35 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <36a00595c5083adb40d496ff30ebc820ae770474.1552545177.git.harish.chegondi@intel.com>
References: <36a00595c5083adb40d496ff30ebc820ae770474.1552545177.git.harish.chegondi@intel.com>
Message-ID: <155254958544.4168.8591390419495126785@skylake-alporthouse-com>
Date: Thu, 14 Mar 2019 07:46:25 +0000
Subject: Re: [igt-dev] [RFC i-g-t 1/1] i915/pm_backlight: turn on dpms
 before backlight fade out and fade in
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
To: Harish Chegondi <harish.chegondi@intel.com>, igt-dev@lists.freedesktop.org
Cc: clinton.a.taylor@intel.com, jyoti.r.yadav@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBIYXJpc2ggQ2hlZ29uZGkgKDIwMTktMDMtMTQgMDY6NDE6NDgpCj4gYmFja2xpZ2h0
IGZhZGUgd2l0aCBzdXNwZW5kIHRlc3QgdHVybnMgb2ZmIGRwbXMgd2hpY2ggdHVybnMgb2ZmCj4g
dGhlIGVkcCBiYWNrbGlnaHQgYW5kIHBhbmVsLiBUaGVuIGl0IGRvZXMgYSBydW50aW1lIHN1c3Bl
bmQsCj4gc3lzdGVtIHN1c3BlbmQgYW5kIHJlc3VtZS4gQWZ0ZXIgcmVzdW1lLCBpdCBkb2VzIGEg
ZmFkZSBvdXQgYW5kCj4gZmFkZSBpbiBvZiB0aGUgYmFja2xpZ2h0IGJyaWdodG5lc3MuIEZyb20g
dGhlIGRtZXNnIGxvZ3Mgb2YgdGhlCj4gY2kgdGVzdHMgaXQgYXBwZWFycyB0aGF0IHRoZSB0ZXN0
IGlzIHNldHRpbmcgdGhlIGJyaWdodG5lc3MKPiBldmVuIGJlZm9yZSB0aGUgZWRwIHBhbmVsIGFu
ZCBiYWNrbGlnaHQgYXJlIHR1cm5lZCBvbiByZXN1aWx0aW5nCj4gaW4gdGhlIGJyaWdodG5lc3Mg
dmFsdWVzIHdyaXR0ZW4gYW5kIHJlYWQgdG8gYmUgZGlmZmVyZW50Lgo+IFR1cm4gb24gdGhlIGRw
bXMgd2hpY2ggdHVybnMgb24gdGhlIGVkcCBwYW5lbCBhbmQgYmFja2xpZ2h0Cj4gYmVmb3JlIGJh
Y2tsaWdodCBmYWRlIG91dCBhbmQgZmFkZSBpbi4gV2l0aCB0aGlzIGNoYW5nZSB0aGUKPiBmYWRl
X3dpdGhfc3VzcGVuZCB0ZXN0IHBhc3Nlcy4KCkJ1dCBpcyBpdCBsZWdhbCBmb3IgdGhlIGtlcm5l
bCB0byB0aGF0PyBJcyB0aGUga2VybmVsIG1lYW50IHRvIHJlc3RvcmUKdGhlIHByZXZpb3VzIGNv
bmZpZ3VyYXRpb24gdXBvbiByZXN1bWUgb3IgbGVhdmUgaXQgdG8gdXNlcnNwYWNlPyBXaGF0CmFi
b3V0IGZvciBmYmNvbj8KCklmIGl0IGlzIG1lYW50IHRvIGxlYXZlIGl0IHRvIHVzZXJzcGFjZSwg
d2h5IGlzIHRoZSBjb25uZWN0b3Igc3RpbGwgZXZlbgplbmFibGVkPwotQ2hyaXMKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
