Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86976ED6F
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2020 12:51:55 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Thu, 20 Feb 2020 14:51:52 +0200
Message-Id: <20200220125152.1188880-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tools/i915-perf: workaround overzelous
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

Give me a break :)

Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tools/i915-perf/i915_perf_control.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/i915-perf/i915_perf_control.c b/tools/i915-perf/i915_perf_control.c
index a8d0d30f..dcbc2f59 100644
--- a/tools/i915-perf/i915_perf_control.c
+++ b/tools/i915-perf/i915_perf_control.c
@@ -95,10 +95,12 @@ main(int argc, char *argv[])
 				struct recorder_command_base base;
 				struct recorder_command_dump dump;
 			} *data = malloc(total_len);
+			char *path = (char *) data->dump.path;
 
 			data->base.command = RECORDER_COMMAND_DUMP;
 			data->base.size = total_len;
-			snprintf((char *) data->dump.path, strlen(dump_file) + 1, "%s", dump_file);
+			snprintf(path, strlen(dump_file) + 1, "%s", dump_file);
+
 
 			fwrite(data, total_len, 1, command_fifo_file);
 		} else {
@@ -109,10 +111,11 @@ main(int argc, char *argv[])
 				struct recorder_command_base base;
 				struct recorder_command_dump dump;
 			} *data = malloc(total_len);
+			char *path = (char *) data->dump.path;
 
 			data->base.command = RECORDER_COMMAND_DUMP;
 			data->base.size = total_len;
-			snprintf((char *) data->dump.path, path_len, "%s/%s", cwd, dump_file);
+			snprintf(path, path_len, "%s/%s", cwd, dump_file);
 
 			fwrite(data, total_len, 1, command_fifo_file);
 		}
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
