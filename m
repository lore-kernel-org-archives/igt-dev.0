Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27664C624D4
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 07:38:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE55910E51D;
	Thu,  3 Sep 2026 07:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oA56EU7l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27EB10F43E
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 07:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788420857; x=1819956857;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QO/rwa8lrFLmbbABqKUcHFjb7ifgzXLjH1LK7yXjaxE=;
 b=oA56EU7l+bkmom6/BIqmONkU9WqqziwIOPDlYwQjpNiJTyCSKJ05HcYn
 exvzvoK96eKcu4yFGM4tE9VlekiRONZYnZHzzSV8AmlaDcgIFc97upy/1
 UD2NmSWePDqoHbt19Kr9HFcAqJvrTf6t0chBpiiPELEU7A26vs9WkVhu1
 IVp3eWzYRf0dQTbHoLvyUyN9IFfpwBdRPEHhqpzBWSMBFObs14aIb0Ehb
 AGPTpGKW/Ct9yQBDfYwIMwpSPBli2W0OV2TxEYSnC19Cp0ohkJr9tZMht
 O0V1ur3rQ0q++bU57D16unUvDQSLSH/21kk0Ir94bu/ZvclymQFiomjHY w==;
X-CSE-ConnectionGUID: 8UDILAStTuS5l819KgJglQ==
X-CSE-MsgGUID: wznqCjX6SyOY63l8NLb8Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88655712"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88655712"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 00:34:16 -0700
X-CSE-ConnectionGUID: eO1ORF7STJ+kCJFXGxPUww==
X-CSE-MsgGUID: nIO4woeDQ1Cu3HyZ0hBarA==
X-ExtLoop1: 1
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 00:34:13 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 Purkait Soham <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Gupta Anshuman <anshuman.gupta@intel.com>,
 Jadav Raag <raag.jadav@intel.com>, Nilawar Badal <badal.nilawar@intel.com>,
 Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v4 03/10] lib/igt_drm_netlink: Introduce DRM RAS Netlink
 interface library
Date: Thu,  3 Sep 2026 13:03:28 +0530
Message-Id: <20260903073335.339540-4-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
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

Introduce an IGT library for communicating with DRM RAS Generic Netlink
interface. Add helpers for Generic Netlink socket initialization and
cleanup.

Cc: Purkait Soham <soham.purkait@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Gupta Anshuman <anshuman.gupta@intel.com>
Cc: Jadav Raag <raag.jadav@intel.com>
Cc: Nilawar Badal <badal.nilawar@intel.com>
Cc: Koujalagi Mallesh <mallesh.koujalagi@intel.com>
Cc: Harish Chegondi <harish.chegondi@intel.com>
Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
v4:Renamed library function names prefixed with igt_drm_netlink_*
   (Nikula Jani and Kamil)
   Moved the headers to other commits which are not necessary in this
   commit (Nikula Jani)
---
 lib/igt_drm_netlink.c | 54 +++++++++++++++++++++++++++++++++++++++++++
 lib/igt_drm_netlink.h | 20 ++++++++++++++++
 lib/meson.build       |  1 +
 3 files changed, 75 insertions(+)
 create mode 100644 lib/igt_drm_netlink.c
 create mode 100644 lib/igt_drm_netlink.h

diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
new file mode 100644
index 000000000..709c01987
--- /dev/null
+++ b/lib/igt_drm_netlink.c
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <stdint.h>
+
+#include <netlink/genl/ctrl.h>
+#include <netlink/genl/genl.h>
+
+#include "igt_core.h"
+#include "igt_drm_netlink.h"
+
+void igt_drm_netlink_cleanup(struct app_context *ctx)
+{
+	if (!ctx || !ctx->sock)
+		return;
+
+	nl_close(ctx->sock);
+	nl_socket_free(ctx->sock);
+	ctx->sock = NULL;
+	ctx->family_id = -1;
+
+	igt_debug("Cleaned up netlink socket.\n");
+}
+
+int igt_drm_netlink_init(struct app_context *ctx)
+{
+	ctx->sock = nl_socket_alloc();
+	if (!ctx->sock)
+		return -1;
+
+	igt_debug("Socket allocation successful. Connecting to Generic Netlink...\n");
+	if (genl_connect(ctx->sock) < 0) {
+		igt_drm_netlink_cleanup(ctx);
+		return -1;
+	}
+
+	igt_debug("Resolving Generic Netlink family '%s'...\n", DRM_RAS_FAMILY_NAME);
+	ctx->family_id = genl_ctrl_resolve(ctx->sock, DRM_RAS_FAMILY_NAME);
+	if (ctx->family_id < 0) {
+		fprintf(stderr,
+			"Failed to resolve Generic Netlink family '%s': %s. "
+			"This may mean the running kernel does not expose DRM RAS support.\n",
+			DRM_RAS_FAMILY_NAME,
+			nl_geterror(ctx->family_id));
+		igt_drm_netlink_cleanup(ctx);
+		return -1;
+	}
+
+	igt_debug("Resolved Generic Netlink family '%s' with id %d.\n",
+		  DRM_RAS_FAMILY_NAME, ctx->family_id);
+	return 0;
+}
diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
new file mode 100644
index 000000000..0e563e55f
--- /dev/null
+++ b/lib/igt_drm_netlink.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef IGT_DRM_NETLINK_H
+#define IGT_DRM_NETLINK_H
+
+#include <drm-uapi/drm_ras.h>
+
+struct app_context {
+	struct nl_sock *sock;
+	int family_id;
+};
+
+void igt_drm_netlink_cleanup(struct app_context *ctx);
+int igt_drm_netlink_init(struct app_context *ctx);
+
+#endif /* IGT_DRM_NETLINK_H */
+
diff --git a/lib/meson.build b/lib/meson.build
index 7248bbc2d..70da9a4a0 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -27,6 +27,7 @@ lib_sources = [
 	'igt_device_scan.c',
 	'igt_drm_clients.h',
 	'igt_drm_fdinfo.c',
+	'igt_drm_netlink.c',
         'igt_fs.c',
 	'igt_aux.c',
 	'igt_dp.c',
-- 
2.34.1

