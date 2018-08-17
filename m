Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B916E632
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Aug 2018 20:59:54 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180817205125.2340-1-rodrigo.vivi@intel.com>
References: <20180817205125.2340-1-rodrigo.vivi@intel.com>
Message-ID: <153453958025.10736.6870367123314362272@skylake-alporthouse-com>
Date: Fri, 17 Aug 2018 21:59:40 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] pm_rpm: Require DMC loaded before
 testing runtime_pm for gen9+
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
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBSb2RyaWdvIFZpdmkgKDIwMTgtMDgtMTcgMjE6NTE6MjUpCj4gU2luY2Ugd2UgYmxv
Y2sgcnVudGltZSBQTSBpZiBETUMgaXMgbm90IGxvYWRlZCwgbGV0J3Mgc2tpcAo+IHRoZSB0ZXN0
Lgo+IAo+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiBDYzog
SW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgo+IENjOiBBbnVzaGEgU3JpdmF0c2EgPGFu
dXNoYS5zcml2YXRzYUBpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUm9kcmlnbyBWaXZpIDxy
b2RyaWdvLnZpdmlAaW50ZWwuY29tPgo+IC0tLQo+ICB0ZXN0cy9wbV9ycG0uYyB8IDEzICsrKysr
KysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0t
Z2l0IGEvdGVzdHMvcG1fcnBtLmMgYi90ZXN0cy9wbV9ycG0uYwo+IGluZGV4IGJiZTM2ZTU5Li5m
ODQ0MmU0YSAxMDA2NDQKPiAtLS0gYS90ZXN0cy9wbV9ycG0uYwo+ICsrKyBiL3Rlc3RzL3BtX3Jw
bS5jCj4gQEAgLTY5Myw2ICs2OTMsMTYgQEAgc3RhdGljIHZvaWQgc2V0dXBfcGM4KHZvaWQpCj4g
ICAgICAgICBoYXNfcGM4ID0gdHJ1ZTsKPiAgfQo+ICAKPiArc3RhdGljIGJvb2wgZG1jX2xvYWRl
ZCh2b2lkKQo+ICt7Cj4gKyAgICAgICBjaGFyIGJ1ZlsxNV07Cj4gKwo+ICsgICAgICAgaWd0X2Rl
YnVnZnNfcmVhZChkcm1fZmQsICJpOTE1X2RtY19pbmZvIiwgYnVmKTsKClRoZXJlJ3MgYWxyZWFk
eSBhIGRlYnVnZnMgZmQsIHNvIHlvdSBjYW4gdXNlCgppZiAoaWd0X3N5c2ZzX3JlYWQoZGVidWdm
cywgImk5MTVfZG1jX2luZm8iLCBidWYsIHNpemVvZihidWYpIDwgMCkKCXJldHVybiB0cnVlOyAv
KiBubyBDU1Igc3VwcG9ydCwgbm8gRE1DIHJlcXVpcmVtZW50ICovCgpZb3UgY2FuIHNraXAgdGhl
IGdlbiB0ZXN0IGFzIGk5MTVfZG1jX2luZm8gcmVwb3J0cyBFTk9ERVYgZm9yIHBsYXRmb3Jtcwp3
aXRob3V0IENTUi4KCj4gKwo+ICsgICAgICAgaWd0X2luZm8oIkRNQzogJXNcbiIsIGJ1Zik7Cj4g
KyAgICAgICByZXR1cm4gc3Ryc3RyKGJ1ZiwgImZ3IGxvYWRlZDogeWVzIik7Cj4gK30KPiArCj4g
IHN0YXRpYyBib29sIHNldHVwX2Vudmlyb25tZW50KHZvaWQpCj4gIHsKPiAgICAgICAgIGlmICho
YXNfcnVudGltZV9wbSkKPiBAQCAtNzE2LDYgKzcyNiw5IEBAIHN0YXRpYyBib29sIHNldHVwX2Vu
dmlyb25tZW50KHZvaWQpCj4gICAgICAgICBpZ3RfaW5mbygiUEM4IHJlc2lkZW5jeSBzdXBwb3J0
OiAlZFxuIiwgaGFzX3BjOCk7Cj4gICAgICAgICBpZ3RfcmVxdWlyZShoYXNfcnVudGltZV9wbSk7
Cj4gIAo+ICsgICAgICAgaWYgKGludGVsX2dlbihtc19kYXRhLmRldmlkKSA+PSA5KQo+ICsgICAg
ICAgICAgICAgICBpZ3RfcmVxdWlyZShkbWNfbG9hZGVkKCkpOwo+ICsKPiAgb3V0Ogo+ICAgICAg
ICAgZGlzYWJsZV9hbGxfc2NyZWVucygmbXNfZGF0YSk7Cj4gICAgICAgICByZXR1cm4gd2FpdF9m
b3Jfc3VzcGVuZGVkKCk7Cj4gLS0gCj4gMi4xNy4xCj4gCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldgo=
