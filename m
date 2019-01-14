Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276A96E2D1
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jan 2019 08:41:24 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id r24so6755041wmh.0
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jan 2019 00:41:24 -0800 (PST)
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 14 Jan 2019 08:37:53 +0000
Message-Id: <20190114083753.14681-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/core_setmaster_vs_auth: drop
 __linux__ includes hunk
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
Cc: emil.l.velikov@gmail.com
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KClNlZW1pbmcg
Y29weS9wYXN0ZSBmcm9tIGFub3RoZXIgdGVzdC4gTm9uZSBvZiB0aGUgaW5jbHVkZXMgYXJlIHJl
cXVpcmVkLgoKU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFi
b3JhLmNvbT4KLS0tCiB0ZXN0cy9jb3JlX3NldG1hc3Rlcl92c19hdXRoLmMgfCA1IC0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9jb3JlX3Nl
dG1hc3Rlcl92c19hdXRoLmMgYi90ZXN0cy9jb3JlX3NldG1hc3Rlcl92c19hdXRoLmMKaW5kZXgg
ZjFhZTBjNjMuLmMzMzVkZGZmIDEwMDY0NAotLS0gYS90ZXN0cy9jb3JlX3NldG1hc3Rlcl92c19h
dXRoLmMKKysrIGIvdGVzdHMvY29yZV9zZXRtYXN0ZXJfdnNfYXV0aC5jCkBAIC0zOCwxMSArMzgs
NiBAQAogI2luY2x1ZGUgPHN0ZGxpYi5oPgogI2luY2x1ZGUgPHN0ZGlvLmg+CiAjaW5jbHVkZSA8
c3RyaW5nLmg+Ci0jaWZkZWYgX19saW51eF9fCi0jIGluY2x1ZGUgPHN5cy9zeXNjYWxsLmg+Ci0j
ZWxzZQotIyBpbmNsdWRlIDxwdGhyZWFkLmg+Ci0jZW5kaWYKIAogSUdUX1RFU1RfREVTQ1JJUFRJ
T04oIkNoZWNrIHRoYXQgZHJvcC9zZXRNYXN0ZXIgY29ycmVjdGx5IHRyYW5zZmVyIG1hc3RlciAi
CiAJCSAgICAgInN0YXRlIik7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldgo=
