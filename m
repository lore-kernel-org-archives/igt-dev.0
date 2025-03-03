Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE3CC282C5
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 07:53:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE1510E227;
	Mon,  3 Mar 2025 07:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d6qCNUne";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41AB10E226
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Mar 2025 07:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740988382; x=1772524382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C9sqTAHWEiZ21kXYaCXDbo3YG2FdHQi8x07D8ONm61Y=;
 b=d6qCNUneIMMDcMKdDbnknkQBJ7Uv2WD0gpW2/yXLXUI4KaPaFKhqXo/z
 5OalnBPN0BQlm64M9hY1MIoPYjb8QX7wPIaIN1R84mGySD2pg8AgdmHK+
 GEb5V0DV7l8xnM9NhO23+RFaTkJUgKZ8DqALDVkr1HNI27jRdG5jefcBT
 +UhJqqdOBW/LEutHZSZJJsIvRcX7MF+/sYj8p4a8VEHUWwRshMPPxwYHs
 Iv8ZQkTipQl3U9g1RNVdxMgvZbawHeERYk//e32rbUHUPtVRGt0lmWhYN
 ZxzjQMZW25D7y1jqJSA16E7aWjsY4E/CvQ0m7Hn+p8LZa6VKD7ISP1UY/ g==;
X-CSE-ConnectionGUID: I+i1wtFmQya7Sdtpzv+G2Q==
X-CSE-MsgGUID: lCX1JVj+Q6+Fwb4hTu/2HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="29437955"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="29437955"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2025 23:53:02 -0800
X-CSE-ConnectionGUID: gOfDzAz2TJOlJ/yXPs/Row==
X-CSE-MsgGUID: drKKuFr5SPmSU/Y+9FbpbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118838748"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 23:53:00 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/kms_dp_link_training: do modeset before
 retraining
Date: Mon,  3 Mar 2025 13:38:41 +0530
Message-Id: <20250303080842.3194642-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250303080842.3194642-1-kunal1.joshi@intel.com>
References: <20250303080842.3194642-1-kunal1.joshi@intel.com>
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

v2: remove redundant modeset (Jeevan)

Fixes: 983ffca5ff96fd67c937691337f4488e28948aa7
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_dp_link_training.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index f00376614..e218c9839 100644
--- a/tests/intel/kms_dp_link_training.c
+++ b/tests/intel/kms_dp_link_training.c
@@ -233,6 +233,7 @@ static bool run_link_rate_test(data_t *data, bool mst, bool uhbr)
 
 	igt_display_reset(&data->display);
 	igt_reset_link_params(data->drm_fd, data->output);
+	do_modeset(data, mst);
 
 	/* Retrain at default/driver parameters */
 	igt_force_link_retrain(data->drm_fd, data->output, RETRAIN_COUNT);
@@ -240,7 +241,6 @@ static bool run_link_rate_test(data_t *data, bool mst, bool uhbr)
 						   igt_get_dp_pending_retrain,
 						   1.0, 20.0), 0);
 	assert_link_status_good(data, mst);
-	do_modeset(data, mst);
 
 	/* FIXME : Driver may lie max link rate or max lane count */
 	/* Read max_link_rate and max_lane_count */
-- 
2.43.0

