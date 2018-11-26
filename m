Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A5F6E353
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Nov 2018 12:58:07 +0000 (UTC)
Date: Mon, 26 Nov 2018 14:58:04 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20181126125804.GF17124@platvala-desk.ger.corp.intel.com>
References: <20181123142726.27625-1-lukasz.kalamarz@intel.com>
 <20181123152509.20360-1-lukasz.kalamarz@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181123152509.20360-1-lukasz.kalamarz@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/3] lib/ioctl_wrapper: Add
 i915_get_param helper
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
To: Lukasz Kalamarz <lukasz.kalamarz@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjMsIDIwMTggYXQgMDQ6MjU6MDdQTSArMDEwMCwgTHVrYXN6IEthbGFtYXJ6
IHdyb3RlOgo+IGdldHBhcmFtIGlzIHVzZWQgaW4gZmV3IHBsYWNlcyBhY3Jvc3MgSUdULCBidXQg
bm8gaGVscGVyIGZ1bmN0aW9uCj4gaXMgdXNlZCB0byByZWR1Y2UgY29kZSBkdXBsaWNhdGlvbi4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBMdWthc3ogS2FsYW1hcnogPGx1a2Fzei5rYWxhbWFyekBpbnRl
bC5jb20+Cj4gCj4gQ2M6IE1pY2hhbCBXaW5pYXJza2kgPG1pY2hhbC53aW5pYXJza2lAaW50ZWwu
Y29tPgo+IENjOiBLYXRhcnp5bmEgRGVjIDxrYXRhcnp5bmEuZGVjQGludGVsLmNvbT4KPiBDYzog
RGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT4K
PiAtLS0KPiAgbGliL2lvY3RsX3dyYXBwZXJzLmMgfCAxMyArKysrKysrKysrKysrCj4gIGxpYi9p
b2N0bF93cmFwcGVycy5oIHwgIDEgKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMo
KykKPiAKPiBkaWZmIC0tZ2l0IGEvbGliL2lvY3RsX3dyYXBwZXJzLmMgYi9saWIvaW9jdGxfd3Jh
cHBlcnMuYwo+IGluZGV4IDlmMjU1NTA4Li44ZmVhOWZhOSAxMDA2NDQKPiAtLS0gYS9saWIvaW9j
dGxfd3JhcHBlcnMuYwo+ICsrKyBiL2xpYi9pb2N0bF93cmFwcGVycy5jCj4gQEAgLTQ2OCw2ICs0
NjgsMTkgQEAgdm9pZCBnZW1fc3luYyhpbnQgZmQsIHVpbnQzMl90IGhhbmRsZSkKPiAgCWVycm5v
ID0gMDsKPiAgfQo+ICAKPiAraW50IGRybV9nZXRfcGFyYW0oaW50IGZkLCB1aW50MzJfdCBwYXJh
bSkKPiArewo+ICsJaW50IHZhbHVlOwo+ICsJZHJtX2k5MTVfZ2V0cGFyYW1fdCBncCA9IHsKPiAr
CQkucGFyYW0gPSBwYXJhbSwKPiArCQkudmFsdWUgPSAmdmFsdWUKPiArCX07Cj4gKwo+ICsJaWYg
KGlndF9pb2N0bChmZCwgRFJNX0lPQ1RMX0k5MTVfR0VUUEFSQU0sICZncCkgPT0gLTEpCj4gKwkJ
cmV0dXJuIE5VTEw7Cj4gKwo+ICsJcmV0dXJuIHZhbHVlOwo+ICt9CgoKRG9jcyB3b3VsZCBiZSBs
b3ZlbHkuCgoKLS0gClBldHJpIExhdHZhbGEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2Cg==
