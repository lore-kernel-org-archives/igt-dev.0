Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209C46E392
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jul 2018 17:05:23 +0000 (UTC)
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Date: Fri, 20 Jul 2018 20:04:56 +0300
Message-Id: <20180720170456.20968-1-gwan-gyeong.mun@intel.com>
Subject: [igt-dev] [PATCH] lib/igt_core: Fix typo
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
Cc: martin.peres@linux.intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Im92ZXJyaWRkZW4iIHdhcyBtaXNzcGVsbGVkIGFzICJvdmVycmlkZW4iLiBGaXggaXQuCgpTaWdu
ZWQtb2ZmLWJ5OiBHd2FuLWd5ZW9uZyBNdW4gPGd3YW4tZ3llb25nLm11bkBpbnRlbC5jb20+Ci0t
LQogbGliL2lndF9jb3JlLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9saWIvaWd0X2NvcmUuYyBiL2xpYi9pZ3RfY29y
ZS5jCmluZGV4IDNkODcxMjNjLi41ZTZmYjdhZCAxMDA2NDQKLS0tIGEvbGliL2lndF9jb3JlLmMK
KysrIGIvbGliL2lndF9jb3JlLmMKQEAgLTIzNSw3ICsyMzUsNyBAQAogICoKICAqIFNvbWUgb2Yg
SUdUJ3MgYmVoYXZpb3IgY2FuIGJlIGNvbmZpZ3VyZWQgdGhyb3VnaCBhIGNvbmZpZ3VyYXRpb24g
ZmlsZS4KICAqIEJ5IGRlZmF1bHQsIHRoaXMgZmlsZSBpcyBleHBlY3RlZCB0byBleGlzdCBpbiB+
Ly5pZ3RyYyAuIFRoZSBkaXJlY3RvcnkgZm9yCi0gKiB0aGlzIGNhbiBiZSBvdmVycmlkZW4gYnkg
c2V0dGluZyB0aGUgZW52aXJvbm1lbnQgdmFyaWFibGUgJUlHVF9DT05GSUdfUEFUSC4KKyAqIHRo
aXMgY2FuIGJlIG92ZXJyaWRkZW4gYnkgc2V0dGluZyB0aGUgZW52aXJvbm1lbnQgdmFyaWFibGUg
JUlHVF9DT05GSUdfUEFUSC4KICAqIEFuIGV4YW1wbGUgY29uZmlndXJhdGlvbiBmb2xsb3dzOgog
ICoKICAqIHxbPCEtLSBsYW5ndWFnZT0icGxhaW4iIC0tPgotLSAKMi4xOC4wCgotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KSW50ZWwgRmlubGFuZCBPeQpSZWdpc3RlcmVkIEFkZHJlc3M6IFBMIDI4MSwgMDAxODEgSGVs
c2lua2kgCkJ1c2luZXNzIElkZW50aXR5IENvZGU6IDAzNTc2MDYgLSA0IApEb21pY2lsZWQgaW4g
SGVsc2lua2kgCgpUaGlzIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIG1heSBjb250YWluIGNv
bmZpZGVudGlhbCBtYXRlcmlhbCBmb3IKdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCByZWNp
cGllbnQocykuIEFueSByZXZpZXcgb3IgZGlzdHJpYnV0aW9uCmJ5IG90aGVycyBpcyBzdHJpY3Rs
eSBwcm9oaWJpdGVkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQKcmVjaXBpZW50LCBwbGVh
c2UgY29udGFjdCB0aGUgc2VuZGVyIGFuZCBkZWxldGUgYWxsIGNvcGllcy4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
