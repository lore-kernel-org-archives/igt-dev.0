Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92126EB1B
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Mar 2021 05:45:52 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Wed, 24 Mar 2021 22:45:34 -0700
Message-Id: <20210325054549.465386-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 00/15] Introduce PXP Test
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

This series adds i915_pxp tests for the new PXP subsystem currently
being reviewed at https://patchwork.freedesktop.org/series/86798/ .
This series currently includes 4 groups of tests addressing the
features and restrictions described by Daniele's series :
   1. test i915 interfaces for allocation of protected bo's
      and contexts and enforcement of UAPI rule disallowing the
      modification of parameters after it's been created.
   2. verify PXP subsystem protected sessions generate encrypted
      content on protected output buffers and decrypt protected
      inputs buffers.
   3. verify i915 PXP auto-teardown succeeds on suspend-resume
      cycles and gem-exec of stale protected assets fail. Ensure
      protected-contexts adhere to stricter invalidation
      enforcement upon teardown event.
   4. Ensure that display plane decryption works as expected with
      protected buffers with and without HDCP.

Changes from prior rev1 to now:
   v2: 
      - Addressed all rev1 review comments except these:
           1.Chris Wilson : "...have the caller do 1-3 once for its protected
             context. Call it something like intel_bb_enable_pxp(),
             intel_bb_set_pxp if it should be reversible.".
             -  This couldn't be implemented because [1] HW needs different
             instruction sequences for enabling/disabling PXP depending
             on the engine class and [2] the pair of "pxp-enable" and "pxp-
             disable" instructions need to be contained within the same batch
             that is dispatched to the hardware. That said, implementing
             internal intel_batchbuffer funtionality for this would conflict
             with how rendercopy_gen9 uses batch buffer memory by repositioing
             the pointer and consuming unused portions of the batch buffer as
             3d state offsets that batchbuffer has no visibility.
         
      - Added these additional subtests:
           1. verify that buffer sharing works across testing pxp context.
           2. verify teardown bans contexts via DRM_IOCTL_I915_GET_RESET_STAT.
           3. verify display plane decryption of protected buffers.

Alan Previn (14):
  Sync i915_drm.h UAPI for PXP
  Add basic PXP testing of buffer and context alloc
  Perform a regular 3d copy as a control checkpoint
  Add PXP attribute support in batchbuffer and buffer_ops libs
  Add MI_SET_APPID instruction definition
  Enable protected session cmd in gen12_render_copyfunc
  Add subtest to copy raw source to protected dest
  Add test where both src and dest are protected
  Verify PXP teardown occured through suspend-resume
  Verify execbuf fails with stale PXP context after teardown
  Verify execbuf fails with stale PXP buffer after teardown
  Verify execbuf ok with stale prot-buff and regular context
  Ensure RESET_STAT reports invalidated protected context
  Verify protected surfaces are dma buffer sharable

Karthik B S (1):
  tests/i915_pxp: CRC validation for display tests.

 include/drm-uapi/i915_drm.h |   94 ++-
 lib/intel_batchbuffer.c     |   23 +-
 lib/intel_batchbuffer.h     |   30 +
 lib/intel_bufops.h          |   15 +
 lib/intel_reg.h             |    9 +
 lib/rendercopy_gen9.c       |   73 +-
 tests/Makefile.sources      |    3 +
 tests/i915/gem_pxp.c        | 1420 +++++++++++++++++++++++++++++++++++
 tests/meson.build           |    1 +
 9 files changed, 1659 insertions(+), 9 deletions(-)
 create mode 100644 tests/i915/gem_pxp.c

-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
