Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA49CD129A
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 06:34:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4688F1131C8;
	Wed, 10 Apr 2024 06:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4kpaYxF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6411131C5
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 06:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712730838; x=1744266838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UEC0LEgW9b4d+ZO9B2QW3BZqMQIswRgU2Tc1jVXS6Js=;
 b=G4kpaYxF9sjM3saKmxenYNHtIUY8Db9TM0lXF3u+mVBXP7UzR9Hv83k0
 LYh8bL1fFH2o+wWQ1O9qmacezCJxIW/P/jAo9Qv4u0yQPdaesVEk3bxFH
 Wg94qrcgTexDwNQ9KIUVhs30duD9FSC5diG1dOZ6kfalmm4EcbxJsbzmA
 whCieWIKfTHRQSaYV/TKVCtyaKYOyzVRkmSFzoF7t9sY7denvPdu+Ngs2
 Ysc1C/mvwU6bOPtOPLt/CQ+tU6zC8tW18ilpZSvDSX8IydO310NfV1HS0
 M0snPKDdADzhu940lBEGEbcBcuTLCGEMo5ESa5+Rnw+0Jzgf67bcua+Ik g==;
X-CSE-ConnectionGUID: OKl9fdCrS7K6oGhjQNPFzQ==
X-CSE-MsgGUID: 6sYQ/al1TrqqeaeoOiWS0g==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7948192"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7948192"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 23:33:58 -0700
X-CSE-ConnectionGUID: +EmzPBCjROyc8NEi+qkrFw==
X-CSE-MsgGUID: Vu5wAW+URY28cHRe03ablw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25138223"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 23:33:56 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 9/9] lib/igt_kms: remove unused
 igt_force_and_check_bigjoiner_status
Date: Wed, 10 Apr 2024 12:14:26 +0530
Message-Id: <20240410064426.1968399-10-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240410064426.1968399-1-kunal1.joshi@intel.com>
References: <20240410064426.1968399-1-kunal1.joshi@intel.com>
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

remove unused igt_force_and_check_bigjoiner_status

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 28 ----------------------------
 lib/igt_kms.h |  1 -
 2 files changed, 29 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 56c9dae9b..e2d5c176a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6331,34 +6331,6 @@ bool igt_has_force_joiner_debugfs(int drmfd, igt_output_t *output)
 	return ret >= 0;
 }
 
-/**
- * Forces the enable/disable state of big joiner for a specific connector.
- *
- * @drmfd The file descriptor of the DRM device.
- * @connector_name The name of the connector.
- * @enable The desired state of big joiner (true for enable, false for disable).
- * Returns:
- *  true if writing the debugfs was successful
- *  and the state was set as requested, false otherwise.
- */
-bool igt_force_and_check_bigjoiner_status(int drmfd, char *connector_name, bool enable)
-{
-	int debugfs_fd, ret;
-	char buf[512];
-
-	igt_assert_f(connector_name, "Connector name cannot be NULL\n");
-	debugfs_fd = igt_debugfs_connector_dir(drmfd, connector_name, O_DIRECTORY);
-	igt_assert_f(debugfs_fd >= 0, "Could not open debugfs for connector %s\n", connector_name);
-	ret = igt_sysfs_write(debugfs_fd, "i915_bigjoiner_force_enable", enable ? "1" : "0", 1);
-	igt_assert_f(ret > 0, "Could not write i915_bigjoiner_force_enable for connector %s\n", connector_name);
-	ret = igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable", buf, sizeof(buf));
-	close(debugfs_fd);
-	igt_assert_f(ret > 0, "Could not read i915_bigjoiner_force_enable for connector %s\n", connector_name);
-
-	return enable ? strstr(buf, "Y") :
-			strstr(buf, "N");
-}
-
 /**
  * igt_check_bigjoiner_support:
  * @display: a pointer to an #igt_display_t structure
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 4980d4791..d9a54384b 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1239,7 +1239,6 @@ bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
 bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode);
 bool igt_has_force_joiner_debugfs(int drmfd, igt_output_t *output);
-bool igt_force_and_check_bigjoiner_status(int drmfd, char *connector_name, bool enable);
 bool igt_check_bigjoiner_support(igt_display_t *display);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
 bool intel_pipe_output_combo_valid(igt_display_t *display);
-- 
2.34.1

