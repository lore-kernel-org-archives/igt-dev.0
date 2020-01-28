Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01CE6EDD8
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2020 11:26:08 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id d16so15569090wre.10
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2020 03:26:08 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 28 Jan 2020 12:25:47 +0100
Message-Id: <20200128112549.172135-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/3] tests/kms_fbcon_fbt: Check for psr
 before keeling over
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
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>, Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Not exactly sure where this broke, or whether it ever worked, but the
psr_disable helper calls igt_skip if psr doesn't work. Which means we
neeed to check for that first.

In general lib/igt_psr.c seems to be a library in dire need of some TLC.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 tests/kms_fbcon_fbt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms_fbcon_fbt.c b/tests/kms_fbcon_fbt.c
index acbb6d303f62..506848cfcf47 100644
--- a/tests/kms_fbcon_fbt.c
+++ b/tests/kms_fbcon_fbt.c
@@ -222,7 +222,8 @@ static bool psr_wait_until_update(int debugfs_fd)
 static void disable_features(int debugfs_fd)
 {
 	igt_set_module_param_int("enable_fbc", 0);
-	psr_disable(debugfs_fd);
+	if (psr_sink_support(debugfs_fd, PSR_MODE_1))
+		psr_disable(debugfs_fd);
 }
 
 static inline void fbc_modparam_enable(int debugfs_fd)
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
