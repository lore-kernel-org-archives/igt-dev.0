Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A48A6E5B8
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Apr 2019 22:40:14 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Thu,  4 Apr 2019 15:39:23 -0700
Message-Id: <20190404223925.1102-2-lucas.demarchi@intel.com>
In-Reply-To: <20190404223925.1102-1-lucas.demarchi@intel.com>
References: <20190404223925.1102-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 2/4] gem_exec_parallel: do not special case the
 default
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

QSBkZWZhdWx0IG1ha2VzIHNlbnNlIHdoZW4gaXQncyB0aGUgbW9zdCB1c2VkLgoKU2lnbmVkLW9m
Zi1ieTogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+Ci0tLQogdGVz
dHMvaTkxNS9nZW1fZXhlY19wYXJhbGxlbC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2Vt
X2V4ZWNfcGFyYWxsZWwuYyBiL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfcGFyYWxsZWwuYwppbmRleCBh
NmZhNjk4ZS4uZjgzMjBjM2EgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfcGFyYWxs
ZWwuYworKysgYi90ZXN0cy9pOTE1L2dlbV9leGVjX3BhcmFsbGVsLmMKQEAgLTIzMSw3ICsyMzEs
NyBAQCBpZ3RfbWFpbgogCQljb25zdCBjaGFyICpuYW1lOwogCQl1bnNpZ25lZCBmbGFnczsKIAl9
IG1vZGVzW10gPSB7Ci0JCXsgIiIsIDAgfSwKKwkJeyAiYmFzaWMiLCAwIH0sCiAJCXsgImNvbnRl
eHRzIiwgQ09OVEVYVFMgfSwKIAkJeyAiZmRzIiwgRkRTIH0sCiAJCXsgTlVMTCB9CkBAIC0yNDYs
NyArMjQ2LDcgQEAgaWd0X21haW4KIAl9CiAKIAlmb3IgKGNvbnN0IHN0cnVjdCBtb2RlICptID0g
bW9kZXM7IG0tPm5hbWU7IG0rKykKLQkJaWd0X3N1YnRlc3RfZigiJXMiLCAqbS0+bmFtZSA/IG0t
Pm5hbWUgOiAiYmFzaWMiKQorCQlpZ3Rfc3VidGVzdF9mKCIlcyIsIG0tPm5hbWUpCiAJCQlhbGwo
ZmQsIEFMTF9FTkdJTkVTLCBtLT5mbGFncyk7CiAKIAlmb3IgKGNvbnN0IHN0cnVjdCBpbnRlbF9l
eGVjdXRpb25fZW5naW5lICplID0gaW50ZWxfZXhlY3V0aW9uX2VuZ2luZXM7Ci0tIAoyLjIxLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
