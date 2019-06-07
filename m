Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B2E89BBD
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2019 11:08:48 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Fri,  7 Jun 2019 14:08:48 +0300
Message-Id: <20190607110848.7516-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/tests/igt_audio: fix bad-function-cast
 warning
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
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Q2FzdCBhIHZhcmlhYmxlIGluc3RlYWQgb2YgdGhlIHJldHVybiB2YWx1ZSBvZiB0aGUgZnVuY3Rp
b24uCgpTaWduZWQtb2ZmLWJ5OiBTaW1vbiBTZXIgPHNpbW9uLnNlckBpbnRlbC5jb20+Ci0tLQog
bGliL3Rlc3RzL2lndF9hdWRpby5jIHwgNyArKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi90ZXN0cy9pZ3RfYXVk
aW8uYyBiL2xpYi90ZXN0cy9pZ3RfYXVkaW8uYwppbmRleCA0N2U2MWFkZjc0ZmUuLmVlZTRkZDUx
ZjA0YyAxMDA2NDQKLS0tIGEvbGliL3Rlc3RzL2lndF9hdWRpby5jCisrKyBiL2xpYi90ZXN0cy9p
Z3RfYXVkaW8uYwpAQCAtNjUsMTEgKzY1LDE0IEBAIHN0YXRpYyB2b2lkIHRlc3Rfc2lnbmFsX2Rl
dGVjdF9ub2lzZShzdHJ1Y3QgYXVkaW9fc2lnbmFsICpzaWduYWwpCiAJZG91YmxlIGJ1ZltCVUZG
RVJfTEVOXTsKIAlib29sIG9rOwogCXNpemVfdCBpOworCWxvbmcgcjsKCiAJLyogR2VuZXJhdGUg
cmFuZG9tIHNhbXBsZXMgYmV0d2VlbiAtMSBhbmQgMSAqLwogCXNyYW5kKDQyKTsKLQlmb3IgKGkg
PSAwOyBpIDwgQlVGRkVSX0xFTjsgaSsrKQotCQlidWZbaV0gPSAoZG91YmxlKSByYW5kb20oKSAv
IFJBTkRfTUFYICogMiAtIDE7CisJZm9yIChpID0gMDsgaSA8IEJVRkZFUl9MRU47IGkrKykgewor
CQlyID0gcmFuZG9tKCk7CisJCWJ1ZltpXSA9IChkb3VibGUpIHIgLyBSQU5EX01BWCAqIDIgLSAx
OworCX0KCiAJb2sgPSBhdWRpb19zaWduYWxfZGV0ZWN0KHNpZ25hbCwgU0FNUExJTkdfUkFURSwg
MCwgYnVmLCBCVUZGRVJfTEVOKTsKCi0tCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pZ3QtZGV2
