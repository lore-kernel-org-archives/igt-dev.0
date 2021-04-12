Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6686E52C
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 11:18:43 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 12 Apr 2021 13:17:48 +0200
Message-Id: <20210412111808.137038-20-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210412111808.137038-1-zbigniew.kempczynski@intel.com>
References: <20210412111808.137038-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v32 19/39] lib/igt_fb: Initialize intel_buf
 with same size as fb
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

V2UgbmVlZCB0byBoYXZlIHNhbWUgc2l6ZSB3aGVuIGludGVsX2J1ZiBpcyBpbml0aWFsaXplZCBv
dmVyIGZiCih3aXRoIGNvbXByZXNzaW9uKSBiZWNhdXNlIGFsbG9jYXRvciBjb3VsZCBiZSBjYWxs
ZWQgd2l0aCBzbWFsbGVyCnNpemUgd2hhdCBjb3VsZCBsZWFkIHRvIHJlbG9jYXRpb24uCgpVc2Ug
bmV3IGludGVsX2J1ZiBmdW5jdGlvbiB3aGljaCBhbGxvd3MgaW5pdGlhbGl6ZSB3aXRoIGhhbmRs
ZSBhbmQgc2l6ZS4KClNpZ25lZC1vZmYtYnk6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25p
ZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPgpDYzogRG9taW5payBHcnplZ29yemVrIDxkb21pbmlr
LmdyemVnb3J6ZWtAaW50ZWwuY29tPgpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxz
b24uY28udWs+CkFja2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNo
PgotLS0KIGxpYi9pZ3RfZmIuYyB8IDEwICsrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9mYi5jIGIv
bGliL2lndF9mYi5jCmluZGV4IDRkZWQ3ZTc4YS4uNWMxNjcwNDEwIDEwMDY0NAotLS0gYS9saWIv
aWd0X2ZiLmMKKysrIGIvbGliL2lndF9mYi5jCkBAIC0yMjUzLDExICsyMjUzLDExIEBAIGlndF9m
Yl9jcmVhdGVfaW50ZWxfYnVmKGludCBmZCwgc3RydWN0IGJ1Zl9vcHMgKmJvcHMsCiAJYm9fbmFt
ZSA9IGdlbV9mbGluayhmZCwgZmItPmdlbV9oYW5kbGUpOwogCWhhbmRsZSA9IGdlbV9vcGVuKGZk
LCBib19uYW1lKTsKIAotCWJ1ZiA9IGludGVsX2J1Zl9jcmVhdGVfdXNpbmdfaGFuZGxlKGJvcHMs
IGhhbmRsZSwKLQkJCQkJICAgIGZiLT53aWR0aCwgZmItPmhlaWdodCwKLQkJCQkJICAgIGZiLT5w
bGFuZV9icHBbMF0sIDAsCi0JCQkJCSAgICBpZ3RfZmJfbW9kX3RvX3RpbGluZyhmYi0+bW9kaWZp
ZXIpLAotCQkJCQkgICAgY29tcHJlc3Npb24pOworCWJ1ZiA9IGludGVsX2J1Zl9jcmVhdGVfdXNp
bmdfaGFuZGxlX2FuZF9zaXplKGJvcHMsIGhhbmRsZSwKKwkJCQkJCSAgICAgZmItPndpZHRoLCBm
Yi0+aGVpZ2h0LAorCQkJCQkJICAgICBmYi0+cGxhbmVfYnBwWzBdLCAwLAorCQkJCQkJICAgICBp
Z3RfZmJfbW9kX3RvX3RpbGluZyhmYi0+bW9kaWZpZXIpLAorCQkJCQkJICAgICBjb21wcmVzc2lv
biwgZmItPnNpemUpOwogCWludGVsX2J1Zl9zZXRfbmFtZShidWYsIG5hbWUpOwogCiAJLyogTWFr
ZSBzdXJlIHdlIGNsb3NlIGhhbmRsZSBvbiBkZXN0cm95IHBhdGggKi8KLS0gCjIuMjYuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
