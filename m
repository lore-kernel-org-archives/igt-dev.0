Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9741C606A320
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 16:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KL0PG1vy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3586910E21C;
	Tue, 10 Nov 2026 16:12:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29C010E21C
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2026 16:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794326881; x=1825862881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x8igFfd0y2MjTa3gdQum1Rm5GxI1pMkxdvCh+BT9GMc=;
 b=KL0PG1vy6ATEYeIKsmSy15SKqImwBM/Fyj6xL6RMbl6gsHsL+tyNdwmT
 LvYy685e7Bwgwzk2jeAvF3KHYLGrXR9T4DkG2KyaiNiU+Ezx7GMKABJB7
 MNaAQBX8pqj4ZCOWShbGgo1b5cMXj7fvCTRVnY+rT9+hCXzPw6Mbgje/f
 cJStvYUvfAxy9kvlUp438mE6ig7tSbquqPCpSFVmxgX0KrdkGkx3joTYv
 9NEMTmNf9B3K52wXRedJHDCzaUqzgrEW9x+SOQeksnWs8JKCNwrlKJl5O
 42K7LkmGtOzIpat2DKBPjSdoK6NHT3QzOeIJayaCFRWiSfMav1DIOfERr A==;
X-CSE-ConnectionGUID: HIjIr88pRUa4gintxRtKug==
X-CSE-MsgGUID: W35U4mzBSt2ruVnunHhAPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3079313"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3079313"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 08:05:35 -0800
X-CSE-ConnectionGUID: aM7mulTqTUCaHL1DE6QAWA==
X-CSE-MsgGUID: 7BaDevzcRzepbR5QyFsgDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8781800"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 08:05:32 -0800
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: soham.purkait@intel.com, riana.tauro@intel.com, anshuman.gupta@intel.com,
 raag.jadav@intel.com, mallesh.koujalagi@intel.com,
 harish.chegondi@intel.com, kamil.konieczny@linux.intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v7 03/10] lib/igt_drm_ras_nl: Introduce DRM RAS Netlink
 interface library
Date: Tue, 10 Nov 2026 21:34:57 +0530
Message-Id: <20261110160504.1315160-4-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110160504.1315160-1-ravi.kishore.koppuravuri@intel.com>
References: <20261110160504.1315160-1-ravi.kishore.koppuravuri@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Introduce an IGT library for communicating with DRM RAS Generic Netlink
interface. Add helpers for Generic Netlink socket initialization and
cleanup.

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Reviewed-by: Soham Purkait <soham.purkait@intel.com>
---
v7: Improved error handling to return standard errno values instead of a generic -1
---
 lib/igt_drm_ras_nl.c | 51 ++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_drm_ras_nl.h | 20 +++++++++++++++++
 lib/meson.build      |  1 +
 3 files changed, 72 insertions(+)
 create mode 100644 lib/igt_drm_ras_nl.c
 create mode 100644 lib/igt_drm_ras_nl.h

diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
new file mode 100644
index 000000000..91396452d
--- /dev/null
+++ b/lib/igt_drm_ras_nl.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <errno.h>
+#include <stdint.h>
+
+#include <netlink/genl/ctrl.h>
+#include <netlink/genl/genl.h>
+
+#include "igt_core.h"
+#include "igt_drm_ras_nl.h"
+
+void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx)
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
+int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx)
+{
+	ctx->sock = nl_socket_alloc();
+	if (!ctx->sock)
+		return -ENOMEM;
+
+	if (genl_connect(ctx->sock) < 0) {
+		igt_warn("Failed to connect to Generic Netlink\n");
+		igt_drm_ras_nl_cleanup(ctx);
+		return -EIO;
+	}
+
+	ctx->family_id = genl_ctrl_resolve(ctx->sock, DRM_RAS_FAMILY_NAME);
+	if (ctx->family_id < 0) {
+		igt_warn("Failed to resolve Netlink family '%s': %s\n",
+			 DRM_RAS_FAMILY_NAME, nl_geterror(ctx->family_id));
+		igt_drm_ras_nl_cleanup(ctx);
+		return -EIO;
+	}
+
+	igt_debug("Resolved Generic Netlink family '%s' with id %d.\n",
+		  DRM_RAS_FAMILY_NAME, ctx->family_id);
+	return 0;
+}
diff --git a/lib/igt_drm_ras_nl.h b/lib/igt_drm_ras_nl.h
new file mode 100644
index 000000000..011f3bc05
--- /dev/null
+++ b/lib/igt_drm_ras_nl.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef IGT_DRM_RAS_NL_H
+#define IGT_DRM_RAS_NL_H
+
+#include <drm-uapi/drm_ras.h>
+
+struct igt_drm_ras_nl_context {
+	struct nl_sock *sock;
+	int family_id;
+};
+
+void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
+int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx);
+
+#endif /* IGT_DRM_RAS_NL_H */
+
diff --git a/lib/meson.build b/lib/meson.build
index c345895bc..8c22ded8a 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -27,6 +27,7 @@ lib_sources = [
 	'igt_device_scan.c',
 	'igt_drm_clients.h',
 	'igt_drm_fdinfo.c',
+	'igt_drm_ras_nl.c',
         'igt_fs.c',
 	'igt_aux.c',
 	'igt_dp.c',
-- 
2.34.1

