Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44AA6E086
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2019 20:41:34 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20190417203544.22298-1-ville.syrjala@linux.intel.com>
 <20190417203544.22298-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20190417203544.22298-2-ville.syrjala@linux.intel.com>
Message-ID: <155553369040.25904.2596203733509411616@skylake-alporthouse-com>
Date: Wed, 17 Apr 2019 21:41:30 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 2/5] tests/i915/gem_render_copy: Don't
 leak bos between subtests
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

UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDE5LTA0LTE3IDIxOjM1OjQxKQo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gVW5yZWYgdGhl
IGJvcyBhZnRlciBvbmUgc3VidGVzdCBpcyBkb25lLiBUaGUgbmV4dCBzdWJ0ZXN0Cj4gd2lsbCBh
bGxvY2F0ZSBpdHMgb3duIGJvcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6Qg
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IC0tLQo+ICB0ZXN0cy9pOTE1L2dlbV9y
ZW5kZXJfY29weS5jIHwgNyArKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KykKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fcmVuZGVyX2NvcHkuYyBiL3Rlc3Rz
L2k5MTUvZ2VtX3JlbmRlcl9jb3B5LmMKPiBpbmRleCA4ZDYyYTBmNDNhZDguLmE2NDc2YTRkMmQ4
ZCAxMDA2NDQKPiAtLS0gYS90ZXN0cy9pOTE1L2dlbV9yZW5kZXJfY29weS5jCj4gKysrIGIvdGVz
dHMvaTkxNS9nZW1fcmVuZGVyX2NvcHkuYwo+IEBAIC02NjIsNiArNjYyLDEzIEBAIHN0YXRpYyB2
b2lkIHRlc3QoZGF0YV90ICpkYXRhLCB1aW50MzJfdCB0aWxpbmcsIHVpbnQ2NF90IGNjc19tb2Rp
ZmllcikKPiAgCj4gICAgICAgICBpZiAoY2NzX21vZGlmaWVyKQo+ICAgICAgICAgICAgICAgICBz
Y3JhdGNoX2J1Zl9hdXhfY2hlY2soZGF0YSwgJmNjcyk7Cj4gKwo+ICsgICAgICAgZm9yIChpbnQg
aSA9IDA7IGkgPCBudW1fc3JjOyBpKyspCj4gKyAgICAgICAgICAgICAgIGRybV9pbnRlbF9ib191
bnJlZmVyZW5jZShzcmNbaV0uYnVmLmJvKTsKPiArICAgICAgIGRybV9pbnRlbF9ib191bnJlZmVy
ZW5jZShkc3QuYm8pOwo+ICsgICAgICAgaWYgKGNjc19tb2RpZmllcikKPiArICAgICAgICAgICAg
ICAgZHJtX2ludGVsX2JvX3VucmVmZXJlbmNlKGNjcy5ibyk7Cj4gKyAgICAgICBkcm1faW50ZWxf
Ym9fdW5yZWZlcmVuY2UocmVmLmJvKTsKClRydWUuIFBsYWludGl2ZSB3aGlzcGVyIGZvciBzY3Jh
dGNoX2J1Zl9maW5pKCksIGFuZCBwZXJoYXBzIHJldmVyc2UgdGhlCm9yZGVyaW5nIGZvciBvbmlv
bnMuClJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4K
LUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
