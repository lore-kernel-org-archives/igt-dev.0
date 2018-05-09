Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9170A6E82E
 for <igt-dev@lists.freedesktop.org>; Wed,  9 May 2018 11:43:58 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
Date: Wed,  9 May 2018 12:43:55 +0100
Message-Id: <20180509114355.24450-1-matthew.auld@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/gem_userptr_blits: test zero user_size
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

Q2hlY2sgdGhhdCB0aGUga2VybmVsIHJlamVjdHMgYSB6ZXJvIHVzZXJfc2l6ZS4KClNpZ25lZC1v
ZmYtYnk6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4KQ2M6IENocmlzIFdp
bHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgpSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29u
IDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0tLQogdGVzdHMvZ2VtX3VzZXJwdHJfYmxpdHMu
YyB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS90ZXN0cy9nZW1fdXNlcnB0cl9ibGl0cy5jIGIvdGVzdHMvZ2VtX3VzZXJwdHJfYmxpdHMu
YwppbmRleCA4NDkwNTRhZC4uN2UzYjZlZjMgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2dlbV91c2VycHRy
X2JsaXRzLmMKKysrIGIvdGVzdHMvZ2VtX3VzZXJwdHJfYmxpdHMuYwpAQCAtNDQyLDYgKzQ0Miwx
NCBAQCBzdGF0aWMgaW50IHRlc3RfaW5wdXRfY2hlY2tpbmcoaW50IGZkKQogCXJldCA9IGRybUlv
Y3RsKGZkLCBMT0NBTF9JT0NUTF9JOTE1X0dFTV9VU0VSUFRSLCAmdXNlcnB0cik7CiAJaWd0X2Fz
c2VydF9uZXEocmV0LCAwKTsKIAorCS8qIFplcm8gdXNlcl9zaXplLiAqLworCW1lbXNldCgmdXNl
cnB0ciwgMCwgc2l6ZW9mKHVzZXJwdHIpKTsKKwl1c2VycHRyLnVzZXJfcHRyID0gMDsKKwl1c2Vy
cHRyLnVzZXJfc2l6ZSA9IDA7CisJdXNlcnB0ci5mbGFncyA9IDA7CisJcmV0ID0gZHJtSW9jdGwo
ZmQsIExPQ0FMX0lPQ1RMX0k5MTVfR0VNX1VTRVJQVFIsICZ1c2VycHRyKTsKKwlpZ3RfYXNzZXJ0
X25lcShyZXQsIDApOworCiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuMTcuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
