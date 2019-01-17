Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150006E428
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jan 2019 19:38:49 +0000 (UTC)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Thu, 17 Jan 2019 11:34:38 -0800
Message-Id: <20190117193438.2891-1-dhinakaran.pandiyan@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_available_modes_crc: Reset
 output->pipe after testing it.
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Tm90IGNsZWFyaW5nIHRoZSBwaXBlIHJlc3VsdHMgaW4gYSB0ZXN0IGZhaWx1cmUgd2hlbiB0aGUg
c2FtZSBwaXBlIGlzCmFzc2lnbmVkIHRvIHRoZSBuZXh0IG91dHB1dC4KCkNjOiBKdWhhLVBla2th
IEhlaWtraWxhIDxqdWhhcGVra2EuaGVpa2tpbGFAZ21haWwuY29tPgpTdWdnZXN0ZWQtYnk6IEph
bWVzIEF1c211cyA8amFtZXMuYXVzbXVzQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogRGhpbmFr
YXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5jb20+Ci0tLQogdGVzdHMv
a21zX2F2YWlsYWJsZV9tb2Rlc19jcmMuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2F2YWlsYWJsZV9tb2Rlc19jcmMuYyBiL3Rl
c3RzL2ttc19hdmFpbGFibGVfbW9kZXNfY3JjLmMKaW5kZXggNDVhNDc3NTAuLjBjMDI4MmY4IDEw
MDY0NAotLS0gYS90ZXN0cy9rbXNfYXZhaWxhYmxlX21vZGVzX2NyYy5jCisrKyBiL3Rlc3RzL2tt
c19hdmFpbGFibGVfbW9kZXNfY3JjLmMKQEAgLTQ4NCw2ICs0ODQsNyBAQCB0ZXN0X2F2YWlsYWJs
ZV9tb2RlcyhkYXRhX3QqIGRhdGEpCiAJCWlndF9waXBlX2NyY19zdG9wKGRhdGEtPnBpcGVfY3Jj
KTsKIAkJaWd0X3BpcGVfY3JjX2ZyZWUoZGF0YS0+cGlwZV9jcmMpOwogCQlpZ3RfZGlzcGxheV9j
b21taXQyKCZkYXRhLT5kaXNwbGF5LCBkYXRhLT5jb21taXQpOworCQlpZ3Rfb3V0cHV0X3NldF9w
aXBlKG91dHB1dCwgUElQRV9OT05FKTsKIAl9CiAJaWd0X2Fzc2VydChpbnZhbGlkcyA9PSAwKTsK
IH0KLS0gCjIuMTQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
