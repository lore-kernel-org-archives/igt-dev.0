Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AB6C88E53
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 21:01:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8834F10E28A;
	Fri, 11 Sep 2026 21:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OynLiwHs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F3310E1F5
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 20:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789160293; x=1820696293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H2HZJFPtcux7K9GzIDyTybRw7cyvDSfzVIJ6Vg83DsU=;
 b=OynLiwHsJfOLjHQky9M8IwH0djFl7EmlOEde37+A5BBo2hfyOS3fcTXO
 QbZ/I5O3xWSt/FSKOomNp0Snv3Nyxp4TVmUQ/KlpFSx5KnxC2+BHGgR3M
 w8jHdQ42lnMwW8CRMaq2nqB7r/XQ4dz7HZpWboqSN52Hw14qEMQc8b3Uh
 D+JIctLCaFD2TkU7NHUMSr8HwFYL7mT2YB5YTCHkU2a8uQaJnLYXexLls
 AtQFRQ9It0+/fnd+1OddJDQ1Ox5rsnMy621SLfFar0YAftE1N73lITc2T
 fOOj/B+Oeloft8UMlgnzORXKwL9kNQufTtBYbGXvACqs2fuLFw5eYiTOo Q==;
X-CSE-ConnectionGUID: 0uv4EAMVSrq+YO7VKrFHsw==
X-CSE-MsgGUID: 9gCLDux4QuyLZndDS+SIvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="138966"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="138966"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 13:58:13 -0700
X-CSE-ConnectionGUID: Va0wtSaGQKe6quQhyr/Qfw==
X-CSE-MsgGUID: Pf5lhG1bSWiO+oVY083JTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; d="scan'208";a="310293699"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 13:58:13 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v3 4/9] lib/dsc: Add igt_get_dsc_sink_max_compressed_bpp()
Date: Sat, 12 Sep 2026 02:37:04 +0530
Message-Id: <20260911210709.943683-5-swati2.sharma@intel.com>
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

Add a helper to read the per-output-format maximum compressed
BPP from DSC_Sink_Max_Compressed_BPP in the connector debugfs
file.

Assisted-by: GitHub Copilot
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_dsc.c | 62 +++++++++++++++++++++++++++++++++++++++++++--------
 lib/igt_dsc.h |  2 ++
 2 files changed, 55 insertions(+), 9 deletions(-)

diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
index 0f938284e..30a12ce13 100644
--- a/lib/igt_dsc.c
+++ b/lib/igt_dsc.c
@@ -11,14 +11,20 @@
 #include "igt_dsc.h"
 #include "igt_sysfs.h"
 
-static bool check_dsc_debugfs(int drmfd, char *connector_name, const char *check_str)
+static bool check_dsc_debugfs(int drmfd, char *connector_name, const char *check_str,
+			      char *buf, int buf_size)
 {
 	char file_name[128] = {0};
-	char buf[512];
+	char local_buf[512];
+
+	if (!buf) {
+		buf = local_buf;
+		buf_size = sizeof(local_buf);
+	}
 
 	sprintf(file_name, "%s/i915_dsc_fec_support", connector_name);
 
-	igt_debugfs_read(drmfd, file_name, buf);
+	__igt_debugfs_read(drmfd, file_name, buf, buf_size);
 
 	return strstr(buf, check_str);
 }
