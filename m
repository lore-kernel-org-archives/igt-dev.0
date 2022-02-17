Return-path: <SRS0=aXFB=TA=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D4810EB3A
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Feb 2022 15:44:48 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 17 Feb 2022 21:14:32 +0530
Message-Id: <20220217154434.13877-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Avoid process exit return values in
 igt_kmod
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Kmod igt library functions like igt_i915_driver_{load, unload}
uses process exit IGT_EXIT_{FAILURE, SKIP, SUCCESS} return values.
Let these function return actual return values
from returned igt_kmod_{load, unload} functions. 

Also modify the perf_pmu test to use 
__igt_i915_driver_unload() accordingly. 

Anshuman Gupta (2):
  lib/igt_kmod: Don't use process exit return value
  test/perf_pmu: Change module unload assertion

 lib/igt_kmod.c        | 34 +++++++++++++++++++++-------------
 tests/i915/perf_pmu.c |  6 +++---
 2 files changed, 24 insertions(+), 16 deletions(-)

-- 
2.26.2
