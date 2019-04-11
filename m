Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCB4898CA
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2019 20:08:49 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <690e6033-4f08-fa82-7e22-71a9c7debe6a@intel.com>
References: <20190325232043.7953-1-antonio.argenziano@intel.com>
 <20190325232043.7953-4-antonio.argenziano@intel.com>
 <155355700301.15930.1926732769716588493@skylake-alporthouse-com>
 <a015d2f0-ed94-7fd9-5f54-8841cbd4a882@intel.com>
 <690e6033-4f08-fa82-7e22-71a9c7debe6a@intel.com>
Message-ID: <155501332246.2474.3320324438260318549@skylake-alporthouse-com>
Date: Thu, 11 Apr 2019 21:08:42 +0100
Subject: Re: [igt-dev] [RFT v4 4/6] igt/i915: Require GTT mapping to be
 available when needed.
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, igt-dev@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTktMDQtMTEgMTk6MTM6MjApCj4gCj4gCj4g
T24gMjcvMDMvMTkgMTQ6MDUsIEFudG9uaW8gQXJnZW56aWFubyB3cm90ZToKPiA+IAo+ID4gCj4g
PiBPbiAyNS8wMy8xOSAxNjozNiwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4+IFF1b3RpbmcgQW50
b25pbyBBcmdlbnppYW5vICgyMDE5LTAzLTI1IDIzOjIwOjQxKQo+IAo+ID4+PiBkaWZmIC0tZ2l0
IGEvdGVzdHMvaTkxNS9nZW1fcmVuZGVyX2NvcHkuYyBiL3Rlc3RzL2k5MTUvZ2VtX3JlbmRlcl9j
b3B5LmMKPiA+Pj4gaW5kZXggOGQ2MmEwZjQuLjU3NTdjNTQ3IDEwMDY0NAo+ID4+PiAtLS0gYS90
ZXN0cy9pOTE1L2dlbV9yZW5kZXJfY29weS5jCj4gPj4+ICsrKyBiL3Rlc3RzL2k5MTUvZ2VtX3Jl
bmRlcl9jb3B5LmMKPiA+Pj4gQEAgLTU3Miw2ICs1NzIsOCBAQCBzdGF0aWMgdm9pZCB0ZXN0KGRh
dGFfdCAqZGF0YSwgdWludDMyX3QgdGlsaW5nLCAKPiA+Pj4gdWludDY0X3QgY2NzX21vZGlmaWVy
KQo+ID4+PiDCoMKgwqDCoMKgwqDCoMKgIGludCBvcHRfZHVtcF9hdWIgPSBpZ3RfYXViX2R1bXBf
ZW5hYmxlZCgpOwo+ID4+PiDCoMKgwqDCoMKgwqDCoMKgIGludCBudW1fc3JjID0gQVJSQVlfU0la
RShzcmMpOwo+ID4+PiArwqDCoMKgwqDCoMKgIGdlbV9yZXF1aXJlX21tYXBfZ3R0KGRhdGEtPmRy
bV9mZCk7Cj4gPj4KPiA+PiBXZSBzaG91bGQgbWFrZSBzdXJlIGdlbV9yZW5kZXJfY29weSByZW1h
aW5zIGF2YWlsYWJsZSBmb3IgZGVidWdnaW5nIHRoZQo+ID4+IHJlbmRlcmNvcHkgcm91dGluZXMs
IEkgZG91YnQgdGhleSBhcmUgZ29pbmcgYXdheS4KPiAKPiBXZSBjYW4gb25seSBrZWVwIHRoZSBv
bmUgdGhhdCBkb2Vzbid0IGRvIHRpbGluZyBBRkFJQ1QuCgpEZXRpbGluZyBvbiB0aGUgY3B1IGlz
IGVhc3kgZW5vdWdoLCBvciBkZXRpbGUgb24gdGhlIGdwdS4gVGhlIGxhdHRlciBpcwphIGxpdHRs
ZSBsZXNzIGJ1bGxldCBwcm9vZiAoMiByZW5kZXJjb3BpZXMgdG8gZGVidWcgZm9yIHRoZSBwcmlj
ZSBvZiAxKS4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
