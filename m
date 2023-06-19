Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD3410E10E
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jun 2023 12:57:16 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 19 Jun 2023 15:56:29 +0300
Message-Id: <20230619125633.2395171-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 0/4] Testcases for dirtyfb ioctl
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

This patchset is adding new testcases for dirtyfb ioctl with features
like FBC, PSR and DRRS.

Also some helpers are split from kms_frontbuffer_tracking to be shared
with a new testcases.

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

Jouni Högander (4):
  tests/i915/kms_frontbuffer_tracking: Split fbc into library
  tests/i915/kms_frontbuffer_tracking: Split drrs into library
  lib/xe/xe_spin: Handle spinner timer for Xe as well
  tests/kms_dirtyfb: Add new test for dirtyfb ioctl

 lib/i915/intel_drrs.c                 | 133 ++++++++++++
 lib/i915/intel_drrs.h                 |  17 ++
 lib/i915/intel_fbc.c                  |  96 ++++++++
 lib/i915/intel_fbc.h                  |  19 ++
 lib/meson.build                       |   2 +
 lib/xe/xe_spin.c                      |   8 +
 tests/i915/kms_dirtyfb.c              | 301 ++++++++++++++++++++++++++
 tests/i915/kms_frontbuffer_tracking.c | 140 ++----------
 tests/meson.build                     |   1 +
 9 files changed, 594 insertions(+), 123 deletions(-)
 create mode 100644 lib/i915/intel_drrs.c
 create mode 100644 lib/i915/intel_drrs.h
 create mode 100644 lib/i915/intel_fbc.c
 create mode 100644 lib/i915/intel_fbc.h
 create mode 100644 tests/i915/kms_dirtyfb.c

-- 
2.34.1
