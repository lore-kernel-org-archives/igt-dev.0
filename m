Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC52F6EA9D
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Oct 2021 04:43:37 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Thu, 21 Oct 2021 10:05:04 +0530
Message-Id: <20211021043508.1158148-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] CCS engine and engine resets test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com, ashutosh.dixit@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add CCS engine support and engine reset tests.

John Harrison (1):
  tests/gem_ctx_persistence: Update saturated_hostile for dependent
    engine resets

Priyanka Dandamudi (1):
  lib/i915/i915_drm_local: Add COMPUTE class engine

Tvrtko Ursulin (1):
  i915/gem_engine_topology: Add compute class

Vinay Belgaumkar (1):
  lib/igt_gt: Add compute engine

 lib/i915/gem_engine_topology.c   |  1 +
 lib/i915/i915_drm_local.h        |  1 +
 lib/igt_gt.c                     |  4 +++
 tests/i915/gem_ctx_persistence.c | 55 ++++++++++++++++++++++++++++----
 4 files changed, 54 insertions(+), 7 deletions(-)

-- 
2.25.1
