Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED65CD5BD0
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 13:30:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B331C896E9;
	Wed, 27 May 2026 13:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CjzrbFJN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974CB896E9
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 13:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779888590; x=1811424590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4+NU247yUMO7Iq9sy91b3kQkZGiEIvhTDMQGlsG5TK4=;
 b=CjzrbFJNQ6ePEmyfJ1d2NpviifHbeQshQk3xu28DgZ6iczute0oxxoQf
 SmQqxvJkkdXwcgB3b92teDRoM4waEg381nWkYd/F7EDf6v83yvElkEDDU
 ueT8LxaX/lQheflLakdGxj/7Z0KEI/XcXCoG/N+t19XW2TO27W165J02r
 /R0gTyti+cU20+9gCPN7V/rOOU5qZ6kvmeZv0Z/9lIcofvnnNaB6ndj8k
 cjF0wha+cbZrZJYamdN7B9fGRnzEIb7gN5Npqkg2GdkeB2v1+fyD2kD9I
 mIOaX3/083hDxM1Q7bAWu9LxKvaT5Lz7snB27MsnOdke1Ru0NvOf3Pbzx A==;
X-CSE-ConnectionGUID: iILe1qWhRoK0kVqqBtiRQA==
X-CSE-MsgGUID: p2fWnk+BRI+VIkLVOd4ZzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80567421"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="80567421"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 06:29:50 -0700
X-CSE-ConnectionGUID: 3V9WJBSJSiCpvXxBYUAbdA==
X-CSE-MsgGUID: pujmGi1BT2Gf+Y7qabxeeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="242079813"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 06:29:48 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, swati2.sharma@intel.com,
 ramanaidu.naladala@intel.com, Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v3 3/3] tests/intel/kms_pipe_stress: fit display modes
 to MST link budget
Date: Wed, 27 May 2026 19:21:08 +0530
Message-ID: <20260527135109.3291120-4-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527135109.3291120-1-sowmiya.s@intel.com>
References: <20260527135109.3291120-1-sowmiya.s@intel.com>
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
2.48.1

