Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ABC46E6E4
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Aug 2018 21:43:12 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180817213553.4544-1-rodrigo.vivi@intel.com>
References: <153454120121.10736.16460853969838180302@skylake-alporthouse-com>
 <20180817213553.4544-1-rodrigo.vivi@intel.com>
Message-ID: <153454218366.10736.13913328360286747917@skylake-alporthouse-com>
Date: Fri, 17 Aug 2018 22:43:03 +0100
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

UXVvdGluZyBSb2RyaWdvIFZpdmkgKDIwMTgtMDgtMTcgMjI6MzU6NTMpCj4gU2luY2Ugd2UgYmxv
Y2sgcnVudGltZSBQTSBpZiBETUMgaXMgbm90IGxvYWRlZCwgbGV0J3Mgc2tpcAo+IHRoZSB0ZXN0
Lgo+IAo+IHYyOiBVc2UgaTkxNV9kbWNfaW5mbyBwcmVzZW5jZSB0byBkZXRlY3QgZG1jIHJlcXVp
cmVtZW50Cj4gICAgIGluc3RlYWQgb2YgZ2VuIGNoZWNrIGFzIENocmlzIHN1Z2dlc3RlZC4KPiB2
MzogQWRkIG1pc3NpbmcgXDAgYmVmb3JlIHVzaW5nIGJ1Zi4gKENocmlzKQo+IAo+IENjOiBDaHJp
cyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiBDYzogSW1yZSBEZWFrIDxpbXJl
LmRlYWtAaW50ZWwuY29tPgo+IENjOiBBbnVzaGEgU3JpdmF0c2EgPGFudXNoYS5zcml2YXRzYUBp
bnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50
ZWwuY29tPgo+IC0tLQo+ICB0ZXN0cy9wbV9ycG0uYyB8IDE2ICsrKysrKysrKysrKysrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMv
cG1fcnBtLmMgYi90ZXN0cy9wbV9ycG0uYwo+IGluZGV4IGJiZTM2ZTU5Li5mYTBkOThkYyAxMDA2
NDQKPiAtLS0gYS90ZXN0cy9wbV9ycG0uYwo+ICsrKyBiL3Rlc3RzL3BtX3JwbS5jCj4gQEAgLTY5
Myw2ICs2OTMsMjEgQEAgc3RhdGljIHZvaWQgc2V0dXBfcGM4KHZvaWQpCj4gICAgICAgICBoYXNf
cGM4ID0gdHJ1ZTsKPiAgfQo+ICAKPiArc3RhdGljIGJvb2wgZG1jX2xvYWRlZCh2b2lkKQo+ICt7
Cj4gKyAgICAgICBjaGFyIGJ1ZlsxNV07Cj4gKyAgICAgICBpbnQgbGVuOwo+ICsKPiArICAgICAg
IGxlbiA9IGlndF9zeXNmc19yZWFkKGRlYnVnZnMsICJpOTE1X2RtY19pbmZvIiwgYnVmLCBzaXpl
b2YoYnVmKSk7CgpzaXplb2YoYnVmKSAtIDEgOikKCm9yIGVsc2UgbGVuIHdpbGwgYmUgc2l6ZW9m
KGJ1ZikgYW5kIGJ1ZltsZW5dIG5vdCB3aGVyZSBpdCBiZWxvbmdzLgotQ2hyaXMKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
