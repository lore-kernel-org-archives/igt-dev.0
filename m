Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DF76EAE1
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Apr 2018 10:57:04 +0000 (UTC)
Date: Fri, 13 Apr 2018 12:57:02 +0200
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20180413105702.GA13079@kdec5-desk.ger.corp.intel.com>
References: <20180411023732.32362-1-dhinakaran.pandiyan@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180411023732.32362-1-dhinakaran.pandiyan@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 01/20] tests/psr: Print the reason for
 skipping when sink lacks PSR support
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
To: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBBcHIgMTAsIDIwMTggYXQgMDc6Mzc6MTNQTSAtMDcwMCwgRGhpbmFrYXJhbiBQYW5k
aXlhbiB3cm90ZToKPiBBbmQgcmVuYW1lIHRoZSBmdW5jdGlvbiB0byBtYXRjaCB3aGF0IGl0IGRv
ZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5w
YW5kaXlhbkBpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBLYXRhcnp5bmEgRGVjIDxrYXRhcnp5bmEu
ZGVjQGludGVsLmNvbT4KPiAtLS0KPiAgdGVzdHMva21zX3Bzcl9zaW5rX2NyYy5jIHwgNiArKyst
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3Bzcl9zaW5rX2NyYy5jIGIvdGVzdHMva21zX3Bzcl9z
aW5rX2NyYy5jCj4gaW5kZXggOThkMjliYTkuLjkzODA3YzAzIDEwMDY0NAo+IC0tLSBhL3Rlc3Rz
L2ttc19wc3Jfc2lua19jcmMuYwo+ICsrKyBiL3Rlc3RzL2ttc19wc3Jfc2lua19jcmMuYwo+IEBA
IC0xOTMsNyArMTkzLDcgQEAgc3RhdGljIHZvaWQgZmlsbF9yZW5kZXIoZGF0YV90ICpkYXRhLCB1
aW50MzJfdCBoYW5kbGUsIHVuc2lnbmVkIGNoYXIgY29sb3IpCj4gIAlnZW1fYm9fYnVzeShkYXRh
LT5kcm1fZmQsIGhhbmRsZSk7Cj4gIH0KPiAgCj4gLXN0YXRpYyBib29sIHBzcl9wb3NzaWJsZShk
YXRhX3QgKmRhdGEpCj4gK3N0YXRpYyBib29sIHNpbmtfc3VwcG9ydChkYXRhX3QgKmRhdGEpCj4g
IHsKPiAgCWNoYXIgYnVmWzUxMl07Cj4gIAo+IEBAIC01MTMsOCArNTEzLDggQEAgaW50IG1haW4o
aW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKPiAgCj4gIAkJaWd0X3NldF9tb2R1bGVfcGFyYW1faW50
KCJlbmFibGVfcHNyIiwgcnVubmluZ193aXRoX3Bzcl9kaXNhYmxlZCA/Cj4gIAkJCQkJIDAgOiAx
KTsKPiAtCj4gLQkJaWd0X3NraXBfb24oIXBzcl9wb3NzaWJsZSgmZGF0YSkpOwo+ICsJCWlndF9y
ZXF1aXJlX2Yoc2lua19zdXBwb3J0KCZkYXRhKSwKPiArCQkJICAgICAgIlNpbmsgZG9lcyBub3Qg
c3VwcG9ydCBQU1JcbiIpOwo+ICAKPiAgCQlkYXRhLmJ1Zm1nciA9IGRybV9pbnRlbF9idWZtZ3Jf
Z2VtX2luaXQoZGF0YS5kcm1fZmQsIDQwOTYpOwo+ICAJCWlndF9hc3NlcnQoZGF0YS5idWZtZ3Ip
Owo+IC0tIAo+IDIuMTQuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gaWd0LWRldiBtYWlsaW5nIGxpc3QKPiBpZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
