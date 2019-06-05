Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D9A892AE
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2019 17:47:55 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Wed,  5 Jun 2019 10:44:50 -0700
Message-Id: <20190605174450.7235-4-lucas.demarchi@intel.com>
In-Reply-To: <20190605174450.7235-1-lucas.demarchi@intel.com>
References: <20190605174450.7235-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 4/4] lib/igt_core: add -h to usage
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

V2UgYWxzbyBhY2NlcHQgdGhlIHNob3J0IG9wdGlvbiAtaC4KClNpZ25lZC1vZmYtYnk6IEx1Y2Fz
IERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogUGV0cmkg
TGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Ci0tLQogbGliL2lndF9jb3JlLmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9saWIvaWd0X2NvcmUuYyBiL2xpYi9pZ3RfY29yZS5jCmluZGV4IGEwYjdlNTgxLi42
YjlmMDQyNSAxMDA2NDQKLS0tIGEvbGliL2lndF9jb3JlLmMKKysrIGIvbGliL2lndF9jb3JlLmMK
QEAgLTU1OCw3ICs1NTgsNyBAQCBzdGF0aWMgdm9pZCBwcmludF91c2FnZShjb25zdCBjaGFyICpo
ZWxwX3N0ciwgYm9vbCBvdXRwdXRfb25fc3RkZXJyKQogCQkgICAiICAtLWRlYnVnWz1sb2ctZG9t
YWluXVxuIgogCQkgICAiICAtLWludGVyYWN0aXZlLWRlYnVnWz1kb21haW5dXG4iCiAJCSAgICIg
IC0taGVscC1kZXNjcmlwdGlvblxuIgotCQkgICAiICAtLWhlbHBcbiIpOworCQkgICAiICAtLWhl
bHB8LWhcbiIpOwogCWlmIChoZWxwX3N0cikKIAkJZnByaW50ZihmLCAiJXNcbiIsIGhlbHBfc3Ry
KTsKIH0KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
