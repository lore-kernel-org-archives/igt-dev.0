Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 15 Aug 2018 10:25:11 +0100
Message-Id: <20180815092511.3838-1-chris@chris-wilson.co.uk>
Subject: [Intel-gfx] [PATCH i-g-t] igt/pm_rpm: Close local fd before trying
 to unload module
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Rml4ZXM6IGQ4ZTc4OTkwYWEyYiAoImlndC9wbV9ycG06IFRlc3QgcmVhcXVpc2l0aW9uIG9mIHJ1
bnRpbWUtcG0gYWZ0ZXIgbW9kdWxlIHJlbG9hZCIpClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNv
biA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotLS0KIHRlc3RzL3BtX3JwbS5jIHwgMiArKwog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL3BtX3Jw
bS5jIGIvdGVzdHMvcG1fcnBtLmMKaW5kZXggNjU0ODliY2RiLi5hNGY5Zjc4M2UgMTAwNjQ0Ci0t
LSBhL3Rlc3RzL3BtX3JwbS5jCisrKyBiL3Rlc3RzL3BtX3JwbS5jCkBAIC0yMDM0LDYgKzIwMzQs
OCBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogCQl0ZWFyZG93bl9lbnZpcm9u
bWVudCgpOwogCiAJaWd0X3N1YnRlc3QoIm1vZHVsZS1yZWxvYWQiKSB7CisJCXRlYXJkb3duX2Vu
dmlyb25tZW50KCk7CisKIAkJaWd0X2RlYnVnKCJSZWxvYWQgdy9vIGRpc3BsYXlcbiIpOwogCQlp
Z3RfaTkxNV9kcml2ZXJfdW5sb2FkKCk7CiAJCWlndF9hc3NlcnRfZXEoaWd0X2k5MTVfZHJpdmVy
X2xvYWQoImRpc2FibGVfZGlzcGxheT0xIiksIDApOwotLSAKMi4xOC4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0
CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK
