Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260B989A5C
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2019 13:32:44 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Mon, 11 Mar 2019 15:32:22 +0200
Message-Id: <20190311133222.10030-2-arkadiusz.hiler@intel.com>
In-Reply-To: <20190311133222.10030-1-arkadiusz.hiler@intel.com>
References: <20190311133222.10030-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] Revert "tests: kms_plane: Disable
 XBGR8888"
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
Cc: Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyByZXZlcnRzIGNvbW1pdCAwNjdhNjg5NjliMmQ0MWUxMDFhYzc3OGIwNmYyNzQzZmE2OWIy
N2FiLgoKV2l0aCB0aGUga21zX3BsYW5lIHBpeGVsIGZvcm1hdCB0ZXN0cyBub3cgZXhoYXVzdGl2
ZWx5IHRlc3RpbmcgYWxsIHRoZQpmb3JtYXRzIGV2ZW4gd2l0aCBlYXJseSBDUkMgbWlzbWF0Y2hl
cywgaXQncyBiZXR0ZXIgdG8gbm90IGhpZGUgc3VjaAppc3N1ZXMgaW4gSUdULiBUaGVyZSBhcmUg
b3RoZXIgc3lzdGVtcyBpbiBwbGFjZSB0byBkbyBzdWNoIHRoaW5ncy4KCkNjOiBNYXhpbWUgUmlw
YXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPgpSZXZpZXdlZC1ieTogTWFydGluIFBlcmVzIDxtYXJ0aW4ucGVyZXNAbGludXgu
aW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxl
ckBpbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX3BsYW5lLmMgfCAxMCAtLS0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3BsYW5l
LmMgYi90ZXN0cy9rbXNfcGxhbmUuYwppbmRleCA0Y2QwYjU2NS4uYmI5MmYwNzggMTAwNjQ0Ci0t
LSBhL3Rlc3RzL2ttc19wbGFuZS5jCisrKyBiL3Rlc3RzL2ttc19wbGFuZS5jCkBAIC01MzQsMTYg
KzUzNCw2IEBAIHN0YXRpYyBib29sIHRlc3RfZm9ybWF0X3BsYW5lKGRhdGFfdCAqZGF0YSwgZW51
bSBwaXBlIHBpcGUsCiAJCWlmICghaWd0X2ZiX3N1cHBvcnRlZF9mb3JtYXQoZm9ybWF0KSkKIAkJ
CWNvbnRpbnVlOwogCi0JCS8qCi0JCSAqIFRoZXJlIHNlZW1zIHRvIGJlIHNvbWUgaXNzdWUgdGhl
cmUgd2l0aCB0aGUgQ1JDIG5vdAotCQkgKiBtYXRjaGluZy4gQm90aCBDUkNzIGFyZSBzdGFibGUs
IGJ1dCBkb24ndCBtYXRjaCwKLQkJICogd2hpY2ggc2VlbXMgdG8gaW5kaWNhdGUgc29tZSBpc3N1
ZSB3aXRoIHRoZSBDUkMKLQkJICogY29tcHV0YXRpb24gbG9naWMsIGJ1dCBJIGhhdmVuJ3QgYmVl
biBhYmxlIHRvIGZpbmQKLQkJICogd2hhdC4KLQkJICovCi0JCWlmIChmb3JtYXQgPT0gRFJNX0ZP
Uk1BVF9YQkdSODg4OCkKLQkJCWNvbnRpbnVlOwotCiAJCWlndF9pbmZvKCJUZXN0aW5nIGZvcm1h
dCAiIElHVF9GT1JNQVRfRk1UICIgb24gJXMuJXVcbiIsCiAJCQkgSUdUX0ZPUk1BVF9BUkdTKGZv
cm1hdCksCiAJCQkga21zdGVzdF9waXBlX25hbWUocGlwZSksIHBsYW5lLT5pbmRleCk7Ci0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
