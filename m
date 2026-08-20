Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF942C5DF81
	for <igt-dev@archiver.kernel.org>; Thu, 20 Aug 2026 12:21:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9425410F010;
	Thu, 20 Aug 2026 12:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ermCm7zb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02CE10E1D6
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Aug 2026 12:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787228192; x=1818764192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UIBemX7RyVqJmpz+PrI+orakZbtyBNVH4rQ9VI47rEQ=;
 b=ermCm7zbdPUT9NcLzArXG34K016RSopXrgqOmg9IBPLUw4QRBBrh/kZC
 +jfyIc1d8seJBE745mrywL+XRFFe/+qpIJZyPeNzoA6fKNam6CkmAcHYJ
 YuZD+zwfjeJbPQbsfeQ2jSuS+eggCje1wH9f6tekNE/QqFZjT2kkozJjG
 3GYvuwW45IchA+SokydeSn6mINQ9/AY1Nx2pHVgJuw8yEuoS+6H6fXjHQ
 zGsncj5fpLnZD+TEP6xyz7esX8f8SPX8/+t4igU2J3Z/YS4iA+uY3gQZL
 /B8ebEkq510AqemQXUxquuFi20zHetSkOaT0oPirzEb6advtfIWFCQhqD g==;
X-CSE-ConnectionGUID: iaXooGWSROybozuf5CRy4g==
X-CSE-MsgGUID: 6ptDp5ylRrWAlMWnfKhShw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="98917285"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="98917285"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 05:16:31 -0700
X-CSE-ConnectionGUID: 1Hx6rWyFTPaYXRGfFpbFXw==
X-CSE-MsgGUID: UmJMKJ5sSMWbMez2G194Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="264675915"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 05:16:30 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v2 1/8] lib/igt_drm_netlink: Introduce DRM RAS Generic Netlink
 interface
Date: Thu, 20 Aug 2026 17:45:53 +0530
Message-Id: <20260820121600.75052-2-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260820121600.75052-1-ravi.kishore.koppuravuri@intel.com>
References: <20260820121600.75052-1-ravi.kishore.koppuravuri@intel.com>
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

Introduce DRM RAS Generic Netlink interface as a library

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
 include/drm-uapi/drm_ras.h | 50 +++++++++++++++++++++++++++++++
 lib/igt_drm_netlink.c      | 60 ++++++++++++++++++++++++++++++++++++++
 lib/igt_drm_netlink.h      | 25 ++++++++++++++++
 lib/meson.build            |  9 ++++++
 4 files changed, 144 insertions(+)
 create mode 100644 include/drm-uapi/drm_ras.h
 create mode 100644 lib/igt_drm_netlink.c
 create mode 100644 lib/igt_drm_netlink.h

diff --git a/include/drm-uapi/drm_ras.h b/include/drm-uapi/drm_ras.h
new file mode 100644
index 000000000..218a3ee86
--- /dev/null
+++ b/include/drm-uapi/drm_ras.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/* Do not edit directly, auto-generated from: */
+/*	Documentation/netlink/specs/drm_ras.yaml */
+/* YNL-GEN uapi header */
+/* To regenerate run: tools/net/ynl/ynl-regen.sh */
+
+#ifndef _UAPI_LINUX_DRM_RAS_H
+#define _UAPI_LINUX_DRM_RAS_H
+
+#define DRM_RAS_FAMILY_NAME	"drm-ras"
+#define DRM_RAS_FAMILY_VERSION	1
+
+/*
+ * Type of the node. Currently, only error-counter nodes are supported, which
+ * expose reliability counters for a hardware/software component.
+ */
+enum drm_ras_node_type {
+	DRM_RAS_NODE_TYPE_ERROR_COUNTER = 1,
+};
+
+enum {
+	DRM_RAS_A_NODE_ATTRS_NODE_ID = 1,
+	DRM_RAS_A_NODE_ATTRS_DEVICE_NAME,
+	DRM_RAS_A_NODE_ATTRS_NODE_NAME,
+	DRM_RAS_A_NODE_ATTRS_NODE_TYPE,
+
+	__DRM_RAS_A_NODE_ATTRS_MAX,
+	DRM_RAS_A_NODE_ATTRS_MAX = (__DRM_RAS_A_NODE_ATTRS_MAX - 1)
+};
+
+enum {
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID = 1,
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME,
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE,
+
+	__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX,
+	DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX = (__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX - 1)
+};
+
+enum {
+	DRM_RAS_CMD_LIST_NODES = 1,
+	DRM_RAS_CMD_GET_ERROR_COUNTER,
+	DRM_RAS_CMD_CLEAR_ERROR_COUNTER,
+
+	__DRM_RAS_CMD_MAX,
+	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
+};
+
+#endif /* _UAPI_LINUX_DRM_RAS_H */
diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
new file mode 100644
index 000000000..1c07bb2db
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
+void cleanup_nl_socket(struct app_context *ctx)
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
+int init_nl_socket(struct app_context *ctx)
+{
+	ctx->sock = nl_socket_alloc();
+	if (!ctx->sock)
+		return -1;
+
+	igt_debug("Socket allocation successful. Connecting to Generic Netlink...\n");
+	if (genl_connect(ctx->sock) < 0) {
+		cleanup_nl_socket(ctx);
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
+		cleanup_nl_socket(ctx);
+		return -1;
+	}
+
+	igt_debug("Resolved Generic Netlink family '%s' with id %d.\n",
+		  DRM_RAS_FAMILY_NAME, ctx->family_id);
+	return 0;
+}
diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
new file mode 100644
index 000000000..c20d5452b
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
+void cleanup_nl_socket(struct app_context *ctx);
+int init_nl_socket(struct app_context *ctx);
+
+#endif /* IGT_DRM_NETLINK_H */
+
diff --git a/lib/meson.build b/lib/meson.build
index 4af346b43..79674e032 100644
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
@@ -141,6 +142,13 @@ lib_sources = [
 	'vendor/uwildmat/uwildmat.c',
 ]
 
+libnl = declare_dependency(dependencies : [
+	dependency('libnl-3.0', required : true),
+	dependency('libnl-genl-3.0', required : true),
+	dependency('libnl-cli-3.0', required : true),
+	dependency('libnl-utils', required : false),
+])
+
 lib_deps = [
 	cairo,
 	glib,
@@ -148,6 +156,7 @@ lib_deps = [
 	libdrm,
 	libdw,
 	libkmod,
+	libnl,
 	libpci,
 	libudev,
 	math,
-- 
2.34.1

