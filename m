Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D37EC369D9
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 06:28:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42DA10E6DC;
	Wed, 30 Apr 2025 06:28:48 +0000 (UTC)
Received: from amd-X570-AORUS-ELITE.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3EAF10E292
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 06:28:43 +0000 (UTC)
Received: by amd-X570-AORUS-ELITE.amd.com (Postfix, from userid 1000)
 id AFDC236A000C; Wed, 30 Apr 2025 11:58:39 +0530 (IST)
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org,
	Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v3 4/4] lib/amdgpu: make amdgpu userqueue file name at par
 with kernel names
Date: Wed, 30 Apr 2025 11:58:35 +0530
Message-ID: <20250430062835.348074-4-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430062835.348074-1-sunil.khatri@amd.com>
References: <20250430062835.348074-1-sunil.khatri@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Update the amdgpu_user_queue.c/.h to amdgpu_userq.c/.h

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 lib/amdgpu/amd_command_submission.c          | 2 +-
 lib/amdgpu/amd_compute.c                     | 2 +-
 lib/amdgpu/amd_memory.c                      | 2 +-
 lib/amdgpu/{amd_user_queue.c => amd_userq.c} | 2 +-
 lib/amdgpu/{amd_user_queue.h => amd_userq.h} | 0
 lib/meson.build                              | 2 +-
 tests/amdgpu/amd_basic.c                     | 2 +-
 tests/amdgpu/amd_cs_nop.c                    | 2 +-
 8 files changed, 7 insertions(+), 7 deletions(-)
 rename lib/amdgpu/{amd_user_queue.c => amd_userq.c} (99%)
 rename lib/amdgpu/{amd_user_queue.h => amd_userq.h} (100%)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 7550fa8bc..80d03a498 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -10,7 +10,7 @@
 #include "lib/amdgpu/amd_sdma.h"
 #include "lib/amdgpu/amd_PM4.h"
 #include "lib/amdgpu/amd_command_submission.h"
-#include "lib/amdgpu/amd_user_queue.h"
+#include "lib/amdgpu/amd_userq.h"
 #include "ioctl_wrappers.h"
 
 
diff --git a/lib/amdgpu/amd_compute.c b/lib/amdgpu/amd_compute.c
index 5d7040d80..95bfa53aa 100644
--- a/lib/amdgpu/amd_compute.c
+++ b/lib/amdgpu/amd_compute.c
@@ -25,7 +25,7 @@
 #include "amd_PM4.h"
 #include "amd_memory.h"
 #include "amd_compute.h"
-#include "amd_user_queue.h"
+#include "amd_userq.h"
 
 /**
  *
diff --git a/lib/amdgpu/amd_memory.c b/lib/amdgpu/amd_memory.c
index d1ff57085..882c5c18f 100644
--- a/lib/amdgpu/amd_memory.c
+++ b/lib/amdgpu/amd_memory.c
@@ -25,7 +25,7 @@
 
 #include "amd_memory.h"
 #include "amd_PM4.h"
-#include "amd_user_queue.h"
+#include "amd_userq.h"
 
 /**
  *
diff --git a/lib/amdgpu/amd_user_queue.c b/lib/amdgpu/amd_userq.c
similarity index 99%
rename from lib/amdgpu/amd_user_queue.c
rename to lib/amdgpu/amd_userq.c
index 444f9c022..50d058609 100644
--- a/lib/amdgpu/amd_user_queue.c
+++ b/lib/amdgpu/amd_userq.c
@@ -3,7 +3,7 @@
  * Copyright 2025 Advanced Micro Devices, Inc.
  */
 
-#include "amd_user_queue.h"
+#include "amd_userq.h"
 #include "amd_memory.h"
 #include "amd_PM4.h"
 #include "ioctl_wrappers.h"
diff --git a/lib/amdgpu/amd_user_queue.h b/lib/amdgpu/amd_userq.h
similarity index 100%
rename from lib/amdgpu/amd_user_queue.h
rename to lib/amdgpu/amd_userq.h
diff --git a/lib/meson.build b/lib/meson.build
index 8517cd540..b58976a43 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -166,7 +166,7 @@ if libdrm_amdgpu.found()
 		'amdgpu/amd_cp_dma.c',
 		'amdgpu/amd_mem_leak.c',
 		'amdgpu/amd_mmd_shared.c',
-		'amdgpu/amd_user_queue.c'
+		'amdgpu/amd_userq.c'
 	]
 	if libdrm_amdgpu.version().version_compare('> 2.4.99')
 		lib_sources +=[ 'amdgpu/amd_dispatch.c',]
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index e0029f582..97a08a9a3 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -13,7 +13,7 @@
 #include "lib/amdgpu/amd_gfx.h"
 #include "lib/amdgpu/amd_shaders.h"
 #include "lib/amdgpu/amd_dispatch.h"
-#include "lib/amdgpu/amd_user_queue.h"
+#include "lib/amdgpu/amd_userq.h"
 
 #define BUFFER_SIZE (8 * 1024)
 
diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
index 160c4f026..268bc9201 100644
--- a/tests/amdgpu/amd_cs_nop.c
+++ b/tests/amdgpu/amd_cs_nop.c
@@ -12,7 +12,7 @@
 #include "lib/amdgpu/amd_PM4.h"
 #include "lib/amdgpu/amd_ip_blocks.h"
 #include "lib/amdgpu/amd_memory.h"
-#include "lib/amdgpu/amd_user_queue.h"
+#include "lib/amdgpu/amd_userq.h"
 
 static void amdgpu_cs_sync(amdgpu_context_handle context,
 			   unsigned int ip_type,
-- 
2.43.0

