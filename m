Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6746EC7E
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jan 2019 10:45:26 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 15 Jan 2019 12:45:21 +0200
Message-Id: <20190115104521.9793-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH CI] tests/tools_test: Print everything when
 searching for tools
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

LS0tCiB0ZXN0cy90b29sc190ZXN0LmMgfCAxMiArKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvdG9v
bHNfdGVzdC5jIGIvdGVzdHMvdG9vbHNfdGVzdC5jCmluZGV4IDg4YTZhZTk2Li5jM2Y1NzQ0OSAx
MDA2NDQKLS0tIGEvdGVzdHMvdG9vbHNfdGVzdC5jCisrKyBiL3Rlc3RzL3Rvb2xzX3Rlc3QuYwpA
QCAtNjUsMTIgKzY1LDE4IEBAIHN0YXRpYyBib29sIGNoZGlyX3RvX3Rvb2xzX2Rpcih2b2lkKQog
CWNoYXIgcGF0aFtQQVRIX01BWF07CiAKIAkvKiBUcnkgVE9PTFMgcmVsYXRpdmUgdG8gY3dkICov
Ci0JaWYgKGNoZGlyKFRPT0xTKSA9PSAwKQorCWlmIChjaGRpcihUT09MUykgPT0gMCkgeworCQlp
Z3RfaW5mbygiRGlyZWN0b3J5IGZvdW5kIGF0IG9yaWdpbmFsIGN3ZCArIFRPT0xTXG4iKTsKIAkJ
cmV0dXJuIHRydWU7CisJfQogCiAJLyogVHJ5IFRPT0xTIGFuZCBpbnN0YWxsIGRpciByZWxhdGl2
ZSB0byB0ZXN0IGJpbmFyeSAqLwotCWlmIChyZWFkbGluaygiL3Byb2Mvc2VsZi9leGUiLCBwYXRo
LCBzaXplb2YocGF0aCkpID4gMCkKLQkJY2hkaXIoZGlybmFtZShwYXRoKSk7CisJaWYgKHJlYWRs
aW5rKCIvcHJvYy9zZWxmL2V4ZSIsIHBhdGgsIHNpemVvZihwYXRoKSkgPiAwKSB7CisJCWlndF9p
bmZvKCJSZWFkbGluayAvcHJvYy9zZWxmL2V4ZSA9ICVzXG4iLCBwYXRoKTsKKwkJaWYgKGNoZGly
KGRpcm5hbWUocGF0aCkpID09IDApCisJCQlpZ3RfaW5mbygiY2hkaXIgdG8gZXhlY3V0YWJsZSBk
aXIgc3VjY2VlZGVkXG4iKTsKKwl9IGVsc2UKKwkJaWd0X2luZm8oIlJlYWRsaW5rIC9wcm9jL3Nl
bGYvZXhlIGZhaWxlZFxuIik7CiAKIAlyZXR1cm4gY2hkaXIoVE9PTFMpID09IDAgfHwgY2hkaXIo
Ii4uLy4uL2JpbiIpID09IDA7CiB9Ci0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldgo=
