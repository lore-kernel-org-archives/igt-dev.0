Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A176E78E
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Aug 2018 18:31:31 +0000 (UTC)
Date: Thu, 30 Aug 2018 11:30:54 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20180830183054.GM6418@intel.com>
References: <20180830071956.7348-1-dhinakaran.pandiyan@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180830071956.7348-1-dhinakaran.pandiyan@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/psr: Skip kms_psr on pre-Gen9
 hardware
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
To: Dhinakaran Pandiyan <dhinakaran.pandiyan@gmail.com>
Cc: igt-dev@lists.freedesktop.org, Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBBdWcgMzAsIDIwMTggYXQgMTI6MTk6NTZBTSAtMDcwMCwgRGhpbmFrYXJhbiBQYW5k
aXlhbiB3cm90ZToKPiBDSSBydW5zIHNob3cgUFNSIHRlc3RzIGZhaWxpbmcgb24gdGhlIHJlY2Vu
dGx5IGFkZGVkIEJEVyAoZmktYmR3LXNhbXVzKSwgaXQKPiBtYWtlcyBzZW5zZSB0byBlbmFibGUg
dGhlc2UgdGVzdHMgd2hlbiB3ZSBrbm93IHRoZXkgYXJlIGV4cGVjdGVkIHRvIHBhc3MuCj4gCj4g
U2lnbmVkLW9mZi1ieTogRGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBp
bnRlbC5jb20+Cj4gLS0tCj4gIHRlc3RzL2ttc19wc3IuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3Bzci5jIGIvdGVz
dHMva21zX3Bzci5jCj4gaW5kZXggMjE4YjM5NjAuLjUyYjcxODI2IDEwMDY0NAo+IC0tLSBhL3Rl
c3RzL2ttc19wc3IuYwo+ICsrKyBiL3Rlc3RzL2ttc19wc3IuYwo+IEBAIC00MTEsNiArNDExLDcg
QEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKPiAgCQlkYXRhLmRlYnVnZnNfZmQg
PSBpZ3RfZGVidWdmc19kaXIoZGF0YS5kcm1fZmQpOwo+ICAJCWttc3Rlc3Rfc2V0X3Z0X2dyYXBo
aWNzX21vZGUoKTsKPiAgCQlkYXRhLmRldmlkID0gaW50ZWxfZ2V0X2RybV9kZXZpZChkYXRhLmRy
bV9mZCk7Cj4gKwkJaWd0X3JlcXVpcmUoQVRfTEVBU1RfR0VOKGRhdGEuZGV2aWQsIDkpKTsKCm9o
ISBJIGxpa2VkIHRoaXMgbWFjcm8uLi4gd2h5IGRvbid0IHdlIGhhdmUgdGhlIHNhbWUgb24ga2Vy
bmVsIHNpZGU/IDopCgpidXQgYXMgd2UgdGFsa2VkIGluIHB2dCBJIGRvbid0IGxpa2UgdGhlIGFw
cHJvYWNoLiBJIHByZWZlciB0aGF0CndlIGtlZXAgaG9uZXN0IGFuZCB0cmFuc3BhcmVudCBvZiB0
aGUgaXNzdWVzIHRoYXQgd2UgaGF2ZSBvbiBwcmV2aW91cwpnZW5zLgoKQWxzbyB3ZSBoYXZlIHRo
ZSB2aXNpYmlsaXR5IGlmIGFueSBjaGFuZ2Ugd2UgbWFrZSB0YXJnZXRpbmcgZ2VuOQppcyBub3Qg
cG9zc2libHkgZml4aW5nIG9yIGNhdXNpbmcgZXZlbiBtb3JlIHRyb3VibGVzIG9uIG9sZGVyIGdl
bnMuCgpUaGFua3MsClJvZHJpZ28uCgo+ICAKPiAgCQlpZ3Rfc2V0X21vZHVsZV9wYXJhbV9pbnQo
ImVuYWJsZV9wc3IiLCBkYXRhLndpdGhfcHNyX2Rpc2FibGVkID8KPiAgCQkJCQkgMCA6IDEpOwo+
IC0tIAo+IDIuMTcuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gaWd0LWRldiBtYWlsaW5nIGxpc3QKPiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
