Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D209989DB7
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Apr 2018 08:17:10 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Mon,  2 Apr 2018 13:44:14 +0530
Message-Id: <1522656854-19558-1-git-send-email-vidya.srinivas@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: fb height to be
 min 16 for NV12
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

UGVyIEJzcGVjLCBmYiBoZWlnaHQgbmVlZHMgdG8gYmUgbWluIDE2IGZvciBOVjEyIChZVVYgcGxh
bmFyCmZvcm1hdHMpLiBXZSBhbHNvIG5lZWQgdGhlIHNyYyBoZWlnaHQgYW5kIHdpZHRoIHRvIGJl
Cm11bHRpcGxlIG9mIDQuCgpSZXZpZXdlZC1CeTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4u
bGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogVW1hIFNoYW5rYXIgPHVt
YS5zaGFua2FyQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogVmlkeWEgU3Jpbml2YXMgPHZpZHlh
LnNyaW5pdmFzQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvdGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYyBiL3Rlc3RzL2ttc19wbGFuZV9zY2FsaW5n
LmMKaW5kZXggMzZmY2ZjMC4uOWQzZmU5NSAxMDA2NDQKLS0tIGEvdGVzdHMva21zX3BsYW5lX3Nj
YWxpbmcuYworKysgYi90ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jCkBAIC0xMzIsNyArMTMyLDcg
QEAgc3RhdGljIHZvaWQgY2hlY2tfc2NhbGluZ19waXBlX3BsYW5lX3JvdChkYXRhX3QgKmQsIGln
dF9wbGFuZV90ICpwbGFuZSwKIAkvKiBjcmVhdGUgYnVmZmVyIGluIHRoZSByYW5nZSBvZiAgbWlu
IGFuZCBtYXggc291cmNlIHNpZGUgbGltaXQuKi8KIAl3aWR0aCA9IGhlaWdodCA9IDk7CiAJaWYg
KHBpeGVsX2Zvcm1hdCA9PSBEUk1fRk9STUFUX05WMTIpCi0JCXdpZHRoID0gaGVpZ2h0ID0gMTc7
CisJCXdpZHRoID0gaGVpZ2h0ID0gMTY7CiAJaWd0X2NyZWF0ZV9jb2xvcl9mYihkaXNwbGF5LT5k
cm1fZmQsIHdpZHRoLCBoZWlnaHQsCiAJCSAgICAgICBwaXhlbF9mb3JtYXQsIHRpbGluZywgMC4w
LCAxLjAsIDAuMCwgJmQtPmZiWzBdKTsKIAlpZ3RfcGxhbmVfc2V0X2ZiKHBsYW5lLCAmZC0+ZmJb
MF0pOwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
