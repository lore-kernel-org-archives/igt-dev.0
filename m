Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDD3C30653
	for <igt-dev@archiver.kernel.org>; Sun,  7 Jul 2024 15:04:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1B010E158;
	Sun,  7 Jul 2024 15:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OlgFdXyS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D5D10E097
 for <igt-dev@lists.freedesktop.org>; Sun,  7 Jul 2024 15:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720364694; x=1751900694;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C3knjC21wATuMKF9mv2p7SpUNbUfGcTYNEBunsgYum0=;
 b=OlgFdXySCT3DaynxHxoRmKmowDCgNJuZOvWQEXLtOBwqyjZjWMTIHh0e
 hSSI5ftCoWjyySKdrsJb3r04mwDN5oKFHtSuBQvPBWrgR4Clymcp3G9s+
 lP3HIfHPhO2siUTzNLD5en+ngWZ2QifSU5IO34eDJDsByJIiB3LpQapsj
 UnL1JoPbqCAeTp5Re0wqLzAcGa+EPs40fUxIMVN5rckt/XLTlSEwu1nrB
 lfxpKHPqteynUuS8w5V8TKPG0vNM+8e+YJS7rEntoYNSqD6Gn0F5FdjOQ
 4Ux5PAmSnkL1lz9N4S/P9JNWw21p/N7p/4PvsrE4K9JPqHgTt1uFrhGNs Q==;
X-CSE-ConnectionGUID: gNQWLsjDSSKoBrzdKAsYJg==
X-CSE-MsgGUID: NWwGxnqlSXGO2XzczWo2AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17703808"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; d="scan'208";a="17703808"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2024 08:04:53 -0700
X-CSE-ConnectionGUID: vpW2Fc7sROyIQWiLcKao5A==
X-CSE-MsgGUID: 0TJj3md4TKmsUN55PA8gOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; d="scan'208";a="84817579"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa001.jf.intel.com with ESMTP; 07 Jul 2024 08:04:52 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 bhanuprakash.modem@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t 1/2] lib/igt_sysfs: Implement dynamic adjustment of
 debug log level
Date: Sun,  7 Jul 2024 20:34:56 +0530
Message-Id: <20240707150457.715471-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240707150457.715471-1-pranay.samala@intel.com>
References: <20240707150457.715471-1-pranay.samala@intel.com>
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

