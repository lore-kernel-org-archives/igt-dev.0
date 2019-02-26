Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A919989FA0
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Feb 2019 16:33:34 +0000 (UTC)
References: <20190226002020.21550-1-antonio.argenziano@intel.com>
 <20190226094927.GC4038@platvala-desk.ger.corp.intel.com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <166a1abe-4ce7-6d2a-eac5-b5b56a475490@intel.com>
Date: Tue, 26 Feb 2019 08:33:33 -0800
MIME-Version: 1.0
In-Reply-To: <20190226094927.GC4038@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/i915: Move mmap IOCTLs wrappers
 into separate file
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAyNi8wMi8xOSAwMTo0OSwgUGV0cmkgTGF0dmFsYSB3cm90ZToKPiBPbiBNb24sIEZlYiAy
NSwgMjAxOSBhdCAwNDoyMDoxOVBNIC0wODAwLCBBbnRvbmlvIEFyZ2Vuemlhbm8gd3JvdGU6Cj4+
IE1vdmUgYWxsIG1tYXAgZmxhdm91cnMgYW5kIHN1cHBvcnQgZnVuY3Rpb24gdG8gc2VwYXJhdGUg
ZmlsZSBpbiBpOTE1Cj4+IGZvbGRlci4gVGhpcyBoZWxwcyB3aXRoIG1vdmluZyBpOTE1IHNwZWNp
ZmljIGZ1bmN0aW9ucyBhd2F5IGZyb20gY29tbW9uCj4+IGxpYnJhcmllcy4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogQW50b25pbyBBcmdlbnppYW5vIDxhbnRvbmlvLmFyZ2Vuemlhbm9AaW50ZWwuY29t
Pgo+PiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4+IC0tLQo+
PiAgIGxpYi9pOTE1L2dlbV9tbWFuLmMgIHwgMjU0ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKPj4gICBsaWIvaTkxNS9nZW1fbW1hbi5oICB8ICA1NSArKysrKysr
KysrCj4+ICAgbGliL2lvY3RsX3dyYXBwZXJzLmMgfCAyMTMgLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4+ICAgbGliL2lvY3RsX3dyYXBwZXJzLmggfCAgMjMgKy0tLQo+PiAg
IGxpYi9tZXNvbi5idWlsZCAgICAgIHwgICAxICsKPiAKPiAKPiBXaGVyZSdzIHRoZSBjaGFuZ2Ug
dG8gbGliL01ha2VmaWxlLnNvdXJjZXM/CgpPcHMsIEkgZm9yZ290IGFib3V0IHRoYXQuCgpUaGFu
a3MsCkFudG9uaW8KCj4gCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dg==
