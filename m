Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB2589DFC
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Oct 2018 13:32:30 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id z12-v6so7841576edp.7
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Oct 2018 06:32:30 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 31 Oct 2018 14:32:23 +0100
Message-Id: <20181031133223.30993-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] gitlab-ci: Depend docker images jobs on
 .gitlab-ci.yaml too
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
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T3RoZXJ3aXNlIGl0J3MgcmVhbGx5IGhhcmQgdG8gZ2V0IHRoZXNlIGpvYnMgdG8gcnVuIHdoZW4g
eW91IG5lZWQgdGhlbQp0b28gYmVjYXVzZSB5b3UgY2hhbmdlZCBzb21ldGhpbmcgd2l0aCB0aGUg
YnVpbGQgaW5zdHJ1Y3Rpb25zLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVs
LnZldHRlckBpbnRlbC5jb20+Ci0tLQogLmdpdGxhYi1jaS55bWwgfCAzICsrKwogMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhLy5naXRsYWItY2kueW1sIGIvLmdp
dGxhYi1jaS55bWwKaW5kZXggMmMxN2VjNjEzMTI4Li5iNDFkZjM3ZTZkN2MgMTAwNjQ0Ci0tLSBh
Ly5naXRsYWItY2kueW1sCisrKyBiLy5naXRsYWItY2kueW1sCkBAIC0xMjQsNiArMTI0LDcgQEAg
Y29udGFpbmVyczppZ3QtZGViaWFuOgogICBvbmx5OgogICAgIGNoYW5nZXM6CiAgICAgICAtIERv
Y2tlcmZpbGUuZGViaWFuCisgICAgICAtIC5naXRsYWItY2kueW1sCiAgIHNlcnZpY2VzOgogICAg
IC0gZG9ja2VyOmRpbmQKICAgdmFyaWFibGVzOgpAQCAtMTQwLDYgKzE0MSw3IEBAIGNvbnRhaW5l
cnM6aWd0LWRlYmlhbi1hcm02NDoKICAgb25seToKICAgICBjaGFuZ2VzOgogICAgICAgLSBEb2Nr
ZXJmaWxlLmRlYmlhbi1hcm02NAorICAgICAgLSAuZ2l0bGFiLWNpLnltbAogICBzZXJ2aWNlczoK
ICAgICAtIGRvY2tlcjpkaW5kCiAgIHZhcmlhYmxlczoKQEAgLTE1Niw2ICsxNTgsNyBAQCBjb250
YWluZXJzOmlndC1mZWRvcmE6CiAgIG9ubHk6CiAgICAgY2hhbmdlczoKICAgICAgIC0gRG9ja2Vy
ZmlsZS5mZWRvcmEKKyAgICAgIC0gLmdpdGxhYi1jaS55bWwKICAgc2VydmljZXM6CiAgICAgLSBk
b2NrZXI6ZGluZAogICB2YXJpYWJsZXM6Ci0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldgo=
