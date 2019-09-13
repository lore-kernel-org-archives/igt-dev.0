Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D56B6EF06
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2019 10:22:37 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Fri, 13 Sep 2019 13:23:40 +0300
Message-Id: <20190913102340.4784-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/igt_eld: fix eld_is_supported failing
 if not supported
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

V2hlbiBnbG9iKDMpIGRvZXNuJ3QgZmluZCBhbnkgcmVzdWx0cywgaXQgcmV0dXJucyBHTE9CX05P
TUFUQ0guIEkndmUgYmVlbgpjb25mdXNlZCBieSBHTE9CX05PQ0hFQ0sncyBkZXNjcmlwdGlvbiBh
bmQgdGhvdWdodCBpdCB3b3VsZCByZXR1cm4gMC4KCkluc3RlYWQgb2YgZmFpbGluZyBvbiB0aGUg
YXNzZXJ0LCByZXR1cm4gdGhhdCBFTERzIGFyZW4ndCBzdXBwb3J0ZWQgaW4gY2FzZQp0aGVyZSdz
IG5vIG1hdGNoLgoKV2hpbGUgYXQgaXQsIGFsc28gaW5jbHVkZSBnbG9iJ3MgcmV0dXJuIHZhbHVl
IGluIHRoZSBhc3NlcnQgbWVzc2FnZS4KClNpZ25lZC1vZmYtYnk6IFNpbW9uIFNlciA8c2ltb24u
c2VyQGludGVsLmNvbT4KRml4ZXM6IDMzNzRjZDBiMDQ4ZiAoImxpYi9pZ3RfZWxkOiBpbnRyb2R1
Y2UgZWxkX2lzX3N1cHBvcnRlZCIpCkNjOiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGlu
dGVsLmNvbT4KLS0tCgpTb3JyeSBhYm91dCB0aGUgZnVzcy4KCiBsaWIvaWd0X2VsZC5jIHwgOSAr
KysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvbGliL2lndF9lbGQuYyBiL2xpYi9pZ3RfZWxkLmMKaW5kZXggNWQxZDhl
MDFjZDMzLi4yM2ViZjYzMDVhZTAgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfZWxkLmMKKysrIGIvbGli
L2lndF9lbGQuYwpAQCAtMjcwLDExICsyNzAsMTQgQEAgYm9vbCBlbGRfaGFzX2lndCh2b2lkKQog
Ym9vbCBlbGRfaXNfc3VwcG9ydGVkKHZvaWQpCiB7CiAJZ2xvYl90IGdsb2JfYnVmID0gezB9Owor
CWludCByZXQ7CiAJYm9vbCBoYXNfZWxkczsKCi0JaWd0X2Fzc2VydF9mKGdsb2IoIi9wcm9jL2Fz
b3VuZC9jYXJkKi8iIEVMRF9QUkVGSVggIioiLAotCQkJICBHTE9CX05PU09SVCwgTlVMTCwgJmds
b2JfYnVmKSA9PSAwLAotCQkgICAgICJnbG9iIGZhaWxlZFxuIik7CisJcmV0ID0gZ2xvYigiL3By
b2MvYXNvdW5kL2NhcmQqLyIgRUxEX1BSRUZJWCAiKiIsCisJCSAgIEdMT0JfTk9TT1JULCBOVUxM
LCAmZ2xvYl9idWYpOworCWlmIChyZXQgPT0gR0xPQl9OT01BVENIKQorCQlyZXR1cm4gZmFsc2U7
CisJaWd0X2Fzc2VydF9mKHJldCA9PSAwLCAiZ2xvYiBmYWlsZWQ6ICVkXG4iLCByZXQpOwogCWhh
c19lbGRzID0gZ2xvYl9idWYuZ2xfcGF0aGMgPiAwOwogCWdsb2JmcmVlKCZnbG9iX2J1Zik7Cgot
LQoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
