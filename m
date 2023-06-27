Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E7F10E2DD
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 10:24:23 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Jun 2023 15:56:56 +0530
Message-Id: <20230627102656.475578-3-riana.tauro@intel.com>
In-Reply-To: <20230627102656.475578-1-riana.tauro@intel.com>
References: <20230627102656.475578-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] xe-fast-feedback.testlist: Remove rc6
 tests from BAT
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
They are removed as the sysfs path changed and will be moved
to different test

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index a956e10e..47b1fac4 100644
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
-- 
2.40.0
