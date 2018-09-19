Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA4D6E4E7
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Sep 2018 11:49:22 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 19 Sep 2018 14:49:10 +0300
Message-Id: <20180919114910.29790-1-petri.latvala@intel.com>
Subject: [igt-dev] [PATCH i-g-t 1/1] runner: Flush igt_runner outputs before
 forking
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
Cc: Tomi Sarvela <tomi.p.sarvela@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

SWYgdGhlIG91dHB1dCBvZiBpZ3RfcnVubmVyIGlzIHBpcGVkIG9yIHJlZGlyZWN0ZWQsIGJ1ZmZl
cmVkIHByaW50cwpjb3VsZCBiZSBsZWZ0IGxpbmdlcmluZyBhbmQgcmVhZCBhcyB0ZXN0IGV4ZWN1
dGFibGUgb3V0cHV0IGlmIGV4ZWN2KCkKZmFpbHMuIFRoaXMgY2FuIGhhcHBlbiBlYXNpbHkgaWYg
Q0kgZm9yIGV4YW1wbGUgZ2VuZXJhdGVzIGEgdGVzdGxpc3QKd2l0aCBhbiBpbmNvcnJlY3QgYmlu
YXJ5IG5hbWUsIG9yIGFuIG9wdGlvbmFsIHRlc3QgYmluYXJ5IChzYXksCmttc19jaGFtZWxpdW0p
IGlzIG5vdCBidWlsdCBmb3IgdGhlIGRlcGxveW1lbnQgaW4gcXVlc3Rpb24uCgpTaWduZWQtb2Zm
LWJ5OiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KQ2M6IFRvbWkgU2Fy
dmVsYSA8dG9taS5wLnNhcnZlbGFAaW50ZWwuY29tPgpDYzogQXJrYWRpdXN6IEhpbGVyIDxhcmth
ZGl1c3ouaGlsZXJAaW50ZWwuY29tPgotLS0KIHJ1bm5lci9leGVjdXRvci5jIHwgOCArKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3J1bm5lci9l
eGVjdXRvci5jIGIvcnVubmVyL2V4ZWN1dG9yLmMKaW5kZXggNzAxY2E4MGQuLmZkMjYyZWI0IDEw
MDY0NAotLS0gYS9ydW5uZXIvZXhlY3V0b3IuYworKysgYi9ydW5uZXIvZXhlY3V0b3IuYwpAQCAt
NzgwLDYgKzc4MCwxNCBAQCBzdGF0aWMgaW50IGV4ZWN1dGVfZW50cnkoc2l6ZV90IGlkeCwKIAkJ
cHJpbnRmKCJcbiIpOwogCX0KIAorCS8qCisJICogRmx1c2ggb3V0cHV0cyBiZWZvcmUgZm9ya2lu
ZyBzbyBvdXIgKGJ1ZmZlcmVkKSBvdXRwdXQgd29uJ3QKKwkgKiBlbmQgdXAgaW4gdGhlIHRlc3Qg
b3V0cHV0cy4KKwkgKi8KKworCWZmbHVzaChzdGRvdXQpOworCWZmbHVzaChzdGRlcnIpOworCiAJ
aWYgKChjaGlsZCA9IGZvcmsoKSkpIHsKIAkJaW50IG91dGZkID0gb3V0cGlwZVswXTsKIAkJaW50
IGVycmZkID0gZXJycGlwZVswXTsKLS0gCjIuMTguMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pZ3QtZGV2Cg==
