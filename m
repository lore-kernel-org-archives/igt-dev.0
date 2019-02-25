Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BB489617
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Feb 2019 13:23:25 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id n15so6849511lfe.5
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Feb 2019 05:23:24 -0800 (PST)
From: Sergii Romantsov <sergii.romantsov@gmail.com>
Date: Mon, 25 Feb 2019 15:23:19 +0200
Message-Id: <1551100999-27427-1-git-send-email-sergii.romantsov@globallogic.com>
Subject: [igt-dev] [PATCH i-g-t v1] meson: missed dependency of liblzma
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
List-ID: <igt-dev@lists.freedesktop.org>

RmFpbGVkIHRvIGNvbmZpZ3VyZSBpbnRlbC1ncHUtdG9vbHMgd2l0aCBlcnJvcjoKCgltZXNvbi5i
dWlsZDoxNTE6MDogRVJST1I6ICBDb3VsZCBub3QgZ2VuZXJhdGUgY2FyZ3MgZm9yIGxpYmR3OgoK
bGliZHcgZGVwZW5kcyBvbiBsaWJsem1hLgpJbnN0YWxsYXRpb24gb2YgbGlibHptYS1kZXYgZml4
ZXMgaXNzdWUuCgpGaXhlczogZTM5ZTA5OTEwZmM4IChsaWIvY29yZTogVXNlIGxpYmR3IHRvIGRl
Y29kZSBzdGFjayB0cmFjZSB3aXRoIGRlYnVnZ2luZyBzeW1ib2xzLCB2Mi4pCkNDOiBNYWFydGVu
IExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpTaWduZWQtb2Zm
LWJ5OiBTZXJnaWkgUm9tYW50c292IDxzZXJnaWkucm9tYW50c292QGdsb2JhbGxvZ2ljLmNvbT4K
LS0tCiBtZXNvbi5idWlsZCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpk
aWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAppbmRleCAwOTlkYjg5Li40YzU4
Y2E4IDEwMDY0NAotLS0gYS9tZXNvbi5idWlsZAorKysgYi9tZXNvbi5idWlsZApAQCAtMTQ4LDYg
KzE0OCw3IEBAIGlmIHdpdGhfbGlidW53aW5kICE9ICdmYWxzZScKIGVuZGlmCiBidWlsZF9pbmZv
ICs9ICdXaXRoIGxpYnVud2luZDogJyArIGxpYnVud2luZGluZm8KIAorbGlibHptYSA9IGRlcGVu
ZGVuY3koJ2xpYmx6bWEnLCByZXF1aXJlZCA6IHRydWUpCiBsaWJkdyA9IGRlcGVuZGVuY3koJ2xp
YmR3JywgcmVxdWlyZWQgOiB0cnVlKQogcGl4bWFuID0gZGVwZW5kZW5jeSgncGl4bWFuLTEnLCBy
ZXF1aXJlZCA6IHRydWUpCiAKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXY=
