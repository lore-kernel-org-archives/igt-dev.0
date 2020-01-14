Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCFCE891CB
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jan 2020 14:29:33 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200114142523.10603-1-ville.syrjala@linux.intel.com>
 <20200114142523.10603-7-ville.syrjala@linux.intel.com>
In-Reply-To: <20200114142523.10603-7-ville.syrjala@linux.intel.com>
Message-ID: <157901216899.5559.6627170876783910455@skylake-alporthouse-com>
Date: Tue, 14 Jan 2020 14:29:29 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 7/7] tools/intel_panel_fitter: Fix
 abs(unsigned)
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDIwLTAxLTE0IDE0OjI1OjIzKQo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gLi4vdG9vbHMv
aW50ZWxfcGFuZWxfZml0dGVyLmM6IEluIGZ1bmN0aW9uIOKAmGNoYW5nZV9zY3JlZW5fc2l6ZeKA
mToKPiAuLi90b29scy9pbnRlbF9wYW5lbF9maXR0ZXIuYzoxODM6MTA6IHdhcm5pbmc6IHRha2lu
ZyB0aGUgYWJzb2x1dGUgdmFsdWUgb2YgdW5zaWduZWQgdHlwZSDigJh1aW50MzJfdOKAmSB7YWth
IOKAmHVuc2lnbmVkIGludOKAmX0gaGFzIG5vIGVmZmVjdCBbLVdhYnNvbHV0ZS12YWx1ZV0KPiAg
IDE4MyB8ICBwb3NfeCA9IGFicygoaW5mby50b3Rfd2lkdGggLSBkc3Rfd2lkdGgpKSAvIDI7Cj4g
ICAgICAgfCAgICAgICAgICBefn4KPiAuLi90b29scy9pbnRlbF9wYW5lbF9maXR0ZXIuYzoxODQ6
MTA6IHdhcm5pbmc6IHRha2luZyB0aGUgYWJzb2x1dGUgdmFsdWUgb2YgdW5zaWduZWQgdHlwZSDi
gJh1aW50MzJfdOKAmSB7YWthIOKAmHVuc2lnbmVkIGludOKAmX0gaGFzIG5vIGVmZmVjdCBbLVdh
YnNvbHV0ZS12YWx1ZV0KPiAgIDE4NCB8ICBwb3NfeSA9IGFicygoaW5mby50b3RfaGVpZ2h0IC0g
ZHN0X2hlaWdodCkpIC8gMjsKPiAgICAgICB8ICAgICAgICAgIF5+fgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CgpBIGJp
dCBvZiBhIGRvdWJsZSB0YWtlIG9uICM2ICh0aGF0IHdhcyBtb3JlIHRoYW4gSSBleHBlY3RlZCB3
b3VsZCBiZQpyZXF1aXJlZCBmb3IgdGhlIHdhcm5pbmcpLCBzZXJpZXMgaXMKClJldmlld2VkLWJ5
OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLUNocmlzCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
