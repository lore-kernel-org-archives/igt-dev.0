Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFAEE6EE18
 for <igt-dev@lists.freedesktop.org>; Fri, 14 May 2021 06:49:56 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Thu, 13 May 2021 23:49:37 -0700
Message-Id: <20210514064953.1644250-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 00/16] Introduce PXP Test
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

This series adds gem_pxp tests for the new PXP subsystem currently
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

NOTE: Although this series is on a third revision, the feature
has not been merged into the kernel yet. One final revision may
be necesssary depending on whether additional UAPI changes are
made on the kernel series. 

Changes from prior rev1 to now:
   v3:
      - Addressed all rev2 review comments.
      - In line with one of the rev2 comments, a thorough fixup
        of all line-breaks in function calls was made for a more
        consistent styling.
      - Rebased on igt upstream repo and updated to latest kernel
        UAPI that added GEM_CREATE_EXT.
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

Alan Previn (15):
  Sync i915_drm.h UAPI from kernel
  Add PXP UAPI support in i915_drm.h
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

 include/drm-uapi/i915_drm.h |  448 +++++++++++-
 lib/intel_batchbuffer.c     |   23 +-
 lib/intel_batchbuffer.h     |   31 +
 lib/intel_bufops.h          |   15 +
 lib/intel_reg.h             |    9 +
 lib/rendercopy_gen9.c       |   72 +-
 tests/i915/gem_pxp.c        | 1308 +++++++++++++++++++++++++++++++++++
 tests/meson.build           |    1 +
 8 files changed, 1864 insertions(+), 43 deletions(-)
 create mode 100644 tests/i915/gem_pxp.c

-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
