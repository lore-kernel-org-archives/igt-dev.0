Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406B76E2C0
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Mar 2021 22:54:04 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Tue,  2 Mar 2021 14:53:23 -0800
Message-Id: <20210302225334.361966-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC i-g-t 00/11] Introduce PXP Test
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
This series currently includes 3 groups of tests addressing the
features and restrictions described in Daniele's series above:

   1. test i915 interfaces for allocation of protected bo's
      and contexts and enforcement of UAPI rule disallowing the
      modification of parameters after it's been created.
   2. verify PXP subsystem protected sessions generate encrypted
      content on protected output buffers and decrypt protected
      inputs buffers.
   3. verify i915 PXP auto-teardown succeeds on suspend-resume
      cycles and gem-exec of stale protected assets fail.

This is still in RFC because the following tests are to be added:
   - verify teardown invalidates contexts via DRM_IOCTL_I915_GET_RESET_STAT.
   - test display plane decryption of protected buffers.
   - verify display plane blackout on stale buffers (post teardown).

Alan Previn (11):
  Sync i915_drm.h UAPI for PXP
  Add basic PXP testing of buffer and context alloc
  Add PXP attributes into lib batchbuffer and buffer structs
  Perform a regular 3d copy as a control checkpoint
  Add MI_SET_APPID instruction definition
  Enable protected session and protected buffers in rendercopy
  Add subtest to copy raw source to protected dest
  Add test where both src and dest are protected
  Add test to verify session key renewed after suspend-resume cycle
  Verify gem_execbuf fails with stale PXP context after teardown
  Verify gem_execbuf fails with stale PXP buffer after teardown

 include/drm-uapi/i915_drm.h |  94 +++-
 lib/intel_batchbuffer.c     |  12 +
 lib/intel_batchbuffer.h     |   9 +
 lib/intel_bufops.h          |   3 +
 lib/intel_reg.h             |   9 +
 lib/rendercopy_gen9.c       | 123 ++++-
 tests/Makefile.sources      |   3 +
 tests/i915/i915_pxp.c       | 991 ++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 9 files changed, 1237 insertions(+), 8 deletions(-)
 create mode 100644 tests/i915/i915_pxp.c

-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
