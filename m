Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7B410E827
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Mar 2023 14:44:55 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Mar 2023 15:44:39 +0100
Message-Id: <9128e61421af539ff918aea7aeeb3de961dc0fd5.1678804829.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1678804829.git.karolina.stolarek@intel.com>
References: <cover.1678804829.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 7/8] lib/intel_cmds_info: Reorder
 blt_tiling_type enum
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

Move Yf Major up so it follows the order of tiling definitions
in intel_batchbuffer.h

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/i915/intel_cmds_info.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/i915/intel_cmds_info.h b/lib/i915/intel_cmds_info.h
index 57e34c4b..9af2f2d9 100644
--- a/lib/i915/intel_cmds_info.h
+++ b/lib/i915/intel_cmds_info.h
@@ -13,8 +13,8 @@ enum blt_tiling_type {
 	T_XMAJOR,
 	T_YMAJOR,
 	T_TILE4,
-	T_TILE64,
 	T_YFMAJOR,
+	T_TILE64,
 	__BLT_MAX_TILING
 };
 
-- 
2.25.1
