Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61264C5DF81
	for <igt-dev@archiver.kernel.org>; Mon, 24 Aug 2026 16:48:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047E510E161;
	Mon, 24 Aug 2026 16:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="avIMmvcG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C7510E15F
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Aug 2026 16:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787589731; x=1819125731;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PRsPCe6xtrZ7h9DmK4MsQKu+irdkodjs60Dt9kwmOjw=;
 b=avIMmvcG1D1PFCYMDfVwDzcOV9G13aHvu5Rs6co6QtiQQ16fhuEl+8+a
 CnD3Vj3IK0aC9I0KStEi48LMIuTFp434awXciLdGf5cYogoatshJJGey6
 GtCJ4vUR7PFkKr6jJS5OfUVYZngkbx+qckWTlb/Olp0qxmA65k+5vmfU1
 Fm8Z8YYUFhcXE5+ZF9ibbpYC3CHa/vcVACPjG/LMwtEFAtwIp4n710hzc
 lfJLgGTsVUCdh7TD8PDtXR1pMelQe3/yy1hWra3Vmh3rxORH4OS+Xj+Um
 ku0GmVBdZhtz0Y0nThqR4ENbI8pHYsAxAmAzBEwCPoqjRPRSyaKFtPgVw g==;
X-CSE-ConnectionGUID: VU+PQcGETUO6SoxGc9xdKQ==
X-CSE-MsgGUID: GYX18FiHTaq3/DIqx0IyXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88105681"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="88105681"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 09:42:10 -0700
X-CSE-ConnectionGUID: vWJIXMqKTiyfMYuBUPLFXw==
X-CSE-MsgGUID: 1EKJZEntQuiURjO2DP+OJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="268993378"
Received: from unknown (HELO rkoppura-Z790I-AORUS-ULTRA.iind.intel.com)
 ([10.190.239.17])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 09:42:09 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v3 03/10] lib/igt_drm_netlink: Introduce DRM RAS Netlink
 interface library
Date: Mon, 24 Aug 2026 22:11:26 +0530
Message-Id: <20260824164133.129138-4-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
References: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
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

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
 lib/igt_drm_netlink.c | 60 +++++++++++++++++++++++++++++++++++++++++++
 lib/igt_drm_netlink.h | 25 ++++++++++++++++++
 lib/meson.build       |  1 +
 3 files changed, 86 insertions(+)
 create mode 100644 lib/igt_drm_netlink.c
 create mode 100644 lib/igt_drm_netlink.h

diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
new file mode 100644
index 000000000..fec1639b4
--- /dev/null
+++ b/lib/igt_drm_netlink.c
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include <netlink/errno.h>
+#include <netlink/genl/ctrl.h>
+#include <netlink/genl/genl.h>
+#include <netlink/netlink.h>
+
+#include "igt_core.h"
+#include "igt_drm_netlink.h"
+
+void igt_cleanup_nl_socket(struct app_context *ctx)
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
+int igt_init_nl_socket(struct app_context *ctx)
+{
+	ctx->sock = nl_socket_alloc();
+	if (!ctx->sock)
+		return -1;
+
+	igt_debug("Socket allocation successful. Connecting to Generic Netlink...\n");
+	if (genl_connect(ctx->sock) < 0) {
+		igt_cleanup_nl_socket(ctx);
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
+		igt_cleanup_nl_socket(ctx);
+		return -1;
+	}
+
+	igt_debug("Resolved Generic Netlink family '%s' with id %d.\n",
+		  DRM_RAS_FAMILY_NAME, ctx->family_id);
+	return 0;
+}
diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
new file mode 100644
index 000000000..f681a3a81
--- /dev/null
+++ b/lib/igt_drm_netlink.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef IGT_DRM_NETLINK_H
+#define IGT_DRM_NETLINK_H
+
+#include <stdbool.h>
+#include <stdint.h>
+
+#include <netlink/netlink.h>
+
+#include <drm-uapi/drm_ras.h>
+
+struct app_context {
+	struct nl_sock *sock;
+	int family_id;
+};
+
+void igt_cleanup_nl_socket(struct app_context *ctx);
+int igt_init_nl_socket(struct app_context *ctx);
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

