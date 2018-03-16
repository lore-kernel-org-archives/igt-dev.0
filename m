Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB926EB44
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Mar 2018 13:22:54 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Fri, 16 Mar 2018 18:50:27 +0530
Message-Id: <1521206427-28202-1-git-send-email-vidya.srinivas@intel.com>
Subject: [igt-dev] [PATCH i-g-t] [i-g-t] tests/kms_plane_scaling: fb height
 to be multiplier of 4 for YUV 420 planar
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
Cc: sunil.kamath@intel.com, ville.syrjala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Rm9yIEdlbjksIEdMSywgQ05MLCBHTFY6IERpc3BsYXkgV0EgMTEwNjoKRGlzcGxheSBjb3JydXB0
aW9uL2NvbG9yIHNoaWZ0IG9ic2VydmVkIHdoZW4gdXNpbmcgTlYxMiB3aXRoCjI3MCByb3RhdGlv
biBvciA5MCByb3RhdGlvbiArIGhvcml6b250YWwgZmxpcC4KV0E6IE5WMTIgd2l0aCAyNzAgcm90
YXRpb24gb3IgOTAgcm90YXRpb24gKyBob3Jpem9udGFsIGZsaXAgcmVxdWlyZXMKdGhlIHByb2dy
YW1tZWQgcGxhbmUgaGVpZ2h0IHRvIGJlIGEgbXVsdGlwbGUgb2YgNC4KUGF0Y2ggY2hhbmdlcyB0
aGUgTlYxMiBidWZmZXIgdG8gMjB4MjAgdG8gbWFpbnRhaW4gYm90aApmYiA+IG1pbiBmYiBhbmQg
YWxzbyBtdWx0aXBsaWVyIG9mIDQKClNpZ25lZC1vZmYtYnk6IFVtYSBTaGFua2FyIDx1bWEuc2hh
bmthckBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IFZpZHlhIFNyaW5pdmFzIDx2aWR5YS5zcmlu
aXZhc0BpbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L3Rlc3RzL2ttc19wbGFuZV9zY2FsaW5nLmMgYi90ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jCmlu
ZGV4IDM2ZmNmYzAuLmI5NGQ3ODUgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19wbGFuZV9zY2FsaW5n
LmMKKysrIGIvdGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYwpAQCAtMTMyLDcgKzEzMiw3IEBAIHN0
YXRpYyB2b2lkIGNoZWNrX3NjYWxpbmdfcGlwZV9wbGFuZV9yb3QoZGF0YV90ICpkLCBpZ3RfcGxh
bmVfdCAqcGxhbmUsCiAJLyogY3JlYXRlIGJ1ZmZlciBpbiB0aGUgcmFuZ2Ugb2YgIG1pbiBhbmQg
bWF4IHNvdXJjZSBzaWRlIGxpbWl0LiovCiAJd2lkdGggPSBoZWlnaHQgPSA5OwogCWlmIChwaXhl
bF9mb3JtYXQgPT0gRFJNX0ZPUk1BVF9OVjEyKQotCQl3aWR0aCA9IGhlaWdodCA9IDE3OworCQl3
aWR0aCA9IGhlaWdodCA9IDIwOwogCWlndF9jcmVhdGVfY29sb3JfZmIoZGlzcGxheS0+ZHJtX2Zk
LCB3aWR0aCwgaGVpZ2h0LAogCQkgICAgICAgcGl4ZWxfZm9ybWF0LCB0aWxpbmcsIDAuMCwgMS4w
LCAwLjAsICZkLT5mYlswXSk7CiAJaWd0X3BsYW5lX3NldF9mYihwbGFuZSwgJmQtPmZiWzBdKTsK
LS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
