Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD3410E58B
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Sep 2023 08:49:38 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 21 Sep 2023 14:25:08 +0530
Message-Id: <20230921085508.2926812-3-riana.tauro@intel.com>
In-Reply-To: <20230921085508.2926812-1-riana.tauro@intel.com>
References: <20230921085508.2926812-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/2] HAX: Add freq-power to
 xe-fast-feedback.testlist
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

Add freq-power to xe-fast-feedback.testlist

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 610cc958c..42171d149 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -114,6 +114,7 @@ igt@xe_exec_threads@threads-mixed-fd-basic
 igt@xe_exec_threads@threads-mixed-userptr-invalidate
 igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race
 igt@xe_gpgpu_fill@basic
+igt@xe_guc_pc@freq-power
 igt@xe_guc_pc@freq_basic_api
 igt@xe_guc_pc@freq_fixed_idle
 igt@xe_guc_pc@freq_range_idle
-- 
2.40.0
