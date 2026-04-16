Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AE9F433E1
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 03:56:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A391C10E172;
	Thu, 16 Apr 2026 03:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dco2MNPi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B18D10E172
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 03:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776311736; x=1807847736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vWxc/4U0nmw050VkauZEJ+srVp9LU8WE6owiHQ7hEqM=;
 b=Dco2MNPi+hqdc5T9zEqjdyQEz2lir0+EWcS4rANg7NGG6chudm6NQDTo
 toWaH//b+K2cDmHZUinrUhCRY1Ps4BGyZ+UsCofoZ0jq4F+5XbXm+qwT8
 5iQCzrEJC/sDjis0KQDhRoxsM6oUJx9VbYrwY3SxPhpXgg2KTCNLlmDyb
 I5ZtFdkPxKNb0kJOzNnb2iERnffYf5ok5VmAqjwYXTAbcqKgwH238U8s+
 uR6Mmb1gq1P2z9JbdnLDwt4KWkunsvLUSJyNITJAV9+t0Q2lWe8G+BoHq
 b7cDbK3x1S22xn2ONOSTtzXvSZnJsuSxrioKEQ2Hckbzxj04Wo77e0CC3 g==;
X-CSE-ConnectionGUID: lHFpeb12S+G9PImezyALJg==
X-CSE-MsgGUID: 4nORjXzYTmuY3MlAnPotMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77002044"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77002044"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 20:55:36 -0700
X-CSE-ConnectionGUID: +gfp5VAsSzqQm0GGoajkTA==
X-CSE-MsgGUID: dyi/vfiORVWzIvTewDB11w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="253867762"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 20:55:33 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, Jeevan B <jeevan.b@intel.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v3 2/4] tests/kms_vrr: Avoid unnecessary PSR disable
Date: Thu, 16 Apr 2026 09:23:31 +0530
Message-ID: <20260416035333.69004-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416035333.69004-1-jeevan.b@intel.com>
References: <20260416035333.69004-1-jeevan.b@intel.com>
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

Use output instead of NULL in PSR helpers so PSR is disabled only
when supported by the sink, avoiding unnecessary global checks and
ensuring correct behavior on multi-eDP setups.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index ec0692b2f..30bda3244 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -912,9 +912,10 @@ test_lobf(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 			igt_skip("%s: Aux-less ALPM not enabled, LOBF not supported.\n",
 				 igt_output_name(output));
 
-		if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
-		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL))
-			psr_disable(data->drm_fd, data->debugfs_fd, NULL);
+		if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, output) ||
+		    psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_2, output) ||
+		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, output))
+			psr_disable(data->drm_fd, data->debugfs_fd, output);
 	}
 
 	igt_info("LOBF test execution on %s, PIPE %s with VRR range: (%u-%u) Hz\n",
-- 
2.43.0

