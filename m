Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B2D89581
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2019 22:07:19 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Wed, 10 Apr 2019 15:07:11 -0700
Message-Id: <20190410220716.19449-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 1/6] tests/fbcon_fbt: Use
 psr_wait_entry() to wait PSR be enabled
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

a21zX2ZiY29uX2ZidCB3YXMgZG9pbmcgaXRzIG93biBoYW5kbGluZyB0byB3YWl0IGZvciBQU1Ig
dG8gZ2V0CmVuYWJsZWQgd2hpbGUgaXQgaXMgYWxyZWFkeSBhdmFpbGFibGUgaW4gbGliLgoKdjI6
IHNwbGl0dGVkIHByZXZpb3VzIHBhdGNoIGludG8gdGhpcyBvbmUgYW5kIHRoZSBwcmV2aW91cyBv
bmUoRGhpbmFrYXJhbikKCkNjOiBEaGluYWthcmFuIFBhbmRpeWFuIDxkaGluYWthcmFuLnBhbmRp
eWFuQGludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxh
bmtob3JzdEBsaW51eC5pbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUg
U291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPgotLS0KIHRlc3RzL2ttc19mYmNvbl9mYnQuYyB8
IDExICstLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEwIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19mYmNvbl9mYnQuYyBiL3Rlc3RzL2ttc19m
YmNvbl9mYnQuYwppbmRleCA5ZDBkNWEzNi4uYTcxN2UwMDAgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2tt
c19mYmNvbl9mYnQuYworKysgYi90ZXN0cy9rbXNfZmJjb25fZmJ0LmMKQEAgLTE4MiwxOCArMTgy
LDkgQEAgc3RhdGljIHZvaWQgcHNyX3ByaW50X3N0YXR1cyhpbnQgZGVidWdmc19mZCkKIAlpZ3Rf
ZGVidWcoIlBTUiBzdGF0dXM6ICVzXG4iLCBidWYpOwogfQogCi1zdGF0aWMgYm9vbCBwc3JfaXNf
ZW5hYmxlZChpbnQgZGVidWdmc19mZCkKLXsKLQljaGFyIGJ1ZltQU1JfU1RBVFVTX01BWF9MRU5d
OwotCi0JaWd0X2RlYnVnZnNfc2ltcGxlX3JlYWQoZGVidWdmc19mZCwgImk5MTVfZWRwX3Bzcl9z
dGF0dXMiLCBidWYsCi0JCQkJc2l6ZW9mKGJ1ZikpOwotCXJldHVybiBzdHJzdHIoYnVmLCAiXG5I
VyBFbmFibGVkICYgQWN0aXZlIGJpdDogeWVzXG4iKTsKLX0KLQogc3RhdGljIGJvb2wgcHNyX3dh
aXRfdW50aWxfZW5hYmxlZChpbnQgZGVidWdmc19mZCkKIHsKLQlib29sIHIgPSBpZ3Rfd2FpdChw
c3JfaXNfZW5hYmxlZChkZWJ1Z2ZzX2ZkKSwgNTAwMCwgMSk7CisJYm9vbCByID0gcHNyX3dhaXRf
ZW50cnkoZGVidWdmc19mZCwgUFNSX01PREVfMSk7CiAKIAlwc3JfcHJpbnRfc3RhdHVzKGRlYnVn
ZnNfZmQpOwogCXJldHVybiByOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXY=
