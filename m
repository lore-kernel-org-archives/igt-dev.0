Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5957F6E9AF
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jul 2021 14:45:11 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri, 16 Jul 2021 17:44:33 +0300
Message-Id: <20210716144442.31962-8-ville.syrjala@linux.intel.com>
In-Reply-To: <20210716144442.31962-1-ville.syrjala@linux.intel.com>
References: <20210716144442.31962-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 07/16] tests/kms_plane_scaling: Use
 igt_plane_has_rotation()
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClJl
cGxhY2UgdGhlIGhhbmQgcm9sbGVkIGdlbiBjaGVjayB3aXRoIGlndF9wbGFuZV9oYXNfcm90YXRp
b24oKS4KClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51
eC5pbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYyB8IDUgKy0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS90ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jIGIvdGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYwpp
bmRleCA4MDk0NjNhNzE1ODMuLjRjNTE3YTQzMjZkNyAxMDA2NDQKLS0tIGEvdGVzdHMva21zX3Bs
YW5lX3NjYWxpbmcuYworKysgYi90ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jCkBAIC0xNjUsMTAg
KzE2NSw2IEBAIHN0YXRpYyBib29sIGNhbl9yb3RhdGUoZGF0YV90ICpkLCB1bnNpZ25lZCBmb3Jt
YXQsIHVpbnQ2NF90IHRpbGluZywKIAlpZiAoIWlzX2k5MTVfZGV2aWNlKGQtPmRybV9mZCkpCiAJ
CXJldHVybiB0cnVlOwogCi0JaWYgKGludGVsX2Rpc3BsYXlfdmVyKGQtPmRldmlkKSA+PSAxMyAm
JgotCQlpZ3Rfcm90YXRpb25fOTBfb3JfMjcwKHJvdCkpCi0JCXJldHVybiBmYWxzZTsKLQogCXN3
aXRjaCAoZm9ybWF0KSB7CiAJY2FzZSBEUk1fRk9STUFUX1JHQjU2NToKIAkJaWYgKGludGVsX2Rp
c3BsYXlfdmVyKGQtPmRldmlkKSA+PSAxMSkKQEAgLTI3Miw2ICsyNjgsNyBAQCBzdGF0aWMgdm9p
ZCB0ZXN0X3NjYWxlcl93aXRoX3JvdGF0aW9uX3BpcGUoZGF0YV90ICpkLCBlbnVtIHBpcGUgcGlw
ZSwKIAogCQkJCWlmICh0ZXN0X2Zvcm1hdChkLCAmdGVzdGVkX2Zvcm1hdHMsIGZvcm1hdCkgJiYK
IAkJCQkgICAgaWd0X3BsYW5lX2hhc19mb3JtYXRfbW9kKHBsYW5lLCBmb3JtYXQsIHRpbGluZykg
JiYKKwkJCQkgICAgaWd0X3BsYW5lX2hhc19yb3RhdGlvbihwbGFuZSwgcm90KSAmJgogCQkJCSAg
ICBjYW5fcm90YXRlKGQsIGZvcm1hdCwgdGlsaW5nLCByb3QpICYmCiAJCQkJICAgIGNhbl9zY2Fs
ZShkLCBmb3JtYXQpKQogCQkJCQljaGVja19zY2FsaW5nX3BpcGVfcGxhbmVfcm90KGQsIHBsYW5l
LCBmb3JtYXQsCi0tIAoyLjMxLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldgo=
