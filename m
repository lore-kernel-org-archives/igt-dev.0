Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800576F3BC
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jan 2019 11:27:21 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <a280afa8-d492-1788-900c-2fea03005661@intel.com>
References: <20190116153732.32638-1-lionel.g.landwerlin@intel.com>
 <20190116153732.32638-4-lionel.g.landwerlin@intel.com>
 <154768145819.9669.9168941470068870842@skylake-alporthouse-com>
 <a280afa8-d492-1788-900c-2fea03005661@intel.com>
Message-ID: <154772441963.12932.18284474660546390361@skylake-alporthouse-com>
Date: Thu, 17 Jan 2019 11:26:59 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] tests/perf: new tests for OA
 interrupt
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, igt-dev@lists.freedesktop.org
Cc: matthew.auld@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBMaW9uZWwgTGFuZHdlcmxpbiAoMjAxOS0wMS0xNyAxMTowMzo0OCkKPiBPbiAxNi8w
MS8yMDE5IDIzOjMwLCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBRdW90aW5nIExpb25lbCBMYW5k
d2VybGluICgyMDE5LTAxLTE2IDE1OjM3OjMxKQo+ID4+ICsgICAgICAgaWYgKHVzZV9wb2xsaW5n
KSB7Cj4gPj4gKyAgICAgICAgICAgICAgIHdoaWxlICgocmV0ID0gcG9sbCgmcG9sbGZkLCAxLCAt
MSkpIDwgMCAmJgo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgZXJybm8gPT0gRUlOVFIpCj4g
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgOwo+ID4gSG1tLCBhcmUgd2Ugc2VuZGluZyBzaWdu
YWxzIHRvIG91cnNlbGY/IEp1c3Qgd29uZGVyaW5nIGlmIEVJTlRSIGhlcmUgaXMKPiA+IGEga2Vy
bmVsIGJ1Zy4uLgo+IAo+IAo+IEhtbSBub3BlLiBJIGp1c3QgYXNzdW1lZCBhbnl0aGluZyBjb3Vs
ZCBpbnRlcnJ1cHQgdXMuCj4gCj4gSSB0aGluayBpZ3RfaW9jdGwoKSBkb2VzIHRoZSBzYW1lIHJp
Z2h0PwoKSW4gdGhlIGdlbmVyYWwgY2FzZSwgd2UgZG8gbmVlZCB0byByZXN0YXJ0IG9uIHNpZ25h
bHMgYXMgd2UgZG8gaW50ZXJydXB0Cm91cnNlbHZlcy4KCkkgd2FzIHdvcnJ5aW5nIGluIGNhc2Ug
eW91J3ZlIG9ic2VydmVkIEVJTlRSIGhlcmUgaW4gcHJhY3RpY2UsIGFzIEkKY291bGRuJ3Qgc2Vl
IGEgcmVhc29uIHdoeSAoaGVuY2UgZnJldHRpbmcgb3ZlciB3aGV0aGVyIHRoZSBjaGFpbiBvZgp3
YWtlX3VwcyBpcyBjYXVzaW5nIGlzc3VlcyBpbiB0aGUga2VybmVsKS4KLUNocmlzCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
