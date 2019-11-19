Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD7B6E075
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2019 11:08:33 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20191119110117.13209-1-venkata.s.dhanalakota@intel.com>
In-Reply-To: <20191119110117.13209-1-venkata.s.dhanalakota@intel.com>
Message-ID: <157416170876.10169.1533103631591014444@skylake-alporthouse-com>
Date: Tue, 19 Nov 2019 11:08:28 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] test/i915: gem_ctx_exec: Fix for
 using context engine map
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
To: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBWZW5rYXRhIFNhbmRlZXAgRGhhbmFsYWtvdGEgKDIwMTktMTEtMTkgMTE6MDE6MTYp
Cj4gU2luY2UgZW5naW5lcyBhcmUgbm93IGxvb2tlZCB1cCBiYXNlZCBvbiBjb250ZXh0IGVuZ2lu
ZSBtYXAsCj4gY29udGV4dCBzaG91bGQgYmUgc2V0dXAgd2l0aCBlbmdpbmVzIGJlZm9yZSB1c2lu
ZyBpbiBleGVjYnVmLgo+IAo+IEZpeGVzOiAxYTdmMmU1OSBpZ3QoImdlbV9jdHhfZXhlYzogdXNl
IHRoZSBnZW1fZW5naW5lX3RvcG9sb2d5Igo+IAo+IENjOiBBbmRpIFNoeXRpIDxhbmRpLnNoeXRp
QGludGVsLmNvbT4KPiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+
Cj4gQ2M6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBsaW51eC5pbnRlbC5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogVmVua2F0YSBTYW5kZWVwIERoYW5hbGFrb3RhIDx2ZW5rYXRhLnMuZGhh
bmFsYWtvdGFAaW50ZWwuY29tPgo+IC0tLQo+ICB0ZXN0cy9pOTE1L2dlbV9jdHhfZXhlYy5jIHwg
MSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS90
ZXN0cy9pOTE1L2dlbV9jdHhfZXhlYy5jIGIvdGVzdHMvaTkxNS9nZW1fY3R4X2V4ZWMuYwo+IGlu
ZGV4IDZjMmNkOTIyLi4yYmY0N2NmMiAxMDA2NDQKPiAtLS0gYS90ZXN0cy9pOTE1L2dlbV9jdHhf
ZXhlYy5jCj4gKysrIGIvdGVzdHMvaTkxNS9nZW1fY3R4X2V4ZWMuYwo+IEBAIC0xMzIsNiArMTMy
LDcgQEAgc3RhdGljIHZvaWQgaW52YWxpZF9jb250ZXh0KGludCBmZCwgY29uc3Qgc3RydWN0IGlu
dGVsX2V4ZWN1dGlvbl9lbmdpbmUyICplLAo+ICAgICAgICAgZ2VtX2V4ZWNidWYoZmQsICZleGVj
YnVmKTsKPiAgCj4gICAgICAgICBjdHggPSBnZW1fY29udGV4dF9jcmVhdGUoZmQpOwo+ICsgICAg
ICAgZ2VtX2NvbnRleHRfc2V0X2FsbF9lbmdpbmVzKGZkLCBjdHgpOwoKSXJyZWxldmFudC4KLUNo
cmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
