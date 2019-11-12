Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6C26EB25
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2019 11:55:43 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Tue, 12 Nov 2019 13:55:35 +0200
Message-Id: <20191112115538.10483-1-mika.kahola@intel.com>
Subject: [igt-dev] [PATCH i-g-t v5 0/3] GEN12 render decompression
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
dWJ0ZXN0IGV4ZWN1dGlvbiBhbmQgbGlzdGluZwp2NTogUmVhbGlnbiBtYWluIGFuZCBhdXggc3Vy
ZmFjZXMgKEltcmUpCgpNaWthIEthaG9sYSAoMyk6CiAgRm9ybWF0IG1vZGlmaWVyIGZvciBJbnRl
bCBHZW4tMTIgcmVuZGVyIGNvbXByZXNzaW9uCiAgbGliL2lndF9mYi5jOiBVcGRhdGUgdGlsZSBz
aXplcyBmb3IgR0VOMTIgQ0NTCiAgdGVzdHMva21zX2NjczogQWRkIEdFTjEyIENDUyByZW5kZXIg
Y29tcHJlc3Npb24gZm9ybWF0IG1vZGlmaWVycwoKIGluY2x1ZGUvZHJtLXVhcGkvZHJtX2ZvdXJj
Yy5oIHwgICAxICsKIGxpYi9pZ3RfZmIuYyAgICAgICAgICAgICAgICAgIHwgIDc3ICsrKysrKysr
KysrKysrKysrKysrLS0tLQogbGliL2lvY3RsX3dyYXBwZXJzLmggICAgICAgICAgfCAgIDEgKwog
dGVzdHMva21zX2Njcy5jICAgICAgICAgICAgICAgfCAxMTAgKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLQogNCBmaWxlcyBjaGFuZ2VkLCAxMzMgaW5zZXJ0aW9ucygrKSwgNTYgZGVs
ZXRpb25zKC0pCgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXY=
