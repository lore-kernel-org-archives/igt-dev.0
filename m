Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66C76E3AC
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Mar 2018 05:00:30 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Wed, 21 Mar 2018 10:27:54 +0530
Message-Id: <1521608274-15501-1-git-send-email-vidya.srinivas@intel.com>
Subject: [igt-dev] [PATCH i-g-t] [i-g-t] tests/kms_plane_scaling: modify fb
 height for yuv planar
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
Cc: sunil.kamath@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

ZmIgc3JjIGhlaWdodCB0byBiZSBtb3JlIHRoYW4gbWluaW11bSBzY2FubGluZXMgZm9yIHBsYW5h
cgpmb3JtYXRzIGxpa2UgTlYxMi4gQ2hhbmdpbmcgdGhlIGZiIGhlaWdodCB0byAxOQpzbyB0aGF0
IHRoZSBoZWlnaHQgaXMgbW9yZSB0aGFuIG1pbiB2YWx1ZSBhZnRlciBLTUQgYWRqdXN0bWVudHMK
CkNyZWRpdHMtdG86IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5p
bnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IFVtYSBTaGFua2FyIDx1bWEuc2hhbmthckBpbnRlbC5j
b20+ClNpZ25lZC1vZmYtYnk6IFZpZHlhIFNyaW5pdmFzIDx2aWR5YS5zcmluaXZhc0BpbnRlbC5j
b20+Ci0tLQogdGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYyB8IDYgKysrKy0tCiAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3Rz
L2ttc19wbGFuZV9zY2FsaW5nLmMgYi90ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jCmluZGV4IDM2
ZmNmYzAuLmRiMzU3ZmEgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19wbGFuZV9zY2FsaW5nLmMKKysr
IGIvdGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYwpAQCAtMTMxLDggKzEzMSwxMCBAQCBzdGF0aWMg
dm9pZCBjaGVja19zY2FsaW5nX3BpcGVfcGxhbmVfcm90KGRhdGFfdCAqZCwgaWd0X3BsYW5lX3Qg
KnBsYW5lLAogCiAJLyogY3JlYXRlIGJ1ZmZlciBpbiB0aGUgcmFuZ2Ugb2YgIG1pbiBhbmQgbWF4
IHNvdXJjZSBzaWRlIGxpbWl0LiovCiAJd2lkdGggPSBoZWlnaHQgPSA5OwotCWlmIChwaXhlbF9m
b3JtYXQgPT0gRFJNX0ZPUk1BVF9OVjEyKQotCQl3aWR0aCA9IGhlaWdodCA9IDE3OworCWlmIChw
aXhlbF9mb3JtYXQgPT0gRFJNX0ZPUk1BVF9OVjEyKSB7CisJCXdpZHRoID0gMTk7CisJCWhlaWdo
dCA9IDE5OworCX0KIAlpZ3RfY3JlYXRlX2NvbG9yX2ZiKGRpc3BsYXktPmRybV9mZCwgd2lkdGgs
IGhlaWdodCwKIAkJICAgICAgIHBpeGVsX2Zvcm1hdCwgdGlsaW5nLCAwLjAsIDEuMCwgMC4wLCAm
ZC0+ZmJbMF0pOwogCWlndF9wbGFuZV9zZXRfZmIocGxhbmUsICZkLT5mYlswXSk7Ci0tIAoyLjcu
NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
