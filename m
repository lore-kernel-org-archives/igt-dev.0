Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2047.outbound.protection.outlook.com [40.107.96.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728B910E167
 for <igt-dev@lists.freedesktop.org>; Thu, 12 May 2022 16:55:04 +0000 (UTC)
From: David Zhang <dingchen.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 12 May 2022 12:54:48 -0400
Message-ID: <20220512165448.686130-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] lib/igt_amd: align the amdgpu PSR state enum to
 upstreamed code base
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

[why & how]
align the PSR state enum definitions to the upstreamed amdgpu drv
code base "dc_psr_state".

Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Jay Pillai <aurabindo.pillai@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>

Signed-off-by: David Zhang <dingchen.zhang@amd.com>
---
 lib/igt_amd.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index 428bfe6f..42cb2e17 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -111,10 +111,17 @@ enum amdgpu_psr_state {
 	PSR_STATE4b,
 	PSR_STATE4c,
 	PSR_STATE4d,
+	PSR_STATE4_FULL_FRAME,
+	PSR_STATE4a_FULL_FRAME,
+	PSR_STATE4b_FULL_FRAME,
+	PSR_STATE4c_FULL_FRAME,
+	PSR_STATE4_FULL_FRAME_POWERUP,
 	PSR_STATE5,
 	PSR_STATE5a,
 	PSR_STATE5b,
 	PSR_STATE5c,
+	PSR_STATE_HWLOCK_MGR,
+	PSR_STATE_POLLVUPDATE,
 	PSR_STATE_INVALID = 0xFF
 };
 
-- 
2.25.1
