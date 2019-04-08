Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D2589173
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Apr 2019 10:15:54 +0000 (UTC)
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Date: Mon,  8 Apr 2019 13:15:42 +0300
Message-Id: <20190408101544.24715-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] [PATCH i-g-t v6 0/2] kms_atomic_transition improvements
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
Cc: ville.syrjala@intel.com, martin.peres@intel.com, stanislav.lisovskiy@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Rml4ZWQgcnVuX3RyYW5zaXRpb25fdGVzdCBpc3N1ZSwgd2hpY2ggbWlnaHQgaGFwcGVuIHdoZW4g
bm8gY2hhbmdlcwphcmUgZG9uZSBhbmQgd2FpdF90cmFuc2l0aW9uIGlzIGNhbGxlZCBhbmQgbWFk
ZSBzZXR1cF9wYXJtcyBmdW5jdGlvbgp0b2xlcmF0ZSBpZiBrZXJuZWwgY2FuJ3QgYWZmb3JkIGhh
dmluZyBhbGwgc3ByaXRlIHBsYW5lcyBlbmFibGVkCmRlcGVuZGluZyBvbiBjdXJyZW50IG1vZGUu
IFJlbW92ZSByZWR1bmRhbnQgY29uZGl0aW9uIG5lc3RpbmcgYW5kIGNvZGUuCgpTdGFuaXNsYXYg
TGlzb3Zza2l5ICgyKToKICBpZ3QvdGVzdHMva21zX2F0b21pY190cmFuc2l0aW9uOiBTa2lwIHRy
YW5zaXRpb24sIGlmIG5vIGNoYW5nZXMgZG9uZQogIGlndC90ZXN0cy9rbXNfYXRvbWljX3RyYW5z
aXRpb246IFRvbGVyYXRlIGlmIGNhbid0IGhhdmUgYWxsIHBsYW5lcwoKIHRlc3RzL2ttc19hdG9t
aWNfdHJhbnNpdGlvbi5jIHwgMTQ2ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA4OCBpbnNlcnRpb25zKCspLCA1OCBkZWxldGlvbnMoLSkKCi0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
