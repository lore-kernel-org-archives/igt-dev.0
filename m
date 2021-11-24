Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C328E6E525
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Nov 2021 11:31:43 +0000 (UTC)
From: Mastan Katragadda <mastanx.katragadda@intel.com>
Date: Wed, 24 Nov 2021 17:02:32 +0530
Message-Id: <20211124113232.904784-1-mastanx.katragadda@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] intel-ci: balcklist gem_exec_alignment@pi-shared
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, tejaskumarx.surendrakumar.upadhyay@intel.com
Cc: mastanx.katragadda@intel.com, thomas.hellstrom@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

black list the test until locking contentions got fixed in kernel

Signed-off-by: Mastan Katragadda <mastanx.katragadda@intel.com>
---
 tests/intel-ci/blacklist.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index ca361fde..8e9767b1 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -61,6 +61,7 @@ igt@sysfs_timeslice_duration@off
 ###############################################
 # GEM: Not worth fixing
 ###############################################
+igt@gem_exec_alignment@pi-shared
 igt@gen7_exec_parse@.*lri.*
 ###############################################
 # There are no DRRS capable displays in CI lab
-- 
2.25.1
