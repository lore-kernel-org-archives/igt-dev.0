Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 670906E893
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2020 09:36:52 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Fri, 20 Nov 2020 11:36:42 +0200
Message-Id: <20201120093646.1340401-1-mika.kahola@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v10 0/4] tests/kms_ccs: CCS Clear Color test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

The patch proposes a method to test CCS with clear color
capability.

The test paints a solid color on primary fb and a small sprite fb.
These are cleared with fast clear feature. A crc is captured and
compared against the reference.

v2: Modify _gen9_render_copyfunc to support fast clear (Matt)
    Enable fast clear bit on 3D sequence (Matt)
    Add helper function to figure out clear color modifier (Matt)
v3: Remove unrelated line additions/removes
v4: Fast clear with color (Imre)
v5: Write raw 32-bit color values to register (Imre)
    Require 32-bit color format
v6: Rebase to use batchbuffer without libdrm dependency
v7: Enable clear color (Nanley)
v8: Various cleanups (Imre)
v9: Splitting patch series into three patches (Imre)
v10: Remove switch from CCS CC modifier check (Imre)
     Color map conversion (Imre)
     Separate function to check CCS CC plane (Imre)
     Removed left-over comment (Imre)
     Replace inte_bb_reset() with intel_bb_sync() and
     intel_bb_destroy() when cleaning up (Imre)
     Fix logic to test CCS clear color only with
     XRGB8888 format (Imre)
     Move fast clear to it's own function (Imre)

Mika Kahola (4):
  tests/kms_ccs: Add debug information on format modifier
  lib/rendercopy: Enable fast clear
  lib/intel_aux_pgtable: Initialize aux pagetable for fast clear
  tests/kms_ccs: CCS Clear Color test

 lib/gen8_render.h       |   1 +
 lib/gen9_render.h       |   6 +-
 lib/igt_fb.c            |  20 +++--
 lib/igt_fb.h            |   3 +
 lib/intel_aux_pgtable.c |  39 +++++++---
 lib/intel_batchbuffer.c |   5 ++
 lib/intel_batchbuffer.h |   6 ++
 lib/rendercopy.h        |   4 +
 lib/rendercopy_gen9.c   | 167 ++++++++++++++++++++++++++++------------
 tests/kms_ccs.c         |  93 ++++++++++++++++++----
 10 files changed, 263 insertions(+), 81 deletions(-)

-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
