Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00FC6ECA5
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Apr 2021 17:48:55 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri, 16 Apr 2021 20:48:41 +0300
Message-Id: <20210416174841.20132-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20210416174841.20132-1-ville.syrjala@linux.intel.com>
References: <20210416174841.20132-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/4] tests/kms_plane: Ignore the crc frame
 count with --skip-crc-compare
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCldo
aWxlIGRlYnVnZ2luZyBvbmUgbWlnaHQgcnVuIHRoaW5ncyB3aXRoICItLWludGVyYWNpdmUtZGVi
dWc9bW9kZXNldAotLXNraXAtY3JjLWNvbXBhcmUiIHRvIGFjdHVhbGx5IHNlZSB3aGF0IHRoaW5n
cyBsb29rIGxpa2Ugb24gdGhlIHNjcmVlbi4KVG8gZG8gdGhhdCB3aXRob3V0IHRoZSBhc3NlcnRz
IGZhaWxpbmcgd2UgbmVlZCB0byBpZ25vcmUgdGhlIGNyYyBmcmFtZQpjb3VudCB2YWx1ZSBzaW5j
ZSB3ZSBtYXkgYmUgc2l0dGluZyB0aGVyZSBmb3IgYW4gYXJiaXRyYXJ5IGFtb3VudCBvZgp0aW1l
IHN0YXJpbmcgYXQgdGhlIHNjcmVlbi4KClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8
dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX3BsYW5lLmMgfCAz
ICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL3Rlc3RzL2ttc19wbGFuZS5jIGIvdGVzdHMva21zX3BsYW5lLmMKaW5kZXggZjIw
ZjViZWU5MThiLi45ZmUyNTNhOGMzOTMgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19wbGFuZS5jCisr
KyBiL3Rlc3RzL2ttc19wbGFuZS5jCkBAIC01NDksNyArNTQ5LDggQEAgc3RhdGljIHZvaWQgY2Fw
dHVyZV9jcmMoZGF0YV90ICpkYXRhLCB1bnNpZ25lZCBpbnQgdmJsYW5rLCBpZ3RfY3JjX3QgKmNy
YykKIHsKIAlpZ3RfcGlwZV9jcmNfZ2V0X2Zvcl9mcmFtZShkYXRhLT5kcm1fZmQsIGRhdGEtPnBp
cGVfY3JjLCB2YmxhbmssIGNyYyk7CiAKLQlpZ3RfZmFpbF9vbl9mKGNyYy0+aGFzX3ZhbGlkX2Zy
YW1lICYmIGNyYy0+ZnJhbWUgIT0gdmJsYW5rLAorCWlndF9mYWlsX29uX2YoIWlndF9za2lwX2Ny
Y19jb21wYXJlICYmCisJCSAgICAgIGNyYy0+aGFzX3ZhbGlkX2ZyYW1lICYmIGNyYy0+ZnJhbWUg
IT0gdmJsYW5rLAogCQkgICAgICAiR290IENSQyBmb3IgdGhlIHdyb25nIGZyYW1lIChnb3QgJXUs
IGV4cGVjdGVkICV1KS4gQ1JDIGJ1ZmZlciBvdmVyZmxvdz9cbiIsCiAJCSAgICAgIGNyYy0+ZnJh
bWUsIHZibGFuayk7CiB9Ci0tIAoyLjI2LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldgo=
