Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::618])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342EA10E18D
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 18:22:37 +0000 (UTC)
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 3 Nov 2023 14:22:26 -0400
Message-ID: <20231103182230.1039191-2-aurabindo.pillai@amd.com>
In-Reply-To: <20231103182230.1039191-1-aurabindo.pillai@amd.com>
References: <20231103182230.1039191-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v2 1/5] lib/amdgpu: Remove unused struct
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

dim2d has no references within AMDGPU tests, so remove it

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 lib/igt_amd.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 84c6d7545..f0fbe97ef 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -45,11 +45,6 @@
 #define Y6 64
 #define Y7 128
 
-struct dim2d
-{
-    int w;
-    int h;
-};
 
 uint32_t igt_amd_create_bo(int fd, uint64_t size)
 {
-- 
2.39.2
