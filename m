Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180815110131.GA8037@ideak-desk.fi.intel.com>
References: <20180815092511.3838-1-chris@chris-wilson.co.uk>
 <20180815110131.GA8037@ideak-desk.fi.intel.com>
Message-ID: <153433105483.4061.4330436998117077204@skylake-alporthouse-com>
Date: Wed, 15 Aug 2018 12:04:14 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] igt/pm_rpm: Close local fd before
 trying to unload module
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
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBJbXJlIERlYWsgKDIwMTgtMDgtMTUgMTI6MDE6MzEpCj4gT24gV2VkLCBBdWcgMTUs
IDIwMTggYXQgMTA6MjU6MTFBTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4gRml4ZXM6
IGQ4ZTc4OTkwYWEyYiAoImlndC9wbV9ycG06IFRlc3QgcmVhcXVpc2l0aW9uIG9mIHJ1bnRpbWUt
cG0gYWZ0ZXIgbW9kdWxlIHJlbG9hZCIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24g
PGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiA+IC0tLQo+ID4gIHRlc3RzL3BtX3JwbS5jIHwg
MiArKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAt
LWdpdCBhL3Rlc3RzL3BtX3JwbS5jIGIvdGVzdHMvcG1fcnBtLmMKPiA+IGluZGV4IDY1NDg5YmNk
Yi4uYTRmOWY3ODNlIDEwMDY0NAo+ID4gLS0tIGEvdGVzdHMvcG1fcnBtLmMKPiA+ICsrKyBiL3Rl
c3RzL3BtX3JwbS5jCj4gPiBAQCAtMjAzNCw2ICsyMDM0LDggQEAgaW50IG1haW4oaW50IGFyZ2Ms
IGNoYXIgKmFyZ3ZbXSkKPiA+ICAgICAgICAgICAgICAgdGVhcmRvd25fZW52aXJvbm1lbnQoKTsK
PiA+ICAKPiA+ICAgICAgIGlndF9zdWJ0ZXN0KCJtb2R1bGUtcmVsb2FkIikgewo+ID4gKyAgICAg
ICAgICAgICB0ZWFyZG93bl9lbnZpcm9ubWVudCgpOwo+ID4gKwo+IAo+IFdoeSBpc24ndCB0aGUg
dGVhcmRvd25fZW52aXJvbm1lbnQoKTsgdW5kZXIgaWd0X2ZpeHR1cmUgZW5vdWdoPwoKSG1tLCBs
b29rcyBsaWtlIEkgdGhvdWdodCBhYm91dCBpdCBlYXJsaWVyLiBJIGd1ZXNzIHdlIGxlYWsgYW4g
ZmQuLi4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
