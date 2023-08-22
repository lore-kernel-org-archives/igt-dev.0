Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECA110E2C7
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Aug 2023 09:41:08 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 22 Aug 2023 12:40:31 +0300
Message-Id: <20230822094035.3424673-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v8 0/4] Testcases for dirtyfb ioctl
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This patchset is adding new testcases for dirtyfb ioctl with features
like FBC, PSR and DRRS.

Also some helpers are split from kms_frontbuffer_tracking to be shared
with a new testcases.

v8:
 - Add new style documentation
v7:
 - Split kms_frontbuffer_tracking changes into separate patch
 - Xe spinner changes already merged
v6:
 - Perform igt_display_reset in prepare
v5:
 - Modifications to support Xe as well
v4:
 - Document library interface functions
 - Check connector type is eDP when PSR is tested
v3:
 - Use spinner
 - Drop allocating big frambuffers
v2:
 - Move fbc and drrs into libigt
 - Change testcase license comment
 - Move disable_features and do not apply for FEATURE_DEFAULT

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Kunal Joshi <kunal1.joshi@intel.com>

Jouni Högander (4):
  lib/i915/fbc: Add fbc helpers
  lib/i915/drrs: Add drrs helpers
  tests/i915/kms_frontbuffer_tracking: Utilize added fbc and drrs
    helpers
  tests/kms_dirtyfb: Add new test for dirtyfb ioctl

 lib/i915/intel_drrs.c                 | 133 +++++++++++
 lib/i915/intel_drrs.h                 |  17 ++
 lib/i915/intel_fbc.c                  |  96 ++++++++
 lib/i915/intel_fbc.h                  |  18 ++
 lib/meson.build                       |   2 +
 tests/i915/kms_dirtyfb.c              | 318 ++++++++++++++++++++++++++
 tests/i915/kms_frontbuffer_tracking.c | 141 ++----------
 tests/meson.build                     |   1 +
 8 files changed, 602 insertions(+), 124 deletions(-)
 create mode 100644 lib/i915/intel_drrs.c
 create mode 100644 lib/i915/intel_drrs.h
 create mode 100644 lib/i915/intel_fbc.c
 create mode 100644 lib/i915/intel_fbc.h
 create mode 100644 tests/i915/kms_dirtyfb.c

-- 
2.34.1
