Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273D51061206
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 11:07:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC23810E88C;
	Wed, 11 Mar 2026 11:07:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QrqTVN2d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A0710E88E
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 11:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773227218; x=1804763218;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jntkNFMqrFfmtNz7SESb8AoGPrjvLWTeLIjfEk73sLw=;
 b=QrqTVN2dVKpkVXCnIlamI6Rz8/65s6QQjQNOsHE7thh/zj4Pt7meB9S2
 JyQhsfCC9LURzdtas8mAIqnlFkdWQBgUDc18gyp0b1gmmLsUO91KJvn03
 Re5kMxJLflIA+jb+cshiGlINZKe3a8gjn0ClBjq72OMdViSAt/lMt/k5b
 eBIKIqTHVJsnVwZHII0m+YVcpWJGK5r+V2oRKL8ZfUfLkh0VZjlZaY/SV
 xB95Cj7+h4QEj60HWoxoLZwLTCnKsjALedwFJLoYsg00iidKBbnSbjmcL
 uK+9OxgFr9+nzgEfmSPJRW+V9cjBBLEyH5oVabC5zf5+EClB6w8/srYDl w==;
X-CSE-ConnectionGUID: oQy6NsWoR9CfrrmNRwts5w==
X-CSE-MsgGUID: F61nGqnqTxecv4ADotV/Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85378233"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="85378233"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:06:58 -0700
X-CSE-ConnectionGUID: yVehoYkgSkSOmxqU6XhuCw==
X-CSE-MsgGUID: kLhmmRrpRm6wpnyMWPmWBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="258344674"
Received: from cmanszew-dev.igk.intel.com ([10.91.214.222])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 04:06:56 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Piotr Rudnicki <piotr.rudnicki@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t v5 2/5] lib/xe/xe_eudebug: Modify toggle error handling
Date: Wed, 11 Mar 2026 12:06:39 +0100
Message-ID: <20260311110636.798120-9-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260311110636.798120-7-christoph.manszewski@intel.com>
References: <20260311110636.798120-7-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Convert __xe_eudebug_enable_getset to use errno. Abort in
xe_eudebug_enable on error (other than -ENOENT) to not leave
the environment in potentially dirty state.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Reviewed-by: Piotr Rudnicki <piotr.rudnicki@intel.com>
Link: https://lore.kernel.org/r/20260220153748.210381-9-christoph.manszewski@intel.com
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 lib/xe/xe_eudebug.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 2387b74f8..41eed7614 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1829,6 +1829,7 @@ static void metadata_event(struct xe_eudebug_client *c, uint32_t flags,
 	xe_eudebug_event_log_write(c->log, (void *)&em);
 }
 
+#define EU_DEBUG_TOGGLE "device/enable_eudebug"
 /**
  * __xe_eudebug_enable_getset
  * @fd: xe client
@@ -1838,13 +1839,12 @@ static void metadata_event(struct xe_eudebug_client *c, uint32_t flags,
  * Stores current eudebug feature state in @old if not NULL. Sets new eudebug
  * feature state to @new if not NULL. Asserts if both @old and @new are NULL.
  *
- * Returns: 0 on success, -1 on failure.
+ * Returns: 0 on success, -errno on failure.
  */
 int __xe_eudebug_enable_getset(int fd, bool *old, bool *new)
 {
-	static const char * const fname = "enable_eudebug";
 	int ret = 0;
-	int sysfs, device_fd;
+	int sysfs;
 	bool val_before;
 	struct stat st;
 
@@ -1853,15 +1853,10 @@ int __xe_eudebug_enable_getset(int fd, bool *old, bool *new)
 
 	sysfs = igt_sysfs_open(fd);
 	if (sysfs < 0)
-		return -1;
-
-	device_fd = openat(sysfs, "device", O_DIRECTORY | O_RDONLY);
-	close(sysfs);
-	if (device_fd < 0)
-		return -1;
+		return -errno;
 
-	if (!__igt_sysfs_get_boolean(device_fd, fname, &val_before)) {
-		ret = -1;
+	if (!__igt_sysfs_get_boolean(sysfs, EU_DEBUG_TOGGLE, &val_before)) {
+		ret = -errno;
 		goto out;
 	}
 
@@ -1871,14 +1866,14 @@ int __xe_eudebug_enable_getset(int fd, bool *old, bool *new)
 		*old = val_before;
 
 	if (new) {
-		if (__igt_sysfs_set_boolean(device_fd, fname, *new))
-			igt_assert_eq(igt_sysfs_get_boolean(device_fd, fname), *new);
+		if (__igt_sysfs_set_boolean(sysfs, EU_DEBUG_TOGGLE, *new))
+			igt_assert_eq(igt_sysfs_get_boolean(sysfs, EU_DEBUG_TOGGLE), *new);
 		else
-			ret = -1;
+			ret = -errno;
 	}
 
 out:
-	close(device_fd);
+	close(sysfs);
 
 	return ret;
 }
@@ -1896,10 +1891,18 @@ out:
  */
 bool xe_eudebug_enable(int fd, bool enable)
 {
+	char sysfs_path[PATH_MAX];
 	bool old = false;
 	int ret = __xe_eudebug_enable_getset(fd, &old, &enable);
 
-	igt_skip_on(ret);
+	if (ret == -ENOENT) {
+		igt_assert(igt_sysfs_path(fd, sysfs_path, sizeof(sysfs_path)));
+		igt_skip("'%s/" EU_DEBUG_TOGGLE
+			 "' sysfs attribute not found, EU DEBUG not supported\n", sysfs_path);
+	}
+
+	igt_abort_on_f(ret, "xe_eudebug_enable: Failed to %s eudebug\n",
+		       enable ? "enable" : "disable");
 
 	return old;
 }
-- 
2.47.1

