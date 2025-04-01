Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E1AC36014
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 09:20:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2AD10E530;
	Tue,  1 Apr 2025 09:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MEbzxJFS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BCB10E060
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 09:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743499224; x=1775035224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mVVwzPYk8v1qtO75yvQtJTjO6XGXjkv2IKgLSc169M0=;
 b=MEbzxJFSEnL7jRrNPjqybOQ3BD1haUKVYe/EmyEbBE5i8xF2gFtnVKTf
 fq4R/TI7RGXLCwMj6RScgPOzHFJouXylM9wIp2aBC+nn/LeCFX4gDLbHE
 yQkJuir0amVNCrNDCT4fgFZ7QgVyioSjBafrUOocUA0INuRu+5qNqmKal
 dD+9xmVP4aSM5fUPmi9h2hrFVCZb0eYfdyzM2lh2YArU6ojZ2WfcTkSDN
 172seicgwyzf6wtEfP9DwXBpYAcwTGb35knwE2dMHJL7WbyoTNybGakBR
 K2o4aDFFCd2hzqC7gJm3rAujfgKD8mRrdePoROiFb2Z0ORiK2/x4soVq0 w==;
X-CSE-ConnectionGUID: GsmwN/LJTuu0z1IVhbBEiw==
X-CSE-MsgGUID: YOkoEdDqRG2TTG7c0Opiwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="62211742"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="62211742"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 02:20:22 -0700
X-CSE-ConnectionGUID: FKaF+FflREKmkc6TfLaZFg==
X-CSE-MsgGUID: HdgImI4tSJGlwGXGhtMPZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="126166452"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa006.fm.intel.com with ESMTP; 01 Apr 2025 02:20:20 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v3 1/5] lib/igt_sysfs: Usage of Original debug mask to
 read/reset
Date: Tue,  1 Apr 2025 14:50:11 +0530
Message-Id: <20250401092015.818465-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401092015.818465-1-pranay.samala@intel.com>
References: <20250401092015.818465-1-pranay.samala@intel.com>
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

Original debug mask holds the mask before the test and will be
used to reset the debug mask post test.

Fixes: 56b91193b825 ("lib/igt_sysfs: Implement dynamic adjustment of debug log level")
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_sysfs.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 2e4c2ee63..9643aab43 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -443,7 +443,7 @@ int igt_sysfs_drm_module_params_open(void)
 	return open(path, O_RDONLY);
 }
 
-static int log_level = -1;
+static int original_debug_mask = -1;
 
 /**
  * igt_drm_debug_level_get:
@@ -458,8 +458,8 @@ int igt_drm_debug_level_get(int dir)
 {
 	char buf[20];
 
-	if (log_level >= 0)
-		return log_level;
+	if (original_debug_mask >= 0)
+		return original_debug_mask;
 
 	if (igt_sysfs_read(dir, "debug", buf, sizeof(buf) - 1) < 0)
 		return -1;
@@ -479,15 +479,15 @@ void igt_drm_debug_level_reset(void)
 	char buf[20];
 	int dir;
 
-	if (log_level < 0)
+	if (original_debug_mask < 0)
 		return;
 
 	dir = igt_sysfs_drm_module_params_open();
 	if (dir < 0)
 		return;
 
-	igt_debug("Resetting DRM debug level to %d\n", log_level);
-	snprintf(buf, sizeof(buf), "%d", log_level);
+	igt_debug("Resetting DRM debug level to %d\n", original_debug_mask);
+	snprintf(buf, sizeof(buf), "%d", original_debug_mask);
 	igt_assert(igt_sysfs_set(dir, "debug", buf));
 
 	close(dir);
@@ -513,8 +513,8 @@ void igt_drm_debug_level_update(unsigned int new_log_level)
 	if (dir < 0)
 		return;
 
-	log_level = igt_drm_debug_level_get(dir);
-	if (log_level < 0) {
+	original_debug_mask = igt_drm_debug_level_get(dir);
+	if (original_debug_mask < 0) {
 		close(dir);
 		return;
 	}
-- 
2.34.1

