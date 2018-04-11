Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC0C6E51A
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Apr 2018 02:38:00 +0000 (UTC)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Tue, 10 Apr 2018 19:37:28 -0700
Message-Id: <20180411023732.32362-16-dhinakaran.pandiyan@intel.com>
In-Reply-To: <20180411023732.32362-1-dhinakaran.pandiyan@intel.com>
References: <20180411023732.32362-1-dhinakaran.pandiyan@intel.com>
Subject: [igt-dev] [PATCH i-g-t 16/20] tests/psr: Pass data_t pointer to
 dpms_off_on
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

Q29uc2lzdGVudCB3aXRoIG90aGVyIGZ1bmN0aW9uIHNpZ25hdHVyZXMgaW4gdGhlIGZpbGUuCgpT
aWduZWQtb2ZmLWJ5OiBEaGluYWthcmFuIFBhbmRpeWFuIDxkaGluYWthcmFuLnBhbmRpeWFuQGlu
dGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfcHNyX3NpbmtfY3JjLmMgfCA4ICsrKystLS0tCiAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3Rlc3RzL2ttc19wc3Jfc2lua19jcmMuYyBiL3Rlc3RzL2ttc19wc3Jfc2lua19jcmMuYwppbmRl
eCBmMjJlZGI0OC4uM2UwNmUxNGUgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19wc3Jfc2lua19jcmMu
YworKysgYi90ZXN0cy9rbXNfcHNyX3NpbmtfY3JjLmMKQEAgLTQyMywxMSArNDIzLDExIEBAIHN0
YXRpYyB2b2lkIHNldHVwX3Rlc3RfcGxhbmUoZGF0YV90ICpkYXRhLCBpbnQgdGVzdF9wbGFuZSkK
IAlpZ3RfZGlzcGxheV9jb21taXQoJmRhdGEtPmRpc3BsYXkpOwogfQogCi1zdGF0aWMgdm9pZCBk
cG1zX29mZl9vbihkYXRhX3QgZGF0YSkKK3N0YXRpYyB2b2lkIGRwbXNfb2ZmX29uKGRhdGFfdCAq
ZGF0YSkKIHsKLQlrbXN0ZXN0X3NldF9jb25uZWN0b3JfZHBtcyhkYXRhLmRybV9mZCwgZGF0YS5v
dXRwdXQtPmNvbmZpZy5jb25uZWN0b3IsCisJa21zdGVzdF9zZXRfY29ubmVjdG9yX2RwbXMoZGF0
YS0+ZHJtX2ZkLCBkYXRhLT5vdXRwdXQtPmNvbmZpZy5jb25uZWN0b3IsCiAJCQkJICAgRFJNX01P
REVfRFBNU19PRkYpOwotCWttc3Rlc3Rfc2V0X2Nvbm5lY3Rvcl9kcG1zKGRhdGEuZHJtX2ZkLCBk
YXRhLm91dHB1dC0+Y29uZmlnLmNvbm5lY3RvciwKKwlrbXN0ZXN0X3NldF9jb25uZWN0b3JfZHBt
cyhkYXRhLT5kcm1fZmQsIGRhdGEtPm91dHB1dC0+Y29uZmlnLmNvbm5lY3RvciwKIAkJCQkgICBE
Uk1fTU9ERV9EUE1TX09OKTsKIH0KIApAQCAtNTMxLDcgKzUzMSw3IEBAIGludCBtYWluKGludCBh
cmdjLCBjaGFyICphcmd2W10pCiAJCWRhdGEub3AgPSBSRU5ERVI7CiAJCXNldHVwX3Rlc3RfcGxh
bmUoJmRhdGEsIERSTV9QTEFORV9UWVBFX1BSSU1BUlkpOwogCQlpZ3RfYXNzZXJ0KHdhaXRfcHNy
X2VudHJ5KCZkYXRhKSk7Ci0JCWRwbXNfb2ZmX29uKGRhdGEpOworCQlkcG1zX29mZl9vbigmZGF0
YSk7CiAJCXJ1bl90ZXN0KCZkYXRhKTsKIAkJdGVzdF9jbGVhbnVwKCZkYXRhKTsKIAl9Ci0tIAoy
LjE0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
