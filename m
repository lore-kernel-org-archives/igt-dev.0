Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B0C6E51D
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Oct 2021 06:21:40 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Fri, 22 Oct 2021 11:42:42 +0530
Message-Id: <20211022061245.1166638-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/3] CCS engine and engine resets test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com, ashutosh.dixit@intel.com, zbigniew.kempczynski@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add CCS engine support and engine reset tests.

v2: Changed the order of series and removed compute engine patch.

John Harrison (1):
  tests/gem_ctx_persistence: Update saturated_hostile for dependent
    engine resets

Priyanka Dandamudi (1):
  lib/i915/i915_drm_local: Add COMPUTE class engine

Tvrtko Ursulin (1):
  i915/gem_engine_topology: Add compute class

 lib/i915/gem_engine_topology.c   |  1 +
 lib/i915/i915_drm_local.h        |  1 +
 tests/i915/gem_ctx_persistence.c | 55 ++++++++++++++++++++++++++++----
 3 files changed, 50 insertions(+), 7 deletions(-)

-- 
2.25.1
