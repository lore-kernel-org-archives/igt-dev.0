Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD6010E060
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Mar 2023 02:44:52 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 29 Mar 2023 19:44:43 -0700
Message-Id: <20230330024445.11696-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/2] tests/xe/xe_guc_pc: Skip RC6 tests
 on PVC
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add IS_PONTEVECCHIO() library routine and Skip rc6 subtests on PVC.

v2: Add proper PVC library support and fix assert check in xe_guc_pc

Reviewed-by: Bruce Chang <yu.bruce.chang@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (2):
  lib: Add Pontevecchio platform
  tests/xe/xe_guc_pc: Skip RC6 tests for PVC

 lib/i915/intel_cmds_info.c | 20 ++++++++++++++++++++
 lib/i915/intel_cmds_info.h |  1 +
 lib/i915_pciids.h          | 13 +++++++++++++
 lib/intel_chipset.h        |  2 ++
 lib/intel_device_info.c    | 10 ++++++++++
 tests/xe/xe_guc_pc.c       |  2 ++
 6 files changed, 48 insertions(+)

-- 
2.21.0.rc0.32.g243a4c7e27
