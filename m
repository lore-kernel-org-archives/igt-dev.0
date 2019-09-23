Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5718919F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2019 10:40:51 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id y10so5041165plp.2
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2019 03:40:51 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Mon, 23 Sep 2019 13:40:32 +0300
Message-Id: <1569235233-15674-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] [PATCH i-g-t] test longer than 32k strides.
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

VGhpcyB0ZXN0IGdvZXMgYWxvbmcgd2l0aCB0aGlzIGtlcm5lbCBwYXRjaDoKaHR0cHM6Ly9wYXRj
aHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82NzA3Ny8KCkp1aGEtUGVra2EgSGVpa2tpbGEg
KDEpOgogIHRlc3RzL2ttc19iaWdfZmI6IEFkZCBvdmVyIDMyayBIVyBzdHJpZGUgdGVzdHMKCiB0
ZXN0cy9rbXNfYmlnX2ZiLmMgfCAxMDMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMDMgaW5zZXJ0aW9ucygrKQoK
LS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
