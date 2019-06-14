Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F52C89590
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jun 2019 08:08:29 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Fri, 14 Jun 2019 11:08:16 +0300
Message-Id: <20190614080816.12464-3-arkadiusz.hiler@intel.com>
In-Reply-To: <20190614080816.12464-1-arkadiusz.hiler@intel.com>
References: <20190614080816.12464-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/3] runner: Log which signal was used to
 terminate the runner
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

RmVlZCB0aGUgY3VyaW91cyBvbmVzLCBhaWQgdGhlIHRyb3VibGVzaG9vdGVycy4KClNpZ25lZC1v
ZmYtYnk6IEFya2FkaXVzeiBIaWxlciA8YXJrYWRpdXN6LmhpbGVyQGludGVsLmNvbT4KLS0tCiBy
dW5uZXIvZXhlY3V0b3IuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcnVubmVyL2V4ZWN1dG9yLmMgYi9ydW5uZXIv
ZXhlY3V0b3IuYwppbmRleCA2YjE3MWMxMi4uNDg4Y2Y2OTkgMTAwNjQ0Ci0tLSBhL3J1bm5lci9l
eGVjdXRvci5jCisrKyBiL3J1bm5lci9leGVjdXRvci5jCkBAIC03MzgsNyArNzM4LDggQEAgc3Rh
dGljIGludCBtb25pdG9yX291dHB1dChwaWRfdCBjaGlsZCwKIAkJCX0gZWxzZSB7CiAJCQkJLyog
V2UncmUgZHlpbmcsIHNvIHdlJ3JlIHRha2luZyB0aGVtIHdpdGggdXMgKi8KIAkJCQlpZiAoc2V0
dGluZ3MtPmxvZ19sZXZlbCA+PSBMT0dfTEVWRUxfTk9STUFMKQotCQkJCQlwcmludGYoIkFib3J0
IHJlcXVlc3RlZCwgdGVybWluYXRpbmcgY2hpbGRyZW5cbiIpOworCQkJCQlwcmludGYoIkFib3J0
IHJlcXVlc3RlZCB2aWEgJXMsIHRlcm1pbmF0aW5nIGNoaWxkcmVuXG4iLAorCQkJCQkgICAgICAg
c3Ryc2lnbmFsKHNpZ2luZm8uc3NpX3NpZ25vKSk7CiAKIAkJCQlhYm9ydGluZyA9IHRydWU7CiAJ
CQkJdGltZW91dCA9IDI7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaWd0LWRldg==
