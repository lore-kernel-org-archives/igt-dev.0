Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7C46E3F9
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2019 16:50:29 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri,  8 Mar 2019 18:50:25 +0200
Message-Id: <20190308165025.27327-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20190307213926.18051-3-ville.syrjala@linux.intel.com>
References: <20190307213926.18051-3-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 3/5] tests/kms_flip: Request the initial
 vbl count with RELATIVE instead of ABSOLUTE
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
LmludGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfZmxpcC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2Zs
aXAuYyBiL3Rlc3RzL2ttc19mbGlwLmMKaW5kZXggNzk4ZmM0ZTgyMmFmLi5iOTcyOWRmZDk0NzQg
MTAwNzU1Ci0tLSBhL3Rlc3RzL2ttc19mbGlwLmMKKysrIGIvdGVzdHMva21zX2ZsaXAuYwpAQCAt
MTEwNSw3ICsxMTA1LDcgQEAgc3RhdGljIHZvaWQgY2FsaWJyYXRlX3RzKHN0cnVjdCB0ZXN0X291
dHB1dCAqbywgaW50IGNydGNfaWR4KQogCiAJbWVtc2V0KCZ3YWl0LCAwLCBzaXplb2Yod2FpdCkp
OwogCXdhaXQucmVxdWVzdC50eXBlID0ga21zdGVzdF9nZXRfdmJsX2ZsYWcoY3J0Y19pZHgpOwot
CXdhaXQucmVxdWVzdC50eXBlIHw9IERSTV9WQkxBTktfQUJTT0xVVEUgfCBEUk1fVkJMQU5LX05F
WFRPTk1JU1M7CisJd2FpdC5yZXF1ZXN0LnR5cGUgfD0gRFJNX1ZCTEFOS19SRUxBVElWRSB8IERS
TV9WQkxBTktfTkVYVE9OTUlTUzsKIAlkb19vcl9kaWUoZHJtV2FpdFZCbGFuayhkcm1fZmQsICZ3
YWl0KSk7CiAKIAlsYXN0X3NlcSA9IHdhaXQucmVwbHkuc2VxdWVuY2U7Ci0tIAoyLjE5LjIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
