Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9038930F
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2019 12:59:59 +0000 (UTC)
Date: Wed, 12 Jun 2019 15:59:56 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190612125956.GM22949@platvala-desk.ger.corp.intel.com>
References: <20190612125222.8447-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190612125222.8447-1-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_aux/hang_detector: Don't enable
 reset if it's explicitly disabled
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMDM6NTI6MjJQTSArMDMwMCwgQXJrYWRpdXN6IEhpbGVy
IHdyb3RlOgo+IFdlIGRvbid0IGV4cGVjdCB0byBoYW5nIGR1cmluZyB0aGUgdGVzdHMgdXNpbmcg
aGFuZ19kZXRlY3RvciwgYW5kIHRoZQo+IG9ubHkgZGlmZmVyZW5jZSBpcyBtb3JlIHNldmVyZSBm
YWxsb3V0IGluIGNhc2UgYSBoYW5nIGFjdHVhbGx5IGhhcHBlbnMKPiBhbmQgZmV3ZXIgc3VycHJp
c2VkIHBlb3BsZSBzZWVpbmcgcmVzZXQgbXlzdGVyaW91c2x5IGVuYWJsZWQgYSBjb3VwbGUgb2YK
PiB0ZXN0cyBkb3duIHRoZSBsaW5lLgo+IAo+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlz
LXdpbHNvbi5jby51az4KPiBDYzogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50
ZWwuY29tPgo+IC0tLQo+ICBsaWIvaWd0X2F1eC5jIHwgNSArKystLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9saWIv
aWd0X2F1eC5jIGIvbGliL2lndF9hdXguYwo+IGluZGV4IDU3OGY4NTc5Li5hZjIxZmRhYyAxMDA2
NDQKPiAtLS0gYS9saWIvaWd0X2F1eC5jCj4gKysrIGIvbGliL2lndF9hdXguYwo+IEBAIC01MTQs
OCArNTE0LDkgQEAgdm9pZCBpZ3RfZm9ya19oYW5nX2RldGVjdG9yKGludCBmZCkKPiAgCSAqIHRo
ZXkgYXJlIGEgdGVzdCBmYWlsdXJlISkgYW5kIHNvIHRoZSBsb3NzIG9mIHBlci1lbmdpbmUgcmVz
ZXQKPiAgCSAqIGZ1bmN0aW9uYWxpdHkgaXMgbm90IGFuIGlzc3VlLgo+ICAJICovCj4gLQlpZ3Rf
YXNzZXJ0KGlndF9zeXNmc19zZXRfcGFyYW1ldGVyCj4gLQkJICAgKGZkLCAicmVzZXQiLCAiJWQi
LCAxIC8qIG9ubHkgZ2xvYmFsIHJlc2V0ICovKSk7Cj4gKwlpZiAoaWd0X3N5c2ZzX2dldF91MzIo
ZmQsICJyZXNldCIpICE9IDApIC8qIGlmIHJlc2V0IGlzIG5vdCBleHBsaWNpdGx5IGRpc2FibGVk
ICovCj4gKwkJaWd0X2Fzc2VydChpZ3Rfc3lzZnNfc2V0X3BhcmFtZXRlcgo+ICsJCQkgICAoZmQs
ICJyZXNldCIsICIlZCIsIDEgLyogb25seSBnbG9iYWwgcmVzZXQgKi8pKTsKCmlndF9zeXNmc19n
ZXRfKigpIHRha2UgYW4gZmQgdG8gdGhlIF9kaXJlY3RvcnlfLCB0aGlzIGZkIGlzIGZvciB0aGUK
ZGV2aWNlLiBZb3UgbmVlZCB0byBjYWxsIGlndF9zeXNmc19vcGVuX3BhcmFtZXRlcnMoZmQpIHRv
IGdldCB0aGUgZGlyLgoKCi0tIApQZXRyaSBMYXR2YWxhCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldg==
