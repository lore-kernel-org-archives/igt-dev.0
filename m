Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1626EB3E
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jan 2019 14:37:09 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Thu,  3 Jan 2019 06:36:40 -0800
Message-Id: <20190103143641.20200-8-jose.souza@intel.com>
In-Reply-To: <20190103143641.20200-1-jose.souza@intel.com>
References: <20190103143641.20200-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 8/9] tests/intel-ci: Add basic PSR2 tests
 to fast feedback test list
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

TGV0cyBydW4gdGhlIHNhbWUgUFNSMSBiYXNpYyB0ZXN0cyBmb3IgUFNSMiB0byBnZXQgUFNSMiBy
ZWdyZXNzaW9ucwpmYXN0ZXIuCgpDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwu
Y29tPgpDYzogRGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5j
b20+ClNpZ25lZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50
ZWwuY29tPgotLS0KIHRlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxpc3QgfCA0ICsr
KysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0cy9p
bnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0IGIvdGVzdHMvaW50ZWwtY2kvZmFzdC1mZWVk
YmFjay50ZXN0bGlzdAppbmRleCA2ZDQyNzkyYy4uMmY2MWQzOGQgMTAwNjQ0Ci0tLSBhL3Rlc3Rz
L2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxpc3QKKysrIGIvdGVzdHMvaW50ZWwtY2kvZmFz
dC1mZWVkYmFjay50ZXN0bGlzdApAQCAtMjI4LDYgKzIyOCwxMCBAQCBpZ3RAa21zX3BzckBwcmlt
YXJ5X3BhZ2VfZmxpcAogaWd0QGttc19wc3JAY3Vyc29yX3BsYW5lX21vdmUKIGlndEBrbXNfcHNy
QHNwcml0ZV9wbGFuZV9vbm9mZgogaWd0QGttc19wc3JAcHJpbWFyeV9tbWFwX2d0dAoraWd0QGtt
c19wc3JAcHNyMl9wcmltYXJ5X3BhZ2VfZmxpcAoraWd0QGttc19wc3JAcHNyMl9jdXJzb3JfcGxh
bmVfbW92ZQoraWd0QGttc19wc3JAcHNyMl9zcHJpdGVfcGxhbmVfb25vZmYKK2lndEBrbXNfcHNy
QHBzcjJfcHJpbWFyeV9tbWFwX2d0dAogaWd0QGttc19zZXRtb2RlQGJhc2ljLWNsb25lLXNpbmds
ZS1jcnRjCiBpZ3RAcG1fYmFja2xpZ2h0QGJhc2ljLWJyaWdodG5lc3MKIGlndEBwbV9ycG1AYmFz
aWMtcGNpLWQzLXN0YXRlCi0tIAoyLjIwLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldgo=
