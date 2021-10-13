Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A946EA64
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Oct 2021 12:59:52 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Wed, 13 Oct 2021 15:59:42 +0300
Message-Id: <20211013125949.19373-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/7] kms: Fix i915 fixed_mode vrefresh
 fallout
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
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

A few igts use a 60Hz hardcoded override mode currently. If the 
panel's fixed_mode dosn't happen to match that i915 will now reject
the mode. So let's adjust the override modes to match the refresh
rate the panel needs. We just pick the refresh rate of the first
reported mode, which sould be the panel's preferred mode. So this
will work just fine even if the panel/driver report and accept
multiple refresh rates.

Ville Syrjälä (7):
  lib: Introduce igt_memdup()
  tests/i915/kms_frontbuffer_tracking: Get rid of the funny mode_copy
  lib/kms: Have igt_std_1024_mode_get() return a copy of the mode
  lib/kms: Have igt_std_1024_mode_get() return a mode with specific
    refresh
  lib/kms: Introduce igt_output_preferred_vrefresh()
  tests/i915/kms_frontbuffer_tracking: Use preferred modes's vrefresh
  tests/kms_concurrent: Use preferred modes's vrefresh

 lib/igt_aux.c                         |  11 +++
 lib/igt_aux.h                         |   2 +
 lib/igt_kms.c                         |  28 +++++--
 lib/igt_kms.h                         |   3 +-
 tests/i915/kms_frontbuffer_tracking.c | 113 +++++++++++++-------------
 tests/kms_concurrent.c                |  25 +++---
 6 files changed, 103 insertions(+), 79 deletions(-)

-- 
2.32.0
