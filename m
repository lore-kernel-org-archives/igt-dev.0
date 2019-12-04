Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C842A6E91E
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Dec 2019 15:53:17 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id v93so3152352pjb.6
 for <igt-dev@lists.freedesktop.org>; Wed, 04 Dec 2019 07:53:17 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Wed,  4 Dec 2019 17:52:49 +0200
Message-Id: <1575474769-30637-2-git-send-email-juhapekka.heikkila@gmail.com>
In-Reply-To: <1575474769-30637-1-git-send-email-juhapekka.heikkila@gmail.com>
References: <1575474769-30637-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/igt_fb: sync memory at unmap_bo()
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

U3luYyBtZW1vcnkgYXQgdW5tYXBfYm8oKSB0byBhdm9pZCBwcm9ibGVtcyB3aXRoIGNwdSBnZW0g
ZG9tYWluLgoKU2lnbmVkLW9mZi1ieTogSnVoYS1QZWtrYSBIZWlra2lsYSA8anVoYXBla2thLmhl
aWtraWxhQGdtYWlsLmNvbT4KLS0tCiBsaWIvaWd0X2ZiLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9saWIvaWd0X2ZiLmMgYi9saWIvaWd0
X2ZiLmMKaW5kZXggNmNlN2NmZS4uNWE3MGRiZiAxMDA2NDQKLS0tIGEvbGliL2lndF9mYi5jCisr
KyBiL2xpYi9pZ3RfZmIuYwpAQCAtMjE1Miw2ICsyMTUyLDEwIEBAIGludCBpZ3RfZGlydHlfZmIo
aW50IGZkLCBzdHJ1Y3QgaWd0X2ZiICpmYikKIAogc3RhdGljIHZvaWQgdW5tYXBfYm8oc3RydWN0
IGlndF9mYiAqZmIsIHZvaWQgKnB0cikKIHsKKwlpZiAoaXNfaTkxNV9kZXZpY2UoZmItPmZkKSkK
KwkJZ2VtX3NldF9kb21haW4oZmItPmZkLCBmYi0+Z2VtX2hhbmRsZSwKKwkJCSAgICAgICBJOTE1
X0dFTV9ET01BSU5fR1RULCAwKTsKKwogCWdlbV9tdW5tYXAocHRyLCBmYi0+c2l6ZSk7CiAKIAlp
ZiAoZmItPmlzX2R1bWIpCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2
