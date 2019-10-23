Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3ED56E161
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2019 21:50:36 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Wed, 23 Oct 2019 14:50:30 -0700
Message-Id: <20191023215031.94821-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/psr: Skip PSR tests if sink not
 reliable
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
Cc: Ap Kamal <kamal.ap@intel.com>, Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UmlnaHQgbm93IGlmIHNpbmsgcmVwb3J0ZWQgYW55IFBTUiBlcnJvciBvciBpZiBpdCBmYWlscyB0
bwphY2tub3dsZWRnZSB0aGUgUFNSIHdha2V1cCBpdCBzZXRzIGEgZmxhZyBhbmQgZG8gbm90IGF0
dGVtcHQgdG8KZW5hYmxlIFBTUiBhbnltb3JlLiBUaGF0IGlzIHRoZSBzYWZlc3QgYXBwcm9hY2gg
dG8gYXZvaWQgcmVwZXRpdGl2ZQpnbGl0Y2hlcyBhbmQgYWxsb3dlZCB1cyB0byBoYXZlIFBTUiBl
bmFibGVkIGJ5IGRlZmF1bHQuCgpCdXQgZnJvbSB0aW1lIHRvIHRpbWUgZXZlbiBnb29kIFBTUiBw
YW5lbHMgaGF2ZSBhIFBTUiBlcnJvciwgY2F1c2luZwp0ZXN0cyB0byBmYWlsLiBBbmQgZm9yIG5v
dyB3ZSBhcmUgbm90IHlldCB0byB0aGUgcG9pbnQgd2VyZSB3ZSBjb3VsZAp0cnkgdG8gcmVjb3Zl
ciBmcm9tIFBTUiBlcnJvcnMsIHNvIGxldHMgY2hlY2sgZm9yIHRoaXMgaW5mb3JtYXRpb24gaW4K
ZGVidWdmcyBhbmQgc2tpcCBQU1IgdGVzdHMgYmVjYXVzZSBvZiBzaW5rIGVycm9ycyBhbmQgZWxp
bWluYXRlIHRoaXMKbm9pc2UgZnJvbSBDSSBydW5zLgoKQ2M6IERoaW5ha2FyYW4gUGFuZGl5YW4g
PGRoaW5ha2FyYW4ucGFuZGl5YW5AaW50ZWwuY29tPgpDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdv
LnZpdmlAaW50ZWwuY29tPgpDYzogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNv
bT4KQ2M6IEFwIEthbWFsIDxrYW1hbC5hcEBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEpvc8Op
IFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPgotLS0KIGxpYi9pZ3RfcHNy
LmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
bGliL2lndF9wc3IuYyBiL2xpYi9pZ3RfcHNyLmMKaW5kZXggYjkyZWE3M2YuLjBlNzlkY2Q5IDEw
MDY0NAotLS0gYS9saWIvaWd0X3Bzci5jCisrKyBiL2xpYi9pZ3RfcHNyLmMKQEAgLTMzLDYgKzMz
LDggQEAgc3RhdGljIGJvb2wgcHNyX2FjdGl2ZV9jaGVjayhpbnQgZGVidWdmc19mZCwgZW51bSBw
c3JfbW9kZSBtb2RlKQogCWlndF9kZWJ1Z2ZzX3NpbXBsZV9yZWFkKGRlYnVnZnNfZmQsICJpOTE1
X2VkcF9wc3Jfc3RhdHVzIiwgYnVmLAogCQkJCXNpemVvZihidWYpKTsKIAorCWlndF9za2lwX29u
KHN0cnN0cihidWYsICJQU1Igc2luayBub3QgcmVsaWFibGU6IHllcyIpKTsKKwogCXJldHVybiBz
dHJzdHIoYnVmLCBzdGF0ZSk7CiB9CiAKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2
