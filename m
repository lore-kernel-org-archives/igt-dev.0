Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EEEB10E110
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jun 2023 07:01:32 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 30 Jun 2023 12:34:38 +0530
Message-Id: <20230630070439.621177-4-riana.tauro@intel.com>
In-Reply-To: <20230630070439.621177-1-riana.tauro@intel.com>
References: <20230630070439.621177-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/4] xe-fast-feedback.testlist: Remove
 rc6 tests from BAT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Remove rc6_on_idle and rc0_on_exec from BAT list
as the sysfs path changed.
Add gt-c6-on-idle to BAT.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 73724a184..d7e91efff 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -162,8 +162,6 @@ igt@xe_gpgpu_fill@basic
 igt@xe_guc_pc@freq_basic_api
 igt@xe_guc_pc@freq_fixed_idle
 igt@xe_guc_pc@freq_range_idle
-igt@xe_guc_pc@rc6_on_idle
-igt@xe_guc_pc@rc0_on_exec
 igt@xe_huc_copy@huc_copy
 igt@xe_intel_bb@add-remove-objects
 igt@xe_intel_bb@bb-with-allocator
@@ -190,6 +188,7 @@ igt@xe_mmap@vram
 igt@xe_mmap@vram-system
 igt@xe_mmio@mmio-timestamp
 igt@xe_mmio@mmio-invalid
+igt@xe_pm_residency@gt-c6-on-idle
 igt@xe_prime_self_import@basic-with_one_bo
 igt@xe_prime_self_import@basic-with_fd_dup
 #igt@xe_prime_self_import@export-vs-gem_close-race
-- 
2.40.0
