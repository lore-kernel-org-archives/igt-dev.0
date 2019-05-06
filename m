Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF30898F5
 for <igt-dev@lists.freedesktop.org>; Mon,  6 May 2019 13:06:37 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
In-Reply-To: <1557141877-12662-4-git-send-email-anshuman.gupta@intel.com>
References: <1557141877-12662-1-git-send-email-anshuman.gupta@intel.com>
 <1557141877-12662-4-git-send-email-anshuman.gupta@intel.com>
Date: Mon, 06 May 2019 16:08:43 +0300
Message-ID: <87v9ynn31g.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v4 3/4] igt/i915/i915_pm_lpsp skip
 edp-panel-fitter test.
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
To: Anshuman Gupta <anshuman.gupta@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCAwNiBNYXkgMjAxOSwgQW5zaHVtYW4gR3VwdGEgPGFuc2h1bWFuLmd1cHRhQGludGVs
LmNvbT4gd3JvdGU6Cj4gU2tpcCBlZHAtcGFuZWwtZml0dGVyIHRlc3QgZm9yIEdlbjkgb253YXJk
cyBwbGF0Zm9ybS4KCldlIGNhbiBzZWUgdGhhdC4gVGhlIGNvbW1pdCBtZXNzYWdlIHNob3VsZCB0
ZWxsIHVzICp3aHkqLgoKQlIsCkphbmkuCgoKPgo+IENjOiBpbXJlLmRlYWtAaW50ZWwuY29tCj4g
U2lnbmVkLW9mZi1ieTogQW5zaHVtYW4gR3VwdGEgPGFuc2h1bWFuLmd1cHRhQGludGVsLmNvbT4K
PiAtLS0KPiAgdGVzdHMvaTkxNS9pOTE1X3BtX2xwc3AuYyB8IDUgKysrKy0KPiAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL3Rl
c3RzL2k5MTUvaTkxNV9wbV9scHNwLmMgYi90ZXN0cy9pOTE1L2k5MTVfcG1fbHBzcC5jCj4gaW5k
ZXggYmFmMDNiMi4uODI5YWZmNSAxMDA2NDQKPiAtLS0gYS90ZXN0cy9pOTE1L2k5MTVfcG1fbHBz
cC5jCj4gKysrIGIvdGVzdHMvaTkxNS9pOTE1X3BtX2xwc3AuYwo+IEBAIC0zMjEsOSArMzIxLDEy
IEBAIGlndF9tYWluCj4gIAlpZ3Rfc3VidGVzdCgiZWRwLW5hdGl2ZSIpCj4gIAkJZWRwX3N1YnRl
c3QoZHJtX2ZkLCBkcm1fcmVzLCBkcm1fY29ubmVjdG9ycywgZGV2aWQsIGZhbHNlLAo+ICAJCQkg
ICAgZGVidWdmcyk7Cj4gLQlpZ3Rfc3VidGVzdCgiZWRwLXBhbmVsLWZpdHRlciIpCj4gKwlpZ3Rf
c3VidGVzdCgiZWRwLXBhbmVsLWZpdHRlciIpIHsKPiArCQlpZ3Rfc2tpcF9vbihBVF9MRUFTVF9H
RU4oZGV2aWQsIDkpKTsKPiAgCQllZHBfc3VidGVzdChkcm1fZmQsIGRybV9yZXMsIGRybV9jb25u
ZWN0b3JzLCBkZXZpZCwgdHJ1ZSwKPiAgCQkJICAgIGRlYnVnZnMpOwo+ICsJfQo+ICsKPiAgCWln
dF9zdWJ0ZXN0KCJub24tZWRwIikKPiAgCQlub25fZWRwX3N1YnRlc3QoZHJtX2ZkLCBkcm1fcmVz
LCBkZXZpZCwgZHJtX2Nvbm5lY3RvcnMsCj4gIAkJCQlkZWJ1Z2ZzKTsKCi0tIApKYW5pIE5pa3Vs
YSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldg==
