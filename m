Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054FB6E90E
 for <igt-dev@lists.freedesktop.org>; Wed,  9 May 2018 17:38:07 +0000 (UTC)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Wed,  9 May 2018 10:37:33 -0700
Message-Id: <20180509173746.23405-2-dhinakaran.pandiyan@intel.com>
In-Reply-To: <20180509173746.23405-1-dhinakaran.pandiyan@intel.com>
References: <20180509173746.23405-1-dhinakaran.pandiyan@intel.com>
Subject: [igt-dev] [PATCH i-g-t 01/14] tests/psr: Print the reason for
 skipping when sink lacks PSR support
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

QW5kIHJlbmFtZSB0aGUgZnVuY3Rpb24gdG8gbWF0Y2ggd2hhdCBpdCBkb2VzLgoKU2lnbmVkLW9m
Zi1ieTogRGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5jb20+
ClJldmlld2VkLWJ5OiBLYXRhcnp5bmEgRGVjIDxrYXRhcnp5bmEuZGVjQGludGVsLmNvbT4KLS0t
CiB0ZXN0cy9rbXNfcHNyX3NpbmtfY3JjLmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfcHNy
X3NpbmtfY3JjLmMgYi90ZXN0cy9rbXNfcHNyX3NpbmtfY3JjLmMKaW5kZXggOThkMjliYTkuLjkz
ODA3YzAzIDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfcHNyX3NpbmtfY3JjLmMKKysrIGIvdGVzdHMv
a21zX3Bzcl9zaW5rX2NyYy5jCkBAIC0xOTMsNyArMTkzLDcgQEAgc3RhdGljIHZvaWQgZmlsbF9y
ZW5kZXIoZGF0YV90ICpkYXRhLCB1aW50MzJfdCBoYW5kbGUsIHVuc2lnbmVkIGNoYXIgY29sb3Ip
CiAJZ2VtX2JvX2J1c3koZGF0YS0+ZHJtX2ZkLCBoYW5kbGUpOwogfQogCi1zdGF0aWMgYm9vbCBw
c3JfcG9zc2libGUoZGF0YV90ICpkYXRhKQorc3RhdGljIGJvb2wgc2lua19zdXBwb3J0KGRhdGFf
dCAqZGF0YSkKIHsKIAljaGFyIGJ1Zls1MTJdOwogCkBAIC01MTMsOCArNTEzLDggQEAgaW50IG1h
aW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKIAogCQlpZ3Rfc2V0X21vZHVsZV9wYXJhbV9pbnQo
ImVuYWJsZV9wc3IiLCBydW5uaW5nX3dpdGhfcHNyX2Rpc2FibGVkID8KIAkJCQkJIDAgOiAxKTsK
LQotCQlpZ3Rfc2tpcF9vbighcHNyX3Bvc3NpYmxlKCZkYXRhKSk7CisJCWlndF9yZXF1aXJlX2Yo
c2lua19zdXBwb3J0KCZkYXRhKSwKKwkJCSAgICAgICJTaW5rIGRvZXMgbm90IHN1cHBvcnQgUFNS
XG4iKTsKIAogCQlkYXRhLmJ1Zm1nciA9IGRybV9pbnRlbF9idWZtZ3JfZ2VtX2luaXQoZGF0YS5k
cm1fZmQsIDQwOTYpOwogCQlpZ3RfYXNzZXJ0KGRhdGEuYnVmbWdyKTsKLS0gCjIuMTQuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
