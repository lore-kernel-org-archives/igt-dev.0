Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 005546E8AA
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Nov 2019 11:00:52 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Mon, 11 Nov 2019 13:00:46 +0200
Message-Id: <20191111110049.32719-1-mika.kahola@intel.com>
Subject: [igt-dev] [PATCH i-g-t v4 0/3] GEN12 render decompression
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

R2VuLTEyIHJlbmRlciBkZWNvbXByZXNzaW9uIGlzIHN1cHBvcnRlZCB3aXRoIFktdGlsZWQgbWFp
biBzdXJmYWNlLgpUaGUgcGF0Y2ggc2VyaWVzIGludHJvZHVjZXMgQ0NTIHN1cHBvcnQgZm9yIElH
VCB0ZXN0cy4KClRoaXMgcGF0Y2ggc2VyaWVzIHJlcXVpcmVzIEltcmUncyBzZXJpZXMKCmh0dHBz
Oi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjg4OTAvCgp2MjogQWRkZWQgbmV3
IHN1YnRlc3RzIGZvciBlYWNoIGZvcm1hdCBtb2RpZmllci4KdjM6IEFkZCBJR1QgZGVzY3JpcHRp
b24gZm9yIGVhY2ggc3VidGVzdCAoR2l0TGFiKQp2NDogRml4IGttc19jY3MgZXJyb3Jub3VzZSBz
dWJ0ZXN0IGV4ZWN1dGlvbiBhbmQgbGlzdGluZwoKTWlrYSBLYWhvbGEgKDMpOgogIEZvcm1hdCBt
b2RpZmllciBmb3IgSW50ZWwgR2VuLTEyIHJlbmRlciBjb21wcmVzc2lvbgogIGxpYi9pZ3RfZmIu
YzogVXBkYXRlIHRpbGUgc2l6ZXMgZm9yIEdFTjEyIENDUwogIHRlc3RzL2ttc19jY3M6IEFkZCBH
RU4xMiBDQ1MgcmVuZGVyIGNvbXByZXNzaW9uIGZvcm1hdCBtb2RpZmllcnMKCiBpbmNsdWRlL2Ry
bS11YXBpL2RybV9mb3VyY2MuaCB8ICAgMSArCiBsaWIvaWd0X2ZiLmMgICAgICAgICAgICAgICAg
ICB8ICAzNCArKysrKysrKysrLQogbGliL2lvY3RsX3dyYXBwZXJzLmggICAgICAgICAgfCAgIDEg
KwogdGVzdHMva21zX2Njcy5jICAgICAgICAgICAgICAgfCAxMTAgKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLQogNCBmaWxlcyBjaGFuZ2VkLCA5OSBpbnNlcnRpb25zKCspLCA0NyBk
ZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldg==
