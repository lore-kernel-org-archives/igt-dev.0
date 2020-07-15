Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46E26EB7F
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2020 15:06:22 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Wed, 15 Jul 2020 18:05:41 +0300
Message-Id: <20200715150542.30405-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20200715150542.30405-1-ville.syrjala@linux.intel.com>
References: <20200715150542.30405-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/kms_cursor_crc: Fix segfault on
 skip
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
ZSBmaXh0dXJlIGF0IHRoZSBlbmQgb2YgdGhlIHRlc3QgY3VycmVudGx5IHRyaWVzIHRvIGZyZWUg
dGhlCmJhdGNoIHdoZXRoZXIgb3Igbm90IGl0IGV2ZW4gZ290IGFsbG9jYXRlZC4gVGhpcyBjYXVz
ZXMgdGhlIHRlc3QKdG8gc2VnZmF1bHQgb24gbWFueSBza2lwcy4gQ2hlY2sgdGhhdCB3ZSBoYXZl
IHRoZSBiYXRjaCBiZWZvcmUKdHJ5aW5nIHRvIGZyZWUgaXQuCgpTaWduZWQtb2ZmLWJ5OiBWaWxs
ZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIHRlc3RzL2tt
c19jdXJzb3JfY3JjLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2N1cnNvcl9jcmMuYyBiL3Rl
c3RzL2ttc19jdXJzb3JfY3JjLmMKaW5kZXggN2U2YjI0Y2MwNGEzLi5kYzA4ODBhNzdlODcgMTAw
NjQ0Ci0tLSBhL3Rlc3RzL2ttc19jdXJzb3JfY3JjLmMKKysrIGIvdGVzdHMva21zX2N1cnNvcl9j
cmMuYwpAQCAtODI3LDEwICs4MjcsMTAgQEAgaWd0X21haW4KIAkJCWlndF9waXBlX2NyY19mcmVl
KGRhdGEucGlwZV9jcmMpOwogCQl9CiAKLQkJaWYgKGRhdGEuYnVmbWdyICE9IE5VTEwpIHsKKwkJ
aWYgKGRhdGEuYmF0Y2ggIT0gTlVMTCkKIAkJCWludGVsX2JhdGNoYnVmZmVyX2ZyZWUoZGF0YS5i
YXRjaCk7CisJCWlmIChkYXRhLmJ1Zm1nciAhPSBOVUxMKQogCQkJZHJtX2ludGVsX2J1Zm1ncl9k
ZXN0cm95KGRhdGEuYnVmbWdyKTsKLQkJfQogCiAJCWlndF9kaXNwbGF5X2ZpbmkoJmRhdGEuZGlz
cGxheSk7CiAJfQotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXYK
