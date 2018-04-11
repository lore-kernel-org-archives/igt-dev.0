Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B946E0BE
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Apr 2018 02:37:59 +0000 (UTC)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Tue, 10 Apr 2018 19:37:23 -0700
Message-Id: <20180411023732.32362-11-dhinakaran.pandiyan@intel.com>
In-Reply-To: <20180411023732.32362-1-dhinakaran.pandiyan@intel.com>
References: <20180411023732.32362-1-dhinakaran.pandiyan@intel.com>
Subject: [igt-dev] [PATCH i-g-t 11/20] tests/psr: Check for drrs status only
 after checking for PSR
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, rodrigo.vivi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIGdvYWwgb2YgdGhpcyB0ZXN0IGlzIChvciBzaG91bGQgYmUpIHRvIHZlcmlmeSBEUlJTIGlz
IGRpc2FibGVkIGlmIFBTUgp3YXMgZW5hYmxlZC4gVGhlcmUgaXMgbm8gcG9pbnQgaW4gY2hlY2tp
bmcgZm9yIERSUlMgc3RhdHVzIGlmIFBTUiB3YXMgbm90CmVuYWJsZWQgaW4gdGhlIGZpcnN0IHBs
YWNlLgoKU2lnbmVkLW9mZi1ieTogRGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5k
aXlhbkBpbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX3Bzcl9zaW5rX2NyYy5jIHwgMSArCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfcHNyX3Np
bmtfY3JjLmMgYi90ZXN0cy9rbXNfcHNyX3NpbmtfY3JjLmMKaW5kZXggMTc0OTA3MjYuLmE3YzZh
MDU3IDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfcHNyX3NpbmtfY3JjLmMKKysrIGIvdGVzdHMva21z
X3Bzcl9zaW5rX2NyYy5jCkBAIC00ODYsNiArNDg2LDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNo
YXIgKmFyZ3ZbXSkKIAogCWlndF9zdWJ0ZXN0KCJub19kcnJzIikgewogCQlzZXR1cF90ZXN0X3Bs
YW5lKCZkYXRhKTsKKwkJaWd0X2Fzc2VydCh3YWl0X3Bzcl9lbnRyeSgmZGF0YSkpOwogCQlpZ3Rf
YXNzZXJ0KGRycnNfZGlzYWJsZWQoJmRhdGEpKTsKIAkJdGVzdF9jbGVhbnVwKCZkYXRhKTsKIAl9
Ci0tIAoyLjE0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
