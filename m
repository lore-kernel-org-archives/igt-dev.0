Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BA16EABD
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Sep 2021 07:42:46 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 22 Sep 2021 13:13:08 +0530
Message-Id: <20210922074308.35769-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/igt_debugfs: Handle memory allocation
 failures for CRC
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Throw assert if failed to allocate memory for pipe crc.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index 2f58519a2..a5bb95ca3 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -688,6 +688,7 @@ pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
 	igt_assert(debugfs != -1);
 
 	pipe_crc = calloc(1, sizeof(struct _igt_pipe_crc));
+	igt_assert(pipe_crc);
 
 	sprintf(buf, "crtc-%d/crc/control", pipe);
 	pipe_crc->ctl_fd = openat(debugfs, buf, O_WRONLY);
-- 
2.32.0
