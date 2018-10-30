Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0026E113
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Oct 2018 12:22:24 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id x2-v6so10287218eds.3
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Oct 2018 05:22:23 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 30 Oct 2018 13:22:13 +0100
Message-Id: <20181030122215.1634-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20181030122215.1634-1-daniel.vetter@ffwll.ch>
References: <20181030122215.1634-1-daniel.vetter@ffwll.ch>
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
UmV2aWV3ZWQtYnk6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+ClJldmlld2VkLWJ5OiBQ
ZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogRGFu
aWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Ci0tLQogLmdpdGxhYi1jaS55bWwg
fCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvLmdpdGxhYi1jaS55bWwgYi8uZ2l0bGFiLWNpLnltbAppbmRleCA1NTVhMDVlZWQyNDkuLmUw
MjUxZDBhNTZlNCAxMDA2NDQKLS0tIGEvLmdpdGxhYi1jaS55bWwKKysrIGIvLmdpdGxhYi1jaS55
bWwKQEAgLTksNiArOSw3IEBAIHZhcmlhYmxlczoKICAgICAtRGJ1aWxkX21hbj10cnVlCiAgICAg
LURidWlsZF90ZXN0cz10cnVlCiAgICAgLURidWlsZF9ydW5uZXI9dHJ1ZQorICAgIC1Ed2l0aF9s
aWJ1bndpbmQ9dHJ1ZQogCiBzdGFnZXM6CiAgIC0gY29udGFpbmVycwpAQCAtMjcsNiArMjgsMTMg
QEAgYnVpbGQ6dGVzdHMtZmVkb3JhOgogICAgIHBhdGhzOgogICAgICAgLSBidWlsZAogCitidWls
ZDp0ZXN0cy1mZWRvcmEtbm8tbGlidW53aW5kOgorICBzdGFnZTogYnVpbGQKKyAgc2NyaXB0Ogor
ICAgIC0gZG5mIHJlbW92ZSAteSBsaWJ1bndpbmQtZGV2ZWwKKyAgICAtIG1lc29uIC1EbGlidW53
aW5kPWZhbHNlIGJ1aWxkCisgICAgLSBuaW5qYSAtQyBidWlsZAorCiAjIGRvY3VtZW50YXRpb24g
YnVpbGRpbmcgaXMgZGlmZmVyZW50IHdpdGggbWVzb248MC40NwogYnVpbGQ6dGVzdHMtZmVkb3Jh
LW9sZGVzdC1tZXNvbjoKICAgc3RhZ2U6IGJ1aWxkCi0tIAoyLjE5LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
