Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EA6E6F07C
	for <igt-dev@archiver.kernel.org>; Tue, 23 Dec 2025 10:22:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F2710E039;
	Tue, 23 Dec 2025 10:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BKZKa+IR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E77810E039
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Dec 2025 10:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766485372; x=1798021372;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FldT569GWqeit0OdEV9wNHEFyQUzLBHZscHYzKRA+l8=;
 b=BKZKa+IRL+dDDM3xMLbV8+DbGeSlpMABP/IVY3JdRkactFaQ64owng1Y
 9P2rVkWTEsZ1xVQEFppqaUuj7+3JeWOd6G2W9HQIaK8jWwJFxMsbBR5pd
 CT51Tz/pRwEMVWyznpD9d+DjesPv7+ik+f5rCcD/guk0QjYKpU649Z/yB
 P/hPrUgl5RrZbF/hn0wDpb7jw0u+NjMoakKuDuYWhrmWOilKaRZBNWxjV
 le5vhlCLyJ1LIFR9UIaaZrNS6BX9OsQlMjCuJ81yP0ufYjLW1X6/pxIsX
 fu6X1juuo0wkJyZ4Tfy2Y+oNoAmm1J899u4f7j2D2DK8vNAVXB47rZnzp Q==;
X-CSE-ConnectionGUID: BDBmL8KfQ72M586XXR7F2w==
X-CSE-MsgGUID: wEvjNdWGQRuTCl0dr9btTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79053794"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; d="scan'208";a="79053794"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 02:22:52 -0800
X-CSE-ConnectionGUID: ly4nuSFtTBS/UgasIH15sw==
X-CSE-MsgGUID: tOsxAvDVQjGLfNuYpqJPfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; d="scan'208";a="200053555"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.36])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 02:22:51 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH i-g-t] lib/intel_compute: Select engine class by engine
 accessibility
Date: Tue, 23 Dec 2025 11:22:44 +0100
Message-ID: <20251223102243.113720-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
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

Stop hardcoding engine class selection based on rel/ver. Instead
select compute engine class if it is available, otherwise try to
use render engine.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/intel_compute.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 49065bdde5..89a2a5adaa 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -173,6 +173,24 @@ static float *get_output_data(const struct bo_execenv *execenv,
 	return output_data;
 }
 
+static uint16_t get_engine_class(int fd)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	bool has_render = false;
+
+	xe_for_each_engine(fd, hwe) {
+		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER)
+			has_render = true;
+		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
+			return hwe->engine_class;
+	}
+
+	igt_assert_f(has_render == true,
+		     "Can't submit compute job, there's no COMPUTE/RENDER engines\n");
+
+	return DRM_XE_ENGINE_CLASS_RENDER;
+}
+
 static void bo_execenv_create(int fd, struct bo_execenv *execenv,
 			      struct drm_xe_engine_class_instance *eci,
 			      struct user_execenv *user)
@@ -201,17 +219,8 @@ static void bo_execenv_create(int fd, struct bo_execenv *execenv,
 			execenv->exec_queue = xe_exec_queue_create(fd, execenv->vm,
 								   eci, 0);
 		} else {
-			uint16_t engine_class;
-			uint32_t devid = intel_get_drm_devid(fd);
-			const struct intel_device_info *info = intel_get_device_info(devid);
-
-			if (info->graphics_ver >= 12 && info->graphics_rel < 60)
-				engine_class = DRM_XE_ENGINE_CLASS_RENDER;
-			else
-				engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
-
 			execenv->exec_queue = xe_exec_queue_create_class(fd, execenv->vm,
-									 engine_class);
+									 get_engine_class(fd));
 		}
 	}
 }
-- 
2.43.0

