Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5D610E2C3
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Aug 2023 20:18:37 +0000 (UTC)
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 22 Aug 2023 16:18:33 -0400
Message-ID: <20230822201833.29474-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH v4] tests/amdgpu: Fix build error due to external
 file include
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: hersenxs.wu@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Remove the external file include that causes build error
on certain systems configured in the CI.

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 tests/amdgpu/amd_odm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/amdgpu/amd_odm.c b/tests/amdgpu/amd_odm.c
index 2781ad1c2..839f2de3f 100644
--- a/tests/amdgpu/amd_odm.c
+++ b/tests/amdgpu/amd_odm.c
@@ -5,7 +5,6 @@
 
 #include <fcntl.h>
 #include <stdio.h>
-#include <xf86drmMode.h>
 
 #include "igt.h"
 #include "igt_amd.h"
-- 
2.41.0
