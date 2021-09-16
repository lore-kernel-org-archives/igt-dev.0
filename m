Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36EC36E57E
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Sep 2021 18:08:27 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
Date: Thu, 16 Sep 2021 11:02:58 -0700
Message-Id: <20210916180301.6791-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] IGT fixes for priority management +
 preempt timeout with GuC submission
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
Cc: john.c.harrison@intel.com, daniele.ceraolospurio@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Matthew Brost (3):
  i915/gem_exec_schedule: Make gem_exec_schedule understand static
    priority mapping
  i915/gem_ctx_shared: Make gem_ctx_shared understand static priority
    mapping
  i915/sysfs_preempt_timeout: Update test to work with GuC submission

 lib/i915/gem_scheduler.c           | 14 ++++++++++
 lib/i915/gem_scheduler.h           |  1 +
 lib/i915/i915_drm_local.h          | 10 +++++++
 tests/i915/gem_ctx_shared.c        |  5 ++--
 tests/i915/gem_exec_schedule.c     | 43 +++++++++++++++++++-----------
 tests/i915/sysfs_preempt_timeout.c |  6 ++++-
 6 files changed, 61 insertions(+), 18 deletions(-)

-- 
2.32.0
