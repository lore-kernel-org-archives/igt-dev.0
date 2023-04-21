Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DB410EDD0
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Apr 2023 08:53:16 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 21 Apr 2023 11:52:50 +0300
Message-Id: <20230421085253.2344889-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/3] Testcases for dirtyfb ioctl
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

Jouni Högander (3):
  tests/i915/kms_frontbuffer_tracking: Split fbc into library
  tests/i915/kms_frontbuffer_tracking: Split drrs into library
  tests/kms_dirtyfb: Add new test for dirtyfb ioctl

 lib/i915/intel_drrs.c                 |  83 ++++++++
 lib/i915/intel_drrs.h                 |  17 ++
 lib/i915/intel_fbc.c                  |  62 ++++++
 lib/i915/intel_fbc.h                  |  19 ++
 lib/meson.build                       |   2 +
 tests/i915/kms_dirtyfb.c              | 291 ++++++++++++++++++++++++++
 tests/i915/kms_frontbuffer_tracking.c | 140 ++-----------
 tests/meson.build                     |   1 +
 8 files changed, 492 insertions(+), 123 deletions(-)
 create mode 100644 lib/i915/intel_drrs.c
 create mode 100644 lib/i915/intel_drrs.h
 create mode 100644 lib/i915/intel_fbc.c
 create mode 100644 lib/i915/intel_fbc.h
 create mode 100644 tests/i915/kms_dirtyfb.c

-- 
2.34.1
