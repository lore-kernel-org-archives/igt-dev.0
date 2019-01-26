Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997DD6E669
 for <igt-dev@lists.freedesktop.org>; Sat, 26 Jan 2019 01:32:58 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Fri, 25 Jan 2019 17:32:54 -0800
Message-Id: <20190126013256.19255-2-jose.souza@intel.com>
In-Reply-To: <20190126013256.19255-1-jose.souza@intel.com>
References: <20190126013256.19255-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v5 2/4] tests/intel-ci: Add basic PSR2 tests
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

TGV0cyBydW4gdGhlIHNhbWUgUFNSMSBiYXNpYyB0ZXN0cyBmb3IgUFNSMiB0byBjYXVnaHQgUFNS
MgpyZWdyZXNzaW9ucyBmYXN0ZXIuCgpDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50
ZWwuY29tPgpDYzogRGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRl
bC5jb20+ClNpZ25lZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFA
aW50ZWwuY29tPgotLS0KIHRlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxpc3QgfCA0
ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0
cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0IGIvdGVzdHMvaW50ZWwtY2kvZmFzdC1m
ZWVkYmFjay50ZXN0bGlzdAppbmRleCBkYTNjNGM4ZS4uZTQ4Y2I4YTUgMTAwNjQ0Ci0tLSBhL3Rl
c3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxpc3QKKysrIGIvdGVzdHMvaW50ZWwtY2kv
ZmFzdC1mZWVkYmFjay50ZXN0bGlzdApAQCAtMjI3LDYgKzIyNywxMCBAQCBpZ3RAa21zX3BzckBw
cmltYXJ5X3BhZ2VfZmxpcAogaWd0QGttc19wc3JAY3Vyc29yX3BsYW5lX21vdmUKIGlndEBrbXNf
cHNyQHNwcml0ZV9wbGFuZV9vbm9mZgogaWd0QGttc19wc3JAcHJpbWFyeV9tbWFwX2d0dAoraWd0
QGttc19wc3JAcHNyMl9wcmltYXJ5X3BhZ2VfZmxpcAoraWd0QGttc19wc3JAcHNyMl9jdXJzb3Jf
cGxhbmVfbW92ZQoraWd0QGttc19wc3JAcHNyMl9zcHJpdGVfcGxhbmVfb25vZmYKK2lndEBrbXNf
cHNyQHBzcjJfcHJpbWFyeV9tbWFwX2d0dAogaWd0QGttc19zZXRtb2RlQGJhc2ljLWNsb25lLXNp
bmdsZS1jcnRjCiBpZ3RAcG1fYmFja2xpZ2h0QGJhc2ljLWJyaWdodG5lc3MKIGlndEBwbV9ycG1A
YmFzaWMtcGNpLWQzLXN0YXRlCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldgo=
