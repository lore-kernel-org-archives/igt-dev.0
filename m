Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr0-x235.google.com (mail-wr0-x235.google.com
 [IPv6:2a00:1450:400c:c0c::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A866ED92
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2018 12:47:56 +0000 (UTC)
Received: by mail-wr0-x235.google.com with SMTP id 39so10138561wrb.10
 for <igt-dev@lists.freedesktop.org>; Thu, 01 Feb 2018 04:47:56 -0800 (PST)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Thu,  1 Feb 2018 12:47:43 +0000
Message-Id: <20180201124746.10641-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 0/3] perf_pmu reliability improvements
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KClNvbWUgcmV3
b3JrcyB0byBob3BlZnVsbHkgaW1wcm92ZSB0aGUgcmVsaWFiaWxpdHkgb2YgdGVzdHMgb24gc21h
bGwgY29yZQptYWNoaW5lcy4KCk1vc3RseSBlbnN1cmluZyBtZWFzdXJlZCBzbGVlcCBhcHByb2Fj
aCBpcyBhbHdheXMgdXNlZCBpbiB0ZXN0cyB3aGljaCBsb29rIGF0CnRpbWUsIGFuZCB0aGF0IHRp
bWUgc3BlbnQgc2V0dGluZyB1cCB0aGUgdGVzdCBpcyBpZ25vcmVkIGFzIG11Y2ggYXMgcG9zc2li
bGUuCgpUdnJ0a28gVXJzdWxpbiAoMyk6CiAgdGVzdHMvcGVyZl9wbXU6IFRpZ2h0ZW4gYnVzeSBt
ZWFzdXJlbWVudAogIHRlc3RzL3BlcmZfcG11OiBNb3JlIGJ1c3kgbWVhc3VyZW1lbnQgdGlnaHRl
bmluZwogIHRlc3RzL3BlcmZfcG11OiBVc2UgbWVhc3VyZWQgc2xlZXAgaW4gYWxsIHRpbWUgYmFz
ZWQgdGVzdHMKCiB0ZXN0cy9wZXJmX3BtdS5jIHwgMTAyICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2MCBpbnNl
cnRpb25zKCspLCA0MiBkZWxldGlvbnMoLSkKCi0tIAoyLjE0LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
