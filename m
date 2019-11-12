Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898C86EA6E
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2019 08:14:20 +0000 (UTC)
Date: Tue, 12 Nov 2019 10:14:17 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20191112081417.GQ25209@platvala-desk.ger.corp.intel.com>
References: <1573482181-19497-1-git-send-email-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573482181-19497-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_persistence: fix gcc
 warning
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTEsIDIwMTkgYXQgMDQ6MjM6MDFQTSArMDIwMCwgSnVoYS1QZWtrYSBIZWlr
a2lsYSB3cm90ZToKPiBjYXN0aW5nIHVuc2lnbmVkIGNoYXIgcG9pbnRlciB0byBpbnQgcG9pbnRl
ciBjYXVzZXMgZ2NjIHRvIGJlIHVuaGFwcHkgd2l0aAo+IGNvbW1lbnQ6ICJ3YXJuaW5nOiBkZXJl
ZmVyZW5jaW5nIHR5cGUtcHVubmVkIHBvaW50ZXIgd2lsbCBicmVhawo+IHN0cmljdC1hbGlhc2lu
ZyBydWxlcyIKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWhhLVBla2thIEhlaWtraWxhIDxqdWhhcGVr
a2EuaGVpa2tpbGFAZ21haWwuY29tPgoKRGVqYS12dSdkIGJ5LCBubyBJIG1lYW4KClJldmlld2Vk
LWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KCgo+IC0tLQo+ICB0
ZXN0cy9pOTE1L2dlbV9jdHhfcGVyc2lzdGVuY2UuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2k5
MTUvZ2VtX2N0eF9wZXJzaXN0ZW5jZS5jIGIvdGVzdHMvaTkxNS9nZW1fY3R4X3BlcnNpc3RlbmNl
LmMKPiBpbmRleCBhNTgyZTY0Li4yNTI1YTg1IDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2k5MTUvZ2Vt
X2N0eF9wZXJzaXN0ZW5jZS5jCj4gKysrIGIvdGVzdHMvaTkxNS9nZW1fY3R4X3BlcnNpc3RlbmNl
LmMKPiBAQCAtNDIwLDcgKzQyMCw3IEBAIHN0YXRpYyB2b2lkIHNlbmRmZChpbnQgc29ja2V0LCBp
bnQgZmQpCj4gIAljbXNnLT5jbXNnX2xldmVsID0gU09MX1NPQ0tFVDsKPiAgCWNtc2ctPmNtc2df
dHlwZSA9IFNDTV9SSUdIVFM7Cj4gIAljbXNnLT5jbXNnX2xlbiA9IG1zZy5tc2dfY29udHJvbGxl
bjsKPiAtCSooaW50ICopQ01TR19EQVRBKGNtc2cpID0gZmQ7Cj4gKwltZW1jcHkoQ01TR19EQVRB
KGNtc2cpLCAmZmQsIHNpemVvZihmZCkpOwo+ICAKPiAgCWlndF9hc3NlcnQoc2VuZG1zZyhzb2Nr
ZXQsICZtc2csIDApICE9IC0xKTsKPiAgfQo+IC0tIAo+IDIuNy40Cj4gCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBpZ3QtZGV2IG1haWxpbmcgbGlz
dAo+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldg==
