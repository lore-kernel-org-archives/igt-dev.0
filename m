Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23C46E884
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Nov 2021 19:10:18 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
Date: Mon,  8 Nov 2021 11:04:55 -0800
Message-Id: <20211108190457.32198-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Matthew Brost (2):
  i915_drm.h sync with drm-next
  i915/gem_exec_balancer: Test parallel execbuf

 include/drm-uapi/i915_drm.h    | 242 ++++++++++++++++-
 lib/i915/i915_drm_local.h      |  13 -
 lib/intel_ctx.c                |  30 ++-
 lib/intel_ctx.h                |   2 +
 lib/intel_reg.h                |   5 +
 tests/i915/gem_exec_balancer.c | 459 +++++++++++++++++++++++++++++++++
 6 files changed, 736 insertions(+), 15 deletions(-)

-- 
2.32.0
