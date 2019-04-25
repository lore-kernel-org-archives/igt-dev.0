Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C972889254
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2019 07:35:33 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id y67so18282458ede.2
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2019 00:35:33 -0700 (PDT)
Date: Thu, 25 Apr 2019 09:35:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190425073525.GA9857@phenom.ffwll.local>
References: <20190424161526.19208-1-simon.ser@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190424161526.19208-1-simon.ser@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] ci: build with Clang
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
To: Simon Ser <simon.ser@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBBcHIgMjQsIDIwMTkgYXQgMDc6MTU6MjZQTSArMDMwMCwgU2ltb24gU2VyIHdyb3Rl
Ogo+IFRoaXMgYWRkcyBhIGJ1aWxkIHN0ZXAgd2l0aCBDbGFuZyBvbiBGZWRvcmEuIEhvcGVmdWxs
eSB0aGlzIGNhbiBoZWxwIGtlZXBpbmcKPiBDbGFuZyBidWlsZHMgaGVhbHRoeS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBTaW1vbiBTZXIgPHNpbW9uLnNlckBpbnRlbC5jb20+Cj4gLS0tCj4gIC5naXRs
YWItY2kueW1sIHwgOCArKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhLy5naXRsYWItY2kueW1sIGIvLmdpdGxhYi1jaS55bWwKPiBpbmRl
eCBhZThjYmI2Ny4uZTdkMzEzNzYgMTAwNjQ0Cj4gLS0tIGEvLmdpdGxhYi1jaS55bWwKPiArKysg
Yi8uZ2l0bGFiLWNpLnltbAo+IEBAIC00Nyw2ICs0NywxNCBAQCBidWlsZDp0ZXN0cy1mZWRvcmEt
b2xkZXN0LW1lc29uOgo+ICAgICAgLSBuaW5qYSAtQyBidWlsZAo+ICAgICAgLSBuaW5qYSAtQyBi
dWlsZCBpZ3QtZ3B1LXRvb2xzLWRvYwo+ICAKPiArYnVpbGQ6dGVzdHMtZmVkb3JhLWNsYW5nOgo+
ICsgIHN0YWdlOiBidWlsZAo+ICsgIHNjcmlwdDoKPiArICAgIC0gZG5mIGluc3RhbGwgLXkgY2xh
bmcKPiArICAgIC0gZXhwb3J0IENDPWNsYW5nCj4gKyAgICAtIG1lc29uICRNRVNPTl9PUFRJT05T
IGJ1aWxkCj4gKyAgICAtIG5pbmphIC1DIGJ1aWxkCgpVaCB3aHk/CgpUaGUgdGhpbmcgdGhhdCBi
cm9rZW4gaXMgYnVpbGRpbmcgb24gbm9uLXg4NiBob3N0cywgYW5kIHRoYXQncyB0aGUgdGhpbmcK
Z2l0bGFiIENJIGNhdWdodC4gSSBoYXZlIG5vIGlkZWEgd2h5IHRoaXMgaXMgYWxsIGFib3V0IGNs
YW5nIChpbW8gaXQncwpub3QpLCBhbmQgSSBkb24ndCB0aGluayB3ZSBzaG91bGQgY2FyZSBhYm91
dCBjbGFuZyBlaXRoZXIuCi1EYW5pZWwKCj4gKwo+ICBidWlsZDp0ZXN0cy1kZWJpYW4tbWVzb246
Cj4gICAgaW1hZ2U6ICRDSV9SRUdJU1RSWS8kQ0lfUFJPSkVDVF9QQVRIL2lndC1kZWJpYW46bGF0
ZXN0Cj4gICAgc3RhZ2U6IGJ1aWxkCj4gLS0gCj4gMi4yMS4wCj4gCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBpZ3QtZGV2IG1haWxpbmcgbGlzdAo+
IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2CgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2Fy
ZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
