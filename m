Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD68E6E15D
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Oct 2018 13:00:10 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Wed, 24 Oct 2018 16:00:01 +0300
Message-Id: <20181024130004.12770-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] [PATCH i-g-t 1/4] gitlab-ci: Parametrize images used with
 CI_ variables
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
Cc: Petri Latvala <petri.latvala@intel.com>, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIGNvbnRhaW5lciBzdGFnZSB3YXMgYWxyZWFkeSB1c2luZyBDSV8gdmFyaWFibGVzLCBwdXNo
aW5nIHRvIHRoZQpyaWdodCByZWdpc3RyeS4gTGV0J3MgZG8gdGhhdCBmb3IgdGhlIHB1bGxpbmcg
Y29udGFpbmVycyB0b28uCgpTaWduZWQtb2ZmLWJ5OiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVz
ei5oaWxlckBpbnRlbC5jb20+Ci0tLQogLmdpdGxhYi1jaS55bWwgfCA0ICsrLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvLmdp
dGxhYi1jaS55bWwgYi8uZ2l0bGFiLWNpLnltbAppbmRleCBhOTA5NjFiNi4uMDMwYjM0MDUgMTAw
NjQ0Ci0tLSBhLy5naXRsYWItY2kueW1sCisrKyBiLy5naXRsYWItY2kueW1sCkBAIC0xLDQgKzEs
NCBAQAotaW1hZ2U6IHJlZ2lzdHJ5LmZyZWVkZXNrdG9wLm9yZy9kcm0vaWd0LWdwdS10b29scy9p
Z3QtZmVkb3JhOmxhdGVzdAoraW1hZ2U6ICRDSV9SRUdJU1RSWS8kQ0lfUFJPSkVDVF9QQVRIL2ln
dC1mZWRvcmE6bGF0ZXN0CiB2YXJpYWJsZXM6CiAgIE1FU09OX09QVElPTlM6ID4KICAgICAtRHdp
dGhfbGliZHJtPWludGVsLG5vdXZlYXUsYW1kZ3B1CkBAIC0yNyw3ICsyNyw3IEBAIGJ1aWxkOnRl
c3RzLWZlZG9yYToKICAgICAgIC0gYnVpbGQKIAogYnVpbGQ6dGVzdHMtZGViaWFuOgotICBpbWFn
ZTogcmVnaXN0cnkuZnJlZWRlc2t0b3Aub3JnL2RybS9pZ3QtZ3B1LXRvb2xzL2lndC1kZWJpYW46
bGF0ZXN0CisgIGltYWdlOiAkQ0lfUkVHSVNUUlkvJENJX1BST0pFQ1RfUEFUSC9pZ3QtZGViaWFu
OmxhdGVzdAogICBzdGFnZTogYnVpbGQKICAgc2NyaXB0OgogICAgIC0gbWVzb24gJE1FU09OX09Q
VElPTlMgYnVpbGQKLS0gCjIuMTcuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2Cg==
