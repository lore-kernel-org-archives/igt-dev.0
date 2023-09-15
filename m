Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A0710E0A0
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Sep 2023 05:17:28 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 karolina.stolarek@intel.com, sai.gowtham.ch@intel.com
Date: Fri, 15 Sep 2023 10:46:14 +0530
Message-Id: <20230915051617.9361-2-sai.gowtham.ch@intel.com>
In-Reply-To: <20230915051617.9361-1-sai.gowtham.ch@intel.com>
References: <20230915051617.9361-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] lib/intel_cmds_info: Add copy commands
 to blt_cmd_type
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

Add copy commands to blt_cmd_type which is used latter,
to check it they are supported by fd.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 lib/intel_cmds_info.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/intel_cmds_info.h b/lib/intel_cmds_info.h
index 91d0f15ec..ec8312d56 100644
--- a/lib/intel_cmds_info.h
+++ b/lib/intel_cmds_info.h
@@ -20,6 +20,8 @@ enum blt_tiling_type {
 
 enum blt_cmd_type {
 	SRC_COPY,
+	MEM_SET,
+	MEM_COPY,
 	XY_SRC_COPY,
 	XY_FAST_COPY,
 	XY_BLOCK_COPY,
-- 
2.39.1
