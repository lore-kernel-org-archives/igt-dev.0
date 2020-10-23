Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8D26E0FF
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2020 13:07:09 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Fri, 23 Oct 2020 16:05:24 +0300
Message-Id: <20201023130526.3983076-1-mika.kahola@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v7 0/2] tests/kms_ccs: CCS Clear Color test
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

Signed-off-by: Mika Kahola <mika.kahola@intel.com>

Mika Kahola (2):
  tests/kms_ccs: Add debug information on format modifier
  tests/kms_ccs: CCS Clear Color test

 lib/gen8_render.h       |   1 +
 lib/gen9_render.h       |   6 ++-
 lib/intel_batchbuffer.c |  10 ++++
 lib/intel_batchbuffer.h |   6 +++
 lib/rendercopy.h        |   4 ++
 lib/rendercopy_gen9.c   |  79 +++++++++++++++++++++++-----
 tests/kms_ccs.c         | 112 +++++++++++++++++++++++++++++++++++-----
 7 files changed, 192 insertions(+), 26 deletions(-)

-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
