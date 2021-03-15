Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29613899B0
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Mar 2021 15:22:44 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id g27so33787102iox.2
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Mar 2021 08:22:44 -0700 (PDT)
From: Aurabindo Pillai <mail@aurabindo.in>
Date: Mon, 15 Mar 2021 11:22:43 -0400
Message-Id: <20210315152243.1500889-1-mail@aurabindo.in>
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
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
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
2.30.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
