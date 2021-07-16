Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351916E9A5
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jul 2021 14:45:38 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri, 16 Jul 2021 17:44:40 +0300
Message-Id: <20210716144442.31962-15-ville.syrjala@linux.intel.com>
In-Reply-To: <20210716144442.31962-1-ville.syrjala@linux.intel.com>
References: <20210716144442.31962-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 14/16] tests/kms_big_fb: Check whether the
 rotation is supposed in the async flip test
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
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkRv
bid0IGNvcnJ1cHQgdGhlIHBsYW5lIHN0YXRlIHdpdGggc29tZSB0b3RhbGx5IHVuc3VwcG9ydGVk
CnJvdGF0aW9uLiBEb2luZyBzbyBjYXVzZXMgc3Vic2V1cWVuY3Qgc3VidGVzdHMgdG8ganVzdCBm
YWlsCm9uIGFjY291bnQgb2YgdGhhdCBiYWQgcm90YXRpb24gc3RhdGUgbGVha2luZyBiZXR3ZWVu
IHRoZQpzdWJ0ZXN0cy4KClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX2JpZ19mYi5jIHwgMSArCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfYmlnX2Zi
LmMgYi90ZXN0cy9rbXNfYmlnX2ZiLmMKaW5kZXggNGMxMjBjNjAyZWQ5Li5jOGUxNjljZjgzNzcg
MTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19iaWdfZmIuYworKysgYi90ZXN0cy9rbXNfYmlnX2ZiLmMK
QEAgLTQ4OSw2ICs0ODksNyBAQCBtYXhfaHdfc3RyaWRlX2FzeW5jX2ZsaXBfdGVzdChkYXRhX3Qg
KmRhdGEpCiAKIAlwcmltYXJ5ID0gaWd0X291dHB1dF9nZXRfcGxhbmVfdHlwZShkYXRhLT5vdXRw
dXQsIERSTV9QTEFORV9UWVBFX1BSSU1BUlkpOwogCisJaWd0X3JlcXVpcmUoaWd0X3BsYW5lX2hh
c19yb3RhdGlvbihwcmltYXJ5LCBkYXRhLT5yb3RhdGlvbikpOwogCWlndF9wbGFuZV9zZXRfcm90
YXRpb24ocHJpbWFyeSwgZGF0YS0+cm90YXRpb24pOwogCiAJaWd0X3JlcXVpcmVfZihpZ3RfZGlz
cGxheV90cnlfY29tbWl0MigmZGF0YS0+ZGlzcGxheSwgQ09NTUlUX0FUT01JQykgPT0gMCwKLS0g
CjIuMzEuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
