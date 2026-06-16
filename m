Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C88CD98DA
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 09:07:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68AC610E944;
	Tue, 16 Jun 2026 09:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uy9FZXXf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D0D10E944
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 09:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781600782; x=1813136782;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=etujBQRHYSg4TsNkx4Ag2JiXMh86yY3H1sshLd0nFWg=;
 b=Uy9FZXXf1y0nx6MilhL1dL6325j7SKOqZBEcyh89doE3XYMhYO1gFnxC
 S4tOnIKpZ7AWEuQy90CUj15gJM3nVoGbpCKqnpCQI3Q/H4wE+fVGpp2Nt
 e6quUAJJQTGyvUaYw48pjm5F2eYC2iuvfNpjnQdqnbTf4jr1V3x29Qkmd
 2Qp1G8wZESNVld2rRiD7HwfIBU+DH5pqv8HQBCgrY3HW7GZFDOPvHVeb5
 1K8EyClffj9ebkgMIjLS1buR+I1KMXdZEdHrXIsfj2cmCnUKnNxEvnabv
 3EdAOZ62M9u5VnBOEb8ZFSZswnVn4mVUOA9EzmU8120nMP39LV2CK+i3Y Q==;
X-CSE-ConnectionGUID: gix1KG63RWS/N/ov9ML3FA==
X-CSE-MsgGUID: N+lnt3T1TaGnBsTGww+Evw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82558817"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82558817"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 02:06:21 -0700
X-CSE-ConnectionGUID: bKUcVC2XRWSLr+XQ+D37fA==
X-CSE-MsgGUID: zCEY13NfQIysAOdxx9IMkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="246832290"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.167])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 02:06:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 2/3] lib/kms: fix last pipe check in
 igt_check_bigjoiner_support()
Date: Tue, 16 Jun 2026 12:06:09 +0300
Message-ID: <20260616090610.2106378-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616090610.2106378-1-jani.nikula@intel.com>
References: <20260616090610.2106378-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Fix last pipe check for non-consecutive pipes. In theory the check could
be too restrictive for fused off pipes, but it's unlikely we've hit the
issue in practise. It's better to be pedantically correct here though.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index c289d76d16e2..e82d32130666 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7344,9 +7344,10 @@ bool igt_check_force_joiner_status(int drmfd, char *connector_name)
  */
 bool igt_check_bigjoiner_support(igt_display_t *display)
 {
-	uint8_t i, total_pipes = 0, pipes_in_use = 0;
+	uint8_t i, pipes_in_use = 0;
 	igt_crtc_t *crtc;
 	igt_output_t *output;
+	enum pipe last_pipe = PIPE_NONE;
 	struct {
 		enum pipe idx;
 		drmModeModeInfo *mode;
@@ -7355,9 +7356,11 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 	} pipes[IGT_MAX_PIPES];
 	int max_dotclock;
 
-	/* Get total enabled pipes. */
-	for_each_crtc(display, crtc)
-		total_pipes++;
+	/* Get last pipe */
+	for_each_crtc(display, crtc) {
+		if (crtc->pipe > last_pipe)
+			last_pipe = crtc->pipe;
+	}
 
 	/*
 	 * Get list of CRTCs in use those were set by igt_output_set_crtc()
@@ -7401,7 +7404,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 				 max_dotclock, pipes[i].force_joiner ? "Yes" : "No");
 			kmstest_dump_mode(pipes[i].mode);
 
-			if (pipes[i].idx >= (total_pipes - 1)) {
+			if (pipes[i].idx >= last_pipe) {
 				igt_info("pipe-%s: Last pipe couldn't be used as a Bigjoiner Primary.\n",
 					 kmstest_pipe_name(pipes[i].idx));
 				return false;
-- 
2.47.3

