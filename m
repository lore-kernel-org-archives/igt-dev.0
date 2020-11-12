Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9226E2C0
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2020 13:28:43 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Thu, 12 Nov 2020 15:28:33 +0200
Message-Id: <20201112132837.502142-1-mika.kahola@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v9 0/4] tests/kms_ccs: CCS Clear Color test
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
v9: Splitting patch into three patches (Imre)

Signed-off-by: Mika Kahola <mika.kahola@intel.com>

Mika Kahola (4):
  tests/kms_ccs: Add debug information on format modifier
  lib/igt_fb: Modify buffer creation
  lib/rendercopy: Add support for Clear Color
  tests/kms_ccs: CCS Clear Color test

 lib/gen8_render.h       |   1 +
 lib/gen9_render.h       |   6 +-
 lib/igt_fb.c            |  20 ++++--
 lib/igt_fb.h            |   3 +
 lib/intel_batchbuffer.c |  10 +++
 lib/intel_batchbuffer.h |   6 ++
 lib/rendercopy.h        |   4 ++
 lib/rendercopy_gen9.c   | 146 ++++++++++++++++++++++++++++------------
 tests/kms_ccs.c         |  82 ++++++++++++++++++----
 9 files changed, 214 insertions(+), 64 deletions(-)

-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
