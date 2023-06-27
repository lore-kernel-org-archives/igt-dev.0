Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2C210E316
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 17:22:19 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b6a6f224a1so31335941fa.1
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 10:22:19 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Jun 2023 20:22:07 +0300
Message-Id: <20230627172210.4599-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Include intel_blt funtions to blitter
 path for igt_fb.c
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Here start to use copy engine for doing rc ccs on Intel hw with flat ccs. This
will replace usage of use of rendercopy on framebuffer creation with i915
devices with flat ccs.

Juha-Pekka Heikkila (3):
  lib/intel_blt: Add offset to block and fast copy
  lib/igt_fb: include lib/intel_blt functions to blitter path
  lib/igt_fb: On blitter path take clear color modifier into account

 lib/igt_fb.c    | 216 ++++++++++++++++++++++++++++++++++++++++++------
 lib/intel_blt.c |  12 ++-
 lib/intel_blt.h |   3 +
 3 files changed, 202 insertions(+), 29 deletions(-)

-- 
2.25.1
