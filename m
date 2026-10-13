Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4369CC6B12
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 19:10:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697EE10E5E5;
	Tue, 13 Oct 2026 19:10:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8735010E5E5
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 19:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791918455; x=1823454455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jelgYTAqcfW+lmnmowE7JWQuGJqUAT/w4uhtlcwr6fU=;
 b=TDTB50xST5KuBAGMGD7IUEKCS5cDTlJtcA+lGGWhZV7SYCafXWWa/PEB
 Y9UIKxe9Gpg+JUcmB5SQlp2cLTRQkOjaeHNelhvSDCPavD1YTP8yTqQBt
 9wRAncDA3focWla4ZDW3yiOCDQYJ5SsWi6pr4VAIjuSA/JPOhcpfmtuIj
 jxjfJu3FDLTTfg/iDf0v8v4JFN/IbERDXt3Xn0O1up2vJmnNJ5Qn5oH8k
 VlrviMGmnh5+eJ0zqDxE6ksV5CIb5pa55/mUJBjOYlza3jwycjpVq7ldM
 4sJa243P9tX/TGSc7YA03PWyZTroKqcHgxG8qfTa1amzlxXFj14GdNDIN A==;
X-CSE-ConnectionGUID: 68QzSD/hThKefEOyvNIAyw==
X-CSE-MsgGUID: 0ziTmF9jQYyylQ7IYyNO7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="687228"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="687228"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:07:34 -0700
X-CSE-ConnectionGUID: STAhxUWzSGeW+YTNizmLMA==
X-CSE-MsgGUID: cATdKfiwQDS8PKFRkWj/JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="3004457"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 12:07:31 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Raag Jadav <raag.jadav@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH v5 03/10] lib/igt_drm_netlink: Introduce DRM RAS Netlink
 interface library
Date: Wed, 14 Oct 2026 00:36:44 +0530
Message-Id: <20261013190651.897241-4-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
References: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
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

Cc: Soham Purkait <soham.purkait@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Harish Chegondi <harish.chegondi@intel.com>
Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
v5:Renamed library function names prefixed with igt_drm_ras_nl_*
   (Riana and Soham)
v4:Renamed library function names prefixed with igt_drm_netlink_*
   (Nikula Jani and Kamil)
   Moved the headers to other commits which are not necessary in this
   commit (Nikula Jani)
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
index df3046f46..c4e03c831 100644
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

