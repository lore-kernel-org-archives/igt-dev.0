Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5758F6E3FB
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Jun 2019 15:55:05 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Wed, 19 Jun 2019 18:55:09 +0300
Message-Id: <20190619155518.25129-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 0/9] Chamelium port mapping auto-discovery
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
Cc: martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

NiB3b3JkczogTm8gTW9yZSBNYW51YWwgQ2hhbWVsaXVtIFBvcnQgQ29uZmlndXJhdGlvbiEKCjxp
bnNlcnQgUGV0cmktc3R5bGUgYWR2ZXJ0aXppbmcgc2F5aW5nIGhvdyBhd2Vzb21lIHRoaXMgcGF0
Y2hzZXQgaXM+CgpUaGlzIHBhdGNoc2V0IGFkZHMgYXV0by1kaXNjb3Zlcnkgb2YgdGhlIG1hcHBp
bmcgYmV0d2VlbiBDaGFtZWxpdW0gcG9ydCBJRHMgYW5kCkRSTSBjb25uZWN0b3JzLiBUaGlzIGlz
IGEgbmV3IHN0ZXAgcGVyZm9ybWVkIG9uIGluaXRpYWxpemF0aW9uLiBQZXItcG9ydCBFRElEcwph
cmUgdXNlZCB0byByZWNvZ25pemUgY29ubmVjdG9ycy4KCkluIGNhc2UgYSBzdGF0aWMgLmlndHJj
IG1hcHBpbmcgaXMgc2V0IHVwLCBpZ3RfY2hhbWVsaXVtIG5vdyBjaGVja3MgdGhhdCBpdCdzCm5v
dCBtaXMtY29uZmlndXJlZC4KCk1TVCBzdXBwb3J0IGlzIHN0aWxsIGEgVE9ETy4KClNpbW9uIFNl
ciAoOSk6CiAgbGliL2lndF9lZGlkOiBhZGQgZWRpZF9nZXRfc2l6ZQogIGxpYi9pZ3RfY2hhbWVs
aXVtOiBmaXggY2hhbWVsaXVtX3BvcnRfc2V0X2VkaWQgZG9jcwogIGxpYi9pZ3RfY2hhbWVsaXVt
OiBhbGxvdyBFRElEcyB0byBiZSBtdXRhdGVkIGZvciBlYWNoIHBvcnQKICBsaWIvaWd0X2NoYW1l
bGl1bTogc3BsaXQgY2htZWxpdW1fbmV3X2VkaWQKICBsaWIvaWd0X2NoYW1lbGl1bTogYWRkIENI
QU1FTElVTV9NQVhfUE9SVFMKICBsaWIvaWd0X2NoYW1lbGl1bTogdXBsb2FkIG9uZSBFRElEIHBl
ciBwb3J0CiAgbGliL2lndF9jaGFtZWxpdW06IHNldCBFRElEIHNlcmlhbAogIGxpYi9pZ3RfZWRp
ZDogYWRkIGVkaWRfZ2V0X21mZwogIGxpYi9pZ3RfY2hhbWVsaXVtOiBhdXRvZGlzY292ZXIgQ2hh
bWVsaXVtIHBvcnQgbWFwcGluZ3MKCiBsaWIvaWd0X2NoYW1lbGl1bS5jICAgfCAzMTMgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tCiBsaWIvaWd0X2NoYW1lbGl1bS5o
ICAgfCAgIDkgKysKIGxpYi9pZ3RfZWRpZC5jICAgICAgICB8ICAyMyArKysrCiBsaWIvaWd0X2Vk
aWQuaCAgICAgICAgfCAgIDIgKwogdGVzdHMva21zX2NoYW1lbGl1bS5jIHwgIDE3ICsrLQogNSBm
aWxlcyBjaGFuZ2VkLCAzMjcgaW5zZXJ0aW9ucygrKSwgMzcgZGVsZXRpb25zKC0pCgotLQoyLjIy
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
