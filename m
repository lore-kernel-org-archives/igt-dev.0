Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 218C910E080
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 12:21:20 +0000 (UTC)
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 29 May 2023 14:21:04 +0200
Message-Id: <20230529122104.391866-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_balancer: skip noheartbeat
 test with GuC
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

GuC does not support fully updating of persisting contexts, especially
heartbeat related parameters.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3952
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
Hi,

This is another case where GuC does not support runtime disabling
heartbeat. I hope the last one.

Regards
Andrzej
---
 tests/i915/gem_exec_balancer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 3ab0903ac89..004ba9a14fe 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -2938,6 +2938,8 @@ static void noheartbeat(int i915)
 {
 	const struct intel_execution_engine2 *e;
 
+	igt_require(!gem_using_guc_submission(i915));
+
 	/*
 	 * Check that non-persistent contexts are also cleaned up if we
 	 * close the context while they are active, but the engine's
-- 
2.34.1
