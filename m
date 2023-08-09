Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66F610E03D
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 09:44:40 +0000 (UTC)
From: Daniel Mrzyglod <daniel.t.mrzyglod@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  9 Aug 2023 11:44:26 +0200
Message-ID: <20230809094426.111590-1-daniel.t.mrzyglod@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/intel-ci: fix
 xe-fast-feedback.testlist
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This patch revert testplan change for igt@xe_query
where query-engines which is a proper HW engine test.

This patch fix the line which propably occured by mistake.
-igt@xe_query@query-engines
+igt@xe_query@query-execqueues

Fixes: 481fe148f034 ("xe: Rename engine to exec_queue")

Signed-off-by: Daniel Mrzyglod <daniel.t.mrzyglod@intel.com>
Cc: francois.dugast@intel.com
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index f7c6b62f5f08..a5ed24aa084b 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -147,7 +147,7 @@ igt@xe_pm_residency@gt-c6-on-idle
 igt@xe_prime_self_import@basic-with_one_bo
 igt@xe_prime_self_import@basic-with_fd_dup
 #igt@xe_prime_self_import@basic-llseek-size
-igt@xe_query@query-execqueues
+igt@xe_query@query-engines
 igt@xe_query@query-mem-usage
 igt@xe_query@query-gts
 igt@xe_query@query-config
-- 
2.41.0
