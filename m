Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A2E6E0EF
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Nov 2021 21:37:06 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
Date: Thu, 11 Nov 2021 13:31:22 -0800
Message-Id: <20211111213124.2433-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/2] Test parallel execbuf
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

v2:
 (Daniele)
  - Sync i915_drm.h
  - Address comments in test
v3:
 (Daniele)
  - Read timeslice from sysfs
v4:
 (Daniele)
  - Add comment in timeslice sysfs read function

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Matthew Brost (2):
  i915_drm.h sync with drm-next
  i915/gem_exec_balancer: Test parallel execbuf

 include/drm-uapi/i915_drm.h    | 242 +++++++++++++++-
 lib/i915/i915_drm_local.h      |  13 -
 lib/intel_ctx.c                |  30 +-
 lib/intel_ctx.h                |   2 +
 lib/intel_reg.h                |   5 +
 tests/i915/gem_exec_balancer.c | 490 +++++++++++++++++++++++++++++++++
 6 files changed, 767 insertions(+), 15 deletions(-)

-- 
2.33.1
