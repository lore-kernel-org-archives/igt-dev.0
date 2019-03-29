Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA8A96E8C1
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2019 11:29:07 +0000 (UTC)
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Date: Fri, 29 Mar 2019 13:28:58 +0200
Message-Id: <20190329112901.27830-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] [PATCH i-g-t v1 0/3] kms_atomic_transition improvements
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

U2ltcGxpZmllZCBwbGFuZSBwYXJhbWV0ZXIgaW5pdGlhbGl6YXRpb24gY29kZSwgZml4ZWQgcnVu
X3RyYW5zaXRpb25fdGVzdAppc3N1ZSwgd2hpY2ggbWlnaHQgaGFwcGVuIHdoZW4gbm8gY2hhbmdl
cyBhcmUgZG9uZSBhbmQgd2FpdF90cmFuc2l0aW9uIGlzCmNhbGxlZCBhbmQgbWFkZSBzZXR1cF9w
YXJtcyBmdW5jdGlvbiB0b2xlcmF0ZSBpZiBrZXJuZWwgY2FuJ3QgYWZmb3JkCmhhdmluZyBhbGwg
c3ByaXRlIHBsYW5lcyBlbmFibGVkIGRlcGVuZGluZyBvbiBjdXJyZW50IG1vZGUuCgpTdGFuaXNs
YXYgTGlzb3Zza2l5ICgzKToKICBpZ3QvdGVzdHMva21zX2F0b21pY190cmFuc2l0aW9uOiBTa2lw
IHRyYW5zaXRpb24sIGlmIG5vIGNoYW5nZXMgZG9uZQogIGlndC90ZXN0czogUmVtb3ZlIHJlZHVu
ZGFudCBjb2RlIGluIGttc19hdG9taWNfdHJhbnNpdGlvbgogIGlndC90ZXN0czogVG9sZXJhdGUg
aWYga2VybmVsIGNhbid0IGhhdmUgYWxsIHBsYW5lcwoKIHRlc3RzL2ttc19hdG9taWNfdHJhbnNp
dGlvbi5jIHwgODYgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspLCAzOCBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
