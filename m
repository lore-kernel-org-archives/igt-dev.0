Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C1F6E3FB
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2019 16:49:58 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri,  8 Mar 2019 18:49:55 +0200
Message-Id: <20190308164955.27133-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20190307213926.18051-2-ville.syrjala@linux.intel.com>
References: <20190307213926.18051-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 2/5] tests/kms_setmode: Request the
 initial vbl count with RELATIVE instead of ABSOLUTE
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
Cc: Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkFz
a2luZyBmb3IgdGhlIGluaXRpYWwgdmJsYW5rIGNvdW50IGJ5IHNwZWNpZnlpbmcgYW5kIGFic29s
dXRlIHZibGFuayBjb3VudCBvZiAwCmRvZXNuJ3QgbWFrZSBtdWNoIHNlbnNlLiBTd2l0Y2ggdG8g
YSByZWxhdGl2ZSBxdWVyeSBpbnN0ZWFkLgoKdjI6IERyb3AgdGhlIE5FWFRPTk1JU1MgKERhbmll
bCkKdjM6IFB1dCBiYWNrIHRoZSBORVhUT05NSVNTIChDaHJpcykKCkNjOiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5j
by51az4KU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4
LmludGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfc2V0bW9kZS5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21z
X3NldG1vZGUuYyBiL3Rlc3RzL2ttc19zZXRtb2RlLmMKaW5kZXggNjgxNDk2MDQ0ZjVkLi5kMTUw
NDgzYzM2OGIgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19zZXRtb2RlLmMKKysrIGIvdGVzdHMva21z
X3NldG1vZGUuYwpAQCAtNDM0LDcgKzQzNCw3IEBAIHN0YXRpYyB2b2lkIGNoZWNrX3RpbWluZ3Mo
aW50IGNydGNfaWR4LCBjb25zdCBkcm1Nb2RlTW9kZUluZm8gKmttb2RlKQogCiAJbWVtc2V0KCZ3
YWl0LCAwLCBzaXplb2Yod2FpdCkpOwogCXdhaXQucmVxdWVzdC50eXBlID0ga21zdGVzdF9nZXRf
dmJsX2ZsYWcoY3J0Y19pZHgpOwotCXdhaXQucmVxdWVzdC50eXBlIHw9IERSTV9WQkxBTktfQUJT
T0xVVEUgfCBEUk1fVkJMQU5LX05FWFRPTk1JU1M7CisJd2FpdC5yZXF1ZXN0LnR5cGUgfD0gRFJN
X1ZCTEFOS19SRUxBVElWRSB8IERSTV9WQkxBTktfTkVYVE9OTUlTUzsKIAlkb19vcl9kaWUoZHJt
V2FpdFZCbGFuayhkcm1fZmQsICZ3YWl0KSk7CiAKIAlsYXN0X3NlcSA9IHdhaXQucmVwbHkuc2Vx
dWVuY2U7Ci0tIAoyLjE5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dg==
