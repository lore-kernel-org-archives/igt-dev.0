Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4143C88E4D
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 20:59:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81FBF10E1F5;
	Fri, 11 Sep 2026 20:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EkWpumw3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B888F10E1F5
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 20:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789160289; x=1820696289;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3YLIwS04DZyqNc8eWg+A/HNuK571nSV2gdFpMsRAtfo=;
 b=EkWpumw3fiDEfzZMVIo0HIt9JrrqZkK8GqK9jG5U67yUHiGa9L080hTP
 Zt/YOjFWEekqknMRsWHSpKNBlW1rtW4GkFsFRlS3pXKwnm2oTB/duDcX3
 yAxl6/7ntIePS9Ntns8HukSaxXE5fE9zIcthJ9+yblkn8ad8bC/cGiBDe
 nwAMvYNv2loFA0pNetRWWDKYjp5DLwZ2yzT6AtpZbMd+Hc2eyDTTmA/XK
 +uAac87e2nx8eX3FgDsY9bRqoRwYouK2T91dpB37nUVv7tcJ5JHRA8YkE
 5b5ibjDe1n1ELH1rUpeg1YhT8qRDzw5pNHBXsWiPE2yIr10ShEROxvDtf g==;
X-CSE-ConnectionGUID: iXqkoyS1Sbq16jJIuIY/+g==
X-CSE-MsgGUID: G2bDsr82TqSSwlQxSsV9Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="138958"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="138958"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 13:58:09 -0700
X-CSE-ConnectionGUID: B2DZx8/LTwit/2otpL3xTA==
X-CSE-MsgGUID: kHnw+HTwTCynaB7m0htlQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; d="scan'208";a="310293670"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 13:58:09 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v3 1/9] lib/dsc: Add igt_force_dsc_enable_compressed_bpp()
Date: Sat, 12 Sep 2026 02:37:01 +0530
Message-Id: <20260911210709.943683-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260911210709.943683-1-swati2.sharma@intel.com>
References: <20260911210709.943683-1-swati2.sharma@intel.com>
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

v2: Fix compressed bpp precision for 1/16 steps
    by writing four fractional digits to debugfs (Sowmiya)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_dsc.c | 21 +++++++++++++++++++++
 lib/igt_dsc.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
index 3754eef07..a1d98500a 100644
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
@@ -166,6 +167,26 @@ int igt_force_dsc_enable_bpc(int drmfd, char *connector_name, int bpc)
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
+	/* DSC compressed BPP steps are in 1/16 increments, so preserve the
+	 * exact value with four fractional digits.
+	 */
+	snprintf(buf, sizeof(buf), "%.4f", bpp);
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

