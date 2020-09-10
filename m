Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CF96E221
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2020 21:06:33 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Thu, 10 Sep 2020 14:09:22 -0700
Message-Id: <20200910210922.99247-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib: Fix parse of supported suspend states
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

SWYgL3N5cy9wb3dlci9zdGF0ZSBzb21lIGRheSBoYXMgYSBuZXcgc3RhdGUgdGhhdCBpcyBub3Qg
aW4Kc3VzcGVuZF9zdGF0ZV9uYW1lIGl0IHdvdWxkIGNhdXNlICIxIDw8IFNVU1BFTkRfU1RBVEVf
TlVNIiBiaXQgdG8gYmUKc2V0LgoKQ2M6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlA
aW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNv
dXphQGludGVsLmNvbT4KLS0tCiBsaWIvaWd0X2F1eC5jIHwgNCArLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9h
dXguYyBiL2xpYi9pZ3RfYXV4LmMKaW5kZXggZmJhMzQ5MzM0Li40NzA3NGMzMmIgMTAwNjQ0Ci0t
LSBhL2xpYi9pZ3RfYXV4LmMKKysrIGIvbGliL2lndF9hdXguYwpAQCAtODE2LDkgKzgxNiw3IEBA
IHN0YXRpYyB1aW50MzJfdCBnZXRfc3VwcG9ydGVkX3N1c3BlbmRfc3RhdGVzKGludCBwb3dlcl9k
aXIpCiAJCWZvciAoc3RhdGUgPSBTVVNQRU5EX1NUQVRFX0ZSRUVaRTsgc3RhdGUgPCBTVVNQRU5E
X1NUQVRFX05VTTsKIAkJICAgICBzdGF0ZSsrKQogCQkJaWYgKHN0cmNtcChzdGF0ZV9uYW1lLCBz
dXNwZW5kX3N0YXRlX25hbWVbc3RhdGVdKSA9PSAwKQotCQkJCWJyZWFrOwotCQlpZ3RfYXNzZXJ0
KHN0YXRlIDwgU1VTUEVORF9TVEFURV9OVU0pOwotCQlzdGF0ZV9tYXNrIHw9IDEgPDwgc3RhdGU7
CisJCQkJc3RhdGVfbWFzayB8PSAxIDw8IHN0YXRlOwogCX0KIAogCWZyZWUoc3RhdGVzKTsKLS0g
CjIuMjguMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
