Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B323D64084
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 20:19:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E8E88D18;
	Fri,  8 Nov 2024 20:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J88KzOxu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AEE410EA39
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 20:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731097138; x=1762633138;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=csqUy0jzjYru4WZpJsACDoi0DGkITT9T4YVko+WnA0k=;
 b=J88KzOxuN77VjvD+aEvGhteIAydmfCPJUTZFz/WQol/MrpHKi2diykXP
 l/6SYgnwTWhjhhBWWx4JuEUGYOCL3AIpoNX+wgr/vxqwdvL71Tpd/npnh
 wRno304L8KwLvv9D6LMZGLGj6lOrasPNf0bZbS8PjlLWep5uFaJkGlcvb
 WJgQ+kqQCj6kCPY4Az4XzNZPAHgeJm8kJoxOXfI63CjnGO4BpsqwjIFmR
 whxDnjnV/mMoMdlZ0zJS57uOfDEz6Bl1R7Uifvactcj7rbpdxb0uO857b
 Vznw68frJFlfhu4wwuLnUo8SWmapMTJLGbR4/ODQJUJbPWvlm38UAv3NG w==;
X-CSE-ConnectionGUID: D+6Ez+zKREeDiESUzf4YPA==
X-CSE-MsgGUID: ZOECjCiQS0Kq88AcIa8Tyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="30390944"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="30390944"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 12:18:58 -0800
X-CSE-ConnectionGUID: 7iEotXsUTF+ExEMAehzIUA==
X-CSE-MsgGUID: xCOfpq6uQcGeyB9j4dWdcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="85621343"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.135])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 12:18:57 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH i-g-t v3 3/4] lib/drmtest: invalidate cached fds after unbind
Date: Fri,  8 Nov 2024 21:18:38 +0100
Message-ID: <20241108201839.119079-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108201839.119079-1-kamil.konieczny@linux.intel.com>
References: <20241108201839.119079-1-kamil.konieczny@linux.intel.com>
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

After driver unbind or reload cached drm file descriptors could
become stale, so there is no point in preventing calling
drm_open_driver() again. This should prevent errors like:

(xe_wedged:3680) drmtest-DEBUG: Condition stat(path, &new) != 0 occurred
	in function _is_already_opened, file ../lib/drmtest.c:407
(xe_wedged:3680) drmtest-WARNING: card maching filter 0 is already opened

when test tries to open again driver and make checks if
it is functional.

Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/drmtest.c          | 18 ++++++++++++++++++
 lib/drmtest.h          |  2 ++
 lib/igt_sysfs.c        |  1 +
 tests/core_hotunplug.c |  1 +
 4 files changed, 22 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 2dd4540b8..2919a4891 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -726,6 +726,24 @@ static void cancel_work_at_exit_render(int sig)
 	at_exit_drm_render_fd = -1;
 }
 
+/**
+ * __drm_invalidate_opened_fds:
+ *
+ * Invalidate drmtest internal fd caches.
+ */
+void __drm_invalidate_opened_fds(void)
+{
+	_opened_fds_count = 0;
+	if (at_exit_drm_fd >= 0)
+		close(at_exit_drm_fd);
+
+	at_exit_drm_fd = -1;
+	if (at_exit_drm_render_fd >= 0)
+		close(at_exit_drm_render_fd);
+
+	at_exit_drm_render_fd = -1;
+}
+
 static const char *chipset_to_vendor_str(int chipset)
 {
 	return chipset == DRIVER_XE ? chipset_to_str(DRIVER_INTEL) : chipset_to_str(chipset);
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 27e5a18e2..fb37a1070 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -129,6 +129,8 @@ int drm_reopen_driver(int fd);
 int drm_prepare_filtered_multigpu(int chipset);
 int drm_open_filtered_card(int idx);
 
+void __drm_invalidate_opened_fds(void);
+
 void igt_require_amdgpu(int fd);
 void igt_require_intel(int fd);
 void igt_require_i915(int fd);
diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 26a3aa31f..356b20f29 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -1377,6 +1377,7 @@ int xe_sysfs_driver_do(int xe_device, char pci_slot[], enum xe_sysfs_driver_acti
 
 	sysfs = open("/sys/bus/pci/drivers/xe", O_DIRECTORY);
 	igt_assert(sysfs);
+	__drm_invalidate_opened_fds();
 
 	switch(action) {
 	case XE_SYSFS_DRIVER_BIND:
diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 7f17f4423..39042f200 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -489,6 +489,7 @@ static bool healthcheck(struct hotunplug *priv, bool recover)
 
 	/* device name may have changed, rebuild IGT device list */
 	igt_devices_scan(true);
+	__drm_invalidate_opened_fds();
 
 	node_healthcheck(priv, recover ? FLAG_RECOVER : 0);
 	if (!priv->failure)
-- 
2.47.0

