Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4171910E02A
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 15:44:01 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ac90178fdaso127312711fa.3
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 08:44:01 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 16 May 2023 18:43:25 +0300
Message-Id: <20230516154329.9002-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] Add Meteorlake CCS support
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

Import fourcc codes from kernel and built support for MTL 4-tile aux ccs type
compression support for render and vebox copy paths.

/Juha-Pekka

Juha-Pekka Heikkila (4):
  drm/fourcc: Import drm_fourcc header from commit c7c12de893f8
    ("drm/fourcc: define Intel Meteorlake related ccs modifiers")
  lib/mtl: Add MTL related tile4 ccs modifiers handling
  tests/i915/kms_ccs: enable mtl aux ccs tests
  tests/kms_getfb: Add meteorlake related ccs modifiers

 include/drm-uapi/drm_fourcc.h | 156 +++++++++++++++++++++++++++++++---
 lib/igt_fb.c                  |  30 +++++--
 lib/intel_aux_pgtable.c       |  79 ++++++++++++-----
 lib/intel_batchbuffer.c       |  15 +++-
 lib/rendercopy.h              |   8 ++
 lib/rendercopy_gen9.c         |  44 +++++++++-
 lib/veboxcopy_gen12.c         |  79 ++++++++---------
 tests/i915/kms_ccs.c          |   6 +-
 tests/kms_getfb.c             |  13 ++-
 9 files changed, 345 insertions(+), 85 deletions(-)

-- 
2.25.1
