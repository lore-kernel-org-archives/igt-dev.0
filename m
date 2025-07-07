Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18351C83F09
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 03:25:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2E510E303;
	Mon,  7 Jul 2025 03:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I60CMR3x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8314A10E303
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 03:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751858713; x=1783394713;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0jUv5+EShMsYz8b6Fx+UVw7t+gjOWO1CCteNCF09m8E=;
 b=I60CMR3xqhkO8UxHItYVXfVGYbznd72htjLpyOCes9F4Zk0WttswmSo4
 G7o1eIeJ+neKumiMeZp23BwF8/LJ1s1uW7zkLtePt9ojx59Jms97m66oU
 4HjNfIYwQUcqK55Ucf1Xac6aO7oTm7NfE2zf0fgCuncrpHfJ/sTudy49B
 MR8aG/ekcGZ7DMlelsIAVy5vNglgv9hvaeWwRU23CNdTCib+oVsPjSnnm
 sh1azXzzbmm6kJcA2PnQ7Ho41vTwlT0Yrw9zi4AJSzQN1sx58b2ebmwTr
 16yFJ5e6bx84V2zl+nJkjslGbeYlxCx9QLkBQ9yLjRrXpI0EnLgyWdopK g==;
X-CSE-ConnectionGUID: tfr5YeqCSzOmGD5Vi3yc8g==
X-CSE-MsgGUID: 44iO5y8uTXaYtQarCPt3WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="65134978"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="65134978"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 20:25:13 -0700
X-CSE-ConnectionGUID: PuT2RNC1Qi6RhMDxVhGJQw==
X-CSE-MsgGUID: 0CqqaCwWSbW0i50rzA8KCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="192288712"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa001.jf.intel.com with ESMTP; 06 Jul 2025 20:25:11 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com,
 Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t v5 1/5] lib/igt_sysfs: Rename log_level to
 saved_drm_debug_mask
Date: Mon,  7 Jul 2025 09:02:42 +0530
Message-Id: <20250707033246.751156-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707033246.751156-1-pranay.samala@intel.com>
References: <20250707033246.751156-1-pranay.samala@intel.com>
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

Rename log_level to saved_drm_debug_mask as it holds
the mask pre-test and will be used to reset the
debug mask post test.

v3:
- Refactored for readability and address logical comment.

v4:
- Improve variable name for debug mask saving (Kunal)

v5:
- Edit the commit message and subject (Jan)
- Rename a word in igt_debug message (Rama)

Fixes: 56b91193b825 ("lib/igt_sysfs: Implement dynamic adjustment of debug log level")
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Jan Sokolowski <jan.sokolowski@intel.com>
---
 lib/igt_sysfs.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 2ba96ca7f..23fe4ac45 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -443,7 +443,7 @@ int igt_sysfs_drm_module_params_open(void)
 	return open(path, O_RDONLY);
 }
 
-static int log_level = -1;
+static int saved_drm_debug_mask = -1;
 
 /**
  * igt_drm_debug_level_get:
@@ -458,8 +458,8 @@ int igt_drm_debug_level_get(int dir)
 {
 	char buf[20];
 
-	if (log_level >= 0)
-		return log_level;
+	if (saved_drm_debug_mask >= 0)
+		return saved_drm_debug_mask;
 
 	if (igt_sysfs_read(dir, "debug", buf, sizeof(buf) - 1) < 0)
 		return -1;
@@ -479,15 +479,15 @@ void igt_drm_debug_level_reset(void)
 	char buf[20];
 	int dir;
 
-	if (log_level < 0)
+	if (saved_drm_debug_mask < 0)
 		return;
 
 	dir = igt_sysfs_drm_module_params_open();
 	if (dir < 0)
 		return;
 
-	igt_debug("Resetting DRM debug level to %d\n", log_level);
-	snprintf(buf, sizeof(buf), "%d", log_level);
+	igt_debug("Restoring DRM debug level to %d\n", saved_drm_debug_mask);
+	snprintf(buf, sizeof(buf), "%d", saved_drm_debug_mask);
 	igt_assert(igt_sysfs_set(dir, "debug", buf));
 
 	close(dir);
@@ -513,8 +513,8 @@ void igt_drm_debug_level_update(unsigned int new_log_level)
 	if (dir < 0)
 		return;
 
-	log_level = igt_drm_debug_level_get(dir);
-	if (log_level < 0) {
+	saved_drm_debug_mask = igt_drm_debug_level_get(dir);
+	if (saved_drm_debug_mask < 0) {
 		close(dir);
 		return;
 	}
-- 
2.34.1

