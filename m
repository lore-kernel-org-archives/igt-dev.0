Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059FD6E88F
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2019 11:01:18 +0000 (UTC)
From: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
Date: Tue, 19 Nov 2019 03:01:17 -0800
Message-Id: <20191119110117.13209-2-venkata.s.dhanalakota@intel.com>
In-Reply-To: <20191119110117.13209-1-venkata.s.dhanalakota@intel.com>
References: <20191119110117.13209-1-venkata.s.dhanalakota@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] test/i915: gem_exec_parallel: Fix for
 using context engine map
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
ZXhlY2J1Zi4KCkZpeGVzOiBhOTk5OGMyMyBpZ3QoImdlbV9leGVjX3BhcmFsbGVsOiB1c2UgdGhl
IGdlbV9lbmdpbmVfdG9wb2xvZ3kiKQoKQ2M6IEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlAaW50ZWwu
Y29tPgpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AbGludXguaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5
OiBWZW5rYXRhIFNhbmRlZXAgRGhhbmFsYWtvdGEgPHZlbmthdGEucy5kaGFuYWxha290YUBpbnRl
bC5jb20+Ci0tLQogdGVzdHMvaTkxNS9nZW1fZXhlY19wYXJhbGxlbC5jIHwgNCArKystCiAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
dGVzdHMvaTkxNS9nZW1fZXhlY19wYXJhbGxlbC5jIGIvdGVzdHMvaTkxNS9nZW1fZXhlY19wYXJh
bGxlbC5jCmluZGV4IDhhNDQ4MmU1Li41NmIyNmNmNCAxMDA2NDQKLS0tIGEvdGVzdHMvaTkxNS9n
ZW1fZXhlY19wYXJhbGxlbC5jCisrKyBiL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfcGFyYWxsZWwuYwpA
QCAtMTI2LDggKzEyNiwxMCBAQCBzdGF0aWMgdm9pZCAqdGhyZWFkKHZvaWQgKmRhdGEpCiAJZXhl
Y2J1Zi5mbGFncyB8PSBMT0NBTF9JOTE1X0VYRUNfTk9fUkVMT0M7CiAJaWYgKHQtPmdlbiA8IDYp
CiAJCWV4ZWNidWYuZmxhZ3MgfD0gSTkxNV9FWEVDX1NFQ1VSRTsKLQlpZiAodC0+ZmxhZ3MgJiBD
T05URVhUUykKKwlpZiAodC0+ZmxhZ3MgJiBDT05URVhUUykgewogCQlleGVjYnVmLnJzdmQxID0g
Z2VtX2NvbnRleHRfY3JlYXRlKGZkKTsKKwkJZ2VtX2NvbnRleHRfc2V0X2FsbF9lbmdpbmVzKGZk
LCBleGVjYnVmLnJzdmQxKTsKKwl9CiAKIAlmb3IgKGkgPSAwOyBpIDwgMTY7IGkrKykgewogCQlv
YmpbMF0uaGFuZGxlID0gdC0+c2NyYXRjaFtpXTsKLS0gCjIuMjEuMC41LmdhZWI1ODJhOTgzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1h
aWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
