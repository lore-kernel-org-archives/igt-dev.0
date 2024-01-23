Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303CBC47DDB
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jan 2024 14:09:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD7610E816;
	Tue, 23 Jan 2024 14:09:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FBE110E812
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jan 2024 14:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706018947; x=1737554947;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k0QK+62K3O/VjvPWnhnKAH2IYzGv99qz4dezOJpmE5o=;
 b=bM460H1jZtWwQsQIqmmFtHYI/ZptjPtrWqZLRkY1in1rAfPhPU1PPXAt
 SoU4SRZy/d1iYQ5i/zRtQmq8ouYyZu722bPAmJkxtL5M45nHyIRd6923H
 7g4jBElUu6AsXE3zk614IYr55hsZxwDmGvFDP5Q3vbrZ6KsA/UtFIoqIL
 ef69Gx/w5KrLfvRcJ3syx9DX/fn3gMLTh1oZEpkmAudxSlmirP6y+4oP0
 myELzj8OCw0IBLkRRG+AW/w/vWyaq5m3fZKycYqjlOZ2M+I7OdyDTSyl/
 PB72mgB4TcIfv22qZHFdfBX9L6n64mCqoH9UEbq1QEsuf1U/5/VoHBI8F g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="15047230"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="15047230"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 06:09:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="1559011"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 06:09:06 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/2] tests/intel/kms_psr: enable given psr mode only
 after checking enable_psr modparam
Date: Tue, 23 Jan 2024 19:48:35 +0530
Message-Id: <20240123141835.1211107-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240123141835.1211107-1-kunal1.joshi@intel.com>
References: <20240123141835.1211107-1-kunal1.joshi@intel.com>
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

don't enable a psr mode with psr_debug debugfs, instead check what's
the modparam value for i915_enable_psr

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_psr.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index 349671b00..521d4c708 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -497,16 +497,28 @@ static void fill_render(data_t *data, const struct igt_fb *fb,
 
 static bool psr_wait_entry_if_enabled(data_t *data)
 {
+	if (!is_psr_enable_possible(data->drm_fd, data->op_psr_mode))
+		igt_skip("enable_psr modparam doesn't allow psr mode %d\n",
+			 data->op_psr_mode);
+
 	return psr_wait_entry(data->debugfs_fd, data->op_psr_mode, data->output);
 }
 
 static bool psr_wait_update_if_enabled(data_t *data)
 {
+	if (!is_psr_enable_possible(data->drm_fd, data->op_psr_mode))
+		igt_skip("enable_psr modparam doesn't allow psr mode %d\n",
+			 data->op_psr_mode);
+
 	return psr_wait_update(data->debugfs_fd, data->op_psr_mode, data->output);
 }
 
 static bool psr_enable_if_enabled(data_t *data)
 {
+	if (!is_psr_enable_possible(data->drm_fd, data->op_psr_mode))
+		igt_skip("enable_psr modparam doesn't allow psr mode %d\n",
+			 data->op_psr_mode);
+
 	return psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode);
 }
 
-- 
2.25.1

