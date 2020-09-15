Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5412F6E882
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Sep 2020 15:47:41 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Tue, 15 Sep 2020 18:47:23 +0300
Message-Id: <20200915154725.1195-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20200915154725.1195-1-ville.syrjala@linux.intel.com>
References: <20200915154725.1195-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/6] tools/intel_display_poller: Add pipe D
 support
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkxl
dCdzIHN1cHBvcnQgNCBwaXBlcyBmb3IgdGdsKy4KClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrD
pGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogdG9vbHMvaW50ZWxfZGlz
cGxheV9wb2xsZXIuYyB8IDggKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90b29scy9pbnRlbF9kaXNwbGF5X3BvbGxl
ci5jIGIvdG9vbHMvaW50ZWxfZGlzcGxheV9wb2xsZXIuYwppbmRleCAwNTk0ZTkxOGJkMzguLjQ1
YjM4MTU0YWJkZSAxMDA2NDQKLS0tIGEvdG9vbHMvaW50ZWxfZGlzcGxheV9wb2xsZXIuYworKysg
Yi90b29scy9pbnRlbF9kaXNwbGF5X3BvbGxlci5jCkBAIC0xMDIzLDcgKzEwMjMsNyBAQCBpbnQg
bWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogCQkJCXBpcGUgLT0gJzAnOwogCQkJZWxzZQog
CQkJCXVzYWdlKGFyZ3ZbMF0pOwotCQkJaWYgKHBpcGUgPCAwIHx8IHBpcGUgPiAyKQorCQkJaWYg
KHBpcGUgPCAwIHx8IHBpcGUgPiAzKQogCQkJCXVzYWdlKGFyZ3ZbMF0pOwogCQkJYnJlYWs7CiAJ
CWNhc2UgJ2InOgpAQCAtMTEwNCw2ICsxMTA0LDggQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIg
KmFyZ3ZbXSkKIAogCQlpZiAocGlwZSA+IDEgJiYgIUlTX0NIRVJSWVZJRVcoZGV2aWQpKQogCQkJ
dXNhZ2UoYXJndlswXSk7CisJCWlmIChwaXBlID4gMikKKwkJCXVzYWdlKGFyZ3ZbMF0pOwogCiAJ
CWlmICh0ZXN0X3BpeGVsY291bnQpCiAJCQl1c2FnZShhcmd2WzBdKTsKQEAgLTExMjksNiArMTEz
MSwxMCBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogCX0gZWxzZSB7CiAJCWlm
IChwaXBlID4gMSAmJiBpbnRlbF9nZW4oZGV2aWQpIDwgNykKIAkJCXVzYWdlKGFyZ3ZbMF0pOwor
CQlpZiAocGlwZSA+IDIgJiYgaW50ZWxfZ2VuKGRldmlkKSA8IDEyKQorCQkJdXNhZ2UoYXJndlsw
XSk7CisJCWlmIChwaXBlID4gMykKKwkJCXVzYWdlKGFyZ3ZbMF0pOwogCiAJCWlmICh0ZXN0X3Bp
eGVsY291bnQpCiAJCQl1c2FnZShhcmd2WzBdKTsKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
