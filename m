Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D94C3DA41
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 11:02:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249B210E9DF;
	Thu, 11 Jul 2024 11:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LYYvv94V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3313310E9F8
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 11:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720695745; x=1752231745;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fbb2DBhITnEbJBgKdHUhU6OzpltKPjM04dA364UkVHA=;
 b=LYYvv94VJOxQJxCYNIQQ6DJgsv0BBN+QTSyzYGh3B8w0jZHR8T7f/cWb
 hVZDo6CmCMwYepff1J2eSVPffHERUZCMA5JXYOae0wRCSiRLZxJKoyiyN
 Thwy437QI5/Z/cJJvK7iOKKHYTivi9q9kgC3zUD0ssrehKVaICP1FTdZM
 4fkLrc1BY9Qekdwqzqj/PRqSDG3jPGRiyN2X4buKv2OC+IeKkH9xrkXnH
 9bzLD9o/bCSMWFrn0a4LuKcLuAbtnFFV6fCwC4YX83oMtAUn1dj8m5hwA
 9h83ARZEsFe4OIDahfplvote7pjaRBpWKQySaNJJdxYc+L8xVf85TOaOG w==;
X-CSE-ConnectionGUID: hIkp9MLeQIOhf6f8yjoBuw==
X-CSE-MsgGUID: y+QAGfm2Q3Ws6bf9HYyOWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="40579884"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="40579884"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 04:02:25 -0700
X-CSE-ConnectionGUID: p3DT7PqUT023/6zBqbE+VQ==
X-CSE-MsgGUID: KVrF2H8kS9GtRs/COdCPbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="53699992"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.210])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 04:02:23 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/2] lib/xe_query: Add display alignment helper
Date: Thu, 11 Jul 2024 13:02:09 +0200
Message-Id: <20240711110210.207882-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240711110210.207882-1-zbigniew.kempczynski@intel.com>
References: <20240711110210.207882-1-zbigniew.kempczynski@intel.com>
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

Battlemage supports 4K pages but display requires 64K physical page
alignment for Tile4 + compression. Lets add helper which returns
necessary bo alignment. This is temporary solution as kernel change
which exposes 64K as configuration for display alignment needs to
be merged first. This chicken-and-egg problem is workarounded here
and it will be replaced in next step after kernel change will land.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/xe/xe_query.c | 27 +++++++++++++++++++++++++++
 lib/xe/xe_query.h |  4 ++++
 2 files changed, 31 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 84eaaac967..1f277500a5 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -12,6 +12,7 @@
 #include "drmtest.h"
 #include "ioctl_wrappers.h"
 #include "igt_map.h"
+#include "intel_chipset.h"
 
 #include "xe_query.h"
 #include "xe_ioctl.h"
@@ -188,6 +189,23 @@ static uint32_t __mem_default_alignment(struct drm_xe_query_mem_regions *mem_reg
 	return alignment;
 }
 
+/*
+ * FIXME:
+ *
+ * This function is temporary and will be replaced by config->display_alignment
+ * exposed in the kernel configuration. Before kernel change will land it mimics
+ * its behavior.
+ */
+static uint32_t __display_alignment(uint16_t devid)
+{
+	uint32_t display_alignment = XE_DEFAULT_ALIGNMENT;
+
+	if (IS_BATTLEMAGE(devid))
+		display_alignment = XE_DEFAULT_ALIGNMENT_64K;
+
+	return display_alignment;
+}
+
 /**
  * xe_engine_class_string:
  * @engine_class: engine class
@@ -268,6 +286,7 @@ struct xe_device *xe_device_get(int fd)
 	xe_dev->config = xe_query_config_new(fd);
 	xe_dev->va_bits = xe_dev->config->info[DRM_XE_QUERY_CONFIG_VA_BITS];
 	xe_dev->dev_id = xe_dev->config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
+	xe_dev->display_alignment = __display_alignment(xe_dev->dev_id);
 	xe_dev->gt_list = xe_query_gt_list_new(fd);
 	xe_dev->memory_regions = __memory_regions(xe_dev->gt_list);
 	xe_dev->engines = xe_query_engines(fd);
@@ -691,6 +710,14 @@ uint64_t xe_visible_available_vram_size(int fd, int gt)
  */
 xe_dev_FN(xe_get_default_alignment, default_alignment, uint32_t);
 
+/**
+ * xe_get_display_alignment:
+ * @fd: xe device fd
+ *
+ * Returns alignment for allocating bo for display on xe device @fd.
+ */
+xe_dev_FN(xe_get_display_alignment, display_alignment, uint32_t);
+
 /**
  * xe_va_bits:
  * @fd: xe device fd
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index c33f91ca11..4f46d397e3 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -50,6 +50,9 @@ struct xe_device {
 	/** @default_alignment: safe alignment regardless region location */
 	uint32_t default_alignment;
 
+	/** @display_alignment: required alignment for display */
+	uint32_t display_alignment;
+
 	/** @has_vram: true if gpu has vram, false if system memory only */
 	bool has_vram;
 
@@ -97,6 +100,7 @@ uint64_t xe_visible_vram_size(int fd, int gt);
 uint64_t xe_available_vram_size(int fd, int gt);
 uint64_t xe_visible_available_vram_size(int fd, int gt);
 uint32_t xe_get_default_alignment(int fd);
+uint32_t xe_get_display_alignment(int fd);
 uint32_t xe_va_bits(int fd);
 uint16_t xe_dev_id(int fd);
 int xe_supports_faults(int fd);
-- 
2.34.1

