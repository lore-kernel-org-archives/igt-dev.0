Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00CA606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 09:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Spe5vDtL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C2FE1120F6;
	Thu, 29 Oct 2026 09:06:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3A211210A
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 09:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793264429; x=1824800429;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hZUAzbuOo6Q91vH4Csv1Y3hVGVRzRotbwC8Rv71cjqA=;
 b=Spe5vDtLh6s0t3ydhmfOYHLWLxKrauRPp6tRntcWA5IHhbZH/19cC5QM
 JHCpVF1Aj1+d06ihamSIfdSZDDXmBmvRc45DKf7RDE3Rza9x54FZJuCfJ
 ES8UzNa156p4LsnIExjK0ijge3I/g2+4CflqR04z3Ed/+3dC4i4cCY2WV
 GpDsRl7092PUnJKTgN2xU8DOgBQAYx0kLQRkIbo6RBpJyb7palN/7Z9nN
 bkQOqTjRCBd2Z1rOyb1qa+9BMdNSApnSxJlCu8BMw1YeQSaJfNjDOPKeD
 i90f3rZhXs/v0YaLxCUW1YStF2XiFfrcn1v5/2bSgHHH2wu7KMDxhp9uk A==;
X-CSE-ConnectionGUID: 4XnnDP4VQ3u92IskBZPDUg==
X-CSE-MsgGUID: 0lHG/CrOSU2qa1aVkkyCkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1991687"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1991687"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 02:00:28 -0700
X-CSE-ConnectionGUID: k1B6u1iZS0mA63G/icTqMQ==
X-CSE-MsgGUID: Bbdaziy/TX2ZIz8eCQ0bhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5092935"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 02:00:25 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: soham.purkait@intel.com, riana.tauro@intel.com, anshuman.gupta@intel.com,
 raag.jadav@intel.com, mallesh.koujalagi@intel.com,
 harish.chegondi@intel.com, kamil.konieczny@linux.intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v6 03/10] lib/igt_drm_ras_nl: Introduce DRM RAS Netlink
 interface library
Date: Thu, 29 Oct 2026 14:29:48 +0530
Message-Id: <20261029085955.1232163-4-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029085955.1232163-1-ravi.kishore.koppuravuri@intel.com>
References: <20261029085955.1232163-1-ravi.kishore.koppuravuri@intel.com>
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
 lib/igt_drm_ras_nl.c | 50 ++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_drm_ras_nl.h | 20 ++++++++++++++++++
 lib/meson.build      |  1 +
 3 files changed, 71 insertions(+)
 create mode 100644 lib/igt_drm_ras_nl.c
 create mode 100644 lib/igt_drm_ras_nl.h

diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
new file mode 100644
index 000000000..2822361d3
--- /dev/null
+++ b/lib/igt_drm_ras_nl.c
@@ -0,0 +1,50 @@
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
+		return -1;
+
+	if (genl_connect(ctx->sock) < 0) {
+		igt_drm_ras_nl_cleanup(ctx);
+		return -1;
+	}
+
+	ctx->family_id = genl_ctrl_resolve(ctx->sock, DRM_RAS_FAMILY_NAME);
+	if (ctx->family_id < 0) {
+		fprintf(stderr,
+			"Failed to resolve Netlink family '%s': %s\n",
+			DRM_RAS_FAMILY_NAME, nl_geterror(ctx->family_id));
+		igt_drm_ras_nl_cleanup(ctx);
+		return -1;
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
index b00353f92..34caf9a27 100644
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

