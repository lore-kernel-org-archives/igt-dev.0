Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53AC76E152
 for <igt-dev@lists.freedesktop.org>; Sun, 13 Oct 2019 19:08:27 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id q5so9082986pfg.13
 for <igt-dev@lists.freedesktop.org>; Sun, 13 Oct 2019 12:08:27 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Sun, 13 Oct 2019 22:08:15 +0300
Message-Id: <1570993695-3208-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] [PATCH i-g-t] tests/sw_sync: fix gcc warning
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

Y2FzdGluZyB2b2lkIHBvaW50ZXIgdG8gaW50IHBvaW50ZXIgY2F1c2VzIGdjYyB0byBiZSB1bmhh
cHkgd2l0aCBjb21tZW50Ogoid2FybmluZzogZGVyZWZlcmVuY2luZyB0eXBlLXB1bm5lZCBwb2lu
dGVyIHdpbGwgYnJlYWsgc3RyaWN0LWFsaWFzaW5nIApydWxlcyIKCmNoYW5nZToKKigoaW50ICop
IENNU0dfREFUQShjbXNnKSkgPSB0aW1lbGluZTsKdG86Cm1lbWNweShDTVNHX0RBVEEoY21zZyks
ICZ0aW1lbGluZSwgc2l6ZW9mKHRpbWVsaW5lKSk7CgpzbyBldmVyeXRpbmcgaXMgbmljZWx5IGRl
ZmluZWQgZm9yIGNvbXBpbGVyLgoKU2lnbmVkLW9mZi1ieTogSnVoYS1QZWtrYSBIZWlra2lsYSA8
anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT4KLS0tCiB0ZXN0cy9zd19zeW5jLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS90ZXN0cy9zd19zeW5jLmMgYi90ZXN0cy9zd19zeW5jLmMKaW5kZXggNjJkMWQxNy4uNjI2
YjZkMyAxMDA2NDQKLS0tIGEvdGVzdHMvc3dfc3luYy5jCisrKyBiL3Rlc3RzL3N3X3N5bmMuYwpA
QCAtMjI4LDcgKzIyOCw3IEBAIHN0YXRpYyB2b2lkIHRlc3Rfc3luY19idXN5X2ZvcmtfdW5peHNv
Y2tldCh2b2lkKQogCQljbXNnLT5jbXNnX3R5cGUgPSBTQ01fUklHSFRTOwogCQljbXNnLT5jbXNn
X2xlbiA9IENNU0dfTEVOKHNpemVvZih0aW1lbGluZSkpOwogCi0JCSooKGludCAqKSBDTVNHX0RB
VEEoY21zZykpID0gdGltZWxpbmU7CisJCW1lbWNweShDTVNHX0RBVEEoY21zZyksICZ0aW1lbGlu
ZSwgc2l6ZW9mKHRpbWVsaW5lKSk7CiAJCW1zZy5tc2dfY29udHJvbGxlbiA9IGNtc2ctPmNtc2df
bGVuOwogCiAJCWlndF9hc3NlcnRfZihzeW5jX2ZlbmNlX3dhaXQoZmVuY2UsIDApID09IC1FVElN
RSwKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
