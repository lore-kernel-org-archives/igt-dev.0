Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF44CAC59A
	for <igt-dev@archiver.kernel.org>; Thu, 18 Sep 2025 09:01:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1026510E3AD;
	Thu, 18 Sep 2025 09:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OOEfphtC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E58F10E320
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Sep 2025 09:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758186074; x=1789722074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u0oqlF70EC938JGKjPPzxCi6L6x4GB5VsrG8Ky1ezK8=;
 b=OOEfphtCqchCJhYS6jitgfX7sjIB/9wutDSojp2mGZpKRzzqrLYRkrZ6
 u9TbrcF86GtZZ6HINMk9p045bInJ00ClI18KGArXB/lAaDzkVEFx/wGWJ
 IFBL4hrrsISBamtFhN0HG9jeNLQ8NUKyF52QJR8daHRImBe53RiaqIwY3
 q+R2o+MYjsJa+fGe1w+Al5FUsWqQqld98bZHPGLTYDJP/GsX+mnKv3GgS
 ZIeZ/rU7FqQ4VBu9Im3cyUtF+PQvRd8vgApk6qlD8hgaLP9iepAtf3OF7
 G/vrsfOQTqFLuxEy5ZtkwsXPa/ftUOIfY2NZlooSYHVbInADs/aZ3VIdZ w==;
X-CSE-ConnectionGUID: LE/8+K3TQEib+f7zmFRfwg==
X-CSE-MsgGUID: KaW3s/R+SF+WD6MoS/WGXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64313253"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64313253"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 02:01:14 -0700
X-CSE-ConnectionGUID: tXJx1YvjT0acDNGbrE/B2g==
X-CSE-MsgGUID: GWEPqGxUQ7mrzMJFwApa4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="206281477"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 02:01:13 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 2/3] tests/kms_vrr: extend lobf test for supported
 connectors
Date: Thu, 18 Sep 2025 14:47:01 +0530
Message-Id: <20250918091702.2339227-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250918091702.2339227-1-kunal1.joshi@intel.com>
References: <20250918091702.2339227-1-kunal1.joshi@intel.com>
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

Extend lobf test for all connectors that
exposes i915_edp_lobf_status debugfs

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_vrr.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 233143770..820a982d0 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -948,7 +948,7 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 {
 	data->debugfs_fd = igt_debugfs_dir(data->drm_fd);
 
-	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_CMRR | TEST_LINK_OFF)) &&
+	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_CMRR)) &&
 	    output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP) {
 		igt_info("%s: Connected panel is not eDP.\n", igt_output_name(output));
 		return false;
@@ -961,6 +961,11 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 	}
 
 	if (flags & TEST_LINK_OFF) {
+		if (igt_has_lobf_debugfs(data->drm_fd, output)) {
+			igt_info("i915_edp_lobf_status not present for %s\n",
+				 igt_output_name(output));
+			return false;
+		}
 		if (!psr_sink_support(data->drm_fd,
 				      data->debugfs_fd, PR_MODE, NULL)) {
 			igt_info("LOBF not supported\n");
-- 
2.25.1

