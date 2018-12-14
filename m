Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A386F44B
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Dec 2018 11:58:53 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id d2so1894429ual.2
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Dec 2018 03:58:53 -0800 (PST)
MIME-Version: 1.0
References: <20181211180647.23186-1-lionel.g.landwerlin@intel.com>
 <20181211180647.23186-2-lionel.g.landwerlin@intel.com>
In-Reply-To: <20181211180647.23186-2-lionel.g.landwerlin@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 14 Dec 2018 11:58:26 +0000
Message-ID: <CAM0jSHOG4jcZkgWLhs=b6K+a8sas1x+PD0LxXwjnomjGZ2-HYg@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/perf: polling: fix
 uninitialized start_times
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCAxMSBEZWMgMjAxOCBhdCAxODowNiwgTGlvbmVsIExhbmR3ZXJsaW4KPGxpb25lbC5n
LmxhbmR3ZXJsaW5AaW50ZWwuY29tPiB3cm90ZToKPgo+IE5vdCBxdWl0ZSBzdXJlIGhvdyB0aGF0
IGZlbGwgdGhyb3VnaCB0aGUgY3JhY2tzIGZvciBzbyBsb25nLi4uCj4KPiBTaWduZWQtb2ZmLWJ5
OiBMaW9uZWwgTGFuZHdlcmxpbiA8bGlvbmVsLmcubGFuZHdlcmxpbkBpbnRlbC5jb20+Cj4gQnVn
emlsbGE6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEwMjI1
MgoKSXQgbG9va3MgbGlrZSB3ZSBpbml0aWFsaXplIGl0IGVhcmxpZXIgOikKCj4gLS0tCj4gIHRl
c3RzL3BlcmYuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRp
ZmYgLS1naXQgYS90ZXN0cy9wZXJmLmMgYi90ZXN0cy9wZXJmLmMKPiBpbmRleCAyMjBjNTJlZi4u
NTRlN2Y0ZjQgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvcGVyZi5jCj4gKysrIGIvdGVzdHMvcGVyZi5j
Cj4gQEAgLTIyMzAsNiArMjIzMCw3IEBAIHRlc3RfcG9sbGluZyh2b2lkKQo+ICAgICAgICAgICog
dGhlIGVycm9yIGRlbHRhLgo+ICAgICAgICAgICovCj4gICAgICAgICBzdGFydCA9IGdldF90aW1l
KCk7Cj4gKyAgICAgICB0aW1lcygmc3RhcnRfdGltZXMpOwo+ICAgICAgICAgZG9faW9jdGwoc3Ry
ZWFtX2ZkLCBJOTE1X1BFUkZfSU9DVExfRU5BQkxFLCAwKTsKPiAgICAgICAgIGZvciAoLyogbm9w
ICovOyAoKGVuZCA9IGdldF90aW1lKCkpIC0gc3RhcnQpIDwgdGVzdF9kdXJhdGlvbl9uczsgLyog
bm9wICovKSB7Cj4gICAgICAgICAgICAgICAgIHN0cnVjdCBwb2xsZmQgcG9sbGZkID0geyAuZmQg
PSBzdHJlYW1fZmQsIC5ldmVudHMgPSBQT0xMSU4gfTsKPiAtLQo+IDIuMjAuMC5yYzIKPgo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gaWd0LWRldiBt
YWlsaW5nIGxpc3QKPiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdApp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
