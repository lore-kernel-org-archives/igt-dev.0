Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D186EC23
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Mar 2018 16:56:29 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Thu, 22 Mar 2018 17:56:26 +0100
Message-Id: <20180322165626.68731-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t] lib/igt_kms: Do not probe connectors during
 init.
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

TGV0cyBzZWUgaG93IG11Y2ggdGltZSB3ZSBjYW4gc2F2ZSBieSBub3QgcHJvYmluZyBjb25uZWN0
b3JzIGR1cmluZwpzY3JlZW4gaW5pdCwgYW5kIGlmIHdlIGNhdXNlIGFueSByZWdyZXNzaW9ucyBi
eSBub3QgcHJvYmluZy4KClNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVu
Lmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Ci0tLQogbGliL2lndF9rbXMuYyB8IDEgLQogMSBm
aWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9saWIvaWd0X2ttcy5jIGIv
bGliL2lndF9rbXMuYwppbmRleCBkOGY2OWQzZGI5Y2EuLjllMzJmNDA2NzNiYiAxMDA2NDQKLS0t
IGEvbGliL2lndF9rbXMuYworKysgYi9saWIvaWd0X2ttcy5jCkBAIC0yMDI4LDcgKzIwMjgsNiBA
QCB2b2lkIGlndF9kaXNwbGF5X2luaXQoaWd0X2Rpc3BsYXlfdCAqZGlzcGxheSwgaW50IGRybV9m
ZCkKIAkJICogV2UgZG9uJ3QgYXNzaWduIGVhY2ggb3V0cHV0IGEgcGlwZSB1bmxlc3MKIAkJICog
YSBwaXBlIGlzIHNldCB3aXRoIGlndF9vdXRwdXRfc2V0X3BpcGUoKS4KIAkJICovCi0JCW91dHB1
dC0+Zm9yY2VfcmVwcm9iZSA9IHRydWU7CiAJCW91dHB1dC0+aWQgPSByZXNvdXJjZXMtPmNvbm5l
Y3RvcnNbaV07CiAJCW91dHB1dC0+ZGlzcGxheSA9IGRpc3BsYXk7CiAKLS0gCjIuMTYuMgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
