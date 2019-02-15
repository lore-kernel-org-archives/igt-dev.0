Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61B96E09E
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Feb 2019 19:54:29 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20190215132638.18978-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20190215132638.18978-1-ville.syrjala@linux.intel.com>
Message-ID: <155026045915.18261.10349241759581838041@skylake-alporthouse-com>
Date: Fri, 15 Feb 2019 19:54:24 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] lib/debugfs: Nuke enum
 intel_pipe_crc_source
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

UXVvdGluZyBWaWxsZSBTeXJqYWxhIHZpYSBpZ3QtZGV2ICgyMDE5LTAyLTE1IDEzOjI2OjM4KQo+
ICBzdGF0aWMgaWd0X3BpcGVfY3JjX3QgKgo+IC1waXBlX2NyY19uZXcoaW50IGZkLCBlbnVtIHBp
cGUgcGlwZSwgZW51bSBpbnRlbF9waXBlX2NyY19zb3VyY2Ugc291cmNlLCBpbnQgZmxhZ3MpCj4g
K3BpcGVfY3JjX25ldyhpbnQgZmQsIGVudW0gcGlwZSBwaXBlLCBjb25zdCBjaGFyICpzb3VyY2Us
IGludCBmbGFncykKPiAgewo+ICAgICAgICAgaWd0X3BpcGVfY3JjX3QgKnBpcGVfY3JjOwo+ICAg
ICAgICAgY2hhciBidWZbMTI4XTsKPiBAQCAtNjc5LDcgKzY2MSw3IEBAIHBpcGVfY3JjX25ldyhp
bnQgZmQsIGVudW0gcGlwZSBwaXBlLCBlbnVtIGludGVsX3BpcGVfY3JjX3NvdXJjZSBzb3VyY2Us
IGludCBmbGFnCj4gICAgICAgICBwaXBlX2NyYy0+ZmQgPSBmZDsKPiAgICAgICAgIHBpcGVfY3Jj
LT5kaXIgPSBkZWJ1Z2ZzOwo+ICAgICAgICAgcGlwZV9jcmMtPnBpcGUgPSBwaXBlOwo+IC0gICAg
ICAgcGlwZV9jcmMtPnNvdXJjZSA9IHNvdXJjZTsKPiArICAgICAgIHBpcGVfY3JjLT5zb3VyY2Ug
PSBzdHJkdXAoc291cmNlKTsKCnhzdHJkdXAoKQppZ3RfYXNzZXJ0KHBpcGVfY3JjLT5zb3VyY2Up
OwoKUHJvYmFibHkgbWVyaXRzIGFuIGlndF9hc3NlcnQoc291cmNlKSBvbiBlbnRyeSBhcyB3ZWxs
LgoKPiAtZW51bSBpbnRlbF9waXBlX2NyY19zb3VyY2Ugewo+IC0gICAgICAgIElOVEVMX1BJUEVf
Q1JDX1NPVVJDRV9OT05FLAo+IC0gICAgICAgIElOVEVMX1BJUEVfQ1JDX1NPVVJDRV9QTEFORTEs
Cj4gLSAgICAgICAgSU5URUxfUElQRV9DUkNfU09VUkNFX1BMQU5FMiwKPiAtICAgICAgICBJTlRF
TF9QSVBFX0NSQ19TT1VSQ0VfUEYsCj4gLSAgICAgICAgSU5URUxfUElQRV9DUkNfU09VUkNFX1BJ
UEUsCj4gLSAgICAgICAgSU5URUxfUElQRV9DUkNfU09VUkNFX1RWLAo+IC0gICAgICAgIElOVEVM
X1BJUEVfQ1JDX1NPVVJDRV9EUF9CLAo+IC0gICAgICAgIElOVEVMX1BJUEVfQ1JDX1NPVVJDRV9E
UF9DLAo+IC0gICAgICAgIElOVEVMX1BJUEVfQ1JDX1NPVVJDRV9EUF9ELAo+IC0gICAgICAgIElO
VEVMX1BJUEVfQ1JDX1NPVVJDRV9BVVRPLAo+IC0gICAgICAgIElOVEVMX1BJUEVfQ1JDX1NPVVJD
RV9NQVgsCj4gLX07Cj4gKyNkZWZpbmUgSU5URUxfUElQRV9DUkNfU09VUkNFX0FVVE8gImF1dG8i
CgpBaCB0aGF0J3MgdGhlIG1hZ2ljIGJlaGluZCB0aGUgcGF0Y2ggYmVpbmcgc28gdGlueS4KClJl
dmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLUNocmlz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
