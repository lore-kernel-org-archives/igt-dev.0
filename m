Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3FE6E607
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Feb 2018 08:52:34 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Tue, 27 Feb 2018 09:52:28 +0100
Message-Id: <20180227085232.54025-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t v3 0/4] kms_panel_fitting and
 kms_frontbuffer_tracking cleanups.
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

a21zX2Zyb250YnVmZmVyX3RyYWNraW5nIGlzIHRoZSBzbG93ZXN0IHRlc3Qgb24gR0xLLCBtYWtl
IGl0IGEgbG90CmZhc3RlciBieSBjb252ZXJ0aW5nIGl0IHRvIHVzZSBpZ3RfZGlzcGxheSwgYW5k
IG5vdCBkb2luZyB0b28gbWFueQptb2Rlc2V0cyB3aGVuIGNvbGxlY3RpbmcgQ1JDJ3MuCgpNYWFy
dGVuIExhbmtob3JzdCAoNCk6CiAgdGVzdHMva21zX3BhbmVsX2ZpdHRpbmc6IFRlc3QgY2xlYW51
cHMuCiAgbGliL2lndF9rbXM6IEZpeCBpZ3RfcGxhbmVfcmVzZXQgdG8gaGFuZGxlIGN1cnNvciBw
bGFuZXMgY29ycmVjdGx5IHRvbwogIHRlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZzogQ29u
dmVydCB0ZXN0IHRvIHVzZSBpZ3RfZGlzcGxheSwgdjMuCiAgdGVzdHMva21zX2Zyb250YnVmZmVy
X3RyYWNraW5nOiBSZW1vdmUgcmVkdW5kYW50IG1vZGVzZXRzIGR1cmluZwogICAgc3VidGVzdCBz
dGFydC4KCiBsaWIvaWd0X2ttcy5jICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiB0ZXN0cy9r
bXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYyB8IDgwNCArKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KIHRlc3RzL2ttc19wYW5lbF9maXR0aW5nLmMgICAgICAgIHwgIDc0ICst
LS0KIDMgZmlsZXMgY2hhbmdlZCwgMzE1IGluc2VydGlvbnMoKyksIDU2NCBkZWxldGlvbnMoLSkK
Ci0tIAoyLjE2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
