Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBD06E16D
 for <igt-dev@lists.freedesktop.org>; Sun, 31 Jan 2021 03:28:45 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id t17so9827337qtq.2
 for <igt-dev@lists.freedesktop.org>; Sat, 30 Jan 2021 19:28:45 -0800 (PST)
Received: from elite-desk-aura.lan (135-23-249-167.cpe.pppoe.ca.
 [135.23.249.167])
 by smtp.gmail.com with ESMTPSA id b21sm7611501qtt.56.2021.01.30.19.28.44
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 19:28:44 -0800 (PST)
From: Aurabindo Pillai <mail@aurabindo.in>
Date: Sat, 30 Jan 2021 22:28:41 -0500
Message-Id: <20210131032842.29033-1-mail@aurabindo.in>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 1/2] tests/kms_setmode: Add test description
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

Add top level test description

Signed-off-by: Aurabindo Pillai <mail@aurabindo.in>
---
 tests/kms_setmode.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 878e149a..448ea6a6 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -37,6 +37,11 @@
 /* max combinations with repetitions */
 #define MAX_COMBINATION_ELEMS   MAX_CRTCS
 
+IGT_TEST_DESCRIPTION(
+    "Sets a mode and verifies whether the applied mode timings"
+    " are congruent with the requested mode, by deriving the timing"
+    " information from vblank timestamp");
+
 static int drm_fd;
 static drmModeRes *drm_resources;
 static int filter_test_id;
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
