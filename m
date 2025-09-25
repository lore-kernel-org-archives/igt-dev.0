Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B485DCAC5A5
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 04:41:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35AB010E83B;
	Thu, 25 Sep 2025 04:41:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PeBdecQF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2CA10E83B
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 04:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758775319; x=1790311319;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WDRcjuk1qC2TfCzkO7Q3zhy22mB/o7ORGcjpZqHGW14=;
 b=PeBdecQFNl1F4nr19RFCTa5u6L17kzk5in6DHUnvKJgqLAmwkdwzR1DD
 pN0vMIwLrka3guMbKtqVg1wnH2gtlabxmq2xFUntBvA3XgOoX+76nV0W5
 Z7NLcItF4Y1++dm3yO6vbaX+WVVTnidORQgpsnGEtHwn8j3PD2kMek6wP
 +vdIf34a7Xg+yoFQJ2odRHpEYGP2FU8n5jIUqB9yQMmPfhQe7nfo1iu6B
 ikRM4C2I/pA3NTH359kWkcY11jldDgSm2ShkqvefE28ix5U2nsv1eOY3o
 0rKhsMKEPrnvrYkv8n1tAaoFn/MkolDLzOyV/Vh5WwNOO5IKCErP+vSVa A==;
X-CSE-ConnectionGUID: LJ9N7jFAQ+KN7jDmMrSvHA==
X-CSE-MsgGUID: sTkgylz7QDOGo9eIQuQX4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64891535"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64891535"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 21:41:58 -0700
X-CSE-ConnectionGUID: AowTfurJQcqk01/nIYPGEQ==
X-CSE-MsgGUID: OzE7olEbRAamzKg6OMGwMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; d="scan'208";a="176824320"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO jhogande-mobl3..)
 ([10.245.244.35])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 21:41:55 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t] lib/igt_psr: Use 10x timeouts in simulation environment
Date: Thu, 25 Sep 2025 07:41:36 +0300
Message-ID: <20250925044136.3654614-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

PSR tests are timeouting in simulation environment. Use 10 as a multiplier
for timeouts in simulation environment.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 lib/igt_psr.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index d5b4198c3..c03042899 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -136,12 +136,14 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
 	return active;
 }
 
+#define PSR_TIMEOUT(timeout)	(igt_run_in_simulation() ? 10 : 1 * (timeout))
+
 /*
  * For PSR1, we wait until PSR is active. We wait until DEEP_SLEEP for PSR2.
  */
 bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
 {
-	return igt_wait(psr_active_check(debugfs_fd, mode, output), 500, 20);
+	return igt_wait(psr_active_check(debugfs_fd, mode, output), PSR_TIMEOUT(500), 20);
 }
 
 bool psr_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
@@ -153,9 +155,9 @@ bool psr_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
 	 */
 	if (output != NULL &&
 	    output->config.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
-		return igt_wait(psr_active_check(debugfs_fd, mode, output), 40, 1);
+		return igt_wait(psr_active_check(debugfs_fd, mode, output), PSR_TIMEOUT(40), 1);
 	else
-		return igt_wait(!psr_active_check(debugfs_fd, mode, output), 40, 1);
+		return igt_wait(!psr_active_check(debugfs_fd, mode, output), PSR_TIMEOUT(40), 1);
 }
 
 bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
@@ -167,9 +169,9 @@ bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode, igt_output_t *outp
 	 */
 	if (output != NULL &&
 	    output->config.connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
-		return igt_wait(psr_active_check(debugfs_fd, mode, output), 500, 1);
+		return igt_wait(psr_active_check(debugfs_fd, mode, output), PSR_TIMEOUT(500), 1);
 	else
-		return igt_wait(!psr_active_check(debugfs_fd, mode, output), 500, 1);
+		return igt_wait(!psr_active_check(debugfs_fd, mode, output), PSR_TIMEOUT(500), 1);
 }
 
 static ssize_t psr_write(int debugfs_fd, const char *buf, igt_output_t *output)
-- 
2.43.0

