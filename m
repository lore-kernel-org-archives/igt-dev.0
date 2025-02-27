Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8702C021BE
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 12:15:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B59710EAC4;
	Thu, 27 Feb 2025 12:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H1+wI7D6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA6110EAD1
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 12:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740658501; x=1772194501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t099zLzMY3Pm4p/PsUoJVksUofkE155rl9FZhN4M0iU=;
 b=H1+wI7D6ltUXQ72OawRCyQjZ3cVG7LRDTIpkN117d0RJ4QS22yD96kwX
 5SBUeX2ivnwunyx7IIOOGSLPWNrRWAz80ZMjEMI6dq9JpCdqeNqRdiF7D
 8LHA/CcclFukmCL6KQUoGA965WB7NVZBjZkDcGBmpKGcOQSN9XLKAggVN
 JIS6P7uxfGSCaVFO0g9tX5ivVoccO4g1Sg/RPhogAGvWEXIAZ/VGdZGwm
 lm4CWjjB6UnLnO/hbInaT6ONzja5VkCm132nElxL82Yc6vxGd3zVGsY7M
 EuwH+3OpJoWrmi6Ry91QsZ/qlY9PinNU4yat4qXWBJQWORnvTFmU1QNmf g==;
X-CSE-ConnectionGUID: FBerUClgTK+V54VyZ0ULRA==
X-CSE-MsgGUID: 2JRCSirKRDScQUQ95JKvbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="59078810"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="59078810"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 04:14:59 -0800
X-CSE-ConnectionGUID: uU4+nM8ESmGlyOQ5pEQyIw==
X-CSE-MsgGUID: qlqjW/C7S/aoON7JMo4+0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="140231089"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 04:14:59 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/kms_dp_link_training: do modeset before
 retrainig
Date: Thu, 27 Feb 2025 18:00:38 +0530
Message-Id: <20250227123039.2933330-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250227123039.2933330-1-kunal1.joshi@intel.com>
References: <20250227123039.2933330-1-kunal1.joshi@intel.com>
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

Retraining can be done on enabled output.
Fix test to do modeset before retraining.

Fixes: 983ffca5ff96fd67c937691337f4488e28948aa7
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_dp_link_training.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index f00376614..33e690a60 100644
--- a/tests/intel/kms_dp_link_training.c
+++ b/tests/intel/kms_dp_link_training.c
@@ -233,6 +233,7 @@ static bool run_link_rate_test(data_t *data, bool mst, bool uhbr)
 
 	igt_display_reset(&data->display);
 	igt_reset_link_params(data->drm_fd, data->output);
+	do_modeset(data, mst);
 
 	/* Retrain at default/driver parameters */
 	igt_force_link_retrain(data->drm_fd, data->output, RETRAIN_COUNT);
-- 
2.25.1

