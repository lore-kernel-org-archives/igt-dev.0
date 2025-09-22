Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A65ECAC5A7
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 07:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE1710E3CE;
	Mon, 22 Sep 2025 07:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kxU0RT4P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C84610E3C7
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 07:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758526097; x=1790062097;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1K++XqBSVZzvPPd8LnFUX8LYJ5HB1kkaZWZJ7sUa5W8=;
 b=kxU0RT4P2L4mHKNcq2HqTE7ZksviRdNxdY3/jttKYxYFgR+HX3fi11dU
 ogKMkG7Wy/RjiGlQ1AnKzv3wUAPNmZQvoTH8BsJuM+QZXAC6vKJENTVDf
 vVYzC6k5PN+GUQzJs0fi2hcddvkhKbZdH+W4A8bo3eEkmEOpGe6tNgzTv
 EMzcGmOzzTosgEGRTeWHfrrjxkq0EolIrQabFJxM3Bg4rSxnrwgwz51Es
 2OqKxYmvAM5T/AbP0P31A4LDvHu1US/Z5Po49c/dTweoYcMULmbQ9pXFv
 lwlv3dqxD1Via694VKp8u2pNH+N4E9jb5LGL60lyDXKNFKZ5ILMA2qaXy Q==;
X-CSE-ConnectionGUID: 233VulJJSSuXSDdjJweNGA==
X-CSE-MsgGUID: pkfUt2eYRvOVVy2EXNoEFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="60708122"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="60708122"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 00:28:16 -0700
X-CSE-ConnectionGUID: uK5Q5CHqTP6iWZm2VoCvQQ==
X-CSE-MsgGUID: 9vckbaABSMCXv2J/MJpxUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="176013555"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 00:28:15 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 2/3] tests/kms_vrr: extend lobf test for supported
 connectors
Date: Mon, 22 Sep 2025 13:14:00 +0530
Message-Id: <20250922074401.2494339-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250922074401.2494339-1-kunal1.joshi@intel.com>
References: <20250922074401.2494339-1-kunal1.joshi@intel.com>
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

v2: add new line (Jeevan)

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_vrr.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 233143770..d47a148c5 100644
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
@@ -961,6 +961,12 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 	}
 
 	if (flags & TEST_LINK_OFF) {
+		if (igt_has_lobf_debugfs(data->drm_fd, output)) {
+			igt_info("i915_edp_lobf_status not present for %s\n",
+				 igt_output_name(output));
+			return false;
+		}
+
 		if (!psr_sink_support(data->drm_fd,
 				      data->debugfs_fd, PR_MODE, NULL)) {
 			igt_info("LOBF not supported\n");
-- 
2.25.1

