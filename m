Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF5AC30653
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jul 2024 09:42:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF5E10EA6C;
	Thu,  4 Jul 2024 09:42:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WH7POPX/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3335810EA6C
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jul 2024 09:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720086164; x=1751622164;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C3knjC21wATuMKF9mv2p7SpUNbUfGcTYNEBunsgYum0=;
 b=WH7POPX/lUqnzxBICiL+rq6GZwCbjXSgsoFESlFg8KAoCYnQAwbLK/8+
 Xpvrz7crA9k2qbBVLr49Fhv5aQ+GLsE7uBt7A+vSEbaCqBnvcb4l3/+AL
 xpioThkVb86m84ok0ixPohXApoRj6ME92mclxeRIihjB/YtDWTeoU/gR4
 5AceL/mUdlOJOQ1k5Dzon08bTR/MsQ/b/UbURyoDWEt9g2VwYmms6eUZx
 TaAMVTPfgIbV52XOejCNEDay/pukQwwUm6bVarewDkhT0WdaN4Ho06E/v
 yp4CrAZTeBjHE+4Cc/tr48atjAk17x3Am+fKEK+xsyyHNat4Ydg1uEeUd g==;
X-CSE-ConnectionGUID: yfaQa/SDSBqhoG54hD69lw==
X-CSE-MsgGUID: lR5sgw6AS82lxqO3v7d42A==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="21226221"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="21226221"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 02:42:44 -0700
X-CSE-ConnectionGUID: 9/3X+rkQQOeECJTQmcnBZg==
X-CSE-MsgGUID: IFz7j2g1TwGAGtr6pc73tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="46685201"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa009.jf.intel.com with ESMTP; 04 Jul 2024 02:42:42 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t] lib/igt_sysfs: Implement dynamic adjustment of debug
 log level
Date: Thu,  4 Jul 2024 15:12:51 +0530
Message-Id: <20240704094251.678956-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

Adjust debug log levels dynamically to prevent machine
disk overflow during excessive test debug logs.

Introduce function to modify log levels as needed,
with an exit handler restoring default settings post-test.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_sysfs.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h |  3 +++
 2 files changed, 48 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index ffeec1ca2..c256f0ae7 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -412,6 +412,51 @@ int igt_sysfs_get_num_gt(int device)
 	return num_gts;
 }
 
+void igt_debug_reset(int drm_fd)
+{
+	int fd = igt_sysfs_open(drm_fd);
+
+	if (fd < 0)
+		return;
+	const char *buf = "14";
+
+	const char *path = "/sys/module/drm/parameters/debug";
+	int debug_dir = openat(fd, path, O_WRONLY);
+
+	igt_debug("Resetting Debug value\n");
+	igt_assert_eq(write(debug_dir, buf, strlen(buf)), strlen(buf));
+	close(fd);
+}
+
+static void igt_debug_exit_handler(int sig)
+{
+	int fd = drm_open_driver(DRIVER_INTEL | DRIVER_XE);
+
+	/* Here we assume that only one i915 device will be ever present */
+	igt_debug_reset(fd);
+	close(fd);
+}
+
+void igt_set_debug_value(int drm_fd, unsigned int value)
+{
+	char buf[16];
+	int fd = igt_sysfs_open(drm_fd);
+
+	if (fd < 0)
+		return;
+
+	const char *path = "/sys/module/drm/parameters/debug";
+	int debug_dir = openat(fd, path, O_WRONLY);
+
+	igt_debug("Setting Debug value to %d\n", value);
+	snprintf(buf, sizeof(buf), "%d", value);
+	igt_assert_eq(write(debug_dir, buf, strlen(buf)), strlen(buf));
+
+	close(fd);
+	close(debug_dir);
+	igt_install_exit_handler(igt_debug_exit_handler);
+}
+
 /**
  * igt_sysfs_write:
  * @dir: sysfs directory
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 6c604d939..abc9c1739 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -138,6 +138,9 @@ void igt_sysfs_set_boolean(int dir, const char *attr, bool value);
 void bind_fbcon(bool enable);
 void fbcon_blink_enable(bool enable);
 
+void igt_set_debug_value(int dir, unsigned int value);
+void igt_debug_reset(int dir);
+
 /**
  * igt_sysfs_rw_attr:
  * @dir: file descriptor for parent directory
-- 
2.34.1