@@ -73,7 +79,7 @@ bool igt_is_dsc_supported_by_source(int drmfd)
  */
 bool igt_is_dsc_supported_by_sink(int drmfd, char *connector_name)
 {
-	return check_dsc_debugfs(drmfd, connector_name, "DSC_Sink_Support: yes");
+	return check_dsc_debugfs(drmfd, connector_name, "DSC_Sink_Support: yes", NULL, 0);
 }
 
 /**
@@ -85,7 +91,7 @@ bool igt_is_dsc_supported_by_sink(int drmfd, char *connector_name)
  */
 bool igt_is_fec_supported(int drmfd, char *connector_name)
 {
-	return check_dsc_debugfs(drmfd, connector_name, "FEC_Sink_Support: yes");
+	return check_dsc_debugfs(drmfd, connector_name, "FEC_Sink_Support: yes", NULL, 0);
 }
 
 /**
@@ -97,7 +103,7 @@ bool igt_is_fec_supported(int drmfd, char *connector_name)
  */
 bool igt_is_dsc_enabled(int drmfd, char *connector_name)
 {
-	return check_dsc_debugfs(drmfd, connector_name, "DSC_Enabled: yes");
+	return check_dsc_debugfs(drmfd, connector_name, "DSC_Enabled: yes", NULL, 0);
 }
 
 /**
@@ -110,7 +116,7 @@ bool igt_is_dsc_enabled(int drmfd, char *connector_name)
  */
 bool igt_is_force_dsc_enabled(int drmfd, char *connector_name)
 {
-	return check_dsc_debugfs(drmfd, connector_name, "Force_DSC_Enable: yes");
+	return check_dsc_debugfs(drmfd, connector_name, "Force_DSC_Enable: yes", NULL, 0);
 }
 
 /**
@@ -135,7 +141,7 @@ int igt_force_dsc_enable(int drmfd, char *connector_name)
  */
 bool igt_is_force_dsc_disabled(int drmfd, char *connector_name)
 {
-	return check_dsc_debugfs(drmfd, connector_name, "Force_DSC_Enable: no");
+	return check_dsc_debugfs(drmfd, connector_name, "Force_DSC_Enable: no", NULL, 0);
 }
 
 /**
@@ -231,7 +237,7 @@ bool igt_is_dsc_output_format_supported_by_sink(int drmfd, char *connector_name,
 		break;
 	}
 
-	return check_dsc_debugfs(drmfd, connector_name, check_str);
+	return check_dsc_debugfs(drmfd, connector_name, check_str, NULL, 0);
 }
 
 /**
@@ -379,6 +385,44 @@ int igt_get_dsc_sink_max_slice_count(int drmfd, char *connector_name)
 	return max_slice_count;
 }
 
+/**
+ * igt_get_dsc_sink_max_compressed_bpp:
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ * @output_format: DSC output format the max compressed bpp is requested for
+ *
+ * Returns: The maximum dsc sink compressed bpp for @output_format from the
+ * connector debugfs.
+ */
+float igt_get_dsc_sink_max_compressed_bpp(int drmfd, char *connector_name,
+					  enum dsc_output_format output_format)
+{
+	char buf[512];
+	char search_key[32];
+	char *start_loc;
+	float max_compressed_bpp;
+
+	igt_require_f(check_dsc_debugfs(drmfd, connector_name,
+				  "DSC_Sink_Max_Compressed_BPP:", buf, sizeof(buf)),
+		      "Sink max compressed bpp is unavailable on connector %s\n",
+		      connector_name);
+	start_loc = strstr(buf, "DSC_Sink_Max_Compressed_BPP:");
+
+	snprintf(search_key, sizeof(search_key), "%s: ",
+		 kmstest_dsc_output_format_str(output_format));
+	igt_require_f(start_loc = strstr(start_loc, search_key),
+		      "Sink max compressed bpp not found for output format %s\n",
+		      kmstest_dsc_output_format_str(output_format));
+
+	start_loc += strlen(search_key);
+	igt_require_f(sscanf(start_loc, "%f", &max_compressed_bpp) == 1,
+		      "Sink max compressed bpp is invalid for output format %s\n",
+		      kmstest_dsc_output_format_str(output_format));
+	igt_require(max_compressed_bpp > 0);
+
+	return max_compressed_bpp;
+}
+
 /**
  * igt_get_dsc_sink_compressed_bpp:
  * @drmfd: A drm file descriptor
diff --git a/lib/igt_dsc.h b/lib/igt_dsc.h
index f895af7f3..3da05b9df 100644
--- a/lib/igt_dsc.h
+++ b/lib/igt_dsc.h
@@ -31,6 +31,8 @@ bool igt_is_force_dsc_fractional_bpp_enabled(int drmfd, char *connector_name);
 int igt_force_dsc_fractional_bpp_enable(int drmfd, char *connector_name);
 int igt_get_dsc_fractional_bpp_debugfs_fd(int drmfd, char *connector_name);
 int igt_get_dsc_sink_max_slice_count(int drmfd, char *connector_name);
+float igt_get_dsc_sink_max_compressed_bpp(int drmfd, char *connector_name,
+					  enum dsc_output_format output_format);
 float igt_get_dsc_sink_compressed_bpp(int drmfd, enum pipe pipe);
 
 #endif
-- 
2.25.1

