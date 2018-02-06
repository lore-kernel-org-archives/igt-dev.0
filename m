Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2136E251
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Feb 2018 10:14:21 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Tue,  6 Feb 2018 11:14:06 +0100
Message-Id: <20180206101417.59979-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 01/12] lib/igt_fb: Make igt_remove_fb more
 robust
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
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyB3aWxsIG1ha2UgaXQgZWFzaWVyIGZvciB0ZXN0cyB0byB1bmNvbmRpdGlvbmFsbHkgY2Fs
bAppZ3RfcmVtb3ZlX2ZiLCB3aXRob3V0IGZpcnN0IGNoZWNraW5nIHdoZXRoZXIgdGhlIEZCIGlz
IGFsbG9jYXRlZC4KClNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxh
bmtob3JzdEBsaW51eC5pbnRlbC5jb20+Ci0tLQogbGliL2lndF9mYi5jIHwgNCArKysrCiAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9mYi5jIGIv
bGliL2lndF9mYi5jCmluZGV4IDZmZWNkZDY2OTlhNS4uMzVhOTI4YjkyODFkIDEwMDY0NAotLS0g
YS9saWIvaWd0X2ZiLmMKKysrIGIvbGliL2lndF9mYi5jCkBAIC0xNjIzLDkgKzE2MjMsMTMgQEAg
dm9pZCBpZ3RfcHV0X2NhaXJvX2N0eChpbnQgZmQsIHN0cnVjdCBpZ3RfZmIgKmZiLCBjYWlyb190
ICpjcikKICAqLwogdm9pZCBpZ3RfcmVtb3ZlX2ZiKGludCBmZCwgc3RydWN0IGlndF9mYiAqZmIp
CiB7CisJaWYgKCFmYiB8fCAhZmItPmZiX2lkKQorCQlyZXR1cm47CisKIAljYWlyb19zdXJmYWNl
X2Rlc3Ryb3koZmItPmNhaXJvX3N1cmZhY2UpOwogCWRvX29yX2RpZShkcm1Nb2RlUm1GQihmZCwg
ZmItPmZiX2lkKSk7CiAJZ2VtX2Nsb3NlKGZkLCBmYi0+Z2VtX2hhbmRsZSk7CisJZmItPmZiX2lk
ID0gMDsKIH0KIAogLyoqCi0tIAoyLjE2LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldgo=
