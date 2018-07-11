Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A14589338
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jul 2018 08:08:24 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id u11-v6so18507292eds.10
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jul 2018 01:08:24 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 11 Jul 2018 10:08:17 +0200
Message-Id: <20180711080817.14304-1-daniel.vetter@ffwll.ch>
Subject: [igt-dev] [PATCH i-g-t] meson.sh: Add support for install/uninstall
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
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBzaG91bGQgd29yayBub3cuCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGludGVsLmNvbT4KLS0tCiBtZXNvbi5zaCB8IDcgKysrKystLQogMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXNv
bi5zaCBiL21lc29uLnNoCmluZGV4IGYwZGIyYTE5YzQ0MC4uN2NmOWQ0YTNhYzcwIDEwMDc1NQot
LS0gYS9tZXNvbi5zaAorKysgYi9tZXNvbi5zaApAQCAtMjQsOCArMjQsMTEgQEAgcmVjb25maWd1
cmU6IGJ1aWxkL2J1aWxkLm5pbmphCiBjaGVjayBkaXN0Y2hlY2sgZGlzdCBkaXN0Y2xlYW46CiAJ
ZWNobyAiVGhpcyBpcyB0aGUgbWVzb24gd3JhcHBlciwgbm90IGF1dG9tYWtlIiAmJiBmYWxzZQog
Ci1pbnN0YWxsIHVuaW5zdGFsbDoKLQllY2hvICJtZXNvbiBpbnN0YWxsIHN1cHBvcnQgbm90IHll
dCBjb21wbGV0ZWQiICYmIGZhbHNlCitpbnN0YWxsOiBidWlsZC9idWlsZC5uaW5qYQorCW5pbmph
IC1DIGJ1aWxkIGluc3RhbGwKKwordW5pbnN0YWxsOiBidWlsZC9idWlsZC5uaW5qYQorCW5pbmph
IC1DIGJ1aWxkIHVuaW5zdGFsbAogCiBkb2NzOgogCW5pbmphIC1DIGJ1aWxkIGlndC1ncHUtdG9v
bHMtZG9jCi0tIAoyLjE4LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dgo=
