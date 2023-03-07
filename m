Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBDA510E437
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Mar 2023 10:45:31 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Mar 2023 11:45:18 +0100
Message-Id: <20230307104519.706553-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230307104519.706553-1-zbigniew.kempczynski@intel.com>
References: <20230307104519.706553-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/3] lib/huc_copy: Rename to avoid macro
 name clash
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

Adding intel_gpu_commands.h requires to solve some name clashes.
Rename MFX_WAIT to HUC_MFX_WAIT to be consistent with other macros
in the huc code.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/huc_copy.c | 6 +++---
 lib/huc_copy.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/huc_copy.c b/lib/huc_copy.c
index 6ec68864b7..bf8254c612 100644
--- a/lib/huc_copy.c
+++ b/lib/huc_copy.c
@@ -80,14 +80,14 @@ gen9_huc_copyfunc(int fd, uint64_t ahnd,
 	buf[i++] = 0;
 	buf[i++] = 0x3;
 
-	buf[i++] = MFX_WAIT;
-	buf[i++] = MFX_WAIT;
+	buf[i++] = HUC_MFX_WAIT;
+	buf[i++] = HUC_MFX_WAIT;
 
 	buf[i++] = HUC_PIPE_MODE_SELECT;
 	buf[i++] = 0;
 	buf[i++] = 0;
 
-	buf[i++] = MFX_WAIT;
+	buf[i++] = HUC_MFX_WAIT;
 
 	memset(reloc, 0, sizeof(reloc));
 
diff --git a/lib/huc_copy.h b/lib/huc_copy.h
index 69d1409335..1789e87359 100644
--- a/lib/huc_copy.h
+++ b/lib/huc_copy.h
@@ -31,7 +31,7 @@
 #include "intel_reg.h"
 
 #define PARALLEL_VIDEO_PIPE		(0x3<<29)
-#define MFX_WAIT			(PARALLEL_VIDEO_PIPE|(0x1<<27)|(0x1<<8))
+#define HUC_MFX_WAIT			(PARALLEL_VIDEO_PIPE|(0x1<<27)|(0x1<<8))
 
 #define HUC_IMEM_STATE			(PARALLEL_VIDEO_PIPE|(0x2<<27)|(0xb<<23)|(0x1<<16)|0x3)
 #define HUC_PIPE_MODE_SELECT		(PARALLEL_VIDEO_PIPE|(0x2<<27)|(0xb<<23)|0x1)
-- 
2.34.1
