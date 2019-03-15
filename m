Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0E46E525
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2019 21:11:22 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190315192829.GA30702@intel.com>
References: <20190215214608.32021-1-prathap.kumar.valsan@intel.com>
 <20190314172852.16603-1-prathap.kumar.valsan@intel.com>
 <155263959127.4168.5666016659107127104@skylake-alporthouse-com>
 <20190315192829.GA30702@intel.com>
Message-ID: <155268425818.4168.11439641025054976800@skylake-alporthouse-com>
Date: Fri, 15 Mar 2019 21:11:08 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v6] i915/gem_mocs_settings: Add mocs
 table for icelake
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
To: "Kumar Valsan, Prathap" <prathap.kumar.valsan@intel.com>
Cc: igt-dev@lists.freedesktop.org, De Marchi Lucas <lucas.demarchi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBLdW1hciBWYWxzYW4sIFByYXRoYXAgKDIwMTktMDMtMTUgMTk6Mjg6MjkpCj4gT24g
RnJpLCBNYXIgMTUsIDIwMTkgYXQgMDg6NDY6MzFBTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdyb3Rl
Ogo+ID4gQnV0IG90aGVyIHRoYW4gdGhhdCwgSSB0aGluayB0aGUgdGVzdCBpcyBzb3VuZCBhbmQg
ZXhlcmNpc2VzIHRoZSB1QUJJCj4gPiBjb3JyZWN0bHkgKGkuZS4gY2xpZW50cyBkZXBlbmQgb24g
dGhlIE1PQ1MgdmFsdWVzIGJlaW5nIHN0YXRpYykuIEJvbnVzCj4gPiBwb2ludHMgZm9yIHByb3Zp
bmcgYW4gaW52YWxpZCBNT0NTIHZhbHVlIHdpdGhvdXQgcmVhZGluZyBhIHJlZ2lzdGVyIDopCj4g
UHJvdmluZyBhbiBpbnZhbGlkIE1PQ1MgdmFsdWUgd2l0aG91dCByZWFkaW5nIGEgcmVnaXN0ZXIg
IHdhc24ndAo+IHN1Y2Nlc3NmdWwuIE9uZSB0aGluZyBpIHRyaWVkIGlzIHVzaW5nIEk5MTVfUEFS
QU1fSEFTX0NPTlRFWFRfSVNPTEFUSU9OOgo+IGNyZWF0ZWQgYSBzZWNvbmQgY29udGV4dCBhZnRl
ciB3cml0aW5nIHRvIG1vY3MgdXNpbmcgZmlyc3QgY29udGV4dC4gVGhlbgo+IGNoZWNrIHRoZSB2
YWx1ZSByZXR1cm5lZCBieSBJOTE1X1BBUkFNX0hBU19DT05URVhUX0lTT0xBVElPTi4gSWYgdGhl
Cj4gc2Vjb25kIGNvbnRleHQgaW5oZXJpdGVkIHRoZSBtb2NzIGZyb20gdGhlIGZpcnN0IGNvbnRl
eHQsIHRoZW4gdGhpcwo+IGlvY3RsIHNob3VsZCByZXR1cm4gZmFsc2UgZm9yIHRoZSByZXNwZWN0
aXZlIGVuZ2luZT8gTm90IHZlcnkgc3VyZSBpIGFtCj4gaGVhZGluZyBhdCB0aGUgcmlnaHQgZGly
ZWN0aW9uLiBXaWxsIGhhdmUgdG8gZXhwZXJpbWVudCBmdXJ0aGVyIGFzIFRPRE8uCj4gOikKCk5v
LCB0aGF0IHBhcmFtIGNvbmNlcm5zIGEgc2VwYXJhdGUgdUFCSSBidWcgd2hlcmVieSB0aGUgaW5p
dGlhbCBzdGF0ZSBvZgpjb250ZXh0IHNhdmVkIHJlZ2lzdGVycyB3ZXJlIG5vdCBzY3J1YmJlZCBi
ZWZvcmUgbmV3IGNvbnRleHRzLiBHbG9iYWwKbW9jcyBzdGF0ZSBkb2VzIG5vdCBmYWxsIHVuZGVy
IHRoZSB1bWJyZWxsYSBvZiBjb250ZXh0IHJlZ3MsIHNvIHRoZQpIQVNfQ09OVEVYVF9JU09MQVRJ
T04gcGFyYW0gZG9lc24ndCBhcHBseSB1bml2ZXJzYWxseS4KCkJ1dCBzdGlsbCwgaXQgaXMgYSB1
QUJJIGJ1ZyBmb3Igb25lIGNvbnRleHQgdG8gc2VlIHRoZSBhbHRlcmVkIG1vY3MKc3RhdGUgb2Yg
YW5vdGhlciBjb250ZXh0OyBpcnJlc3BlY3RpdmUgb2YgdGhhdCBwYXJhbS4gOikKCkZvciBwcm92
aW5nIG1vY3MgYWN0dWFsbHkgZG9lcyBzb21ldGhpbmcsIHdlIG5lZWQgdG8gbG9vayB0b3dhcmRz
IHRoZQpjb2hlcmVuY3kgaXNzdWVzIGJldHdlZW4gZGlmZmVyZW50IG1vY3Mgc2V0dGluZ3M7IGFu
ZCBkZXRlY3RpbmcgdGhvc2UKcXVpY2tseSBhbmQgcmVsaWFibHkgaXMgaGFyZC4KLUNocmlzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
