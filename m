Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E379C6E426
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Dec 2020 16:27:29 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu, 17 Dec 2020 18:26:57 +0200
Message-Id: <20201217162703.20779-9-ville.syrjala@linux.intel.com>
In-Reply-To: <20201217162703.20779-1-ville.syrjala@linux.intel.com>
References: <20201217162703.20779-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 08/14] lib: Add timestmap registers
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkFk
ZCBkZWZpbml0aW9ucyBmb3IgdGhlIHRpbWVzdGFtcCByZWdpc3RlcnMuCgpTaWduZWQtb2ZmLWJ5
OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGxp
Yi9pbnRlbF9yZWcuaCB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvbGliL2ludGVsX3JlZy5oIGIvbGliL2ludGVsX3JlZy5oCmluZGV4IGQ1MDE3
ZjNkOWViMi4uZDQwNDVjMzYyMGMyIDEwMDY0NAotLS0gYS9saWIvaW50ZWxfcmVnLmgKKysrIGIv
bGliL2ludGVsX3JlZy5oCkBAIC0yMjk0LDYgKzIyOTQsNyBAQCBTT0ZUV0FSRSBPUiBUSEUgVVNF
IE9SIE9USEVSIERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4KICAqLwogI2RlZmluZSBQSVBFQUZS
TUNPVU5UX0c0WAkweDcwMDQwCiAjZGVmaW5lIFBJUEVBRkxJUENPVU5UX0c0WAkweDcwMDQ0Cisj
ZGVmaW5lIFBJUEVBRlJNVE1TTVRQCQkweDcwMDQ4CiAvKgogICogQ29tcHV0aW5nIEdNQ0ggTSBh
bmQgTiB2YWx1ZXMuCiAgKgpAQCAtMjgwMSw2ICsyODAyLDggQEAgdHlwZWRlZiBlbnVtIHsKICNk
ZWZpbmUgTUNIQkFSX1JFTkRFUl9TVEFOREJZCTB4MTExQjgKICNkZWZpbmUgUkVOREVSX1NUQU5E
QllfRU5BQkxFCSgxIDw8IDMwKQogCisjZGVmaW5lIElMS19USU1FU1RBTVBfSEkgICAgICAgIDB4
NzAwNzAKKyNkZWZpbmUgSVZCX1RJTUVTVEFNUF9DVFIgICAgICAgMHg0NDA3MAogCiAvKiBJcm9u
bGFrZSAqLwogCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldgo=
