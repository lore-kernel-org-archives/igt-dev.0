Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3276E885
 for <igt-dev@lists.freedesktop.org>; Sat, 20 Jul 2019 01:37:50 +0000 (UTC)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Fri, 19 Jul 2019 18:37:35 -0700
Message-Id: <20190720013735.11953-2-dhinakaran.pandiyan@intel.com>
In-Reply-To: <20190720013735.11953-1-dhinakaran.pandiyan@intel.com>
References: <20190720013735.11953-1-dhinakaran.pandiyan@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tools/vbt_decode: Fix PSR2 decoded
 training pattern duration
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Tm90aWNlZCB0aGF0IEkgaW50cm9kdWNlZCBhIHR5cG8sIHRoZSB2YWx1ZSBjb3JyZXNwb25kaW5n
IDB4MyBpbiB0aGUgUFNSMgpUUDIvVFAzIGZpZWxkIGlzIDUwdXMgbm90IDV1cy4KCkNjOiBWaWxs
ZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5
OiBEaGluYWthcmFuIFBhbmRpeWFuIDxkaGluYWthcmFuLnBhbmRpeWFuQGludGVsLmNvbT4KLS0t
CiB0b29scy9pbnRlbF92YnRfZGVjb2RlLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90b29scy9pbnRlbF92YnRfZGVj
b2RlLmMgYi90b29scy9pbnRlbF92YnRfZGVjb2RlLmMKaW5kZXggZWE2NGVlZTIuLjRhZjk0NGNk
IDEwMDY0NAotLS0gYS90b29scy9pbnRlbF92YnRfZGVjb2RlLmMKKysrIGIvdG9vbHMvaW50ZWxf
dmJ0X2RlY29kZS5jCkBAIC0xMDE1LDcgKzEwMTUsNyBAQCBzdGF0aWMgdm9pZCBkdW1wX3Bzcihz
dHJ1Y3QgY29udGV4dCAqY29udGV4dCwKIAogCQlpZiAoY29udGV4dC0+YmRiLT52ZXJzaW9uID49
IDIyNikgewogCQkJaW50IGluZGV4OwotCQkJc3RhdGljIGNvbnN0IHVpbnQxNl90IHBzcjJfdHBf
dGltZXNbXSA9IHs1MDAsIDEwMCwgMjUwMCwgNX07CisJCQlzdGF0aWMgY29uc3QgdWludDE2X3Qg
cHNyMl90cF90aW1lc1tdID0gezUwMCwgMTAwLCAyNTAwLCA1MH07CiAKIAkJCWluZGV4ID0gKHBz
cjJfdHBfdGltZSA+PiAoaSAqIDIpKSAmIDB4MzsKIAkJCXByaW50ZigiXHRcdFBTUjIgVFAyL1RQ
MyB3YWtldXAgdGltZTogJWQgdXNlYyAoMHgleClcbiIsCi0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
