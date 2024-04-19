Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F58C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 06:29:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC5110FDA5;
	Fri, 19 Apr 2024 06:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T35DW3Ax";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E7010FDA5
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 06:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713508170; x=1745044170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0WtfIf5pwRAahjySY7vP8MUExkNO0pt4AqD5fxapZmg=;
 b=T35DW3Ax2mXpaut7ItXFvVP7tz8U4/iv5sIptcmmj+9p3t+ZbxBnvYm6
 rxSAPJYbXc5AZD/x16jN1xl3+0F3LpfqNDgdSMIJN3AEGl5ekiNVjqSCq
 JfI26FhtlWrp3ydiIzIqPawdXi3aMWXSCqm/8Eb64C97t64wjEv3jI0kT
 TU2K9Z3X8wPN68lTm7LDBGhYrHB0rnm9/LDfCFSPhtkS9jWuz8Re3P6Nf
 uLl4XYukoc0Jz91rO2/zYKkwGJAqzQjT5ihw1vqkTzj54JoP3lv2PiGaA
 eDGl1X6bFSwUtXOm+qTMdxSBLjXEIDu0XIL3sCI++O+n6YwfbkSsMh0fb g==;
X-CSE-ConnectionGUID: 5e/eorRKTZClFoLrHq/7Pg==
X-CSE-MsgGUID: I8Ou7RnORW+wi3LugQ6kng==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9637646"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9637646"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 23:29:24 -0700
X-CSE-ConnectionGUID: +r63sV5+SaKtA+EcAFZY4g==
X-CSE-MsgGUID: u0RE7LJeQLqLCMm3F6tJpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23310865"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 23:29:22 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 6/7] lib/igt_kms: remove unused
 igt_force_and_check_bigjoiner_status
Date: Fri, 19 Apr 2024 12:10:00 +0530
Message-Id: <20240419064001.2401850-7-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240419064001.2401850-1-kunal1.joshi@intel.com>
References: <20240419064001.2401850-1-kunal1.joshi@intel.com>
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
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 28 ----------------------------
 lib/igt_kms.h |  1 -
 2 files changed, 29 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 324b0527f..35e2a0bb0 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6332,34 +6332,6 @@ bool igt_has_force_joiner_debugfs(int drmfd, igt_output_t *output)
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
index 0abf450c1..01604dac9 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1216,7 +1216,6 @@ bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
 bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode);
 bool igt_has_force_joiner_debugfs(int drmfd, igt_output_t *output);
-bool igt_force_and_check_bigjoiner_status(int drmfd, char *connector_name, bool enable);
 bool igt_check_bigjoiner_support(igt_display_t *display);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
 bool intel_pipe_output_combo_valid(igt_display_t *display);
-- 
2.25.1

