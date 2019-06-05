Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C706F890F2
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2019 12:37:00 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id z25so5565703edq.9
 for <igt-dev@lists.freedesktop.org>; Wed, 05 Jun 2019 05:37:00 -0700 (PDT)
Date: Wed, 5 Jun 2019 14:36:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190605123656.GT21222@phenom.ffwll.local>
References: <20190605121607.28014-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190605121607.28014-1-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Also consider
 TAINT_MACHINE_CHECK as abortable taint
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBKdW4gMDUsIDIwMTkgYXQgMDM6MTY6MDdQTSArMDMwMCwgUGV0cmkgTGF0dmFsYSB3
cm90ZToKPiBTaWduZWQtb2ZmLWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVs
LmNvbT4KPiBDYzogTWlrYSBLdW9wcGFsYSA8bWlrYS5rdW9wcGFsYUBsaW51eC5pbnRlbC5jb20+
CgpJJ3ZlIHNlZW4gbG90cyBvZiBtYWNoaW5lcyB3aGVyZSB0aGVzZSBoYXBwZW4gYXMgbm9ybWFs
IHNpZGUtZWZmZWN0IG9mCnRoZXJtYWwgdGhyb3RsbGluZy4gRm9yIHNvbWUgdmFsdWUgb2YgIm5v
cm1hbCIuCgpEbyB3ZSByZWFsbHkgd2FudCB0byByZWJvb3Qgb24gdGhlc2U/IEl0IGNvdWxkIGJl
IGxpa2UgdGhlIG5ldHdvcmsgdGhpbmcgSQpyZWNlbnRseSBkaXNhYmxlZCwgYW5kIHRoZW4gZXZl
cnlvbmUgc3RhcnRlZCBzY3JlYW1pbmcgYmVjYXVzZSBvdXIKbWFjaGluZXMgd2hlcmUgY29uc3Rh
bnRseSByZWJvb3RpbmcgZHVlIHRvIG5ldHdvcmsgY2FyZHMvZHJpdmVycwp0ZW1wb3JhcmlseSBo
YXZpbmcgYSBiYWQgdGltZSAoYnV0IHVzdWFsbHkgcmVjb3ZlcmluZykuCi1EYW5pZWwKPiAtLS0K
PiAgcnVubmVyL2V4ZWN1dG9yLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCj4gCj4gZGlmZiAtLWdpdCBhL3J1bm5lci9leGVjdXRvci5jIGIvcnVubmVyL2V4ZWN1dG9y
LmMKPiBpbmRleCA3ZTVmYmU4Zi4uNjllZjIxZTUgMTAwNjQ0Cj4gLS0tIGEvcnVubmVyL2V4ZWN1
dG9yLmMKPiArKysgYi9ydW5uZXIvZXhlY3V0b3IuYwo+IEBAIC0xNDIsNiArMTQyLDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCB7Cj4gIAl1bnNpZ25lZCBsb25nIGJpdDsKPiAgCWNvbnN0IGNoYXIg
KmV4cGxhbmF0aW9uOwo+ICB9IGFib3J0X3RhaW50c1tdID0gewo+ICsgIHsoMSA8PCA0KSwgIlRB
SU5UX01BQ0hJTkVfQ0hFQ0s6IFByb2Nlc3NvciByZXBvcnRlZCBhIE1hY2hpbmUgQ2hlY2sgRXhj
ZXB0aW9uLiJ9LAo+ICAgIHsoMSA8PCA1KSwgIlRBSU5UX0JBRF9QQUdFOiBCYWQgcGFnZSByZWZl
cmVuY2Ugb3IgYW4gdW5leHBlY3RlZCBwYWdlIGZsYWdzLiJ9LAo+ICAgIHsoMSA8PCA3KSwgIlRB
SU5UX0RJRTogS2VybmVsIGhhcyBkaWVkIC0gQlVHL09PUFMuIn0sCj4gICAgeygxIDw8IDkpLCAi
VEFJTlRfV0FSTjogV0FSTl9PTiBoYXMgaGFwcGVuZWQuIn0sCj4gLS0gCj4gMi4xOS4xCj4gCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBpZ3QtZGV2
IG1haWxpbmcgbGlzdAo+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2CgotLSAKRGFuaWVs
IFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cu
ZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
