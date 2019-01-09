Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F2C6F172
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jan 2019 12:54:30 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Wed,  9 Jan 2019 14:55:13 +0200
Message-Id: <20190109125513.17460-3-mika.kahola@intel.com>
In-Reply-To: <20190109125513.17460-1-mika.kahola@intel.com>
References: <20190109125513.17460-1-mika.kahola@intel.com>
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_cursor_crc: Remove
 unnecessary waits for vblank
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

V2UgZG9uJ3QgbmVlZCB0byB3YWl0IGZvciB2YmxhbmtzIGFueW1vcmUgYXMga2VybmVsIGF0b21p
Y2FsbHkgdGFrZXMKY2FyZSBvZiB0aGVzZS4KCkJ1Z3ppbGxhOiBodHRwczovL2J1Z3MuZnJlZWRl
c2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDMyMzIKClNpZ25lZC1vZmYtYnk6IE1pa2EgS2Fo
b2xhIDxtaWthLmthaG9sYUBpbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX2N1cnNvcl9jcmMuYyB8
IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3Rz
L2ttc19jdXJzb3JfY3JjLmMgYi90ZXN0cy9rbXNfY3Vyc29yX2NyYy5jCmluZGV4IDliMzE0MTRm
Li5hYjI5ZmM3NyAxMDA2NDQKLS0tIGEvdGVzdHMva21zX2N1cnNvcl9jcmMuYworKysgYi90ZXN0
cy9rbXNfY3Vyc29yX2NyYy5jCkBAIC0xNzEsNyArMTcxLDYgQEAgc3RhdGljIHZvaWQgZG9fc2lu
Z2xlX3Rlc3QoZGF0YV90ICpkYXRhLCBpbnQgeCwgaW50IHkpCiAKIAlpZ3RfZGlzcGxheV9jb21t
aXQoZGlzcGxheSk7CiAKLQlpZ3Rfd2FpdF9mb3JfdmJsYW5rKGRhdGEtPmRybV9mZCwgZGF0YS0+
cGlwZSk7CiAJaWd0X3BpcGVfY3JjX3N0YXJ0KHBpcGVfY3JjKTsKIAlpZ3RfcGlwZV9jcmNfZ2V0
X3NpbmdsZShwaXBlX2NyYywgJmNyYyk7CiAKQEAgLTIwNSw3ICsyMDQsNiBAQCBzdGF0aWMgdm9p
ZCBkb19zaW5nbGVfdGVzdChkYXRhX3QgKmRhdGEsIGludCB4LCBpbnQgeSkKIAlpZ3RfcHV0X2Nh
aXJvX2N0eChkYXRhLT5kcm1fZmQsICZkYXRhLT5wcmltYXJ5X2ZiLCBjcik7CiAJaWd0X2Rpc3Bs
YXlfY29tbWl0KGRpc3BsYXkpOwogCi0JaWd0X3dhaXRfZm9yX3ZibGFuayhkYXRhLT5kcm1fZmQs
IGRhdGEtPnBpcGUpOwogCWlndF9waXBlX2NyY19nZXRfY3VycmVudChkYXRhLT5kcm1fZmQsIHBp
cGVfY3JjLCAmcmVmX2NyYyk7CiAJaWd0X2Fzc2VydF9jcmNfZXF1YWwoJmNyYywgJnJlZl9jcmMp
OwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
