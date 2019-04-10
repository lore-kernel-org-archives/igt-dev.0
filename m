Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 295188949C
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2019 11:32:13 +0000 (UTC)
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Date: Wed, 10 Apr 2019 14:32:02 +0300
Message-Id: <20190410113205.3486-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] [PATCH i-g-t v9 0/3] kms_atomic_transition improvements
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
Cc: stanislav.lisovskiy@intel.com, ville.syrjala@intel.com, martin.peres@intel.com, juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Rml4ZWQgcnVuX3RyYW5zaXRpb25fdGVzdCBpc3N1ZSwgd2hpY2ggbWlnaHQgaGFwcGVuIHdoZW4g
bm8gY2hhbmdlcwphcmUgZG9uZSBhbmQgd2FpdF90cmFuc2l0aW9uIGlzIGNhbGxlZCBhbmQgbWFk
ZSBzZXR1cF9wYXJtcyBmdW5jdGlvbgp0b2xlcmF0ZSBpZiBrZXJuZWwgY2FuJ3QgYWZmb3JkIGhh
dmluZyBhbGwgc3ByaXRlIHBsYW5lcyBlbmFibGVkCmRlcGVuZGluZyBvbiBjdXJyZW50IG1vZGUu
IFJlbW92ZSByZWR1bmRhbnQgY29uZGl0aW9uIG5lc3RpbmcgYW5kIGNvZGUuCgpTdGFuaXNsYXYg
TGlzb3Zza2l5ICgzKToKICBpZ3QvdGVzdHM6IFJlbW92ZSByZWR1bmRhbnQgYWxwaGEgcmV0cnkK
ICBpZ3QvdGVzdHMva21zX2F0b21pY190cmFuc2l0aW9uOiBTa2lwIHRyYW5zaXRpb24sIGlmIG5v
IGNoYW5nZXMgZG9uZQogIGlndC90ZXN0cy9rbXNfYXRvbWljX3RyYW5zaXRpb246IFRvbGVyYXRl
IGlmIGNhbid0IGhhdmUgYWxsIHBsYW5lcwoKIHRlc3RzL2ttc19hdG9taWNfdHJhbnNpdGlvbi5j
IHwgMTE1ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA2NyBpbnNlcnRpb25zKCspLCA0OCBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
