Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD886E116
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Feb 2018 09:55:24 +0000 (UTC)
References: <20180208080131.3004-1-tvrtko.ursulin@linux.intel.com>
 <20180208080131.3004-3-tvrtko.ursulin@linux.intel.com>
 <151807759064.28809.4247346291445702173@mail.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <e3b92e3a-f162-c049-b45f-249d01c1468d@linux.intel.com>
Date: Mon, 12 Feb 2018 09:55:21 +0000
MIME-Version: 1.0
In-Reply-To: <151807759064.28809.4247346291445702173@mail.alporthouse.com>
Content-Language: en-GB
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tests/perf_pmu: Give sampling more
 time
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDA4LzAyLzIwMTggMDg6MTMsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIFR2cnRr
byBVcnN1bGluICgyMDE4LTAyLTA4IDA4OjAxOjMxKQo+PiBGcm9tOiBUdnJ0a28gVXJzdWxpbiA8
dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+Pgo+PiBXZSBnZXQgb2NjYXNpb25hbCBlcnJvcnMg
bGlrZToKPj4KPj4gICAocGVyZl9wbXU6MjEzMTUpIENSSVRJQ0FMOiBUZXN0IGFzc2VydGlvbiBm
YWlsdXJlIGZ1bmN0aW9uIHNlbWFfd2FpdCwgZmlsZSBwZXJmX3BtdS5jOjYzMToKPj4gICAocGVy
Zl9wbXU6MjEzMTUpIENSSVRJQ0FMOiBGYWlsZWQgYXNzZXJ0aW9uOiAoZG91YmxlKSh2YWxbMV0g
LSB2YWxbMF0pIDw9ICgxLjAgKyAodG9sZXJhbmNlKSkgKiAoZG91YmxlKShzbGVwdCkgJiYgKGRv
dWJsZSkodmFsWzFdIC0gdmFsWzBdKSA+PSAoMS4wIC0gKHRvbGVyYW5jZSkpICogKGRvdWJsZSko
c2xlcHQpCj4+ICAgKHBlcmZfcG11OjIxMzE1KSBDUklUSUNBTDogJ3ZhbFsxXSAtIHZhbFswXScg
IT0gJ3NsZXB0JyAoNDUwMDAwMDAwLjAwMDAwMCBub3Qgd2l0aGluIDUuMDAwMDAwJSB0b2xlcmFu
Y2Ugb2YgNTAwMTI5NjE4LjAwMDAwMCkKPiAKPiBTb21ldGhpbmcgdG8gcmVtZW1iZXIgd2hlbiBy
ZXBvcnRpbmcgcG11IGVycm9ycyBpcyB3aGV0aGVyIGl0J3MKPiBzYW1wbGluZy4gSW4gdGhpcyBj
YXNlIHNlbWFfd2FpdCBpcyBhbHdheXMgc2FtcGxpbmcuLi4gQnV0IEkgd29uZGVyIGlmCj4gd2Ug
Y2FuIHJlcG9ydCBpdCBmcm9tIHBtdSBzb21laG93PwoKVGhlb3JldGljYWxseSBJIHRoaW5rIHdl
IGNvdWxkIGFkZCBvdXIgb3duIGZpbGUgdG8gc3lzZnMsIGFsb25nc2lkZSAKPGNvdW50ZXItbmFt
ZT4oLnVuaXR8LnNjYWxlKSBldGMuLiBsaWtlICIucmVzb2x1dGlvbiIgb3Igc29tZXRoaW5nLiBO
b3QgCnN1cmUgaG93IHBvbGl0ZSB0aGF0IHdvdWxkIGJlIHRob3VnaC4uIG5vdCB2ZXJ5IEkgdGhp
bmsuIEFsdGVybmF0aXZlIAp3b3VsZCBiZSB0byBjcmVhdGUgYWRkaXRpb25hbCBwbXUgaGllcmFy
Y2h5IGluIGRlYnVnZnMgd2l0aCB0aGlzIGRhdGEuCgpSZWdhcmRzLAoKVHZydGtvCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
