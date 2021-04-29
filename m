Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45ED6F49A
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Apr 2021 19:26:34 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Thu, 29 Apr 2021 22:26:25 +0300
Message-Id: <20210429192628.4056795-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/3] lib/igt_fb: A few changes to fix test
 runs on ADL_P
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBwYXRjaHNldCBmaXhlcyBhIGZldyB0aGluZ3MgSSBuZWVkZWQgdG8gbWFrZSB0ZXN0cyBw
YXNzIG9uIEFETF9QCih3aXRoIG90aGVyIHBhdGNoZXMgd2FpdGluZyBzdGlsbCBmb3IgdXBzdHJl
YW1pbmcgaW4gYW4gaW50ZXJuYWwKYnJhbmNoKS4KCkNjOiBQYXVsIEtvY2lhbGtvd3NraSA8cGF1
bC5rb2NpYWxrb3dza2lAYm9vdGxpbi5jb20+CkNjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQu
Y29tPgpDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KQ2M6IERv
bWluaWsgR3J6ZWdvcnplayA8ZG9taW5pay5ncnplZ29yemVrQGludGVsLmNvbT4KQ2M6IFpiaWdu
aWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPgpDYzogSnVo
YS1QZWtrYSBIZWlra2lsYSA8anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT4KQ2M6IE1pa2Eg
S2Fob2xhIDxtaWthLmthaG9sYUBpbnRlbC5jb20+CkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tPgoKSW1yZSBEZWFrICgzKToKICB0ZXN0cy9rbXNfY2Nz
OiBTa2lwIENDUyBjb2xvciBjbGVhciB2YWx1ZSBjaGVjayBmb3IgcmFuZG9taXppbmcKICAgIHN1
YnRlc3RzCiAgbGliL2lndF9mYjogRml4IHN0cmlkZSBmb3IgcmVuZGVyX2NvcHkgYmFzZWQgRkIg
Y29udmVyc2lvbnMKICBsaWIvaWd0X2ZiOiBSZW1vdmUgcmVkdW5kYW50IFZDNCBTQU5EIHBsYW5l
IHNpemUgYWxpZ25tZW50CgogbGliL2lndF9mYi5jICAgICAgIHwgMTAgKystLS0tLS0tLQogbGli
L2ludGVsX2J1Zm9wcy5jIHwgMjUgKysrKysrKysrKysrKysrKystLS0tLS0tLQogbGliL2ludGVs
X2J1Zm9wcy5oIHwgIDMgKystCiB0ZXN0cy9rbXNfY2NzLmMgICAgfCAgNiArKystLS0KIDQgZmls
ZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCgotLSAKMi4yNy4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
