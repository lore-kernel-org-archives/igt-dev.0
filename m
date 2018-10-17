Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCAF1891C2
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Oct 2018 12:34:10 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20181017121545.29096-1-arkadiusz.hiler@intel.com>
References: <20181017121545.29096-1-arkadiusz.hiler@intel.com>
Message-ID: <153977963993.22931.1527870108804631182@skylake-alporthouse-com>
Date: Wed, 17 Oct 2018 13:34:00 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] tests: Rename drv_module_reload to
 i915_load
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>, Martin Peres <martin.peres@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBcmthZGl1c3ogSGlsZXIgKDIwMTgtMTAtMTcgMTM6MTU6NDMpCj4gVGhlIHRlc3Qg
aXMgaTkxNSBzcGVjaWZpYywgc28gbGV0J3MgYmUgY2xlYXIgb24gdGhhdC4gVGhlcmUgaXMgYWxz
byBtb3JlCj4gc3VidGVzdHMgY29taW5nIHRoYXQgYXJlIG5vdCBqdXN0IHJlbG9hZGluZy4KCkl0
J3Mgc3RpbGwgZm9jdXNzZWQgb24gbW9kdWxlX2xvYWQsIHNvIEkgd291bGQgd2FudCB0byBrZWVw
IG1vZHVsZSBpbgp0aGVyZSBzbyBpdCdzIGNsZWFybHkgbm90aGluZyB0byBkbyB3aXRoIHJ1bnRp
bWUgbG9hZHMgKHdvcmtsb2FkcykuCgpBbmQgYWRkaW5nIGEgJ2k5MTUnIGlzIGEgZ29vZCB0aW1l
IHRvIHN0YXJ0IGEgaTkxNS8KCj4gQ2M6IE1hcnRpbiBQZXJlcyA8bWFydGluLnBlcmVzQGxpbnV4
LmludGVsLmNvbT4KPiBDYzogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwu
Y29tPgo+IC0tLQo+ICB0ZXN0cy9NYWtlZmlsZS5zb3VyY2VzICAgICAgICAgICAgICAgICAgICAg
fCAyICstCj4gIHRlc3RzL3tkcnZfbW9kdWxlX3JlbG9hZC5jID0+IGk5MTVfbG9hZC5jfSB8IDAK
PiAgdGVzdHMvaW50ZWwtY2kvYmxhY2tsaXN0LnR4dCAgICAgICAgICAgICAgIHwgMiArLQo+ICB0
ZXN0cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0ICAgICAgfCA2ICsrKy0tLQo+ICB0
ZXN0cy9tZXNvbi5idWlsZCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCj4gIDUgZmls
ZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+ICByZW5hbWUgdGVz
dHMve2Rydl9tb2R1bGVfcmVsb2FkLmMgPT4gaTkxNV9sb2FkLmN9ICgxMDAlKQo+IAo+IGRpZmYg
LS1naXQgYS90ZXN0cy9NYWtlZmlsZS5zb3VyY2VzIGIvdGVzdHMvTWFrZWZpbGUuc291cmNlcwo+
IGluZGV4IGNkZjVhN2UxLi5hMWZhNmU5OCAxMDA2NDQKPiAtLS0gYS90ZXN0cy9NYWtlZmlsZS5z
b3VyY2VzCj4gKysrIGIvdGVzdHMvTWFrZWZpbGUuc291cmNlcwo+IEBAIC0yMiw2ICsyMiw3IEBA
IEFNREdQVV9URVNUUyA9IFwKPiAgICAgICAgICQoTlVMTCkKPiAgCj4gIFRFU1RTX3Byb2dzID0g
XAo+ICsgICAgICAgaTkxNV9sb2FkIFwKCidpJyBpcyBhZnRlciAnYycKLUNocmlzCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
