Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E6C36E076
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Oct 2018 11:33:40 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Tue, 30 Oct 2018 13:33:21 +0200
Message-Id: <20181030113321.3892-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] [PATCH i-g-t] gitlab-ci: Build Docker images if
 Dockerfiles have changed
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

VGhlIGpvYnMgdGhhdCBidWlsZCBjb250YWluZXIgaW1hZ2VzIGFuZCB1cGxvYWQgdGhlbSB0byB0
aGUgcmVnaXN0cnkgZG8Kbm90IGhhdmUgdG8gYmUgbWFudWFsIGFueSBsb25nZXIuIEJ5IGxldmVy
YWdpbmcgdGhlIG5ldyBvbmx5LWNoYW5nZXMKZmVhdHVyZSwgd2UgY2FuIHRyaWdnZXIgdGhvc2Ug
am9icyBjb25kaXRpb25hbGx5IG9uIGFueSBhbHRlcmF0aW9ucyB0bwp0aGUgRG9ja2VyZmlsZXMu
CgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogUGV0cmkgTGF0dmFsYSA8
cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEFya2FkaXVzeiBIaWxlciA8
YXJrYWRpdXN6LmhpbGVyQGludGVsLmNvbT4KLS0tCiAuZ2l0bGFiLWNpLnltbCB8IDggKysrKysr
LS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvLmdpdGxhYi1jaS55bWwgYi8uZ2l0bGFiLWNpLnltbAppbmRleCBiZDFkZGI3OS4u
NTU1YTA1ZWUgMTAwNjQ0Ci0tLSBhLy5naXRsYWItY2kueW1sCisrKyBiLy5naXRsYWItY2kueW1s
CkBAIC05NCw4ICs5NCwxMCBAQCBwYWdlczoKIAogY29udGFpbmVyczppZ3QtZGViaWFuOgogICBz
dGFnZTogY29udGFpbmVycwotICB3aGVuOiBtYW51YWwKICAgaW1hZ2U6IGRvY2tlcjpzdGFibGUK
KyAgb25seToKKyAgICBjaGFuZ2VzOgorICAgICAgLSBEb2NrZXJmaWxlLmRlYmlhbgogICBzZXJ2
aWNlczoKICAgICAtIGRvY2tlcjpkaW5kCiAgIHZhcmlhYmxlczoKQEAgLTEwOCw4ICsxMTAsMTAg
QEAgY29udGFpbmVyczppZ3QtZGViaWFuOgogCiBjb250YWluZXJzOmlndC1mZWRvcmE6CiAgIHN0
YWdlOiBjb250YWluZXJzCi0gIHdoZW46IG1hbnVhbAogICBpbWFnZTogZG9ja2VyOnN0YWJsZQor
ICBvbmx5OgorICAgIGNoYW5nZXM6CisgICAgICAtIERvY2tlcmZpbGUuZmVkb3JhCiAgIHNlcnZp
Y2VzOgogICAgIC0gZG9ja2VyOmRpbmQKICAgdmFyaWFibGVzOgotLSAKMi4xNy4yCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcg
bGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
