Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFC76E1F5
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Oct 2018 13:34:50 +0000 (UTC)
Date: Tue, 30 Oct 2018 15:34:47 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20181030133447.GV9144@intel.com>
References: <20181030112646.14957-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181030112646.14957-1-maarten.lankhorst@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_draw: Only skip when width/x is
 not a multiple of 2.
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBPY3QgMzAsIDIwMTggYXQgMTI6MjY6NDZQTSArMDEwMCwgTWFhcnRlbiBMYW5raG9y
c3Qgd3JvdGU6Cj4gWSBhbmQgaGVpZ2h0IGhhdmUgbm8gc3VjaCByZXN0cmljdGlvbnMsIHNpbmNl
IHBpeGVsIHNpemUgaGFzIG5vCj4gcmVsYXRpb24gdG8gaGVpZ2h0Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+
Cj4gLS0tCj4gIGxpYi9pZ3RfZHJhdy5jIHwgNCArLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9kcmF3
LmMgYi9saWIvaWd0X2RyYXcuYwo+IGluZGV4IDA1ODIxNDgwYmM4MC4uODRkZDIxMmMxZGFmIDEw
MDY0NAo+IC0tLSBhL2xpYi9pZ3RfZHJhdy5jCj4gKysrIGIvbGliL2lndF9kcmF3LmMKPiBAQCAt
NTgxLDkgKzU4MSw3IEBAIHN0YXRpYyB2b2lkIGRyYXdfcmVjdF9yZW5kZXIoaW50IGZkLCBzdHJ1
Y3QgY21kX2RhdGEgKmNtZF9kYXRhLAo+ICAJICogc21hbGxlciBicHBzIHlvdSB3b24ndCBzdWNj
ZWVlZCBpZiB5b3UgbmVlZCB0byBjb3B5ICJoYWxmIiBvZiBhIDMyYnBwCj4gIAkgKiBwaXhlbCBv
ciBzb21ldGhpbmcgc2ltaWxhci4gKi8KPiAgCWlndF9za2lwX29uKHJlY3QtPnggJSAoMzIgLyBi
dWYtPmJwcCkgIT0gMCB8fAo+IC0JCSAgICByZWN0LT55ICUgKDMyIC8gYnVmLT5icHApICE9IDAg
fHwKPiAtCQkgICAgcmVjdC0+dyAlICgzMiAvIGJ1Zi0+YnBwKSAhPSAwIHx8Cj4gLQkJICAgIHJl
Y3QtPmggJSAoMzIgLyBidWYtPmJwcCkgIT0gMCk7Cj4gKwkJICAgIHJlY3QtPncgJSAoMzIgLyBi
dWYtPmJwcCkgIT0gMCk7CgpSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4KCkFkZGluZyAxNmJwcCBzdXBwb3J0IHRvIHJlbmRlcmNvcHkg
c2hvdWxkbid0IGJlIHRvbyBoYXJkLi4uCgo+ICAKPiAgCWlndF9yZXF1aXJlKGdlbV9nZXRfdGls
aW5nKGZkLCBidWYtPmhhbmRsZSwgJnRpbGluZywgJnN3aXp6bGUpKTsKPiAgCj4gLS0gCj4gMi4x
OS4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBpZ3QtZGV2IG1haWxpbmcgbGlzdAo+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cgot
LSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldgo=
