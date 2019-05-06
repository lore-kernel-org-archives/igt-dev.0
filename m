Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A404D8987A
 for <igt-dev@lists.freedesktop.org>; Mon,  6 May 2019 11:29:27 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Mon,  6 May 2019 16:54:33 +0530
Message-Id: <1557141877-12662-1-git-send-email-anshuman.gupta@intel.com>
Subject: [igt-dev] [PATCH i-g-t v4 0/4] igt/i915/i915_pm_lpsp enable pm_lpsp
 for platforms till Gen11 v4
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

aTkxNV9wbV9scHNwIHBhdGNoLCBzZW5kaW5nIHY0IHZlcnNpb24gYWZ0ZXIgYWRkcmVzc2luZwpy
ZXZpZXcgY29tbWVudHMgYW5kIGZpeGluZyBJR1QgZmFpbHVyZXMgZm9yIHRlc3QgbWV0aG9kLgoK
VGhpcyBzZXJpZXMgaGFzIGFkZGVkIGk5MTVfcG1fbHBzcCBzdWJ0ZXN0cyB0byBDSSBmYXN0CmZl
ZWRiYWNrIGxpc3QgaW4gb3JkZXIgdG8gcnVuIGNvdmVyIHRoZXNlIHN1YnRlc3Qgb24gYWxsCmFm
ZmVjdGVkIHBsYXRmb3Jtcy4KClJldmlzaW9uIDEgTGluazogIGh0dHBzOi8vcGF0Y2h3b3JrLmZy
ZWVkZXNrdG9wLm9yZy9zZXJpZXMvNTgwNTEvClJldmlzaW9uIDIgTGluazogIGh0dHBzOi8vcGF0
Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNTkwNDgvCiAKQW5zaHVtYW4gR3VwdGEgKDQp
OgogIGlndC9pOTE1L2k5MTVfcG1fbHBzcCBlbmFibGUgcG1fbHBzcCBmb3IgcGxhdGZvcm1zIHRp
bGwgR2VuMTEuCiAgaWd0L2k5MTUvaTkxNV9wbV9scHNwIGNoZWNrIGxwc3AgcmVsZXZhbmNlIG9u
IG5vbiBlZHAgcGFuZWwuCiAgaWd0L2k5MTUvaTkxNV9wbV9scHNwIHNraXAgZWRwLXBhbmVsLWZp
dHRlciB0ZXN0LgogIERPX05PVF9NRVJHRSBhZGQgaTkxNV9wbV9scHNwIHN1YnRlc3RzIHRvIENJ
IGZhc3QgZmVlZGJhY2sgbGlzdC4KCiB0ZXN0cy9pOTE1L2k5MTVfcG1fbHBzcC5jICAgICAgICAg
ICAgIHwgMTQzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0KIHRlc3RzL2ludGVs
LWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxpc3QgfCAgIDQgKwogMiBmaWxlcyBjaGFuZ2VkLCAxMjkg
aW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCgotLSAKMi43LjQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
