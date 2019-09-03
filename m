Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21CC89341
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Sep 2019 08:36:39 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Tue, 3 Sep 2019 11:36:09 +0300
Message-ID: <20190903083614.31305-3-arkadiusz.hiler@intel.com>
In-Reply-To: <20190903083614.31305-1-arkadiusz.hiler@intel.com>
References: <20190903083614.31305-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/8] .gitlab-ci: Remove dead code
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VEFHIGlzIHVudXNlZCBzaW5jZSBmZXcgcmV2aXNpb25zIG9mIHRoZSBvcmlnaW5hbCBwYXRjaHNl
dCBhZ28gYW5kIG5ldmVyCndhcyBjbGVhbmVkIHVwIHByb3Blcmx5LgoKU2lnbmVkLW9mZi1ieTog
QXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPgotLS0KIC5naXRsYWIt
Y2kvcHVsbC1vci1yZWJ1aWxkLnNoIHwgOCArKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS8uZ2l0bGFiLWNpL3B1bGwt
b3ItcmVidWlsZC5zaCBiLy5naXRsYWItY2kvcHVsbC1vci1yZWJ1aWxkLnNoCmluZGV4IDlmMzNi
NDE0Li43ZTY5NDc3ZSAxMDA3NTUKLS0tIGEvLmdpdGxhYi1jaS9wdWxsLW9yLXJlYnVpbGQuc2gK
KysrIGIvLmdpdGxhYi1jaS9wdWxsLW9yLXJlYnVpbGQuc2gKQEAgLTM4LDEyICszOCwxMiBAQCBJ
TUFHRV9QUkVTRU5UPSQ/CiAKIHNldCAtZQogaWYgWyAkSU1BR0VfUFJFU0VOVCAtZXEgMCBdICYm
IFsgJHtGT1JDRV9SRUJVSUxEOi0wfSAtZXEgMCBdIDsgdGhlbgotCWVjaG8gIlNraXBwaW5nICRO
QU1FOiRUQUcsIGFscmVhZHkgYnVpbHQiCisJZWNobyAiU2tpcHBpbmcsIGFscmVhZHkgYnVpbHQi
CiAJZG9ja2VyIHRhZyAkRE9DS0VSTkFNRSAkTkFNRQogCWRvY2tlciB0YWcgJERPQ0tFUk5BTUUg
JFJFRk5BTUUKIAlkb2NrZXIgdGFnICRET0NLRVJOQU1FICRDT01NSVROQU1FCiBlbHNlCi0JZWNo
byAiQnVpbGRpbmcgJE5BTUU6JFRBRyIKKwllY2hvICJCdWlsZGluZyEiCiAJZG9ja2VyIGJ1aWxk
IC0tYnVpbGQtYXJnPUNJX0NPTU1JVF9TSEE9JENJX0NPTU1JVF9TSEEgXAogCQkJIC10ICRET0NL
RVJOQU1FIC10ICROQU1FIFwKIAkJCSAtdCAkUkVGTkFNRSAtdCAkQ09NTUlUTkFNRSAtZiAkRE9D
S0VSRklMRSAuCkBAIC01MSw3ICs1MSwzIEBAIGVsc2UKIGZpCiBkb2NrZXIgcHVzaCAkUkVGTkFN
RQogZG9ja2VyIHB1c2ggJENPTU1JVE5BTUUKLWlmIFsgJFRBRyA9ICJtYXN0ZXIiIF07IHRoZW4K
LQlkb2NrZXIgdGFnICRDSEVDS05BTUUgJElNQUdFTkFNRQotCWRvY2tlciBwdXNoICRJTUFHRU5B
TUUKLWZpCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dg==
