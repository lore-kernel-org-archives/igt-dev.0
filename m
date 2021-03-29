Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E106E3FC
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Mar 2021 13:06:44 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id w2so10679940ilj.12
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Mar 2021 06:06:44 -0700 (PDT)
From: Aurabindo Pillai <mail@aurabindo.in>
Date: Mon, 29 Mar 2021 09:06:42 -0400
Message-Id: <20210329130642.236359-1-mail@aurabindo.in>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] tests/amdgpu: Add test description for amd_abm
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

From: Aurabindo Pillai <aurabindo.pillai@amd.com>

Add overall test description for amd_abm

Change-Id: I4baa52ea66189688b12a82befbbd842ba3d3a24d
Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 tests/amdgpu/amd_abm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index 0505f17e..a1e48533 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -32,6 +32,8 @@
 #include <fcntl.h>
 #include <time.h>
 
+IGT_TEST_DESCRIPTION("Tests Adaptive Backlight Modulation on supported hardware");
+
 #define BACKLIGHT_PATH "/sys/class/backlight/amdgpu_bl0"
 
 typedef struct data {
-- 
2.31.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
