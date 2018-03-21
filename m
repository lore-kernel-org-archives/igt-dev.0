Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7D06E37B
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Mar 2018 05:08:44 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Wed, 21 Mar 2018 10:36:09 +0530
Message-Id: <1521608769-25758-1-git-send-email-vidya.srinivas@intel.com>
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
ZmNmYzAuLjAyN2I0MmUgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19wbGFuZV9zY2FsaW5nLmMKKysr
IGIvdGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYwpAQCAtMTMwLDkgKzEzMCwxMSBAQCBzdGF0aWMg
dm9pZCBjaGVja19zY2FsaW5nX3BpcGVfcGxhbmVfcm90KGRhdGFfdCAqZCwgaWd0X3BsYW5lX3Qg
KnBsYW5lLAogCW1vZGUgPSBpZ3Rfb3V0cHV0X2dldF9tb2RlKG91dHB1dCk7CiAKIAkvKiBjcmVh
dGUgYnVmZmVyIGluIHRoZSByYW5nZSBvZiAgbWluIGFuZCBtYXggc291cmNlIHNpZGUgbGltaXQu
Ki8KLQl3aWR0aCA9IGhlaWdodCA9IDk7CiAJaWYgKHBpeGVsX2Zvcm1hdCA9PSBEUk1fRk9STUFU
X05WMTIpCi0JCXdpZHRoID0gaGVpZ2h0ID0gMTc7CisJCXdpZHRoID0gaGVpZ2h0ID0gMTk7CisJ
ZWxzZQorCQl3aWR0aCA9IGhlaWdodCA9IDk7CisKIAlpZ3RfY3JlYXRlX2NvbG9yX2ZiKGRpc3Bs
YXktPmRybV9mZCwgd2lkdGgsIGhlaWdodCwKIAkJICAgICAgIHBpeGVsX2Zvcm1hdCwgdGlsaW5n
LCAwLjAsIDEuMCwgMC4wLCAmZC0+ZmJbMF0pOwogCWlndF9wbGFuZV9zZXRfZmIocGxhbmUsICZk
LT5mYlswXSk7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3Qt
ZGV2Cg==
