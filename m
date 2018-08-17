Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8E26E5CA
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Aug 2018 21:26:49 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180817211332.28910-1-rodrigo.vivi@intel.com>
References: <153453958025.10736.6870367123314362272@skylake-alporthouse-com>
 <20180817211332.28910-1-rodrigo.vivi@intel.com>
Message-ID: <153454120121.10736.16460853969838180302@skylake-alporthouse-com>
Date: Fri, 17 Aug 2018 22:26:41 +0100
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

UXVvdGluZyBSb2RyaWdvIFZpdmkgKDIwMTgtMDgtMTcgMjI6MTM6MzIpCj4gU2luY2Ugd2UgYmxv
Y2sgcnVudGltZSBQTSBpZiBETUMgaXMgbm90IGxvYWRlZCwgbGV0J3Mgc2tpcAo+IHRoZSB0ZXN0
Lgo+IAo+IHYyOiBVc2UgaTkxNV9kbWNfaW5mbyBwcmVzZW5jZSB0byBkZXRlY3QgZG1jIHJlcXVp
cmVtZW50Cj4gICAgIGluc3RlYWQgb2YgZ2VuIGNoZWNrIGFzIENocmlzIHN1Z2dlc3RlZC4KPiAK
PiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gQ2M6IEltcmUg
RGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4KPiBDYzogQW51c2hhIFNyaXZhdHNhIDxhbnVzaGEu
c3JpdmF0c2FAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmln
by52aXZpQGludGVsLmNvbT4KPiAtLS0KPiAgdGVzdHMvcG1fcnBtLmMgfCAxMiArKysrKysrKysr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
dGVzdHMvcG1fcnBtLmMgYi90ZXN0cy9wbV9ycG0uYwo+IGluZGV4IGJiZTM2ZTU5Li4yNDMyNWZl
YiAxMDA2NDQKPiAtLS0gYS90ZXN0cy9wbV9ycG0uYwo+ICsrKyBiL3Rlc3RzL3BtX3JwbS5jCj4g
QEAgLTY5Myw2ICs2OTMsMTcgQEAgc3RhdGljIHZvaWQgc2V0dXBfcGM4KHZvaWQpCj4gICAgICAg
ICBoYXNfcGM4ID0gdHJ1ZTsKPiAgfQo+ICAKPiArc3RhdGljIGJvb2wgZG1jX2xvYWRlZCh2b2lk
KQo+ICt7Cj4gKyAgICAgICBjaGFyIGJ1ZlsxNV07Cj4gKwo+ICsgICAgICAgaWYgKGlndF9zeXNm
c19yZWFkKGRlYnVnZnMsICJpOTE1X2RtY19pbmZvIiwgYnVmLCBzaXplb2YoYnVmKSkgPCAwKQo+
ICsgICAgICAgICAgIHJldHVybiB0cnVlOyAvKiBubyBDU1Igc3VwcG9ydCwgbm8gRE1DIHJlcXVp
cmVtZW50ICovCgpIbW0sIEkgZGlkbid0IG1lbnRpb24gdGhlIGlzc3VlIHdpdGggdGhlIG1pc3Np
bmcgTlVMIGJ5dGUuLi4KCmNoYXIgYnVmWzE2XTsKaW50IGxlbjsKCmxlbiA9IC4uLnJlYWQoLi4u
IHNpemVvZihidWYpIC0gMSk7CmlmIChsZW4gPCAwKQoJcmV0dXJuIHRydWU7IC8qLi4uKi8KCmJ1
ZltsZW5dID0gJ1wwJzsKClNvcnJ5LAotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2Cg==
