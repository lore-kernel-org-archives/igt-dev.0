Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6472EC27C4F
	for <igt-dev@archiver.kernel.org>; Wed, 26 Jun 2024 19:03:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E462610E0D2;
	Wed, 26 Jun 2024 19:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gfo3ZnlV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B6A10E24D
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jun 2024 19:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719428637; x=1750964637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UZG4+KKw1S9NYJKKmBawns5ptZYahDerbyGJE4YjJqY=;
 b=gfo3ZnlVZRg629ke5vipNM/mdxnfze4SsRLECGK/x92W19qynyXXz/+Q
 Bb/G/bcL3ozZudbGXhGQX5EQ9tBZOJa8esOzOonqjMSTzrxWgD8ZX3zvp
 v4KTxJPnY/VyihtKBlvi8i4/h//kCW5evr6jg6NiHOMlybQRKJ0RKatvw
 JZ8ex3xj045lPO9VlvufvMZsv/PmmbUL8MlVaPip4o/+WrZVoiJK0eaBC
 EcghhslXFrpdpA5SHhGMCdktDHXnN9iw2c/cTCwHwDNgCfWevCSMYsSCh
 +eciQT/r4b39JriK5b5dFgeNks05RYtVxI5tvzdokWFdUQHTgkHUDpfNW A==;
X-CSE-ConnectionGUID: BCqVB6zaRvafUJkODPrsNw==
X-CSE-MsgGUID: rHlfwvQcTbaO85K00zQe/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27111850"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="27111850"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 12:03:50 -0700
X-CSE-ConnectionGUID: VESnk/rcSwSx8jSWb8UK1w==
X-CSE-MsgGUID: M1khAExYTaiajqmnAo7IvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="48467576"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 12:03:48 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, animesh.manna@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_kms: Added library functions for LOBF status
Date: Thu, 27 Jun 2024 00:45:36 +0530
Message-Id: <20240626191537.1507452-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626191537.1507452-1-jeevan.b@intel.com>
References: <20240626191537.1507452-1-jeevan.b@intel.com>
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

Added helper functions to check LOBF status to check weather
it is enabled or disabled.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_kms.c | 23 +++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 174bbe6c4..1f0243eb6 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6071,6 +6071,29 @@ void igt_dump_crtcs_fd(int drmfd)
 	drmModeFreeResources(mode_resources);
 }
 
+/**
+ * igt_get_i915_edp_lobf_info
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Return: True if its enabled.
+ */
+bool igt_get_i915_edp_lobf_info(int drmfd, char *connector_name)
+{
+	char buf[24];
+	int fd, res;
+
+	fd = igt_debugfs_connector_dir(drmfd, connector_name, O_RDONLY);
+	igt_assert(fd >= 0);
+
+	res = igt_debugfs_simple_read(fd, "i915_edp_lobf_info", buf, sizeof(buf));
+	igt_require(res > 0);
+
+	close(fd);
+
+	return strstr(buf, "LOBF status: enabled");
+}
+
 /**
  * igt_get_output_max_bpc:
  * @drmfd: A drm file descriptor
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 01604dac9..5b1591631 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1195,6 +1195,7 @@ void igt_require_pipe(igt_display_t *display,
 void igt_dump_connectors_fd(int drmfd);
 void igt_dump_crtcs_fd(int drmfd);
 bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
+bool igt_get_i915_edp_lobf_info(int drmfd, char *connector_name);
 unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
 unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);
 void igt_assert_output_bpc_equal(int drmfd, enum pipe pipe,
-- 
2.25.1

