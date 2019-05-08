Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190508121058.27038-2-tvrtko.ursulin@linux.intel.com>
References: <20190508121058.27038-1-tvrtko.ursulin@linux.intel.com>
 <20190508121058.27038-2-tvrtko.ursulin@linux.intel.com>
Message-ID: <155731785242.28545.4596359087636884591@skylake-alporthouse-com>
Date: Wed, 08 May 2019 13:17:32 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 01/21] scripts/trace.pl: Fix after
 intel_engine_notify removal
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOS0wNS0wOCAxMzoxMDozOCkKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IEFmdGVyIHRoZSByZW1v
dmFsIG9mIGVuZ2luZSBnbG9iYWwgc2Vxbm9zIGFuZCB0aGUgY29ycmVzcG9uZGluZwo+IGludGVs
X2VuZ2luZV9ub3RpZnkgdHJhY2Vwb2ludHMgdGhlIHNjcmlwdCBuZWVkcyB0byBiZSBhZGp1c3Rl
ZCB0byBjb3BlCj4gd2l0aCB0aGUgbmV3IHN0YXRlIG9mIHRoaW5ncy4KPiAKPiBUbyBrZWVwIHdv
cmtpbmcgaXQgc3dpdGNoZXMgb3ZlciB1c2luZyB0aGUgZG1hX2ZlbmNlOmRtYV9mZW5jZV9zaWdu
YWxlZDoKPiB0cmFjZXBvaW50IGFuZCBrZWVwcyBvbmUgZXh0cmEgaW50ZXJuYWwgbWFwIHRvIGNv
bm5lY3QgdGhlIGN0eC1zZXFubyBwYWlycwo+IHdpdGggZW5naW5lcy4KCklzIHRoZSBtYXAgc3Vp
dGFibGUgZm9yIHRoZSBwbGFubmVkIChieSBtZSkKCglzL2k5MTVfcmVxdWVzdF93YWl0X2JlZ2lu
L2RtYV9mZW5jZV93YWl0X2JlZ2luLwoKSSBndWVzcyBpdCBzaG91bGQgYmUuCi1DaHJpcwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
