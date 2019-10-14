Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C197F6E1B3
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2019 12:09:29 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id i32so9998705pgl.10
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2019 05:09:29 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Mon, 14 Oct 2019 15:09:04 +0300
Message-Id: <1571054945-5439-1-git-send-email-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] RFC: Fix gem test related gcc warnings.
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
Cc: tvrtko.ursulin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

SSBkb24ndCB1c2UgdGhlc2UgImZvcl9lYWNoX2VuZ2luZSIgZGVmaW5lcyBldmVyIHNvIEkgZG9u
J3Qga25vdyBpZiB0aGlzIGlzCndvcmthYmxlIHNvbHV0aW9uLiBJIHdhcyBqdXN0IGxvb2tpbmcg
YXQgdGhvc2UgZ2VtIHRlc3QgcmVsYXRlZCBjb21waWxlCnRpbWUgd2FybmluZ3MgYWJvdXQgImRl
Y2xhcmF0aW9uIG9mIOKAmGVfX+KAmSBzaGFkb3dzIGEgcHJldmlvdXMgbG9jYWwiIGFuZAptYWRl
IHRoaXMgdG8gc2lsZW5jZSB0aGVtIG91dC4KCkp1aGEtUGVra2EgSGVpa2tpbGEgKDEpOgogIGdl
bTogZml4IGNvbXBpbGVyIHdhcm5pbmdzCgogbGliL2lndF9ndC5oICAgICAgICAgICAgICAgICAg
IHwgMTYgKysrKysrKystLS0tLS0tLQogdGVzdHMvaTkxNS9nZW1fZWlvLmMgICAgICAgICAgIHwg
IDYgKysrLS0tCiB0ZXN0cy9pOTE1L2dlbV9leGVjX2xhdGVuY3kuYyAgfCAgNCArKy0tCiB0ZXN0
cy9pOTE1L2dlbV9leGVjX25vcC5jICAgICAgfCAgOCArKysrLS0tLQogdGVzdHMvaTkxNS9nZW1f
ZXhlY19zY2hlZHVsZS5jIHwgIDQgKystLQogdGVzdHMvaTkxNS9nZW1fc3luYy5jICAgICAgICAg
IHwgMTYgKysrKysrKystLS0tLS0tLQogNiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCsp
LCAyNyBkZWxldGlvbnMoLSkKCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2
