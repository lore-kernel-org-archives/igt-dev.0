Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2087.outbound.protection.outlook.com [40.107.212.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647F910E17B
 for <igt-dev@lists.freedesktop.org>; Sat, 12 Mar 2022 05:29:29 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Sat, 12 Mar 2022 00:29:06 -0500
Message-ID: <20220312052910.357949-2-dingchen.zhang@amd.com>
In-Reply-To: <20220312052910.357949-1-dingchen.zhang@amd.com>
References: <20220312052910.357949-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH v3 1/5] lib/igt_psr: pass higher versions of PSR
 SU panels
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

[why]
From eDP 1.5 (eDP 1.4b SCR adopted), a higher version of PSR-SU eDP
panel, i.e. version 0x4, is added into spec. Need to treat such PSR
panel as PSR capable sink device.

[how]
validate the PSR capable sink for higher PSR version 0x4.

Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>

Signed-off-by: David Zhang <dingchen.zhang@amd.com>
Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 lib/igt_psr.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 98eb28b4..2b73e809 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -209,8 +209,14 @@ bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode)
 		/*
 		 * i915 requires PSR version 0x03 that is PSR2 + SU with
 		 * Y-coordinate to support PSR2
+		 *
+		 * or
+		 *
+		 * PSR version 0x4 that is PSR2 + SU w/ Y-coordinate and SU
+		 * Region Early Transport to support PSR2 (eDP 1.5)
 		 */
-		return strstr(buf, "Sink support: yes [0x03]");
+		return strstr(buf, "Sink support: yes [0x03]") ||
+		       strstr(buf, "Sink support: yes [0x04]");
 }
 
 #define PSR2_SU_BLOCK_STR_LOOKUP "PSR2 SU blocks:\n0\t"
-- 
2.25.1
