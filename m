Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DBD010E84C
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Sep 2023 15:40:21 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  7 Sep 2023 21:08:25 +0530
Message-Id: <20230907153826.1281037-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/intel-ci: drop drrs tests from
 blocklist
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

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/blacklist.txt | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index e13759d3e..a2c36e137 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -69,10 +69,6 @@ igt@sysfs_timeslice_duration@off
 igt@gen7_exec_parse@.*lri.*
 igt@gem_exec_alignment@pi-shared
 ###############################################
-# There are no DRRS capable displays in CI lab
-###############################################
-igt@kms_frontbuffer_tracking@.*drrs.*
-###############################################
 # Tends to generate invalid configurations
 # using CCS planes or configurations that
 # exceed HW capabilities resulting in sporadic
-- 
2.25.1
