Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E88A6E39B
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2019 16:11:59 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20191122130300.558951-1-lionel.g.landwerlin@intel.com>
 <20191122130300.558951-9-lionel.g.landwerlin@intel.com>
 <157443636615.2524.3175030323013777744@skylake-alporthouse-com>
 <7191fc53-f4a3-48ba-0557-edafd4ff66ee@intel.com>
 <157443789518.2524.2012790618955207394@skylake-alporthouse-com>
 <00eea48c-1e4f-446c-bc57-763c97c7ffd1@intel.com>
In-Reply-To: <00eea48c-1e4f-446c-bc57-763c97c7ffd1@intel.com>
Message-ID: <157443911421.2524.16229225306566043931@skylake-alporthouse-com>
Date: Fri, 22 Nov 2019 16:11:54 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v2 08/10] tests/i915/exec_fence: add
 timeline fence tests
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBMaW9uZWwgTGFuZHdlcmxpbiAoMjAxOS0xMS0yMiAxNjowMzoxNikKPiBPbiAyMi8x
MS8yMDE5IDE3OjUxLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBRdW90aW5nIExpb25lbCBMYW5k
d2VybGluICgyMDE5LTExLTIyIDE1OjQzOjExKQo+ID4+IE9uIDIyLzExLzIwMTkgMTc6MjYsIENo
cmlzIFdpbHNvbiB3cm90ZToKPiA+Pj4gUXVvdGluZyBMaW9uZWwgTGFuZHdlcmxpbiAoMjAxOS0x
MS0yMiAxMzowMjo1OCkKPiA+Pj4+IFdlIGNhbiBub3cgZ2l2ZSBhIHR1cGxlIChoYW5kbGUsIHBv
aW50X3ZhbHVlKSBmb3IgdGltZWxpbmUgc2VtYXBob3Jlcy4KPiA+Pj4+Cj4gPj4+PiB2MjogRml4
IHVwIHN5bmNvYmotdGltZWxpbmUtcmVwZWF0IHRlc3QgKExpb25lbCkKPiA+Pj4+ICAgICAgIFVw
ZGF0ZSBmb2xsb3dpbmcga2VybmVsIHJlbmFtZQo+ID4+Pj4KPiA+Pj4+IHYzOiBBZGQgbW9yZSBv
cmRlcmluZyB0ZXN0cyBmb3Igc3luY29iai9idWZmZXIgaGFuZGxlIHN0YXRlIChDaHJpcykKPiA+
Pj4gQW5vdGhlciBxdWVzdGlvbiwgZG8gd2Ugd29ycnkgYWJvdXQgc3dfc3luYyBpbXBvcnRlZCBm
ZW5jZXMgYmVpbmcKPiA+Pj4gaGFuZGxlcyBkaWZmZXJlbnRseSB0byBuYXRpdmU/Cj4gPj4+IC1D
aHJpcwo+ID4+IFdoYXQgZG8geW91IG1lYW4gYnkgZGlmZmVyZW50bHk/Cj4gPiBXZSBoYXZlIGlz
X2k5MTVfZmVuY2UoKSB3aXRoIGJyYW5jaGluZyBwYXRocyBmb3IgaW50ZXJuYWwvZXh0ZXJuYWws
IGFuZAo+ID4gd2l0aGluIHRoZSBzeW5jb2JqIHRpbWVsaW5lIG1peGVkIGZlbmNlIGNvbnRleHRz
IGNhdXNlIGEgaGFyZCBiYXJyaWVyLAo+ID4gc28gbWF5IHByZXNlbnQgaW50ZXJlc3RpbmcgZWZm
ZWN0cyBhdCB0aGUgdUFQSSBsYXllcj8KPiAKPiAKPiBXZWxsLi4uIHNhbWUgaXNzdWVzIHdpdGgg
YW4gYXJyYXkgb2YgaTkxNSBmZW5jZXMgcmlnaHQ/Cj4gCj4gCj4gSSBndWVzcyBmZW5jZV9zZXRf
cHJpb3JpdHkoKSBjb3VsZCBiZSBhZGp1c3RlZCB0byBkZWFsIHdpdGggCj4gZG1hLWZlbmNlLWNo
YWluIGxpa2UgaXQgZG9lcyB3aXRoIGRtYS1mZW5jZS1hcnJheS4KCk5vLCBlaXRoZXIgaXQncyBh
IGNoYWluIG9mIGZlbmNlIG9yIGl0J3MganVzdCBhIGxpc3QgKGFuZCBzaG91bGRuJ3QgYmUKY2Fs
bGluZyBpdHNlbGYgYSBjaGFpbiA7KS4gSWYgaXQgaXMgYSBjaGFpbiB3aXRoIGRlcGVuZGVuY2ll
cyBhbG9uZyB0aGUKY2hhaW4sIHRoZW4gd2UgYWxyZWFkeSBoYXZlIHRoZSBpbmZvcm1hdGlvbiBm
b3IgcHJpb3JpdHkgaW5oZXJpdGFuY2UuCkV4Y2VwdCBkbWEtZmVuY2UtY2hhaW4gZG9lc24ndCBf
Z3VhcmFudGVlXyB0aGF0IGlzIHRoZSBjYXNlIGFuZCBsZWF2ZXMKaXQgdXAgdG8gdGhlIGNhbGxl
ciB0byBwcm92aWRlIG9yZGVyIGFjcm9zcyBmZW5jZV9jb250ZXh0cyAod2l0aGluIGEKZmVuY2Vf
Y29udGV4dCBpdCB0aGUgc2Vxbm8gYXJlIG1lYW50IHRvIGJlIG9yZGVyZWQsIGFuZCBpZiB0aGUg
Y2FsbGVyCnRyaWVzIHRvIHVzZSB0aGVtIG91dC1vZi1vcmRlciBmb3Igc3luY3B0cyB3aXRoaW4g
YSBkbWEtZmVuY2UtY2hhaW4gaXQKZ29lcyBpbnRvIHRoZSBicm9rZW4gY2hhaW4gcGF0aCBzYW1l
IGFzIGZvciBzd2l0Y2hpbmcgZmVuY2VfY29udGV4dHMpLgotQ2hyaXMKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
