Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E67606A31B
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 13:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c+KXWpET
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F09410E130;
	Wed,  4 Nov 2026 13:11:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B811410FBDF
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 13:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793797667; x=1825333667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Apz7jqH+Wirif0DF/CEq9C0RIUZw+inDKyKjS2THL6s=;
 b=c+KXWpET0ibPsyyd+l4h+iYwznD5WQicNhzs5r7goCKXq/ZjNfVYT3Vv
 K8Cb3ZZYQSsNbD6vpTwAUBdt14FayDaDz++bS5N0yaOFlB9aKJlqCOvO6
 t1Vvv+H90ec2dt7y3isaA7n4rzRi4aHyZ9NdWPndgZMo+VfWCjhRtnk/S
 EdB6KJsli0ulyujCSP6hSufu4HkfgDj98P7bUL8uvfsGr0YSgGyePktZX
 /b1PJCQhyR0j7bopzKAsmTnwk/YdvxpKbfbjBM/NvUtn3KcomH2ftXfBa
 8ltwbUZoEihwHqlJVKTBZ+89KE3wp1+TyhRzKhUHuE8Px5qZAiDeFsx9d g==;
X-CSE-ConnectionGUID: N3qM3A3/QV+2zYRwC23tag==
X-CSE-MsgGUID: giNvR6TtQUCuGbzMsK/Z1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2424649"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2424649"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 05:07:44 -0800
X-CSE-ConnectionGUID: DB52GimfRUapL55FHuxRoA==
X-CSE-MsgGUID: 1wMZIFynTV29yyZCLVYCEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6565707"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa008.jf.intel.com with ESMTP; 04 Nov 2026 05:07:43 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH i-g-t v2 3/3] tests/intel/kms_psr2_sf: Handle the joiner
Date: Wed,  4 Nov 2026 13:07:37 +0000
Message-ID: <20261104130737.2549248-4-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104130737.2549248-1-mika.kahola@intel.com>
References: <20261104130737.2549248-1-mika.kahola@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PSR with joiner is only supported when the joiner pipe mask is
PIPE_A|PIPE_B, so skip the configs that don't land on that pair.

psr_enable() makes the kernel force a modeset on whatever is currently
committed, and that fails if another output is still driving the joiner
secondary. Reset the display first.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 tests/intel/kms_psr2_sf.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index fa7090ce8..b15488ca6 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -407,6 +407,9 @@ static void prepare(data_t *data)
 	igt_plane_t *primary, *sprite = NULL, *cursor = NULL;
 	int fb_w, fb_h, x, y, view_w, view_h;
 
+	igt_display_reset(&data->display);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
 	psr_enable(data->drm_fd, data->debugfs_fd, data->psr_mode,
 		   data->output);
 
@@ -1044,6 +1047,22 @@ static void cleanup(data_t *data)
 	igt_remove_fb(data->drm_fd, &data->fb_test);
 }
 
+/* PSR/Panel Replay with joiner is only supported on the pipe A/B pair. */
+static bool sel_fetch_joiner_combo_valid(data_t *data)
+{
+	drmModeModeInfo *mode = igt_output_get_mode(data->output);
+	int max_dotclock = igt_get_max_dotclock(data->drm_fd);
+
+	if (igt_ultrajoiner_possible(data->drm_fd, mode, max_dotclock))
+		return false;
+
+	if (!igt_check_force_joiner_status(data->drm_fd, data->output->name) &&
+	    !igt_bigjoiner_possible(data->drm_fd, mode, max_dotclock))
+		return true;
+
+	return data->crtc->hardware_pipe == PIPE_A;
+}
+
 static bool sel_fetch_pipe_combo_valid(data_t *data)
 {
 	if (data->devid < 14 && !IS_ALDERLAKE_P(data->devid) && data->crtc->hardware_pipe != PIPE_A)
@@ -1053,6 +1072,9 @@ static bool sel_fetch_pipe_combo_valid(data_t *data)
 	    data->crtc->hardware_pipe != PIPE_A && data->crtc->hardware_pipe != PIPE_B)
 		return false;
 
+	if (!sel_fetch_joiner_combo_valid(data))
+		return false;
+
 	return true;
 }
 
-- 
2.43.0

