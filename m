Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE9989A0E
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Oct 2018 08:10:39 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id e2-v6so6449174edn.2
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Oct 2018 01:10:39 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 29 Oct 2018 09:10:28 +0100
Message-Id: <20181029081030.4041-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20181029081030.4041-1-daniel.vetter@ffwll.ch>
References: <20181029081030.4041-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/4] gitlab-ci: build test libunwind stubs
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
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
List-ID: <igt-dev@lists.freedesktop.org>

V2Ugd2FudCB0byBtYWtlIHN1cmUgdGhpcyBrZWVwcyB3b3JraW5nIG5pY2VseQoKQ2M6IFNlYW4g
UGF1bCA8c2VhbkBwb29ybHkucnVuPgpDYzogRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0Lm5ldD4K
U2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Ci0t
LQogLmdpdGxhYi1jaS55bWwgfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvLmdpdGxhYi1jaS55bWwgYi8uZ2l0bGFiLWNpLnltbAppbmRl
eCBiZDFkZGI3OWIxMTkuLjEyNjAxY2I3ZjIwMCAxMDA2NDQKLS0tIGEvLmdpdGxhYi1jaS55bWwK
KysrIGIvLmdpdGxhYi1jaS55bWwKQEAgLTksNiArOSw3IEBAIHZhcmlhYmxlczoKICAgICAtRGJ1
aWxkX21hbj10cnVlCiAgICAgLURidWlsZF90ZXN0cz10cnVlCiAgICAgLURidWlsZF9ydW5uZXI9
dHJ1ZQorICAgIC1Ed2l0aF9saWJ1bndpbmQ9dHJ1ZQogCiBzdGFnZXM6CiAgIC0gY29udGFpbmVy
cwpAQCAtMjcsNiArMjgsMTMgQEAgYnVpbGQ6dGVzdHMtZmVkb3JhOgogICAgIHBhdGhzOgogICAg
ICAgLSBidWlsZAogCitidWlsZDp0ZXN0cy1mZWRvcmEtbm8tbGlidW53aW5kOgorICBzdGFnZTog
YnVpbGQKKyAgc2NyaXB0OgorICAgIC0gZG5mIHJlbW92ZSAteSBsaWJ1bndpbmQtZGV2ZWwKKyAg
ICAtIG1lc29uIC1EbGlidW53aW5kPWZhbHNlIGJ1aWxkCisgICAgLSBuaW5qYSAtQyBidWlsZAor
CiAjIGRvY3VtZW50YXRpb24gYnVpbGRpbmcgaXMgZGlmZmVyZW50IHdpdGggbWVzb248MC40Nwog
YnVpbGQ6dGVzdHMtZmVkb3JhLW9sZGVzdC1tZXNvbjoKICAgc3RhZ2U6IGJ1aWxkCi0tIAoyLjE5
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
