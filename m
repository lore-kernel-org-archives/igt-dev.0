Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDC7C369CD
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 12:19:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C8710E31E;
	Thu, 26 Sep 2024 12:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PzyozLCE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBC610E31E
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 12:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727353152; x=1758889152;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dq3Mvtb2LE44nJoHibIB2e2vlapXUm55CX5OZntVdOE=;
 b=PzyozLCE9k4IzFt1R/nSoA4xUgDdlJgPWsOcRVxx0vu4cnOINyLowAYv
 I3/34mBuGgHa16eImFJoswtzRYa7TngepFhuCodAWBbTDA39g5HQIdSUa
 X1Iwq5CFQi+SDp511p1ZpMlqoJDQVLMgkR2aiGEOigu5ddzsX3fsk9M16
 j1G96s3ALi56IQoV9rl5XKhD3q9T7vWzrC1r8Z32Hj0vOl0FOZ5mvNRxv
 /V+2MpssSedS/hU85l8NygcYkI+ege039Na6miOlYwx+bN5J++CV7kdMt
 9OCpJwcyTrNGU5bSLQAtPjofSUTbcozOYc3UsLFxobIbU68zjyOrpNJfA A==;
X-CSE-ConnectionGUID: kc4GLJjoRU+zhOBGHxM4Uw==
X-CSE-MsgGUID: KpkxUff+T7yEv2QGcGdH4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="43958765"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="43958765"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 05:19:11 -0700
X-CSE-ConnectionGUID: YXzePcj0Rxm50o9El6jL3w==
X-CSE-MsgGUID: TPzSHCnOS7S5cz0bqNpT+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="76956879"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.104])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 05:19:09 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 1/2] lib/xe_eudebug: Introduce preempt_timeout helpers
Date: Thu, 26 Sep 2024 14:18:45 +0200
Message-Id: <20240926121846.5885-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240926121846.5885-1-dominik.karol.piatkowski@intel.com>
References: <20240926121846.5885-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This patch introduces preempt_timeout helpers:
 - xe_eudebug_set_preempt_timeout_to_max
   Sets preempt_timeout_us for given engine_class to maximum.
 - xe_eudebug_restore_preempt_timeout
   Sets preempt_timeout_us for given engine_class to previous value.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/xe/xe_eudebug.c | 120 ++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_eudebug.h |   3 ++
 2 files changed, 123 insertions(+)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 2c7cd2ae1..229f9e6a1 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -16,6 +16,7 @@
 #include "intel_pat.h"
 #include "xe_eudebug.h"
 #include "xe_ioctl.h"
+#include "xe_drm.h"
 
 struct event_trigger {
 	xe_eudebug_trigger_fn fn;
@@ -1717,6 +1718,125 @@ bool xe_eudebug_enable(int fd, bool enable)
 	return old;
 }
 
+/**
+ * xe_eudebug_set_preempt_timeout_to_max
+ * @fd: xe client
+ * @engine_class: engine class to modify (drm_xe_engine_class_instance->engine_class)
+ * @value: pointer to variable to store previous preempt_timeout value in, needed for restore
+ *
+ * Sets preempt_timeout_us for given engine_class to maximum.
+ *
+ * Returns: true on success, false on failure.
+ */
+bool xe_eudebug_set_preempt_timeout_to_max(int fd, uint16_t engine_class, uint32_t *value)
+{
+	int engines_fd;
+	int gt_fd;
+	uint32_t max_value;
+
+	igt_assert(engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
+		   engine_class == DRM_XE_ENGINE_CLASS_COMPUTE);
+
+	gt_fd = xe_sysfs_gt_open(fd, 0);
+	if (gt_fd == -1) {
+		igt_debug("Failed to open gt.\n");
+
+		return false;
+	}
+
+	if (engine_class == DRM_XE_ENGINE_CLASS_RENDER)
+		engines_fd = openat(gt_fd, "engines/rcs", O_RDONLY);
+	else
+		engines_fd = openat(gt_fd, "engines/ccs", O_RDONLY);
+
+	if (engines_fd == -1) {
+		igt_debug("Failed to open engine class.\n");
+		close(gt_fd);
+
+		return false;
+	}
+
+	if (!__igt_sysfs_get_u32(engines_fd, "preempt_timeout_us", value)) {
+		igt_debug("Failed to read preempt_timeout_us.\n");
+		close(engines_fd);
+		close(gt_fd);
+
+		return false;
+	}
+
+	if (!__igt_sysfs_get_u32(engines_fd, "preempt_timeout_max", &max_value)) {
+		igt_debug("Failed to read preempt_timeout_max.\n");
+		close(engines_fd);
+		close(gt_fd);
+
+		return false;
+	}
+
+	if (!__igt_sysfs_set_u32(engines_fd, "preempt_timeout_us", max_value)) {
+		igt_debug("Failed to write preempt_timeout_us.\n");
+		close(engines_fd);
+		close(gt_fd);
+
+		return false;
+	}
+
+	close(engines_fd);
+	close(gt_fd);
+
+	return true;
+}
+
+/**
+ * xe_eudebug_restore_preempt_timeout
+ * @fd: xe client
+ * @engine_class: engine class to modify (drm_xe_engine_class_instance->engine_class)
+ * @value: previous preempt_timeout value
+ *
+ * Sets preempt_timeout_us for given engine_class to previous value.
+ *
+ * Returns: true on success, false on failure.
+ */
+bool xe_eudebug_restore_preempt_timeout(int fd, uint16_t engine_class, uint32_t value)
+{
+	int engines_fd;
+	int gt_fd;
+
+	igt_assert(engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
+		   engine_class == DRM_XE_ENGINE_CLASS_COMPUTE);
+
+	gt_fd = xe_sysfs_gt_open(fd, 0);
+	if (gt_fd == -1) {
+		igt_debug("Failed to open gt.\n");
+
+		return false;
+	}
+
+	if (engine_class == DRM_XE_ENGINE_CLASS_RENDER)
+		engines_fd = openat(gt_fd, "engines/rcs", O_RDONLY);
+	else
+		engines_fd = openat(gt_fd, "engines/ccs", O_RDONLY);
+
+	if (engines_fd == -1) {
+		igt_debug("Failed to open engine class.\n");
+		close(gt_fd);
+
+		return false;
+	}
+
+	if (!__igt_sysfs_set_u32(engines_fd, "preempt_timeout_us", value)) {
+		igt_debug("Failed to write preempt_timeout_us.\n");
+		close(engines_fd);
+		close(gt_fd);
+
+		return false;
+	}
+
+	close(engines_fd);
+	close(gt_fd);
+
+	return true;
+}
+
 /* Eu debugger wrappers around resource creating xe ioctls. */
 
 /**
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index 29ab68fee..144035862 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -167,6 +167,9 @@ void xe_eudebug_client_set_data(struct xe_eudebug_client *c, void *ptr);
 
 bool xe_eudebug_enable(int fd, bool enable);
 
+bool xe_eudebug_set_preempt_timeout_to_max(int fd, uint16_t engine_class, uint32_t *value);
+bool xe_eudebug_restore_preempt_timeout(int fd, uint16_t engine_class, uint32_t value);
+
 int xe_eudebug_client_open_driver(struct xe_eudebug_client *c);
 void xe_eudebug_client_close_driver(struct xe_eudebug_client *c, int fd);
 uint32_t xe_eudebug_client_vm_create(struct xe_eudebug_client *c, int fd,
-- 
2.34.1

