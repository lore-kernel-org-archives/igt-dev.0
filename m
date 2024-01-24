Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B18CC46CD2
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 10:24:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD98910F6E5;
	Wed, 24 Jan 2024 10:24:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAEF310F454
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 10:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706091882; x=1737627882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kSfGJ3uhfRjpi/N89d9GkEqjTWnnqYOItGzOrNQGdQg=;
 b=jaUHiEWG9X64T2zJiOUQvh1ZJ0ug3H8VOBeXQg32+2w03IExx956i48p
 hr2e7QCXZI8bzux7f9RMfTUxjjNf+ID2s7WLplQMma3n2m4i3/iD2a1ll
 WevrN/IJvjqopI6KOZV+4dw2aP26H5As9k8TtWW36pDwwWsbt6FYognuw
 HSqLvoAvJ+j5TdDJGHxsl0pq2XWrnFOKyvr/5XP4AaTM17yM46POvuBGX
 4+BZdsRFUy0DlVujLKv+lFa5SYIfXFAspbHqIqcg33btZq8z1CFIhYVct
 /GN3q9DJMU3ilYLtP33p0bt3Cyawe33fB//WLaklgbapQ6qNcEXK3K/0Q A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="401463980"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="401463980"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 02:24:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="905546521"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="905546521"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmsmga002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 02:24:41 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/2] tests/intel/kms_psr: enable given psr mode only
 after checking enable_psr modparam
Date: Wed, 24 Jan 2024 16:04:10 +0530
Message-Id: <20240124103410.1259607-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240124103410.1259607-1-kunal1.joshi@intel.com>
References: <20240124103410.1259607-1-kunal1.joshi@intel.com>
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
Reviewed-by: Jeevan B <jeevan.b@intel.com>
Tested-by: Vidya Srinivas <vidya.srinivas@intel.com>
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

