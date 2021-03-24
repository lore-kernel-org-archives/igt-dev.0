Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2354A6ECCA
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Mar 2021 18:17:39 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Wed, 24 Mar 2021 20:17:33 +0200
Message-Id: <20210324181735.1669-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/3] tests/kms_cursor_crc: Remove the
 max_w==max_h requirement
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
ZSB0ZXN0IHdvcmtzIGZpbmUgZXZlbiBpZiB0aGUgbWF4IGN1cnNvciBzaXplIGlzIG5vdCBzcXVh
cmUuCgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXgu
aW50ZWwuY29tPgotLS0KIHRlc3RzL2ttc19jdXJzb3JfY3JjLmMgfCAzIC0tLQogMSBmaWxlIGNo
YW5nZWQsIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2N1cnNvcl9jcmMu
YyBiL3Rlc3RzL2ttc19jdXJzb3JfY3JjLmMKaW5kZXggMTNkNjE1NmM5Yzc3Li43MDY4NDc1ZTA0
YjEgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19jdXJzb3JfY3JjLmMKKysrIGIvdGVzdHMva21zX2N1
cnNvcl9jcmMuYwpAQCAtNzk4LDkgKzc5OCw2IEBAIGlndF9tYWluCiAJCXJldCA9IGRybUdldENh
cChkYXRhLmRybV9mZCwgRFJNX0NBUF9DVVJTT1JfSEVJR0hULCAmY3Vyc29yX2hlaWdodCk7CiAJ
CWlndF9hc3NlcnQocmV0ID09IDAgfHwgZXJybm8gPT0gRUlOVkFMKTsKIAotCQkvKiBXZSBhc3N1
bWUgd2lkdGggYW5kIGhlaWdodCBhcmUgc2FtZSBzbyBtYXggaXMgYXNzaWduZWQgd2lkdGggKi8K
LQkJaWd0X2Fzc2VydF9lcShjdXJzb3Jfd2lkdGgsIGN1cnNvcl9oZWlnaHQpOwotCiAJCWttc3Rl
c3Rfc2V0X3Z0X2dyYXBoaWNzX21vZGUoKTsKIAogCQlpZ3RfcmVxdWlyZV9waXBlX2NyYyhkYXRh
LmRybV9mZCk7Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldgo=
