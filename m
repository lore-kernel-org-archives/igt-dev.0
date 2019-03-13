Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680084.outbound.protection.outlook.com [40.107.68.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B966E0F8
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2019 20:12:28 +0000 (UTC)
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Date: Wed, 13 Mar 2019 16:12:19 -0400
Message-ID: <20190313201219.7804-1-nicholas.kazlauskas@amd.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane: Set output to PIPE_NONE at
 end of test_format_plane
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

QU1ER1BVIHJlamVjdHMgY29tbWl0cyB0aGF0IGhhdmUgYW4gYWN0aXZlIENSVEMgd2l0aG91dCBh
biBhY3RpdmUKcHJpbWFyeSBwbGFuZS4KClRoZSBwaXhlbC1mb3JtYXQtcGlwZS0qIHRlc3RzIGZh
aWwgb24gQU1ER1BVIGR1cmluZyB0aGUgY2xlYW51cCBhdAp0aGUgZW5kIG9mIHRoZSB0ZXN0IGR1
ZSB0byB0aGUgZmluYWwgY29tbWl0IGRpc2FibGluZyBhbGwgdGhlIHBsYW5lcyBidXQKbm90IHRo
ZSBDUlRDLgoKRGlzYWJsZSB0aGUgQ1JUQyB3aGVuIGNsZWFuaW5nIHVwIGJ5IHNldHRpbmcgdGhl
IG91dHB1dCB0byBQSVBFX05PTkUuCgpTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVza2Fz
IDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+Ci0tLQogdGVzdHMva21zX3BsYW5lLmMgfCAx
ICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2tt
c19wbGFuZS5jIGIvdGVzdHMva21zX3BsYW5lLmMKaW5kZXggOWMzMzBhZTQuLjk2OWE2MWM4IDEw
MDY0NAotLS0gYS90ZXN0cy9rbXNfcGxhbmUuYworKysgYi90ZXN0cy9rbXNfcGxhbmUuYwpAQCAt
NTg2LDYgKzU4Niw3IEBAIHN0YXRpYyBib29sIHRlc3RfZm9ybWF0X3BsYW5lKGRhdGFfdCAqZGF0
YSwgZW51bSBwaXBlIHBpcGUsCiAKIAlpZ3RfcGxhbmVfc2V0X2ZiKHByaW1hcnksIE5VTEwpOwog
CWlndF9wbGFuZV9zZXRfZmIocGxhbmUsIE5VTEwpOworCWlndF9vdXRwdXRfc2V0X3BpcGUob3V0
cHV0LCBQSVBFX05PTkUpOwogCWlndF9kaXNwbGF5X2NvbW1pdDIoJmRhdGEtPmRpc3BsYXksIGRh
dGEtPmRpc3BsYXkuaXNfYXRvbWljID8gQ09NTUlUX0FUT01JQyA6IENPTU1JVF9MRUdBQ1kpOwog
CiAJaWd0X3JlbW92ZV9mYihkYXRhLT5kcm1fZmQsICZmYik7Ci0tIAoyLjE3LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
