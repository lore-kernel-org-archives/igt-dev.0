Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162F76E54C
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2019 22:37:46 +0000 (UTC)
From: Caz Yokoyama <caz.yokoyama@intel.com>
Date: Fri, 29 Mar 2019 15:26:13 -0700
Message-Id: <b45714c8ec351a3dcde4c353fbfd23aa4c73851d.1553898290.git.caz.yokoyama@intel.com>
Subject: [igt-dev] [PATCH i-g-t v6 1/1] i915_pm_rpm: remove
 gem-execbuf-stress-extra-wait because same as gem-execbuf-stress
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
List-ID: <igt-dev@lists.freedesktop.org>

RXh0cmEgNXNlYyBkZWxheSBkb2VzIG5vdCBhZGQgYW55IHZhbHVlIG1vcmUgdGhhbiBnZW0tZXhl
Y2J1Zi1zdHJlc3MuCkl0IHdhaXRzIHVudGlsIHN1c3BlbmQgc3RhdGUgYWZ0ZXIgYSBqb2IgaXMg
YWRkZWQgYnkgZ2VtX2V4ZWNidWYoKS4KVGhlcmUgaXMgbm8gbmVlZCB0byBkbyBtb3JlIHdoZW4g
R1BVIGJlY29tZXMgc3VzcGVuZGVkIHN0YXRlLgpJIGNvbmZpcm0gdGhpcyBieSBsb29raW5nIGF0
IHBtX3J1bnRpbWVfZm9yY2Vfc3VzcGVuZCgpIHdoaWNoIGV4aXRzCm9uIHN1c3BlbmQgc3RhdGUu
CgpTaWduZWQtb2ZmLWJ5OiBDYXogWW9rb3lhbWEgPGNhei55b2tveWFtYUBpbnRlbC5jb20+CkNj
OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLS0tCiB0ZXN0cy9pbnRl
bC1jaS9ibGFja2xpc3QudHh0IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykK
CmRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC1jaS9ibGFja2xpc3QudHh0IGIvdGVzdHMvaW50ZWwt
Y2kvYmxhY2tsaXN0LnR4dAppbmRleCBhMjEwMWFlNy4uMmYzNmFkM2YgMTAwNjQ0Ci0tLSBhL3Rl
c3RzL2ludGVsLWNpL2JsYWNrbGlzdC50eHQKKysrIGIvdGVzdHMvaW50ZWwtY2kvYmxhY2tsaXN0
LnR4dApAQCAtMTQsNiArMTQsNyBAQCBpZ3RAZHJtX21tKEAuKik/CiAjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogaWd0QGk5MTVfbW9kdWxlX2xvYWQoQC4q
KT8KIGlndEBpOTE1X3BtX3JwbUBtb2R1bGUtcmVsb2FkCitpZ3RAaTkxNV9wbV9ycG1AZ2VtLWV4
ZWNidWYtc3RyZXNzLWV4dHJhLXdhaXQKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjCiAjIEdFTQogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2
