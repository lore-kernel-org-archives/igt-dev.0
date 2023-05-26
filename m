Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771A910E093
 for <igt-dev@lists.freedesktop.org>; Fri, 26 May 2023 06:45:57 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 26 May 2023 12:15:19 +0530
Message-Id: <20230526064520.310041-2-swati2.sharma@intel.com>
In-Reply-To: <20230526064520.310041-1-swati2.sharma@intel.com>
References: <20230526064520.310041-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/tests/kms_cursor_crc: remove
 extra \n
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

Remove extra newline.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_cursor_crc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index f837dbc4..f5eb061d 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -29,7 +29,6 @@
 #include <stdio.h>
 #include <string.h>
 
-
 IGT_TEST_DESCRIPTION(
    "Use the display CRC support to validate cursor plane functionality. "
    "The test will position the cursor plane either fully onscreen, "
@@ -87,7 +86,6 @@ static bool extended;
 static enum pipe active_pipes[IGT_MAX_PIPES];
 static uint32_t last_pipe;
 
-
 #define TEST_DPMS (1<<0)
 #define TEST_SUSPEND (1<<1)
 
-- 
2.25.1
