Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54EC589B5F
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Oct 2021 09:22:31 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Mon, 25 Oct 2021 14:53:03 +0530
Message-Id: <20211025092305.14742-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Nuke unload_i915
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
Cc: chris.p.wilson@intel.com, badal.nilawar@intel.com, Anshuman Gupta <anshuman.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Use a silent version of lib function __igt_i915_driver_unload()
instead.

Anshuman Gupta (2):
  lib: Add silent __igt_i915_driver_unload
  perf/perf_pmu: Nuke unload_i915

 lib/igt_kmod.c        | 86 +++++++++++++++++++++++++------------------
 lib/igt_kmod.h        |  1 +
 tests/i915/perf_pmu.c | 31 ++--------------
 3 files changed, 55 insertions(+), 63 deletions(-)

-- 
2.26.2
