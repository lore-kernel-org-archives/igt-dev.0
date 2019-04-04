Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989996E9CD
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Apr 2019 07:43:43 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20190403154104.20708-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20190403154104.20708-1-ville.syrjala@linux.intel.com>
Message-ID: <155436381344.7532.1708058939274624952@skylake-alporthouse-com>
Date: Thu, 04 Apr 2019 08:43:38 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] lib/rendercopy: Assert that buffer
 dimensions/stride are acceptable
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

UXVvdGluZyBWaWxsZSBTeXJqYWxhICgyMDE5LTA0LTAzIDE2OjQxOjA0KQo+IEZyb206IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gU3ByaW5rbGUg
c29tZSBhc3NlcnRzIGludG8gcmVuZGVyY29weSB0byBtYWtlIHN1cmUgd2UgZG9uJ3QgdHJ5Cj4g
dG8gZXhjZWVkIHRoZSByZW5kZXIgZW5naW5lIHN1cmZhY2Ugc2l6ZS9zdHJpZGUgbGltaXRhdGlv
bnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxp
bnV4LmludGVsLmNvbT4KPiAtLS0KPiBkaWZmIC0tZ2l0IGEvbGliL3JlbmRlcmNvcHlfZ2VuNi5j
IGIvbGliL3JlbmRlcmNvcHlfZ2VuNi5jCj4gaW5kZXggZjRjMDEwNWE4MGRiLi5hNjE1N2NmYzcw
ZjYgMTAwNjQ0Cj4gLS0tIGEvbGliL3JlbmRlcmNvcHlfZ2VuNi5jCj4gKysrIGIvbGliL3JlbmRl
cmNvcHlfZ2VuNi5jCj4gQEAgLTc5LDYgKzc5LDEwIEBAIGdlbjZfYmluZF9idWYoc3RydWN0IGlu
dGVsX2JhdGNoYnVmZmVyICpiYXRjaCwgY29uc3Qgc3RydWN0IGlndF9idWYgKmJ1ZiwKPiAgICAg
ICAgIHVpbnQzMl90IHdyaXRlX2RvbWFpbiwgcmVhZF9kb21haW47Cj4gICAgICAgICBpbnQgcmV0
Owo+ICAKPiArICAgICAgIGlndF9hc3NlcnRfbHRlKGJ1Zi0+c3RyaWRlLCAxMjgqMTAyNCk7Cj4g
KyAgICAgICBpZ3RfYXNzZXJ0X2x0ZShpZ3RfYnVmX3dpZHRoKGJ1ZiksIDgxOTIpOwo+ICsgICAg
ICAgaWd0X2Fzc2VydF9sdGUoaWd0X2J1Zl9oZWlnaHQoYnVmKSwgODE5Mik7CgpJbmRlZWQuIEkg
aGFkIGl0IGRvd24gYXMgMjU2aywgYnV0IHRoZSBmaWVsZCBzZWVtcyB0byBiZSBvbmx5IDE3YiBh
bmQKbm90IDE4YiBhcyBpdmIrLgoKUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hy
aXMtd2lsc29uLmNvLnVrPgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2
