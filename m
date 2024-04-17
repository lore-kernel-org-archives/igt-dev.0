Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8746C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 12:39:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53CA210F5E0;
	Wed, 17 Apr 2024 12:39:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c+5CKQEM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB9F10F325
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 12:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713357570; x=1744893570;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xlsk4jj51m3ZkH/DBk3lF8gQOMQgrQl28lHKtCi60fg=;
 b=c+5CKQEM0u08oWJaAG8SRCb7KBMxmd9ncyPLbyJWo3qesTLH/9/WzUmo
 L/bgIe4qzWQ1iJsQOe6TH6AV3CNKrMwrGRu3hcyncfAYXiIXnbtl0Odt9
 4Xz2ofLsHlpMKqI7NlI9lfH/UHN6l67Id0FGTpt7GpH/jf8QK7pW3aSt3
 XeAC0DpBRa2Tx4twFTSkRMNJuYeIYmjT7PR3cO77OOGNfb5h+aVLk4XA5
 sl5941qk+hQx9+oEaHJENoOTXim8VOtuDuM4KtnQUktzXt8obnyXoSYBZ
 elSwatpQRBBFdaBUCozJhpByXoIADHvp0iiNZMv40+zejDSBbDGtvlKvr g==;
X-CSE-ConnectionGUID: NnhwFsQRSBaRAGQUm4av+A==
X-CSE-MsgGUID: Gib9vfOLQvK7YqYfoktO5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8705515"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="8705515"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 05:39:29 -0700
X-CSE-ConnectionGUID: HtAF9Vp8Tp+x46dEoC89dg==
X-CSE-MsgGUID: ZW2rPBwtQSW0elqusG7E/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="23206410"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 05:39:28 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_kms: New helper to check force joiner status
Date: Wed, 17 Apr 2024 18:03:18 +0530
Message-ID: <20240417123319.610839-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240417123319.610839-1-bhanuprakash.modem@intel.com>
References: <20240417123319.610839-1-bhanuprakash.modem@intel.com>
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

Add a new static function to check the force joiner status
on selected connecter, so that it would be helpful to check
the force joiner status from other places too.

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 3216fe7e4..9ff80378d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6255,6 +6255,22 @@ bool igt_has_force_joiner_debugfs(int drmfd, igt_output_t *output)
 	return ret >= 0;
 }
 
+static bool check_force_bigjoiner_status(int drmfd, char *connector_name, bool enable)
+{
+	int debugfs_fd, ret;
+	char buf[512];
+
+	debugfs_fd = igt_debugfs_connector_dir(drmfd, connector_name, O_DIRECTORY);
+	igt_assert_f(debugfs_fd >= 0, "Could not open debugfs for connector %s\n", connector_name);
+
+	ret = igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable", buf, sizeof(buf));
+	close(debugfs_fd);
+	igt_assert_f(ret > 0, "Could not read i915_bigjoiner_force_enable for connector %s\n", connector_name);
+
+	return enable ? strstr(buf, "Y") :
+			strstr(buf, "N");
+}
+
 /**
  * Forces the enable/disable state of big joiner for a specific connector.
  *
@@ -6268,19 +6284,15 @@ bool igt_has_force_joiner_debugfs(int drmfd, igt_output_t *output)
 bool igt_force_and_check_bigjoiner_status(int drmfd, char *connector_name, bool enable)
 {
 	int debugfs_fd, ret;
-	char buf[512];
 
 	igt_assert_f(connector_name, "Connector name cannot be NULL\n");
 	debugfs_fd = igt_debugfs_connector_dir(drmfd, connector_name, O_DIRECTORY);
 	igt_assert_f(debugfs_fd >= 0, "Could not open debugfs for connector %s\n", connector_name);
 	ret = igt_sysfs_write(debugfs_fd, "i915_bigjoiner_force_enable", enable ? "1" : "0", 1);
 	igt_assert_f(ret > 0, "Could not write i915_bigjoiner_force_enable for connector %s\n", connector_name);
-	ret = igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable", buf, sizeof(buf));
 	close(debugfs_fd);
-	igt_assert_f(ret > 0, "Could not read i915_bigjoiner_force_enable for connector %s\n", connector_name);
 
-	return enable ? strstr(buf, "Y") :
-			strstr(buf, "N");
+	return check_force_bigjoiner_status(drmfd, connector_name, enable);
 }
 
 /**
-- 
2.43.2

