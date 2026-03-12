Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8C6FED2CC
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 06:26:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D42F10E411;
	Thu, 12 Mar 2026 06:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JXf9RCCo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8010210E411
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 06:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773296795; x=1804832795;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VNmReFOZhph3Dlrh0F8daXJFR08oq+Hx4D29WShdYz4=;
 b=JXf9RCCoGPgU1ee4w1xRq0uE3bT2Z6Lj0uUZiMSgw8kKdJMo+osqSfDL
 wrwj+AD/GwGYYHORjGftsfTzrQxc7rKVd7vStQTOkgZJo1kOCiHI8XcM9
 GnkOi/m+TVbSDso4wZiGTFgD0RPbMMHovtIekTlH1VElneXFhRivVgIfS
 zbpy/JCW7tVsJU3/1jJERBLLHsFkmveIfBo8ccYm10Dt7RiYO4WDrZkXW
 BNEPxcrGiJxbS+Yisxat6K9WYDkFw3eiVKPtr0RlGbW6mnriJcgJ3fBcQ
 e0E4SrNOKYi3DMpGgI/xo413ySHimeTr1Ooy3YtlrV0/Difi+Nx25VM7x w==;
X-CSE-ConnectionGUID: p6XBvspXTcmwfvqmJvaoMw==
X-CSE-MsgGUID: TxsZG7vMQWyUPoV3KWvPag==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74345930"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="74345930"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 23:26:34 -0700
X-CSE-ConnectionGUID: Epi6ZcA8QWaqFvdcYVj4TQ==
X-CSE-MsgGUID: E/OfbJaBTraQcR0lb2+lGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="225420301"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 23:26:32 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3] lib/igt_kms: Fix joiner force debugfs entry and
 expected value
Date: Thu, 12 Mar 2026 11:57:15 +0530
Message-ID: <20260312062715.231319-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311174001.224347-1-ramanaidu.naladala@intel.com>
References: <20260311174001.224347-1-ramanaidu.naladala@intel.com>
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

Change the debugfs entry and use the number of pipes in IGT as
introduced in KMD.

v2: Update return logic and commit message. (Ankit)
v3: Address the review comments. (Ankit, Santhosh)

commit: a47df3335a22 ("drm/i915/display: Modify debugfs for joiner to force n pipes")

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 lib/igt_kms.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 0b05ddd72..dfb52d286 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7120,9 +7120,9 @@ bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name)
  * @drmfd: file descriptor of the DRM device.
  * @connector_name: connector to check.
  *
- * Checks if the force big joiner is enabled.
+ * Checks if the force joiner is enabled.
  *
- * Returns: True if the force big joiner is enabled, False otherwise.
+ * Returns: True if the force joiner is enabled, False otherwise.
  */
 bool igt_check_force_joiner_status(int drmfd, char *connector_name)
 {
@@ -7138,15 +7138,15 @@ bool igt_check_force_joiner_status(int drmfd, char *connector_name)
 		return false;
 	}
 
-	ret = igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable", buf, sizeof(buf));
+	ret = igt_debugfs_simple_read(debugfs_fd, "i915_joiner_force_enable", buf, sizeof(buf));
 	close(debugfs_fd);
 
 	if (ret < 0) {
-		igt_debug("Could not read i915_bigjoiner_force_enable for connector: %s\n", connector_name);
+		igt_debug("Could not read i915_joiner_force_enable for connector: %s\n", connector_name);
 		return false;
 	}
 
-	return strstr(buf, "Y");
+	return (atoi(buf) > 1);
 }
 
 /**
-- 
2.43.0

