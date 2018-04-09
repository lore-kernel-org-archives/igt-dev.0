Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com
 [IPv6:2a00:1450:400c:c09::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908EE89E38
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Apr 2018 16:35:49 +0000 (UTC)
Received: by mail-wm0-x243.google.com with SMTP id r82so18113998wme.0
 for <igt-dev@lists.freedesktop.org>; Mon, 09 Apr 2018 09:35:49 -0700 (PDT)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Mon,  9 Apr 2018 17:35:39 +0100
Message-Id: <20180409163539.13980-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t] tools/aubdump: Fix ISO C90 forbids mixed
 declarations and code warning
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCkJhY2sgdG8g
YSBjbGVhbiBidWlsZCB3aXRoIG5vIHdhcm5pbmdzLCBhdCBsZWFzdCBmb3IgbWUuCgpTaWduZWQt
b2ZmLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgpDYzogSm9y
ZGFuIEp1c3RlbiA8am9yZGFuLmwuanVzdGVuQGludGVsLmNvbT4KQ2M6IFNjb3R0IEQgUGhpbGxp
cHMgPHNjb3R0LmQucGhpbGxpcHNAaW50ZWwuY29tPgotLS0KIHRvb2xzL2F1YmR1bXAuYyB8IDcg
KysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS90b29scy9hdWJkdW1wLmMgYi90b29scy9hdWJkdW1wLmMKaW5kZXggMjY3
MDYxYjBmYzJiLi4yZDJiNmM2MDdhNDMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2F1YmR1bXAuYworKysg
Yi90b29scy9hdWJkdW1wLmMKQEAgLTM5NCwxMCArMzk0LDExIEBAIGdlbjhfZW1pdF9nZ3R0X3B0
ZV9mb3JfcmFuZ2UodWludDY0X3Qgc3RhcnQsIHVpbnQ2NF90IGVuZCkKIAogCWVudHJ5X2FkZHIg
PSBzdGFydCAmIH4oNDA5NiAtIDEpOwogCWRvIHsKKwkJdWludDY0X3QgbGFzdF9wYWdlX2VudHJ5
LCBudW1fZW50cmllczsKKwogCQlwYWdlX251bSA9IGVudHJ5X2FkZHIgPj4gMjE7Ci0JCXVpbnQ2
NF90IGxhc3RfcGFnZV9lbnRyeSA9Ci0JCQltaW4oKHBhZ2VfbnVtICsgMSkgPDwgMjEsIGVuZF9h
bGlnbmVkKTsKLQkJdWludDY0X3QgbnVtX2VudHJpZXMgPSAobGFzdF9wYWdlX2VudHJ5IC0gZW50
cnlfYWRkcikgPj4gMTI7CisJCWxhc3RfcGFnZV9lbnRyeSA9IG1pbigocGFnZV9udW0gKyAxKSA8
PCAyMSwgZW5kX2FsaWduZWQpOworCQludW1fZW50cmllcyA9IChsYXN0X3BhZ2VfZW50cnkgLSBl
bnRyeV9hZGRyKSA+PiAxMjsKIAkJbWVtX3RyYWNlX21lbW9yeV93cml0ZV9oZWFkZXJfb3V0KAog
CQkJZW50cnlfYWRkciA+PiA5LCBudW1fZW50cmllcyAqIEdFTjhfUFRFX1NJWkUsCiAJCQlBVUJf
TUVNX1RSQUNFX01FTU9SWV9BRERSRVNTX1NQQUNFX0dHVFRfRU5UUlkpOwotLSAKMi4xNC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1h
aWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
