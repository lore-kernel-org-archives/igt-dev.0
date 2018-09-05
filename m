Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026936E4E4
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Sep 2018 15:15:16 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <764be659-3d3c-6f8b-da8d-ace2b49526f1@linux.intel.com>
References: <20180905090705.12829-1-chris@chris-wilson.co.uk>
 <764be659-3d3c-6f8b-da8d-ace2b49526f1@linux.intel.com>
Message-ID: <153616042048.28292.14573089888419717635@skylake-alporthouse-com>
Date: Wed, 05 Sep 2018 16:13:40 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] lib/pm: Fail gracefully if CONFIG_PM is
 not built into the kernel
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wOS0wNSAxNjowMTowNCkKPiAKPiBPbiAwNS8w
OS8yMDE4IDEwOjA3LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBXZSByZXBvcnQgdGhlIGZhaWx1
cmUgZnJvbSBpZ3Rfc2V0dXBfcnVudGltZV9wbSgpIHNvIHRoYXQgdGhlIGNhbGxlciBjYW4KPiA+
IGRlY2lkZSBob3cgdGhleSBtYXkgcHJvY2VlZCwgc28gcmVwbGFjZSB0aGUgaGFyZCBhc3NlcnQg
d2l0aCB0aGUgZXJyb3IKPiA+IHByb3BhZ2F0aW9uLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBD
aHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiA+IENjOiBUdnJ0a28gVXJz
dWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+ID4gQ2M6IEltcmUgRGVhayA8aW1yZS5k
ZWFrQGludGVsLmNvbT4KPiA+IC0tLQo+ID4gICBsaWIvaWd0X3BtLmMgfCAxNSArKysrKysrKysr
LS0tLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9saWIvaWd0X3BtLmMgYi9saWIvaWd0X3BtLmMKPiA+
IGluZGV4IDYxNTQ2M2EwOC4uNDkwMjcyMzhiIDEwMDY0NAo+ID4gLS0tIGEvbGliL2lndF9wbS5j
Cj4gPiArKysgYi9saWIvaWd0X3BtLmMKPiA+IEBAIC01MTEsMTIgKzUxMSwxNiBAQCBib29sIGln
dF9zZXR1cF9ydW50aW1lX3BtKHZvaWQpCj4gPiAgIAo+ID4gICAgICAgaWd0X3BtX2VuYWJsZV9h
dWRpb19ydW50aW1lX3BtKCk7Cj4gPiAgIAo+ID4gLSAgICAgLyogT3VyIGltcGxlbWVudGF0aW9u
IHVzZXMgYXV0b3N1c3BlbmQuIFRyeSB0byBzZXQgaXQgdG8gMG1zIHNvIHRoZSB0ZXN0Cj4gPiAt
ICAgICAgKiBzdWl0ZSBnb2VzIGZhc3RlciBhbmQgd2UgaGF2ZSBhIGhpZ2hlciBwcm9iYWJpbGl0
eSBvZiB0cmlnZ2VyaW5nIHJhY2UKPiA+IC0gICAgICAqIGNvbmRpdGlvbnMuICovCj4gPiArICAg
ICAvKgo+ID4gKyAgICAgICogT3VyIGltcGxlbWVudGF0aW9uIHVzZXMgYXV0b3N1c3BlbmQuIFRy
eSB0byBzZXQgaXQgdG8gMG1zIHNvIHRoZQo+ID4gKyAgICAgICogdGVzdCBzdWl0ZSBnb2VzIGZh
c3RlciBhbmQgd2UgaGF2ZSBhIGhpZ2hlciBwcm9iYWJpbGl0eSBvZgo+ID4gKyAgICAgICogdHJp
Z2dlcmluZyByYWNlIGNvbmRpdGlvbnMuCj4gPiArICAgICAgKi8KPiA+ICAgICAgIGZkID0gb3Bl
bihQT1dFUl9ESVIgIi9hdXRvc3VzcGVuZF9kZWxheV9tcyIsIE9fUkRXUik7Cj4gPiAtICAgICBp
Z3RfYXNzZXJ0X2YoZmQgPj0gMCwKPiA+IC0gICAgICAgICAgICAgICAgICAiQ2FuJ3Qgb3BlbiAi
IFBPV0VSX0RJUiAiL2F1dG9zdXNwZW5kX2RlbGF5X21zXG4iKTsKPiA+ICsgICAgIGlmIChmZCA8
IDApIHsKPiA+ICsgICAgICAgICAgICAgaWd0X3BtX2F1ZGlvX3Jlc3RvcmVfcnVudGltZV9wbSgp
Owo+ID4gKyAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gCj4gV29ydGggcm9idXN0aWZ5aW5n
IHdpdGggYW4gaWd0X2Fzc2VydF9lcShlcnJubywgRU5PRU5UKSA/CgpZb3UgYXJlIGp1c3QgZHlp
bmcgdG8gZGVidWcgYWxsIHRoZSB0cmFuc2llbnQgRU5PTUVNIGFuZCBFTUZJTEUgYXJlbid0Cnlv
dSEgOikKLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
