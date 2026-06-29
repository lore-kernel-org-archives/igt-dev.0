Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4099C43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 09:05:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C41710E066;
	Mon, 29 Jun 2026 09:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jXLjc8l5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA0210E799
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 09:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782723808; x=1814259808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cyRsG9QhORDMUNCxTk1lwOeYgIuLvgo2ALuIY7cO4WI=;
 b=jXLjc8l52USEwV/bLE0/ywS00BQjpR1tcOFEt2BH36j+DqV0zHCKubSC
 w8Hngl9A+1UnRgpaIfOObzmtShUo5+Ta7pymngAxcX30uUZxvJPZYebvd
 4hpSppf++svRfeZf3VdoWosgxeSGtovG4uCthzNLO/YNwZr4ftH7J5F6e
 w7gwYhzyzeFYyE0OdQuzUT1yGnzysO7cQraHro/e2lzPkav8LKFmM6oPq
 79w3EXJzB+qjwZlcG89QZZ81SQCA05Jvu+w1+dTrew4QxoWAyagy9lGHO
 wU1372DLc4u9v91GLvVkjBH38cdR4Wc+2gdqtXhftLS45dobvb2GPLf4D w==;
X-CSE-ConnectionGUID: fDJdl/b0SdeTRylvIDe8gg==
X-CSE-MsgGUID: eZ1sMi4jRxy9SgbxvWzFlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="94793466"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="94793466"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 02:03:28 -0700
X-CSE-ConnectionGUID: pFNYrcRoRkqbUxA4Voph0w==
X-CSE-MsgGUID: UsZuk8paSOigm6cIg1pnWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="281988784"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 02:03:27 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, swati2.sharma@intel.com,
 ramanaidu.naladala@intel.com, Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v4 3/3] tests/intel/kms_pipe_stress: Fit display modes
 to MST link budget
Date: Mon, 29 Jun 2026 14:56:11 +0530
Message-ID: <20260629092611.298235-4-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629092611.298235-1-sowmiya.s@intel.com>
References: <20260629092611.298235-1-sowmiya.s@intel.com>
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

When multiple displays share a single MST link,
running them at their highest modes can exceed the
available bandwidth.This causes the stress loop to
fail with -ENOSPC when the driver rejects the commit.
Before allocating framebuffers,check that the combined
mode bandwidth fits the link and scale down modes if
needed,so stress loop never commits an impossible config.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/intel/kms_pipe_stress.c | 51 +++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 36e3842c6..84dcba11f 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -763,6 +763,8 @@ static void prepare_test(struct data *data)
 	int i, j;
 	int num_connectors;
 	int num_cpus = (int) sysconf(_SC_NPROCESSORS_ONLN);
+	igt_output_t *output;
+	enum pipe pipe = PIPE_A;
 
 	data->number_of_cores = min(num_cpus, MAX_CORES);
 
@@ -820,6 +822,55 @@ static void prepare_test(struct data *data)
 			 data->num_planes[i], i);
 	}
 
+	/*
+	 * Assign all connected outputs to their pipes and fit the modes
+	 * within the available link bandwidth.  On shared-link MST
+	 * configurations such as a TBT dock (e.g. 2x4K displays)
+	 * the combined DP stream bandwidth can exceed the link capacity
+	 * and cause subsequent commits to fail with -ENOSPC.
+	 * igt_require_mst_link_bw() detects this and selects the highest
+	 * modes that fit the link budget; for non-MST setups it is a
+	 * no-op.  Update data->highest_mode[] before create_framebuffers()
+	 * so that FBs are allocated at the BW-constrained dimensions and
+	 * the stress loop commits with a mode the driver will accept.
+	 */
+	igt_display_reset(display);
+	for_each_connected_output(display, output) {
+		igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
+
+		if (!crtc || !data->highest_mode[pipe]) {
+			if (++pipe >= IGT_MAX_PIPES)
+				break;
+			continue;
+		}
+
+		igt_output_set_crtc(output, crtc);
+		igt_output_override_mode(output, data->highest_mode[pipe]);
+		pipe++;
+		if (pipe >= IGT_MAX_PIPES)
+			break;
+	}
+
+	igt_require_mst_link_bw(display);
+
+	/* Update highest_mode[] with the (possibly fitted) modes. */
+	for_each_connected_output(display, output) {
+		igt_crtc_t *crtc = output->pending_crtc;
+		enum pipe p;
+
+		if (!crtc)
+			continue;
+
+		p = crtc->pipe;
+		if (!data->highest_mode[p])
+			continue;
+
+		data->highest_mode[p] = igt_output_get_mode(output);
+		igt_assert(data->highest_mode[p]);
+		igt_info("Mode for pipe %d after BW fitting:\n", (int)p);
+		kmstest_dump_mode(data->highest_mode[p]);
+	}
+
 	create_framebuffers(data);
 
 	if (intel_gen(intel_get_drm_devid(data->drm_fd)) > 9)
-- 
2.51.0

