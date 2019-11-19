Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFFA96E075
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2019 11:01:17 +0000 (UTC)
From: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
Date: Tue, 19 Nov 2019 03:01:16 -0800
Message-Id: <20191119110117.13209-1-venkata.s.dhanalakota@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] test/i915: gem_ctx_exec: Fix for using
 context engine map
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
List-ID: <igt-dev@lists.freedesktop.org>

U2luY2UgZW5naW5lcyBhcmUgbm93IGxvb2tlZCB1cCBiYXNlZCBvbiBjb250ZXh0IGVuZ2luZSBt
YXAsCmNvbnRleHQgc2hvdWxkIGJlIHNldHVwIHdpdGggZW5naW5lcyBiZWZvcmUgdXNpbmcgaW4g
ZXhlY2J1Zi4KCkZpeGVzOiAxYTdmMmU1OSBpZ3QoImdlbV9jdHhfZXhlYzogdXNlIHRoZSBnZW1f
ZW5naW5lX3RvcG9sb2d5IgoKQ2M6IEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlAaW50ZWwuY29tPgpD
YzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBUdnJ0a28gVXJz
dWxpbiA8dHZydGtvLnVyc3VsaW5AbGludXguaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBWZW5r
YXRhIFNhbmRlZXAgRGhhbmFsYWtvdGEgPHZlbmthdGEucy5kaGFuYWxha290YUBpbnRlbC5jb20+
Ci0tLQogdGVzdHMvaTkxNS9nZW1fY3R4X2V4ZWMuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fY3R4X2V4ZWMuYyBiL3Rl
c3RzL2k5MTUvZ2VtX2N0eF9leGVjLmMKaW5kZXggNmMyY2Q5MjIuLjJiZjQ3Y2YyIDEwMDY0NAot
LS0gYS90ZXN0cy9pOTE1L2dlbV9jdHhfZXhlYy5jCisrKyBiL3Rlc3RzL2k5MTUvZ2VtX2N0eF9l
eGVjLmMKQEAgLTEzMiw2ICsxMzIsNyBAQCBzdGF0aWMgdm9pZCBpbnZhbGlkX2NvbnRleHQoaW50
IGZkLCBjb25zdCBzdHJ1Y3QgaW50ZWxfZXhlY3V0aW9uX2VuZ2luZTIgKmUsCiAJZ2VtX2V4ZWNi
dWYoZmQsICZleGVjYnVmKTsKIAogCWN0eCA9IGdlbV9jb250ZXh0X2NyZWF0ZShmZCk7CisJZ2Vt
X2NvbnRleHRfc2V0X2FsbF9lbmdpbmVzKGZkLCBjdHgpOwogCWk5MTVfZXhlY2J1ZmZlcjJfc2V0
X2NvbnRleHRfaWQoZXhlY2J1ZiwgY3R4KTsKIAlnZW1fZXhlY2J1ZihmZCwgJmV4ZWNidWYpOwog
Ci0tIAoyLjIxLjAuNS5nYWViNTgyYTk4MwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2
