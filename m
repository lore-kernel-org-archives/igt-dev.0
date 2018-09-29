Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8596E0A9
 for <igt-dev@lists.freedesktop.org>; Sat, 29 Sep 2018 00:01:41 +0000 (UTC)
From: Casey Bowman <casey.g.bowman@intel.com>
Date: Fri, 28 Sep 2018 17:01:31 -0700
Message-Id: <20180929000131.142820-1-casey.g.bowman@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/igt_psr: Added ENOENT error check to
 psr_set for older kernels
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
Cc: Casey Bowman <casey.g.bowman@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T25seSBFSU5WQUwgd2FzIGJlaW5nIHVzZWQgdG8gYWNjb3VudCBmb3Igb2xkZXIga2VybmVscywK
YnV0IG9uIGxlZ2FjeSBrZXJuZWxzIHRoYXQgZG9uJ3QgdXNlIGk5MTVfZWRwX3Bzcl9kZWJ1ZywK
dGhlIEVOT0VOVCBlcnJvciB3aWxsIGJlIHRocm93bi4gVGhpcyBjaGFuZ2VzIHRoZSBsb2dpYwp0
byBhbHNvIGFjY291bnQgZm9yIEVOT0VOVCBlcnJvcnMuCgpTaWduZWQtb2ZmLWJ5OiBDYXNleSBC
b3dtYW4gPGNhc2V5LmcuYm93bWFuQGludGVsLmNvbT4KLS0tCiBsaWIvaWd0X3Bzci5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvbGliL2lndF9wc3IuYyBiL2xpYi9pZ3RfcHNyLmMKaW5kZXggMGRkZmI2NGYuLjhjYjQx
YTU1IDEwMDY0NAotLS0gYS9saWIvaWd0X3Bzci5jCisrKyBiL2xpYi9pZ3RfcHNyLmMKQEAgLTEw
Myw3ICsxMDMsNyBAQCBzdGF0aWMgYm9vbCBwc3Jfc2V0KGludCBkZWJ1Z2ZzX2ZkLCBib29sIGVu
YWJsZSkKIAkJcmV0dXJuIGZhbHNlOwogCX0KIAotCWlmIChyZXQgPT0gLUVJTlZBTCkgeworCWlm
IChyZXQgPT0gLUVJTlZBTCB8fCByZXQgPT0gLUVOT0VOVCkgewogCQlyZXQgPSBwc3JfbW9kcGFy
YW1fc2V0KGVuYWJsZSk7CiAJfSBlbHNlIHsKIAkJcmV0ID0gcHNyX3dyaXRlKGRlYnVnZnNfZmQs
IGVuYWJsZSA/ICIweDMiIDogIjB4MSIpOwotLSAKMi4xOS4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2lndC1kZXYK
