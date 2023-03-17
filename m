Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9125710E371
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Mar 2023 12:37:30 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 17 Mar 2023 13:37:09 +0100
Message-Id: <3821529a6f383bd3a2ab859ae6b8a24d76526b10.1679055766.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1679055766.git.karolina.stolarek@intel.com>
References: <cover.1679055766.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 7/9] lib/intel_cmds_info: Reorder
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
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
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
