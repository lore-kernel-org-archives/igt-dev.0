Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FA86E915
 for <igt-dev@lists.freedesktop.org>; Wed,  9 May 2018 17:38:09 +0000 (UTC)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Wed,  9 May 2018 10:37:41 -0700
Message-Id: <20180509173746.23405-10-dhinakaran.pandiyan@intel.com>
In-Reply-To: <20180509173746.23405-1-dhinakaran.pandiyan@intel.com>
References: <20180509173746.23405-1-dhinakaran.pandiyan@intel.com>
Subject: [igt-dev] [PATCH i-g-t 09/14] tests/psr: Remove delay between dpms
 toggle.
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, rodrigo.vivi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Tm8gcmVhc29uIGZvciB0aGUgZGVsYXkgYmV0d2VlbiBkcG1zIG9mZiBhbmQgb24uCgpTaWduZWQt
b2ZmLWJ5OiBEaGluYWthcmFuIFBhbmRpeWFuIDxkaGluYWthcmFuLnBhbmRpeWFuQGludGVsLmNv
bT4KUmV2aWV3ZWQtYnk6IEthdGFyenluYSBEZWMgPGthdGFyenluYS5kZWNAaW50ZWwuY29tPgot
LS0KIHRlc3RzL2ttc19wc3Jfc2lua19jcmMuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfcHNyX3NpbmtfY3JjLmMgYi90ZXN0cy9r
bXNfcHNyX3NpbmtfY3JjLmMKaW5kZXggZTA0ZTBmNmEuLmFmMThkNDNlIDEwMDY0NAotLS0gYS90
ZXN0cy9rbXNfcHNyX3NpbmtfY3JjLmMKKysrIGIvdGVzdHMva21zX3Bzcl9zaW5rX2NyYy5jCkBA
IC00MjYsNyArNDI2LDYgQEAgc3RhdGljIHZvaWQgZHBtc19vZmZfb24oZGF0YV90IGRhdGEpCiB7
CiAJa21zdGVzdF9zZXRfY29ubmVjdG9yX2RwbXMoZGF0YS5kcm1fZmQsIGRhdGEub3V0cHV0LT5j
b25maWcuY29ubmVjdG9yLAogCQkJCSAgIERSTV9NT0RFX0RQTVNfT0ZGKTsKLQlzbGVlcCgxKTsK
IAlrbXN0ZXN0X3NldF9jb25uZWN0b3JfZHBtcyhkYXRhLmRybV9mZCwgZGF0YS5vdXRwdXQtPmNv
bmZpZy5jb25uZWN0b3IsCiAJCQkJICAgRFJNX01PREVfRFBNU19PTik7CiB9Ci0tIAoyLjE0LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
