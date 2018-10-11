Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49596E3EF
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Oct 2018 15:42:37 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id y20-v6so8692770eds.10
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Oct 2018 08:42:37 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 11 Oct 2018 17:42:30 +0200
Message-Id: <20181011154230.13802-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] meson.sh: Add support for install/uninstall
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
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBzaG91bGQgd29yayBub3cuCgpBY2tlZC1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0
dmFsYUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAaW50ZWwuY29tPgotLS0KIG1lc29uLnNoIHwgNyArKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21lc29uLnNoIGIv
bWVzb24uc2gKaW5kZXggZjBkYjJhMTljNDQwLi43Y2Y5ZDRhM2FjNzAgMTAwNzU1Ci0tLSBhL21l
c29uLnNoCisrKyBiL21lc29uLnNoCkBAIC0yNCw4ICsyNCwxMSBAQCByZWNvbmZpZ3VyZTogYnVp
bGQvYnVpbGQubmluamEKIGNoZWNrIGRpc3RjaGVjayBkaXN0IGRpc3RjbGVhbjoKIAllY2hvICJU
aGlzIGlzIHRoZSBtZXNvbiB3cmFwcGVyLCBub3QgYXV0b21ha2UiICYmIGZhbHNlCiAKLWluc3Rh
bGwgdW5pbnN0YWxsOgotCWVjaG8gIm1lc29uIGluc3RhbGwgc3VwcG9ydCBub3QgeWV0IGNvbXBs
ZXRlZCIgJiYgZmFsc2UKK2luc3RhbGw6IGJ1aWxkL2J1aWxkLm5pbmphCisJbmluamEgLUMgYnVp
bGQgaW5zdGFsbAorCit1bmluc3RhbGw6IGJ1aWxkL2J1aWxkLm5pbmphCisJbmluamEgLUMgYnVp
bGQgdW5pbnN0YWxsCiAKIGRvY3M6CiAJbmluamEgLUMgYnVpbGQgaWd0LWdwdS10b29scy1kb2MK
LS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
