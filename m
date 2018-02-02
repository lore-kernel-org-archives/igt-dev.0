Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB236F125
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Feb 2018 20:55:05 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180202183754.30042-8-tvrtko.ursulin@linux.intel.com>
References: <20180202183754.30042-1-tvrtko.ursulin@linux.intel.com>
 <20180202183754.30042-8-tvrtko.ursulin@linux.intel.com>
Message-ID: <151760489869.15322.1829983553670528497@mail.alporthouse.com>
Date: Fri, 02 Feb 2018 20:54:58 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 7/9] tests/perf_pmu: Always skip missing
 engines
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
To: Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wMi0wMiAxODozNzo1MikKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IEFsd2F5cyBza2lwIG1p
c3NpbmcgZW5naW5lcyB0byBtYWtlIHRlc3RzIHNraXBzIHZlcnkgZWFybHkgYW5kIGF2b2lkCj4g
bG9zaW5nIHRpbWUgaW4gdGVzdHMgd2hpY2ggbmVlZCB0byBkbyBzZXR1cHMgb3Igd2FpdHMgYmVm
b3JlIHRoZXkgd291bGQKPiBvdGhlcndpc2UgZGV0ZWN0IHRoaXMuCj4gCj4gVG8gZW5zdXJlIFBN
VSBpcyByZWplY3Rpbmcgb3BlbmluZyBtaXNzaW5nIGVuZ2luZXMgd2Ugd2lsbCBhZGQgYW4gZXhw
bGljaXQKPiB0ZXN0IGxhdGVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFR2cnRrbyBVcnN1bGluIDx0
dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Cj4gLS0tCj4gIHRlc3RzL3BlcmZfcG11LmMgfCAxNCAr
KysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQo+IAo+IGRp
ZmYgLS1naXQgYS90ZXN0cy9wZXJmX3BtdS5jIGIvdGVzdHMvcGVyZl9wbXUuYwo+IGluZGV4IGRl
MGExYzdkOTM2Yy4uZDY1NGVjZTYzYmI3IDEwMDY0NAo+IC0tLSBhL3Rlc3RzL3BlcmZfcG11LmMK
PiArKysgYi90ZXN0cy9wZXJmX3BtdS5jCj4gQEAgLTE1NSw2ICsxNTUsOCBAQCBzaW5nbGUoaW50
IGdlbV9mZCwgY29uc3Qgc3RydWN0IGludGVsX2V4ZWN1dGlvbl9lbmdpbmUyICplLCB1bnNpZ25l
ZCBpbnQgZmxhZ3MpCj4gICAgICAgICB1aW50NjRfdCB2YWw7Cj4gICAgICAgICBpbnQgZmQ7Cj4g
IAo+ICsgICAgICAgZ2VtX3JlcXVpcmVfZW5naW5lKGdlbV9mZCwgZS0+Y2xhc3MsIGUtPmluc3Rh
bmNlKTsKPiArCj4gICAgICAgICBmZCA9IG9wZW5fcG11KEk5MTVfUE1VX0VOR0lORV9CVVNZKGUt
PmNsYXNzLCBlLT5pbnN0YW5jZSkpOwo+ICAKPiAgICAgICAgIGlmIChmbGFncyAmIFRFU1RfQlVT
WSkKCkkgZmVlbCB0aGVzZSBwcm9iYWJseSBkZXNlcnZlIHRvIGJlIGluIGFuCmZvcl9lYWNoX2Vu
Z2luZSguLi4pCglpZ3Rfc3VidGVzdF9ncm91cCB7CgkJaWd0X2ZpeHR1cmUgewoJCQlnZW1fcmVx
dWlyZV9lbmdpbmUoLi4uKQoJCX0KCgkJaWd0X3N1YnRlc3QoKSB7CgkJCXNpbmdsZSguLi4pCgkJ
fQoJCWV0Yy4KCX0KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dgo=
