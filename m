Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646A66E117
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Aug 2018 13:53:19 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Thu,  2 Aug 2018 15:53:14 +0200
Message-Id: <20180802135314.11737-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t] kms_pipe_crc_basic: Skip when hitting -EIO
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

LUVJTyBpcyByZXR1cm5lZCB3aGVuIHRoZSBjcnRjIGlzIG5vdCBhY3RpdmUsIGluIHdoaWNoIGNh
c2Ugd2Ugc2tpcCB0aGUgdGVzdApiZWNhdXNlIHRoZSBwYXJzaW5nIG9mIHRoZSBwYXJhbWV0ZXIg
aW4gY3J0Yy0wL2NyYy9jb250cm9sIGlzIG5vdCBkb25lLgoKU2lnbmVkLW9mZi1ieTogTWFhcnRl
biBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KUmVwb3J0ZWQt
Ynk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotLS0KIHRlc3RzL2tt
c19waXBlX2NyY19iYXNpYy5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3BpcGVfY3JjX2Jhc2lj
LmMgYi90ZXN0cy9rbXNfcGlwZV9jcmNfYmFzaWMuYwppbmRleCA5MjBlYjZlMDZkMzcuLjg1MmYx
Njk3Mjc0YyAxMDA2NDQKLS0tIGEvdGVzdHMva21zX3BpcGVfY3JjX2Jhc2ljLmMKKysrIGIvdGVz
dHMva21zX3BpcGVfY3JjX2Jhc2ljLmMKQEAgLTQ5LDggKzQ5LDEwIEBAIHN0YXRpYyBzdHJ1Y3Qg
ewogc3RhdGljIHZvaWQgdGVzdF9iYWRfc291cmNlKGRhdGFfdCAqZGF0YSkKIHsKIAllcnJubyA9
IDA7Ci0JaWYgKGlndF9zeXNmc19zZXQoZGF0YS0+ZGVidWdmcywgImNydGMtMC9jcmMvY29udHJv
bCIsICJmb28iKSkKKwlpZiAoaWd0X3N5c2ZzX3NldChkYXRhLT5kZWJ1Z2ZzLCAiY3J0Yy0wL2Ny
Yy9jb250cm9sIiwgImZvbyIpKSB7CiAJCWlndF9hc3NlcnQob3BlbmF0KGRhdGEtPmRlYnVnZnMs
ICJjcnRjLTAvY3JjL2RhdGEiLCBPX1dST05MWSkgPT0gLTEpOworCQlpZ3Rfc2tpcF9vbihlcnJu
byA9PSBFSU8pOworCX0KIAogCWlndF9hc3NlcnRfZXEoZXJybm8sIEVJTlZBTCk7CiB9Ci0tIAoy
LjE4LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
