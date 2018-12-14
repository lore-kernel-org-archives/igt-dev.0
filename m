Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26AF96F4EC
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Dec 2018 13:58:09 +0000 (UTC)
References: <20181211180647.23186-1-lionel.g.landwerlin@intel.com>
 <20181211180647.23186-2-lionel.g.landwerlin@intel.com>
 <CAM0jSHOG4jcZkgWLhs=b6K+a8sas1x+PD0LxXwjnomjGZ2-HYg@mail.gmail.com>
 <9f00684f-33ec-174f-c90a-4192803b5fc8@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <5afda7f5-d9db-93bd-c562-e358e99b3083@intel.com>
Date: Fri, 14 Dec 2018 13:58:06 +0000
MIME-Version: 1.0
In-Reply-To: <9f00684f-33ec-174f-c90a-4192803b5fc8@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/perf: polling: fix
 uninitialized start_times
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
To: Matthew Auld <matthew.william.auld@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gMTQvMTIvMjAxOCAxMzozMCwgTGlvbmVsIExhbmR3ZXJsaW4gd3JvdGU6Cj4gT24gMTQvMTIv
MjAxOCAxMTo1OCwgTWF0dGhldyBBdWxkIHdyb3RlOgo+PiBPbiBUdWUsIDExIERlYyAyMDE4IGF0
IDE4OjA2LCBMaW9uZWwgTGFuZHdlcmxpbgo+PiA8bGlvbmVsLmcubGFuZHdlcmxpbkBpbnRlbC5j
b20+IHdyb3RlOgo+Pj4gTm90IHF1aXRlIHN1cmUgaG93IHRoYXQgZmVsbCB0aHJvdWdoIHRoZSBj
cmFja3MgZm9yIHNvIGxvbmcuLi4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBMaW9uZWwgTGFuZHdl
cmxpbiA8bGlvbmVsLmcubGFuZHdlcmxpbkBpbnRlbC5jb20+Cj4+PiBCdWd6aWxsYTogaHR0cHM6
Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTAyMjUyCj4+IEl0IGxvb2tz
IGxpa2Ugd2UgaW5pdGlhbGl6ZSBpdCBlYXJsaWVyIDopCj4KPgo+IEkgY2FuJ3Qgc2VlIHdoZXJl
IDp8Cj4KPiBVbmxlc3MgaXQncyBpbiB0aGUgdGVzdF9ibG9ja2luZygpIHdoaWNoIGlzIGEgZGlm
ZmVyZW50IHRlc3QuCgoKU29ycnksIG1pc3NlZCBzb21lIG90aGVyIHJlZmFjdG9yaW5nIGRlbGV0
aW5nIHRoYXQgcHJldmlvdXMgb25lLgoKRHJvcHBpbmcgdGhpcyBwYXRjaC4KCgpUaGFua3MsCgoK
LQoKTGlvbmVsCgoKPgo+Cj4+Cj4+PiAtLS0KPj4+IMKgIHRlc3RzL3BlcmYuYyB8IDEgKwo+Pj4g
wqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL3Rl
c3RzL3BlcmYuYyBiL3Rlc3RzL3BlcmYuYwo+Pj4gaW5kZXggMjIwYzUyZWYuLjU0ZTdmNGY0IDEw
MDY0NAo+Pj4gLS0tIGEvdGVzdHMvcGVyZi5jCj4+PiArKysgYi90ZXN0cy9wZXJmLmMKPj4+IEBA
IC0yMjMwLDYgKzIyMzAsNyBAQCB0ZXN0X3BvbGxpbmcodm9pZCkKPj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCAqIHRoZSBlcnJvciBkZWx0YS4KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+Pj4gwqDC
oMKgwqDCoMKgwqDCoCBzdGFydCA9IGdldF90aW1lKCk7Cj4+PiArwqDCoMKgwqDCoMKgIHRpbWVz
KCZzdGFydF90aW1lcyk7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIGRvX2lvY3RsKHN0cmVhbV9mZCwg
STkxNV9QRVJGX0lPQ1RMX0VOQUJMRSwgMCk7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIGZvciAoLyog
bm9wICovOyAoKGVuZCA9IGdldF90aW1lKCkpIC0gc3RhcnQpIDwgCj4+PiB0ZXN0X2R1cmF0aW9u
X25zOyAvKiBub3AgKi8pIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0
cnVjdCBwb2xsZmQgcG9sbGZkID0geyAuZmQgPSBzdHJlYW1fZmQsIC5ldmVudHMgPSAKPj4+IFBP
TExJTiB9Owo+Pj4gLS0gCj4+PiAyLjIwLjAucmMyCj4+Pgo+Pj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IGlndC1kZXYgbWFpbGluZyBsaXN0Cj4+
PiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cj4KPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gaWd0LWRldiBtYWlsaW5nIGxpc3QKPiBp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldgo=
