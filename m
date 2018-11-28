Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08D789DBC
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Nov 2018 13:03:36 +0000 (UTC)
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Date: Wed, 28 Nov 2018 15:03:34 +0200
Message-Id: <20181128130334.6024-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] [PATCH i-g-t] Allow a full modeset in kms_properties
 atomic case
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
Cc: stanislav.lisovskiy@intel.com, ville.syrjala@intel.com, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

T3RoZXJ3aXNlIHdlIGFyZSBnZXR0aW5nIEVJTlZBTCBhcyBkcm0gcmVxdWlyZXMgaXQKYXQgc29t
ZSBwb2ludC4KQnVnemlsbGE6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcu
Y2dpP2lkPTEwODY0MgpTaWduZWQtb2ZmLWJ5OiBTdGFuaXNsYXYgTGlzb3Zza2l5IDxzdGFuaXNs
YXYubGlzb3Zza2l5QGludGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfcHJvcGVydGllcy5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvdGVzdHMva21zX3Byb3BlcnRpZXMuYyBiL3Rlc3RzL2ttc19wcm9wZXJ0aWVzLmMKaW5k
ZXggODJkMjhlOWIuLmViOWNiZGRhIDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfcHJvcGVydGllcy5j
CisrKyBiL3Rlc3RzL2ttc19wcm9wZXJ0aWVzLmMKQEAgLTEwMCw3ICsxMDAsNyBAQCBzdGF0aWMg
dm9pZCBtYXhfYnBjX3Byb3BfdGVzdChpbnQgZmQsIHVpbnQzMl90IGlkLCB1aW50MzJfdCB0eXBl
LCBkcm1Nb2RlUHJvcGVydAogCQkJcmV0ID0gZHJtTW9kZUF0b21pY0FkZFByb3BlcnR5KHJlcSwg
aWQsIHByb3BfaWQsIGkpOwogCQkJaWd0X2Fzc2VydChyZXQgPj0gMCk7CiAKLQkJCXJldCA9IGRy
bU1vZGVBdG9taWNDb21taXQoZmQsIHJlcSwgRFJNX01PREVfQVRPTUlDX1RFU1RfT05MWSwgTlVM
TCk7CisJCQlyZXQgPSBkcm1Nb2RlQXRvbWljQ29tbWl0KGZkLCByZXEsIERSTV9NT0RFX0FUT01J
Q19URVNUX09OTFkgfCBEUk1fTU9ERV9BVE9NSUNfQUxMT1dfTU9ERVNFVCwgTlVMTCk7CiAJCQlp
Z3RfYXNzZXJ0X2VxKHJldCwgMCk7CiAJCX0KIAl9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
