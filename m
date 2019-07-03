Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D4F6E10C
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2019 10:37:52 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k8so1559852edr.11
 for <igt-dev@lists.freedesktop.org>; Wed, 03 Jul 2019 03:37:52 -0700 (PDT)
Date: Wed, 3 Jul 2019 12:37:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190703103746.GH15868@phenom.ffwll.local>
References: <20181016222341.1537-1-drawat@vmware.com>
 <20181016222341.1537-5-drawat@vmware.com>
 <CAKMK7uEUN_-cdkMxvO1VwhD7YhGTNgd56y+Z8Pjv53Ri7wMSNw@mail.gmail.com>
 <20190625060132.rsidgloshp7oz4ud@ahiler-desk1.fi.intel.com>
 <20190625153701.GA12905@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625153701.GA12905@phenom.ffwll.local>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 5/5] tests/kms_selftest:
 Integrate kernel selftest test-drm_modeset
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>, intel-gfx <intel-gfx@lists.freedesktop.org>, IGT development <igt-dev@lists.freedesktop.org>, VMware Graphics <linux-graphics-maintainer@vmware.com>, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDU6Mzc6MDFQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUdWUsIEp1biAyNSwgMjAxOSBhdCAwOTowMTozMkFNICswMzAwLCBBcmthZGl1
c3ogSGlsZXIgd3JvdGU6Cj4gPiBPbiBUaHUsIEp1biAyMCwgMjAxOSBhdCAwMzoyMDowMlBNICsw
MjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gPiBPbiBUdWUsIE9jdCAxNiwgMjAxOCBhdCAw
MzoyMzo0MVBNIC0wNzAwLCBEZWVwYWsgUmF3YXQgd3JvdGU6Cj4gPiA+ID4gQ2FsbCBrZXJuZWwg
c2VsZnRlc3QgbW9kdWxlIHRlc3QtZHJtX21vZGVzZXQgZm9yIHRlc3RpbmcgS01TLgo+ID4gPiA+
Cj4gPiA+ID4gdjI6Cj4gPiA+ID4gLSBBZGQgdGVzdCBhbHBoYWJldGljYWxseS4KPiA+ID4gPiAt
IEFkZCB0ZXN0IHRvIG1lc29uIGJ1aWxkLgo+ID4gPiA+Cj4gPiA+ID4gdjM6IFJlbmFtZSB0byBr
bXNfc2VsZnRlc3QuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEZWVwYWsgUmF3YXQg
PGRyYXdhdEB2bXdhcmUuY29tPgo+ID4gPiAKPiA+ID4gSnVzdCByZWFsaXplZCB0aGF0IHRoaXMg
bmV2ZXIgbGFuZGVkIC4uLiBhbnkgcmVhc29ucz8gV291bGQgYmUgbmljZSB0byBnZXQKPiA+ID4g
dGhpcyBoYW5kbGVkLgo+ID4gPiAKPiA+ID4gUGV0cmkvQXJlaz8KPiA+ID4gCj4gPiA+IENoZWVy
cywgRGFuaWVsCj4gPiAKPiA+IFdoYXQgZG8geW91IG1lYW4gYnkgInRoaXMgbmV2ZXIgbGFuZGVk
Ij8KPiA+IAo+ID4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pZ3QtZ3B1LXRv
b2xzL2NvbW1pdC83NzY2YjFlMjM0OGIKPiA+IAo+ID4gY29tbWl0IDc3NjZiMWUyMzQ4YjMyY2M4
ZWQ1OGE5NzJjNmZkNTNiMjAyNzk1NDkKPiA+IEF1dGhvcjogICAgIERlZXBhayBSYXdhdCA8ZHJh
d2F0QHZtd2FyZS5jb20+Cj4gPiBBdXRob3JEYXRlOiBUdWUgT2N0IDE2IDE1OjIzOjQxIDIwMTgg
LTA3MDAKPiA+IENvbW1pdDogICAgIERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwu
Y2g+Cj4gPiBDb21taXREYXRlOiBXZWQgT2N0IDE3IDA5OjQxOjA3IDIwMTggKzAyMDAKPiA+IAo+
ID4gdGVzdHMva21zX3NlbGZ0ZXN0OiBJbnRlZ3JhdGUga2VybmVsIHNlbGZ0ZXN0IHRlc3QtZHJt
X21vZGVzZXQKPiAKPiBIbSBub3Qgc3VyZSB3aGF0IEkgbG9va2VkIGF0LCBidXQgaXQgd2FzbnQg
dGhlcmUuIFNvcnJ5IGZvciB0aGUgbm9pc2UuCgpPayB0aGlzIG9uZSBoZXJlIGxhbmRlZCwgYnV0
IHRoZSBvdGhlciA0IGRpZG4ndCAuLi4gQ2FuIHdlIHVuYmxvY2sgdGhlbQpzb21laG93PyBPciBh
bnkgaG9sZC11cD8gV291bGQgYmUgbmljZSB0byBoYXZlIGlndHMgZm9yIGF0IGxlYXN0IHRoZSBt
b3JlCnJlY2VudGx5IGFkZGVkIHVhcGksIGVzcGVjaWFsbHkgd2hlbiB0aGUgdGVzdHMgZXhpc3Qg
Li4uCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldg==
