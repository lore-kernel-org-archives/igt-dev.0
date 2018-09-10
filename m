Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244626E0C1
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Sep 2018 15:42:18 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20180910153407.1723-1-ville.syrjala@linux.intel.com>
 <20180910153407.1723-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20180910153407.1723-3-ville.syrjala@linux.intel.com>
Message-ID: <153659413285.4253.13469319217982591605@skylake-alporthouse-com>
Date: Mon, 10 Sep 2018 16:42:12 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] lib: Add roundup_power_of_two()
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

UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDE4LTA5LTEwIDE2OjM0OjA3KQo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gQWRkIGEgaGVs
cGVyIHRvIHJvdW5kIGEgdmFsdWUgdG8gdGhlIG5leHQgcG93ZXIgb2YgdHdvIHNpemUuCj4gCj4g
QW5kIHNpbmNlIHdlIG5lZWQgZmxzKCkgdG8gaW1wbGVtZW50IHRoYXQsIHJldXNlIHRoYXQgZWxz
ZXdoZXJlCj4gYXMgd2VsbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgoKTG9va3MgcmVhc29uYWJsZS4gVGhlcmUgc2hv
dWxkIGJlIGEgZmV3IG1vcmUgZmxzIGFyb3VuZCwgaXQgdGVuZHMgdG8gYmUKdXNlZnVsLgoKUmV2
aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgoKPiAtLS0K
PiAgbGliL2lndF9hdXguaCAgICAgICAgICB8ICA2ICsrKysrKwo+ICBsaWIvaWd0X2ZiLmMgICAg
ICAgICAgIHwgMTIgKysrKy0tLS0tLS0tCj4gIHRlc3RzL2dlbV9leGVjX3JldXNlLmMgfCAxMiAr
LS0tLS0tLS0tLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxOSBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9hdXguaCBiL2xpYi9pZ3RfYXV4LmgK
PiBpbmRleCBlZjg5ZmFhOWJkMzAuLjE5MmMzYWQ4ODY1OCAxMDA2NDQKPiAtLS0gYS9saWIvaWd0
X2F1eC5oCj4gKysrIGIvbGliL2lndF9hdXguaAo+IEBAIC0yODcsNCArMjg3LDEwIEBAIHZvaWQg
aWd0X2xzb2YoY29uc3QgY2hhciAqZHBhdGgpOwo+ICAKPiAgI2RlZmluZSBpc19wb3dlcl9vZl90
d28oeCkgICgoKHgpICYgKCh4KS0xKSkgPT0gMCkKPiAgCj4gKyNkZWZpbmUgaWd0X2Zscyh4KSAo
KHgpID8gX19idWlsdGluX2Nob29zZV9leHByKHNpemVvZih4KSA9PSA4LCBcCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgNjQgLSBfX2J1aWx0aW5fY2x6
bGwoeCksIFwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAzMiAtIF9fYnVpbHRpbl9jbHooeCkpIDogMCkKClRob3VnaCBJIHdvbmRlciBpZiBfX2J1aWx0
aW5fdHlwZXNfY29tcGF0aWJsZV9wKHR5cGVvZih4KSwgbG9uZyBsb25nKQp3b3VsZCBiZSBiZXR0
ZXIgKHRoZW4gd2UgY291bGQgaGF2ZSB0aGUgbG9uZyBsb25nOyBsb25nOyBpbnQgY2FzY2FkZSku
CkkndmUgZmFpbGVkIGV2ZXJ5IHRpbWUgSSB0cmllZCB0byB1c2UgdHlwZXNfY29tcGF0aWJsZSwg
bWF5YmUgeW91J2xsCmhhdmUgYmV0dGVyIGx1Y2sgOikKLUNocmlzCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
