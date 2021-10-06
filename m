Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB75B6EDB0
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Oct 2021 16:20:10 +0000 (UTC)
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Wed,  6 Oct 2021 12:14:36 -0400
Message-Id: <20211006161444.904476-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/8] drm-uapi clean-up
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Patches 1 to 3:
The main motivation of this series is to clean-up the mess
I created with the recent merge of a i915_drm.h coming from
drm-intel-gt-next rather than from drm-next. I'm sorry for that.

Patches 4:
Since I was already there, let me update some of the upstreamed
UAPIs.

Patch 5: Extra sync to drm-next, including all of the patches.

Patches 6 to 8: These might be the controversial ones. While
doing the work above, I decided that we needed to make the
documentation cleaner and more visible so we would avoid further
mistakes. But I'm okay on dropping these patches if there's
any disagreement.

Thanks,
Rodrigo.

Rodrigo Vivi (8):
  tests/i915/gem_pxp: Add LOCAL_ UAPI defines
  Revert "i915_drm.h sync"
  i915_drm.h sync with drm-next
  tests/gem_userptr_blits: Remove LOCAL_
  include/drm-uapi: Sync with drm-next
  README.md: Detail the drm-uapi headers sync.
  include: Introduce linux-uapi for non-drm-uapi files.
  README.md: Accept the i915_drm.h standalone update.

 README.md                                    |  38 +-
 include/drm-uapi/drm.h                       |  14 +-
 include/drm-uapi/drm_fourcc.h                | 115 ++++-
 include/drm-uapi/drm_mode.h                  |  95 ++++-
 include/drm-uapi/i915_drm.h                  |  99 +----
 include/drm-uapi/msm_drm.h                   |  14 +-
 include/drm-uapi/tegra_drm.h                 | 425 ++++++++++++++++++-
 include/drm-uapi/v3d_drm.h                   | 136 ++++++
 include/drm-uapi/vmwgfx_drm.h                |  41 ++
 include/{drm-uapi => linux-uapi}/sync_file.h |   0
 meson.build                                  |   2 +-
 tests/i915/gem_pxp.c                         |  31 +-
 tests/i915/gem_userptr_blits.c               |   7 +-
 13 files changed, 866 insertions(+), 151 deletions(-)
 rename include/{drm-uapi => linux-uapi}/sync_file.h (100%)

-- 
2.31.1
