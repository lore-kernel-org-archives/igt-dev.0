Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6289589F82
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Oct 2018 14:31:01 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Mon, 29 Oct 2018 16:30:53 +0200
Message-Id: <20181029143054.28147-3-petri.latvala@intel.com>
In-Reply-To: <20181029143054.28147-1-petri.latvala@intel.com>
References: <20181029143054.28147-1-petri.latvala@intel.com>
Subject: [igt-dev] [PATCH i-g-t 3/4] assembler: Compare correct things
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

VGhpcyBjb2RlIGlzIHN1cHBvc2VkbHkgY2hlY2tpbmcgb2YgdGhlIGdpdmVuIHJlZ2lzdGVyIGlz
IG5yPTAgaW4gQVJGIGJ1dAp3YXMgaW5zdGVhZCBjaGVja2luZyB0d2ljZSBpZiB0aGUgcmVnaXN0
ZXIgaXMgYW55dGhpbmcgaW4gQVJGLgoKU2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0
cmkubGF0dmFsYUBpbnRlbC5jb20+Ci0tLQogYXNzZW1ibGVyL2Jyd19ldV9lbWl0LmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9hc3NlbWJsZXIvYnJ3X2V1X2VtaXQuYyBiL2Fzc2VtYmxlci9icndfZXVfZW1pdC5jCmlu
ZGV4IGQ0ZmFkZmZhLi5jYTkzMjQ1YiAxMDA2NDQKLS0tIGEvYXNzZW1ibGVyL2Jyd19ldV9lbWl0
LmMKKysrIGIvYXNzZW1ibGVyL2Jyd19ldV9lbWl0LmMKQEAgLTE4MCw3ICsxODAsNyBAQCB2YWxp
ZGF0ZV9yZWcoc3RydWN0IGJyd19pbnN0cnVjdGlvbiAqaW5zbiwgc3RydWN0IGJyd19yZWcgcmVn
KQogICAgfQogCiAgICBpZiAocmVnLmZpbGUgPT0gQlJXX0FSQ0hJVEVDVFVSRV9SRUdJU1RFUl9G
SUxFICYmCi0gICAgICAgcmVnLmZpbGUgPT0gQlJXX0FSRl9OVUxMKQorICAgICAgIHJlZy5uciA9
PSBCUldfQVJGX05VTEwpCiAgICAgICByZXR1cm47CiAKICAgIGFzc2VydChyZWcuaHN0cmlkZSA+
PSAwICYmIHJlZy5oc3RyaWRlIDwgRWxlbWVudHMoaHN0cmlkZV9mb3JfcmVnKSk7Ci0tIAoyLjE4
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
