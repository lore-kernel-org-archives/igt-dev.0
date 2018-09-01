Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBC36E090
 for <igt-dev@lists.freedesktop.org>; Sat,  1 Sep 2018 04:18:08 +0000 (UTC)
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Fri, 31 Aug 2018 21:18:02 -0700
Message-Id: <20180901041806.2627-2-rodrigo.vivi@intel.com>
In-Reply-To: <20180901041806.2627-1-rodrigo.vivi@intel.com>
References: <20180901041806.2627-1-rodrigo.vivi@intel.com>
Subject: [igt-dev] [PATCH i-g-t 2/6] tools/dpcd_reg: Improve outputs
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

QmVmb3JlOgoKJCBkcGNkX3JlZyByZWFkIC0tZGV2aWNlPTAgLS1vZmZzZXQ9MDIwMCAtLWNvdW50
IDgKUmVhZCA4IGJ5dGUocykgc3RhcnRpbmcgYXQgb2Zmc2V0IDIwMAoKNDEKMAowCjAKODAKMAo2
Ngo2NgoKQWZ0ZXI6CiQgZHBjZF9yZWcgcmVhZCAtLWRldmljZT0wIC0tb2Zmc2V0PTAyMDAgLS1j
b3VudCA4CjAyMDA6IDQxIDAwIDAwIDAwIDgwIDAwIDY2IDY2CgpCZXNpZGVzIHRoZSBjbGVhbiB2
aWV3IHRoaXMgd2lsbCBhbGxvdyB1cyB0byBpbnRlZ3JhdGUKdGhlIGR1bXAgYW5kIG11bHRpcGxl
IHJlYWRzLgoKQ2M6IFRhcnVuIFZ5YXMgPHRhcnVuLnZ5YXNAaW50ZWwuY29tPgpDYzogRGhpbmFr
YXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5jb20+ClNpZ25lZC1vZmYt
Ynk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4KLS0tCiB0b29scy9kcGNk
X3JlZy5jIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9kcGNkX3JlZy5jIGIvdG9vbHMvZHBjZF9yZWcu
YwppbmRleCAzOWRkZTJjOS4uZDEzOTAwN2MgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2RwY2RfcmVnLmMK
KysrIGIvdG9vbHMvZHBjZF9yZWcuYwpAQCAtNzUsOSArNzUsMTAgQEAgc3RhdGljIGludCBkcGNk
X3JlYWQoY2hhciAqZGV2aWNlLCBjb25zdCB1aW50MzJfdCBvZmZzZXQsIHNpemVfdCBjb3VudCkK
IAkJCWdvdG8gb3V0OwogCQl9CiAKLQkJaWd0X2luZm8oIlJlYWQgJXp1IGJ5dGUocykgc3RhcnRp
bmcgYXQgb2Zmc2V0ICV4XG5cbiIsIGNvdW50LCBvZmZzZXQpOworCQlpZ3RfaW5mbygiJTA0eDoi
LCBvZmZzZXQpOwogCQlmb3IgKGkgPSAwOyBpIDwgY291bnQ7IGkrKykKLQkJCWlndF9pbmZvKCIl
eFxuIiwgKigoKHVpbnQ4X3QgKikoYnVmKSkgKyBpKSk7CisJCQlpZ3RfaW5mbygiICUwMngiLCAq
KCgodWludDhfdCAqKShidWYpKSArIGkpKTsKKwkJaWd0X2luZm8oIlxuIik7CiAJfQogCWVsc2Ug
ewogCQlpZ3Rfd2FybigiRmFpbGVkIHRvIG9wZW4gJXMgYXV4IGRldmljZSAtIGVycm9yOiAlc1xu
IiwgZGV2aWNlLCBzdHJlcnJvcihlcnJubykpOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
