Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF04C5516D
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 12:14:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E8910E1F0;
	Fri, 31 Jul 2026 12:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MCIvox4u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6173F10F240
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 12:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785499967; x=1817035967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h+VDICkk9VA5GahuYXk3mGkeZIJ7BYltCLuAhFcV9uI=;
 b=MCIvox4uBYNn3AzvPFdHtcV+OJoQj4bOlOeEoFKw5obs/rA8dqVGxbKz
 VuZxmt9Vg910ZfPMdcKpDqpbixMN3cKXT+fZUSlB81skevhtqZfBY24r3
 pX+CwcqzHl7hwwWwbr33HY2eGi2prBH0Vm1LBUh26kPpb5JVE5G0rj7Fn
 bCYoswCgqCaFAnFfaRqECuOFecuGejvfXGQkPsAvVnFE9q2941XJ59ckz
 EV2GhAc/DhL4LL++x2fpv50CLhXcfCpnWujwIzQMGdXZthcxgo7X92nUZ
 3DnbSm0zTL/b5RJCjucCStzA+eSeXua+JWFUTMfdQuYPcZ/u7pz+Qs5+s g==;
X-CSE-ConnectionGUID: Q6p0KKBYQOCPuuHNjP1uvQ==
X-CSE-MsgGUID: kJi/7eJUTMePdI47iPS7qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="85891502"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="85891502"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 05:12:47 -0700
X-CSE-ConnectionGUID: a3XVhBTXT16m/YFU/NdpvA==
X-CSE-MsgGUID: FhBaZUm1SY+EL2TMlyyZbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="265630645"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 05:12:45 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 1/4] lib/dsc: Add igt_force_dsc_enable_compressed_bpp()
Date: Fri, 31 Jul 2026 17:51:42 +0530
Message-Id: <20260731122145.4099468-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260731122145.4099468-1-swati2.sharma@intel.com>
References: <20260731122145.4099468-1-swati2.sharma@intel.com>
MIME-Version: 1.0
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

Function is added to force compressed bpp via debugfs
intel_force_link_bpp.

v2: Rebase

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_dsc.c | 18 ++++++++++++++++++
 lib/igt_dsc.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
index 3754eef07..93b67655f 100644
--- a/lib/igt_dsc.c
+++ b/lib/igt_dsc.c
@@ -6,6 +6,7 @@
 #include <unistd.h>
 #include <fcntl.h>
 #include <string.h>
+#include "drmtest.h"
 #include "igt_core.h"
 #include "igt_dsc.h"
 #include "igt_sysfs.h"
@@ -166,6 +167,23 @@ int igt_force_dsc_enable_bpc(int drmfd, char *connector_name, int bpc)
 	return write_dsc_debugfs(drmfd, connector_name, "i915_dsc_bpc", buf);
 }
 
+/**
+ * igt_force_dsc_enable_compressed_bpp:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ * @bpp: Compressed BPP
+ *
+ * Returns: 0 on success or negative error code, in case of failure.
+ */
+int igt_force_dsc_enable_compressed_bpp(int drmfd, char *connector_name, float bpp)
+{
+	char buf[20] = {0};
+
+	snprintf(buf, sizeof(buf), "%.2f", bpp);
+
+	return write_dsc_debugfs(drmfd, connector_name, "intel_force_link_bpp", buf);
+}
+
 /**
  * igt_get_dsc_debugfs_fd:
  * @drmfd: A drm file descriptor
diff --git a/lib/igt_dsc.h b/lib/igt_dsc.h
index f63345848..0ba06d8c5 100644
--- a/lib/igt_dsc.h
+++ b/lib/igt_dsc.h
@@ -17,6 +17,7 @@ bool igt_is_dsc_enabled(int drmfd, char *connector_name);
 bool igt_is_force_dsc_enabled(int drmfd, char *connector_name);
 int igt_force_dsc_enable(int drmfd, char *connector_name);
 int igt_force_dsc_enable_bpc(int drmfd, char *connector_name, int bpc);
+int igt_force_dsc_enable_compressed_bpp(int drmfd, char *connector_name, float bpp);
 int igt_force_dsc_disable(int drmfd, char *connector_name);
 bool igt_is_force_dsc_disabled(int drmfd, char *connector_name);
 int igt_get_dsc_debugfs_fd(int drmfd, char *connector_name);
-- 
2.25.1

