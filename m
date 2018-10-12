Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D36089D40
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Oct 2018 10:29:54 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Fri, 12 Oct 2018 13:29:47 +0300
Message-Id: <20181012102947.32489-1-petri.latvala@intel.com>
Subject: [igt-dev] [PATCH i-g-t 1/1] runner: Fix results when there's warns
 and dmesg-warns
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
Cc: Petri Latvala <petri.latvala@intel.com>, Martin Peres <martin.peres@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

QWZ0ZXIgc2V0dGluZyB0aGUgcmVzdWx0IG9iamVjdCB0ZXh0LCB0aGUgc3RyaW5nIHJldHJpZXZl
ZCBmcm9tIHRoZQpvbGQgb2JqZWN0IGlzIGludmFsaWQuCgpTaWduZWQtb2ZmLWJ5OiBQZXRyaSBM
YXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KQ2M6IE1hcnRpbiBQZXJlcyA8bWFydGlu
LnBlcmVzQGxpbnV4LmludGVsLmNvbT4KQ2M6IEFya2FkaXVzeiBIaWxlciA8YXJrYWRpdXN6Lmhp
bGVyQGludGVsLmNvbT4KLS0tCiBydW5uZXIvcmVzdWx0Z2VuLmMgfCAxICsKIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3J1bm5lci9yZXN1bHRnZW4uYyBiL3J1
bm5lci9yZXN1bHRnZW4uYwppbmRleCA5ZmM1NGNkYy4uZWQ4YzkyNjYgMTAwNjQ0Ci0tLSBhL3J1
bm5lci9yZXN1bHRnZW4uYworKysgYi9ydW5uZXIvcmVzdWx0Z2VuLmMKQEAgLTgyOCw2ICs4Mjgs
NyBAQCBzdGF0aWMgdm9pZCBvdmVycmlkZV9yZXN1bHRfc2luZ2xlKHN0cnVjdCBqc29uX29iamVj
dCAqb2JqKQogCWlmICghc3RyY21wKHJlc3VsdCwgInBhc3MiKSAmJgogCSAgICBjb3VudF9saW5l
cyhlcnJ0ZXh0LCBlcnJ0ZXh0ICsgc3RybGVuKGVycnRleHQpKSA+IDIpIHsKIAkJc2V0X3Jlc3Vs
dChvYmosICJ3YXJuIik7CisJCXJlc3VsdCA9ICJ3YXJuIjsKIAl9CiAKIAlpZiAoZG1lc2d3YXJu
cykgewotLSAKMi4xOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
