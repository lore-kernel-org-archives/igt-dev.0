Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68B610E07D
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 05:05:02 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 10:44:38 +0530
Message-Id: <20231103051438.19342-3-nidhi1.gupta@intel.com>
In-Reply-To: <20231103051438.19342-1-nidhi1.gupta@intel.com>
References: <20231103051438.19342-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] HAX PATCH DO NOT MERGE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index c252e2cf0..4749b378d 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,7 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
-
+# Hax patch for testing do not merge
+igt@kms_frontbuffer_tracking@plane-fbc-rte
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
-- 
2.39.0
