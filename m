Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70C46E077
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Sep 2018 11:40:57 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 11 Sep 2018 14:38:52 +0300
Message-Id: <20180911113853.24044-1-petri.latvala@intel.com>
Subject: [igt-dev] [PATCH i-g-t 1/2] runner/resultgen: More checking if
 subtests should exist
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
Cc: Martin Peres <martin.peres@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

SWYgYSB0ZXN0IHdpdGggc3VidGVzdHMganVzdCBleGl0cyBpbW1lZGlhdGVseSwgb3IgdGhlIHRl
c3QgYmluYXJ5CmRvZXNuJ3QgZXhpc3QgYXQgYWxsIChhcyBpcyBzb21ldGltZXMgdGhlIGNhc2Ug
d2l0aCBrbXNfY2hhbWVsaXVtKSwKdGhlIGV4aXN0ZW5jZSBvZiBzdWJ0ZXN0cyBkb2Vzbid0IGVu
ZCB1cCBpbiB0aGUgZXhlY3V0aW9uIGpvdXJuYWwuIEFzCndhcyBkb25lIGZvciB0aW1lb3V0cyBp
biBhNzk3Y2JmNjkxOGEgKCJydW5uZXIvcmVzdWx0Z2VuOiBCZSBtb3JlCnJvYnVzdCB3aXRoIGlu
Y29tcGxldGUgdGVzdHMiKSwgY2hlY2sgaWYgd2Ugd2VyZSBhdHRlbXB0aW5nIHRvIHJ1biBhCnN1
YnRlc3QgYmVmb3JlIGF0dHJpYnV0aW5nIGEgJ25vdHJ1bicgcmVzdWx0IHRvIGFuIGluY29ycmVj
dCBmaWVsZC4KClNpZ25lZC1vZmYtYnk6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50
ZWwuY29tPgpDYzogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPgpD
YzogTWFydGluIFBlcmVzIDxtYXJ0aW4ucGVyZXNAbGludXguaW50ZWwuY29tPgotLS0KIHJ1bm5l
ci9yZXN1bHRnZW4uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3J1bm5lci9yZXN1bHRnZW4uYyBiL3J1bm5lci9yZXN1
bHRnZW4uYwppbmRleCBlYTY4MDkxNC4uZDkzOTU4M2QgMTAwNjQ0Ci0tLSBhL3J1bm5lci9yZXN1
bHRnZW4uYworKysgYi9ydW5uZXIvcmVzdWx0Z2VuLmMKQEAgLTc3OCw3ICs3NzgsNyBAQCBzdGF0
aWMgdm9pZCBmaWxsX2Zyb21fam91cm5hbChpbnQgZmQsCiAJCQlhZGRfcnVudGltZShvYmosIHRp
bWUpOwogCiAJCQkvKiBJZiBubyBzdWJ0ZXN0cywgdGhlIHRlc3QgcmVzdWx0IG5vZGUgYWxzbyBn
ZXRzIHRoZSBydW50aW1lICovCi0JCQlpZiAoc3VidGVzdHMtPnNpemUgPT0gMCkgeworCQkJaWYg
KHN1YnRlc3RzLT5zaXplID09IDAgJiYgZW50cnktPnN1YnRlc3RfY291bnQgPT0gMCkgewogCQkJ
CW9iaiA9IGdldF9vcl9jcmVhdGVfanNvbl9vYmplY3QodGVzdHMsIHBpZ2xpdF9uYW1lKTsKIAkJ
CQlhZGRfcnVudGltZShvYmosIHRpbWUpOwogCQkJfQotLSAKMi4xNC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdApp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
