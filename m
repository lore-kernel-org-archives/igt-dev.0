Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7819B6E064
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Nov 2021 23:04:33 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
Date: Tue,  9 Nov 2021 14:59:52 -0800
Message-Id: <20211109225954.24248-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Matthew Brost (2):
  i915_drm.h sync with drm-next
  i915/gem_exec_balancer: Test parallel execbuf

 include/drm-uapi/i915_drm.h    | 242 +++++++++++++++-
 lib/i915/i915_drm_local.h      |  13 -
 lib/intel_ctx.c                |  30 +-
 lib/intel_ctx.h                |   2 +
 lib/intel_reg.h                |   5 +
 tests/i915/gem_exec_balancer.c | 486 +++++++++++++++++++++++++++++++++
 6 files changed, 763 insertions(+), 15 deletions(-)

-- 
2.32.0
