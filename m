Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDAE6E6B5
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Aug 2018 07:20:08 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id i26-v6so3470655pfo.12
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Aug 2018 00:20:08 -0700 (PDT)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@gmail.com>
Date: Thu, 30 Aug 2018 00:19:56 -0700
Message-Id: <20180830071956.7348-1-dhinakaran.pandiyan@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/psr: Skip kms_psr on pre-Gen9 hardware
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Q0kgcnVucyBzaG93IFBTUiB0ZXN0cyBmYWlsaW5nIG9uIHRoZSByZWNlbnRseSBhZGRlZCBCRFcg
KGZpLWJkdy1zYW11cyksIGl0Cm1ha2VzIHNlbnNlIHRvIGVuYWJsZSB0aGVzZSB0ZXN0cyB3aGVu
IHdlIGtub3cgdGhleSBhcmUgZXhwZWN0ZWQgdG8gcGFzcy4KClNpZ25lZC1vZmYtYnk6IERoaW5h
a2FyYW4gUGFuZGl5YW4gPGRoaW5ha2FyYW4ucGFuZGl5YW5AaW50ZWwuY29tPgotLS0KIHRlc3Rz
L2ttc19wc3IuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0t
Z2l0IGEvdGVzdHMva21zX3Bzci5jIGIvdGVzdHMva21zX3Bzci5jCmluZGV4IDIxOGIzOTYwLi41
MmI3MTgyNiAxMDA2NDQKLS0tIGEvdGVzdHMva21zX3Bzci5jCisrKyBiL3Rlc3RzL2ttc19wc3Iu
YwpAQCAtNDExLDYgKzQxMSw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAJ
CWRhdGEuZGVidWdmc19mZCA9IGlndF9kZWJ1Z2ZzX2RpcihkYXRhLmRybV9mZCk7CiAJCWttc3Rl
c3Rfc2V0X3Z0X2dyYXBoaWNzX21vZGUoKTsKIAkJZGF0YS5kZXZpZCA9IGludGVsX2dldF9kcm1f
ZGV2aWQoZGF0YS5kcm1fZmQpOworCQlpZ3RfcmVxdWlyZShBVF9MRUFTVF9HRU4oZGF0YS5kZXZp
ZCwgOSkpOwogCiAJCWlndF9zZXRfbW9kdWxlX3BhcmFtX2ludCgiZW5hYmxlX3BzciIsIGRhdGEu
d2l0aF9wc3JfZGlzYWJsZWQgPwogCQkJCQkgMCA6IDEpOwotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlz
dAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
