Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A004897AC
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Oct 2018 09:44:29 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <1539767601-16519-1-git-send-email-jyoti.r.yadav@intel.com>
References: <1539767601-16519-1-git-send-email-jyoti.r.yadav@intel.com>
Message-ID: <153976946056.22931.1730804888828078397@skylake-alporthouse-com>
Date: Wed, 17 Oct 2018 10:44:20 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] [CI] tests/pm_backlight.c: Fix
 brightness failure with system suspend
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
To: Jyoti Yadav <jyoti.r.yadav@intel.com>, igt-dev@lists.freedesktop.org
Cc: Jyoti Yadav <jyoti.r.yadav@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBKeW90aSBZYWRhdiAoMjAxOC0xMC0xNyAxMDoxMzoyMCkKPiBUaGlzIHBhdGNoIHRy
aWVzIHRvIGZpeCB0aGUgZmFsaXVyZSBvY2N1cmluZyBkdXJpbmcgc3VidGVzdAo+ICJmYWRlX3dp
dGhfc3VzcGVuZCIuIEZhaWx1cmUgaXMgb2NjdXJpbmcgYmVjYXVzZSwgYnJpZ2h0bmVzcwo+IHZh
bHVlIGlzIGJlaW5nIGNoZWNrZWQgYmVmb3JlIGRyaXZlciBpbml0aWFsaXplcyBmdWxseSBhZnRl
ciByZXN1bWUuCj4gCj4gQnVnemlsbGE6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hv
d19idWcuY2dpP2lkPTEwNzg0Nwo+IFNpZ25lZC1vZmYtYnk6IEp5b3RpIFlhZGF2IDxqeW90aS5y
LnlhZGF2QGludGVsLmNvbT4KPiAtLS0KPiAgdGVzdHMvcG1fYmFja2xpZ2h0LmMgfCAxICsKPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL3Bt
X2JhY2tsaWdodC5jIGIvdGVzdHMvcG1fYmFja2xpZ2h0LmMKPiBpbmRleCAzMjgwOGNkLi5lYzA0
N2IzIDEwMDY0NAo+IC0tLSBhL3Rlc3RzL3BtX2JhY2tsaWdodC5jCj4gKysrIGIvdGVzdHMvcG1f
YmFja2xpZ2h0LmMKPiBAQCAtMTgzLDYgKzE4Myw3IEBAIHRlc3RfZmFkZV93aXRoX3N1c3BlbmQo
c3RydWN0IGNvbnRleHQgKmNvbnRleHQsIGlndF9vdXRwdXRfdCAqb3V0cHV0KQo+ICAgICAgICAg
aWd0X3JlcXVpcmUoaWd0X3dhaXRfZm9yX3BtX3N0YXR1cyhJR1RfUlVOVElNRV9QTV9TVEFUVVNf
U1VTUEVOREVEKSk7Cj4gIAo+ICAgICAgICAgaWd0X3N5c3RlbV9zdXNwZW5kX2F1dG9yZXN1bWUo
U1VTUEVORF9TVEFURV9NRU0sIFNVU1BFTkRfVEVTVF9OT05FKTsKPiArICAgICAgIGlndF9yZXF1
aXJlKGlndF93YWl0X2Zvcl9wbV9zdGF0dXMoSUdUX1JVTlRJTUVfUE1fU1RBVFVTX0FDVElWRSkp
OwoKV2h5IHdvdWxkIHRoZSBkZXZpY2UgYmUgYWN0aXZlIG9uIHN5c3RlbSByZXN1bWUgaWYgaXQg
d2FzIGFzbGVlcApiZWZvcmVoYW5kPyBJbiBmYWN0LCB0aGF0IHNvdW5kcyBsaWtlIHRoZSBvcHBv
c2l0ZSBvZiB3aGF0IHdlIHdvdWxkIGxpa2UKOykKLUNocmlzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldgo=
