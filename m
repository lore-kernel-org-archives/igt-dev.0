Return-path: <SRS0=ONlT=TE=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E3A10E4B4
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Feb 2022 10:24:36 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 21 Feb 2022 15:54:21 +0530
Message-Id: <20220221102423.8089-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/2] Avoid process exit return values in
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

v2:
- Addressed review comment from petri.

Anshuman Gupta (2):
  lib/igt_kmod: Don't use process exit return value
  test/perf_pmu: Change module unload assertion

 lib/igt_kmod.c        | 34 +++++++++++++++++++++-------------
 tests/i915/perf_pmu.c |  6 +++---
 2 files changed, 24 insertions(+), 16 deletions(-)

-- 
2.26.2
