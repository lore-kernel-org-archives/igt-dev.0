Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B2810E329
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Sep 2023 11:05:58 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, karolina.stolarek@intel.com,
 sai.gowtham.ch@intel.com
Date: Mon,  4 Sep 2023 16:34:56 +0530
Message-Id: <20230904110458.24177-3-sai.gowtham.ch@intel.com>
In-Reply-To: <20230904110458.24177-1-sai.gowtham.ch@intel.com>
References: <20230904110458.24177-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] lib/intel_blt: check if blt commands
 are supported by the platforms
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Check if mem-copy/mem-set commands are supported by fd device.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 lib/intel_blt.c | 32 ++++++++++++++++++++++++++++++++
 lib/intel_blt.h |  2 ++
 2 files changed, 34 insertions(+)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 429511920..b55fa9b52 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -289,6 +289,38 @@ bool blt_has_block_copy(int fd)
 	return blt_supports_command(cmds_info, XY_BLOCK_COPY);
 }
 
+/**
+ * blt_has_mem_copy
+ * @fd: drm fd
+ *
+ * Check if mem copy is supported by @fd device
+ *
+ * Returns:
+ * true if it does, false otherwise.
+ */
+bool blt_has_mem_copy(int fd)
+{
+	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(fd);
+
+	return blt_supports_command(cmds_info, MEM_COPY);
+}
+
+/**
+ * blt_has_mem_set
+ * @fd: drm fd
+ *
+ * Check if mem set is supported by @fd device
+ *
+ * Returns:
+ * true if it does, false otherwise.
+ */
+bool blt_has_mem_set(int fd)
+{
+	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(fd);
+
+	return blt_supports_command(cmds_info, MEM_SET);
+}
+
 /**
  * blt_has_fast_copy
  * @fd: drm fd
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index b8b3d724d..d9c8883c7 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -175,6 +175,8 @@ bool blt_cmd_has_property(const struct intel_cmds_info *cmds_info,
 			  uint32_t prop);
 
 bool blt_has_block_copy(int fd);
+bool blt_has_mem_copy(int fd);
+bool blt_has_mem_set(int fd);
 bool blt_has_fast_copy(int fd);
 bool blt_has_xy_src_copy(int fd);
 bool blt_has_xy_color(int fd);
-- 
2.39.1
