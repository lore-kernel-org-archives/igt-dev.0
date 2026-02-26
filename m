Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1226FD8FD8
	for <igt-dev@archiver.kernel.org>; Thu, 26 Feb 2026 16:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E9410E9D2;
	Thu, 26 Feb 2026 16:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P9XL3lJp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B953910E9D2
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Feb 2026 16:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772124796; x=1803660796;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sTOBYO1T6xym+EMyNSFCs+W4f8GVsFbPMX6TOUKpjrA=;
 b=P9XL3lJpuTEFi9Lu88mkEifmA5KoWDlF56ZmoyC6OntHo8uaLyvm0IwF
 qnAlqJCo8obNJ21vb5eEdHVPGypiokQ4bpLy1jzviSB/6GGpaZ+6J7BRs
 sJ/LKF8jTkPib5EgiytAxuUTkODLd2SeKuaaqeYqaYUdNA/TAWC6cjhiG
 wVIEBgzw7JOr34yxEMKJGuEKYvYE/QhQQ6CU1SrtQp+crxU5M736XQWLr
 5xaKZx1d3lETwToGK1I0gKspdrf4fG0NBqyZYtXhB3eoIoxxoXPidAPM0
 J2jC4ronffaBULBcXVJDWNvJNOqGkn9Jq8aW2DZnpxK/aud35GzS8foN1 Q==;
X-CSE-ConnectionGUID: zTrBucOiRRGxEfxXeV0cdQ==
X-CSE-MsgGUID: O2jczyhZQnytXk4OGW+5wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="83523844"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="83523844"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 08:53:15 -0800
X-CSE-ConnectionGUID: wnkn8AomQHmE66RIYLpqrw==
X-CSE-MsgGUID: jVQYJ5VyQf6THcZuKPo1AA==
X-ExtLoop1: 1
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 08:53:13 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_content_protection: check sink capability
 after modeset
Date: Thu, 26 Feb 2026 22:17:42 +0530
Message-Id: <20260226164742.1845906-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

The loop checks HDCP sink capability too early, this makes test skips
on multi display panels with "Sink has no HDCP support"
on valid connectors.

Fix this by validating output/crtc combo, do modeset and then check for
sink capability.

Fixes: a85208a45759 ("tests/kms: Use igt_crtc_t instead of enum pipe, part 4")
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_content_protection.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 2c2ffa150..1f1f45fe6 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -725,21 +725,22 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 
 	for_each_connected_output(display, output) {
 		for_each_crtc(display, crtc) {
-			if (!output_hdcp_capable(output, content_type))
+			igt_display_reset(display);
+			igt_output_set_crtc(output, crtc);
+			if (!intel_pipe_output_combo_valid(display))
 				continue;
+
+			modeset_with_fb(output, commit_style);
+
 			if (is_output_hdcp_test_exempt(output)) {
 				igt_info("Skipping HDCP test on %s, as the panel is blocklisted\n",
 					  output->name);
 				continue;
 			}
 
-			igt_display_reset(display);
-			igt_output_set_crtc(output,
-				            crtc);
-			if (!intel_pipe_output_combo_valid(display))
+			if (!output_hdcp_capable(output, content_type))
 				continue;
 
-			modeset_with_fb(output, commit_style);
 			if (data.is_force_hdcp14)
 				set_i915_force_hdcp14(output);
 
-- 
2.34.1

