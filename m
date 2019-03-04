Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05043894EA
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2019 15:17:42 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon,  4 Mar 2019 15:17:35 +0000
Message-Id: <20190304151735.10158-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/pm_rpm: Show the rpm status after
 disabling screens
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

VG8gaGF2ZSBhIGNsZWFyZXIgcGljdHVyZSBhdCB3aGF0IG1heSBzdGlsbCBiZSBob2xkaW5nIGEg
d2FrZXJlZiB3aGVuCmFsbCBpcyBkaXNhYmxlZCwgc2hvdyB0aGUgd2FrZXJlZnMganVzdCBiZWZv
cmUgd2Ugc3RhcnQgb3VyIHdhaXQKYmVsaWV2aW5nIHRoYXQgbm8gd2FrZXJlZnMgcmVtYWluLgoK
U2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0t
LQogdGVzdHMvaTkxNS9pOTE1X3BtX3JwbS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvaTkx
NV9wbV9ycG0uYyBiL3Rlc3RzL2k5MTUvaTkxNV9wbV9ycG0uYwppbmRleCBiZTI5NmY1MjUuLjc1
OWM3NmVhZiAxMDA2NDQKLS0tIGEvdGVzdHMvaTkxNS9pOTE1X3BtX3JwbS5jCisrKyBiL3Rlc3Rz
L2k5MTUvaTkxNV9wbV9ycG0uYwpAQCAtNzU2LDggKzc1Niw2IEBAIHN0YXRpYyBib29sIHNldHVw
X2Vudmlyb25tZW50KHZvaWQpCiAJaGFzX3J1bnRpbWVfcG0gPSBpZ3Rfc2V0dXBfcnVudGltZV9w
bSgpOwogCXNldHVwX3BjOCgpOwogCi0JZHVtcF9maWxlKGRlYnVnZnMsICJpOTE1X3J1bnRpbWVf
cG1fc3RhdHVzIik7Ci0KIAlpZ3RfaW5mbygiUnVudGltZSBQTSBzdXBwb3J0OiAlZFxuIiwgaGFz
X3J1bnRpbWVfcG0pOwogCWlndF9pbmZvKCJQQzggcmVzaWRlbmN5IHN1cHBvcnQ6ICVkXG4iLCBo
YXNfcGM4KTsKIAlpZ3RfcmVxdWlyZShoYXNfcnVudGltZV9wbSk7CkBAIC03NjUsNiArNzYzLDgg
QEAgc3RhdGljIGJvb2wgc2V0dXBfZW52aXJvbm1lbnQodm9pZCkKIAogb3V0OgogCWRpc2FibGVf
YWxsX3NjcmVlbnMoJm1zX2RhdGEpOworCWR1bXBfZmlsZShkZWJ1Z2ZzLCAiaTkxNV9ydW50aW1l
X3BtX3N0YXR1cyIpOworCiAJcmV0dXJuIHdhaXRfZm9yX3N1c3BlbmRlZCgpOwogfQogCi0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
