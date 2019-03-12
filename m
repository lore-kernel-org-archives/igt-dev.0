Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298F689B70
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2019 15:25:37 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id b20so2622125edw.11
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2019 08:25:37 -0700 (PDT)
Date: Tue, 12 Mar 2019 16:25:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190312152533.GE2665@phenom.ffwll.local>
References: <20190312112114.1979-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190312112114.1979-1-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/ioctl_wrappers: Assert that
 prime_handle_to_fd returns a valid fd
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBNYXIgMTIsIDIwMTkgYXQgMDE6MjE6MTRQTSArMDIwMCwgUGV0cmkgTGF0dmFsYSB3
cm90ZToKPiBJZiB0aGUgaW9jdGwgaXMgc3VjY2Vzc2Z1bCwgdGhlIHJldHVybmVkIGZkIHNob3Vs
ZCBiZSB2YWxpZC4gQ2hlY2sKPiB0aGF0IGl0IGlzLCB0aHVzIGFsc28gaGVscGluZyBzdGF0aWMg
YW5hbHlzaXMgaW4gYWxtb3N0IDcwIGNhbGwgc2l0ZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGV0
cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Cj4gLS0tCj4gIGxpYi9pb2N0bF93
cmFwcGVycy5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRp
ZmYgLS1naXQgYS9saWIvaW9jdGxfd3JhcHBlcnMuYyBiL2xpYi9pb2N0bF93cmFwcGVycy5jCj4g
aW5kZXggMzk5MjBmODcuLjMxOTY5ZTc3IDEwMDY0NAo+IC0tLSBhL2xpYi9pb2N0bF93cmFwcGVy
cy5jCj4gKysrIGIvbGliL2lvY3RsX3dyYXBwZXJzLmMKPiBAQCAtMTMzMiw2ICsxMzMyLDcgQEAg
aW50IHByaW1lX2hhbmRsZV90b19mZChpbnQgZmQsIHVpbnQzMl90IGhhbmRsZSkKPiAgCWFyZ3Mu
ZmQgPSAtMTsKPiAgCj4gIAlkb19pb2N0bChmZCwgRFJNX0lPQ1RMX1BSSU1FX0hBTkRMRV9UT19G
RCwgJmFyZ3MpOwo+ICsJaWd0X2Fzc2VydF9mZChhcmdzLmZkKTsKCmZkID49IDAgaWYgd2Ugd2Fu
dCB0aGlzIGNoZWNrLiBJIHRoaW5rIGl0J3Mgb2sgdG8gaGF2ZSB0aGUgYXNzZXJ0IGhlcmUsIHNp
bmNlCmRvX2lvY3RsIGFscmVhZHkgY2hlY2tzIHRoYXQgdGhlIGlvY3RsIGRpZG4ndCBmYWlsLiBJ
ZiB3ZSB3YW50IGFuCnVuY2hlY2tlZCB2ZXJzaW9uIHdlIGNhbiBhZGQgdGhlIHVzdWFsIF9fcHJp
bWVfaGFubGRlX3RvX2ZkLgotRGFuaWVsCgo+ICAKPiAgCXJldHVybiBhcmdzLmZkOwo+ICB9Cj4g
LS0gCj4gMi4xOS4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBpZ3QtZGV2IG1haWxpbmcgbGlzdAo+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2CgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9y
YXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2
