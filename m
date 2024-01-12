Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA8310EA88
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jan 2024 07:44:03 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com, sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_exec_store: Remove redundant code
Date: Fri, 12 Jan 2024 13:19:02 +0530
Message-Id: <20240112074902.2455804-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Remove redundant code related to exec queue creation.

Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/intel/xe_exec_store.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 870394d3c..3fa8880ba 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -148,7 +148,6 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 	else
 		igt_assert_f(inst_type < 2, "Entered wrong inst_type.\n");
 
-	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
 	exec.exec_queue_id = exec_queue;
 	exec.address = data->addr;
 	sync.flags &= DRM_XE_SYNC_FLAG_SIGNAL;
-- 
2.25.1
