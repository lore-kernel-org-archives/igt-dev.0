Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF5610EA33
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Sep 2022 03:26:51 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Sep 2022 06:26:42 +0300
Message-Id: <20220929032642.16556-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20220929032642.16556-1-ville.syrjala@linux.intel.com>
References: <20220929032642.16556-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/3] intel-ci: Enable DRRS tests
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Stop preventing DRRS testing.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel-ci/blacklist.txt | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index 0d3077301823..61e8193583f1 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -64,10 +64,6 @@ igt@sysfs_timeslice_duration@off
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
2.35.1
