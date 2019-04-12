Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296E38999A
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2019 13:36:09 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id h16so8864285ljg.11
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2019 06:36:09 -0700 (PDT)
From: Sergii Romantsov <sergii.romantsov@gmail.com>
Date: Fri, 12 Apr 2019 16:36:03 +0300
Message-Id: <20190412133603.31320-1-sergii.romantsov@globallogic.com>
In-Reply-To: <20190226102029.GE4038@platvala-desk.ger.corp.intel.com>
References: <20190226102029.GE4038@platvala-desk.ger.corp.intel.com>
Subject: [igt-dev] [PATCH i-g-t v2] meson: missed dependency of liblzma
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RmFpbGVkIHRvIGNvbmZpZ3VyZSBpbnRlbC1ncHUtdG9vbHMgd2l0aCBlcnJvcjoKCgltZXNvbi5i
dWlsZDoxNTE6MDogRVJST1I6ICBDb3VsZCBub3QgZ2VuZXJhdGUgY2FyZ3MgZm9yIGxpYmR3OgoK
bGliZHcgZGVwZW5kcyBvbiBsaWJsem1hLgpJbnN0YWxsYXRpb24gb2YgbGlibHptYS1kZXYgZml4
ZXMgaXNzdWUuCkF0IGxlYXN0IGl0IGhhcyB0byBiZSBwb2ludGVkIGluIFJlYWRtZS4KCnYyOiBq
dXN0IHJlYWRtZSB1cGRhdGVkCgpDYzogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRl
bC5jb20+CkNDOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50
ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBTZXJnaWkgUm9tYW50c292IDxzZXJnaWkucm9tYW50c292
QGdsb2JhbGxvZ2ljLmNvbT4KLS0tCiBSRUFETUUubWQgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL1JFQURNRS5tZCBiL1JFQURNRS5tZAppbmRleCAy
ZDU4MzA5NS4uN2JhY2UwMDIgMTAwNjQ0Ci0tLSBhL1JFQURNRS5tZAorKysgYi9SRUFETUUubWQK
QEAgLTE1Nyw2ICsxNTcsNyBAQCB0aGUgZGVmYXVsdCBjb25maWd1cmF0aW9uIChwYWNrYWdlIG5h
bWVzIG1heSB2YXJ5KToKIAlsaWJwY2lhY2Nlc3MtZGV2CiAJbGlicHJvY3BzLWRldgogCWxpYnVu
d2luZC1kZXYKKwlsaWJsem1hLWRldgogCWxpYmR3LWRldgogCXB5dGhvbi1kb2N1dGlscwogCXgx
MXByb3RvLWRyaTItZGV2Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldg==
