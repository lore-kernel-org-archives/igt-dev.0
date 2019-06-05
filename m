Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200788994D
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2019 12:40:29 +0000 (UTC)
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
In-Reply-To: <20190605121607.28014-1-petri.latvala@intel.com>
References: <20190605121607.28014-1-petri.latvala@intel.com>
Date: Wed, 05 Jun 2019 15:40:26 +0300
Message-ID: <874l54ryrp.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+IHdyaXRlczoKCj4gU2lnbmVk
LW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Cj4gQ2M6IE1p
a2EgS3VvcHBhbGEgPG1pa2Eua3VvcHBhbGFAbGludXguaW50ZWwuY29tPgoKSWYgd2UgZ2V0IG9u
ZSwgdGhlIG1hY2hpbmUgc2hvdWxkIGJlIHJlbW92ZWQgZnJvbSB0aGUgcG9vbC4KClJldmlld2Vk
LWJ5OiBNaWthIEt1b3BwYWxhIDxtaWthLmt1b3BwYWxhQGxpbnV4LmludGVsLmNvbT4KCj4gLS0t
Cj4gIHJ1bm5lci9leGVjdXRvci5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQo+Cj4gZGlmZiAtLWdpdCBhL3J1bm5lci9leGVjdXRvci5jIGIvcnVubmVyL2V4ZWN1dG9y
LmMKPiBpbmRleCA3ZTVmYmU4Zi4uNjllZjIxZTUgMTAwNjQ0Cj4gLS0tIGEvcnVubmVyL2V4ZWN1
dG9yLmMKPiArKysgYi9ydW5uZXIvZXhlY3V0b3IuYwo+IEBAIC0xNDIsNiArMTQyLDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCB7Cj4gIAl1bnNpZ25lZCBsb25nIGJpdDsKPiAgCWNvbnN0IGNoYXIg
KmV4cGxhbmF0aW9uOwo+ICB9IGFib3J0X3RhaW50c1tdID0gewo+ICsgIHsoMSA8PCA0KSwgIlRB
SU5UX01BQ0hJTkVfQ0hFQ0s6IFByb2Nlc3NvciByZXBvcnRlZCBhIE1hY2hpbmUgQ2hlY2sgRXhj
ZXB0aW9uLiJ9LAo+ICAgIHsoMSA8PCA1KSwgIlRBSU5UX0JBRF9QQUdFOiBCYWQgcGFnZSByZWZl
cmVuY2Ugb3IgYW4gdW5leHBlY3RlZCBwYWdlIGZsYWdzLiJ9LAo+ICAgIHsoMSA8PCA3KSwgIlRB
SU5UX0RJRTogS2VybmVsIGhhcyBkaWVkIC0gQlVHL09PUFMuIn0sCj4gICAgeygxIDw8IDkpLCAi
VEFJTlRfV0FSTjogV0FSTl9PTiBoYXMgaGFwcGVuZWQuIn0sCj4gLS0gCj4gMi4xOS4xCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
