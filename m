Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F846ED84
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2020 13:34:20 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Thu, 20 Feb 2020 15:34:16 +0200
Message-Id: <20200220133416.1194071-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] tools/i915-perf: workaround overzelous
 compiler warnings
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Take 2.

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tools/i915-perf/i915_perf_recorder_commands.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/i915-perf/i915_perf_recorder_commands.h b/tools/i915-perf/i915_perf_recorder_commands.h
index 4855d80f..44dd4438 100644
--- a/tools/i915-perf/i915_perf_recorder_commands.h
+++ b/tools/i915-perf/i915_perf_recorder_commands.h
@@ -35,5 +35,6 @@ struct recorder_command_base {
 };
 
 struct recorder_command_dump {
-	uint8_t path[0];
+	uint8_t unused;
+	uint8_t path[];
 };
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
