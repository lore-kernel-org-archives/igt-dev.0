Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7236E35A
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Mar 2018 09:23:45 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Tue,  6 Mar 2018 14:51:39 +0530
Message-Id: <1520328099-19034-1-git-send-email-vidya.srinivas@intel.com>
Subject: [igt-dev] [PATCH i-g-t] [i-g-t] tests/kms_plane_scaling: Change
 minimum fb height for YUV 420 planar
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

V2hlbiB0aGUgcGxhbmUgc2NhbGluZyBpcyB1c2VkIHdpdGggWVVWIDQyMCBwbGFuYXIgZm9ybWF0
cywKdGhlIGhlaWdodCBzaG91bGQgYmUgYSBtaW5pbXVtIG9mIDE2IHNjYW5saW5lcyBhcyBwZXIg
QlNwZWMKTWluaW11bSBvZiA4IHNjYW5saW5lcyBpcyBmb3Igbm9uLVlVViA0MjAgcGxhbmFyIGZv
cm1hdHMuClBhdGNoIGNoYW5nZXMgdGhlIG1pbmltdW0gZmIgaGVpZ2h0IGJlaW5nIHVzZWQgaW4g
dGhlIHRlc3QKaW4gY2FzZSBvZiBZVVYgNDIwIHBsYW5hciAoZm9yIG5vdyBOVjEyIGFzIG9ubHkg
dGhhdCBpcyBzdXBwb3J0ZWQpLgoKU2lnbmVkLW9mZi1ieTogVW1hIFNoYW5rYXIgPHVtYS5zaGFu
a2FyQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogVmlkeWEgU3Jpbml2YXMgPHZpZHlhLnNyaW5p
dmFzQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jIHwgMiArKwogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19wbGFu
ZV9zY2FsaW5nLmMgYi90ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jCmluZGV4IDQ0MDhlNWMuLmNm
NDkwMTUgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19wbGFuZV9zY2FsaW5nLmMKKysrIGIvdGVzdHMv
a21zX3BsYW5lX3NjYWxpbmcuYwpAQCAtMTMxLDYgKzEzMSw4IEBAIHN0YXRpYyB2b2lkIGNoZWNr
X3NjYWxpbmdfcGlwZV9wbGFuZV9yb3QoZGF0YV90ICpkLCBpZ3RfcGxhbmVfdCAqcGxhbmUsCiAK
IAkvKiBjcmVhdGUgYnVmZmVyIGluIHRoZSByYW5nZSBvZiAgbWluIGFuZCBtYXggc291cmNlIHNp
ZGUgbGltaXQuKi8KIAl3aWR0aCA9IGhlaWdodCA9IDk7CisJaWYgKHBpeGVsX2Zvcm1hdCA9PSBE
Uk1fRk9STUFUX05WMTIpCisJCWhlaWdodCA9IDE2OwogCWlndF9jcmVhdGVfY29sb3JfZmIoZGlz
cGxheS0+ZHJtX2ZkLCB3aWR0aCwgaGVpZ2h0LAogCQkgICAgICAgcGl4ZWxfZm9ybWF0LCB0aWxp
bmcsIDAuMCwgMS4wLCAwLjAsICZkLT5mYlswXSk7CiAJaWd0X3BsYW5lX3NldF9mYihwbGFuZSwg
JmQtPmZiWzBdKTsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXYK
