Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BB1C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 15:17:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC9310F8BA;
	Thu, 18 Apr 2024 15:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UzVZZ6e2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B4710F18C
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2024 15:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713453453; x=1744989453;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MNF1qiBSgt+QK/9cylriGSSgvXoUbEnEWq2q8EFC0OI=;
 b=UzVZZ6e2fEZx1rKB2OUX9oO2PD2tPXXJaWBBpYx8GV6REDfFTOYzExmv
 B4uK2OLeTgKsD/maDQjaZ/COGhpvetNPBlN4O2NvFGq+3Pgxq7ergHYzH
 lcPXQepRdUAvKJP9rdmlCdmMnsxPuPVONN0kbImhblIk5d3YGpZryXtca
 AY9471szFHtg9srdjp/JSkIQdoXfc6np3o8HJyduzOrGOH5lVewaJ6zae
 fH3FNkTw/1m3r+/26zkSWIRTJ1rFiBYjOiMOkvdBLLYpbZkG+2+1K+MwH
 8T3Hc8dv+xgHYW0NS4TqKUCwI8cOPUNjVCr2OVKszBJpNARsZTgEoQOqf Q==;
X-CSE-ConnectionGUID: qRpN1l6cQTiwFOC6QEU9zQ==
X-CSE-MsgGUID: 5aZf2f3pT4SjZMoCwM4KOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="26465805"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="26465805"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 08:17:33 -0700
X-CSE-ConnectionGUID: VV4JoeruQv+quhPFlWtYRA==
X-CSE-MsgGUID: OHcOePDdTDmxi3pVp6AMRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="23463251"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 08:17:30 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 2/7] tests/intel/kms_big_joiner: fix crash in multi
 joiner test
Date: Thu, 18 Apr 2024 20:58:12 +0530
Message-Id: <20240418152817.2352850-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240418152817.2352850-1-kunal1.joshi@intel.com>
References: <20240418152817.2352850-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Fix test from crashing on out of bound.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_big_joiner.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
index 078f76ac1..88923be6b 100644
--- a/tests/intel/kms_big_joiner.c
+++ b/tests/intel/kms_big_joiner.c
@@ -162,7 +162,7 @@ static void test_single_joiner(data_t *data, int output_count, bool force_joiner
 
 static void test_multi_joiner(data_t *data, int output_count, bool force_joiner)
 {
-	int i;
+	int i, cleanup;
 	uint32_t available_pipe_mask;
 	enum pipe pipe, master_pipe;
 	igt_output_t **outputs;
@@ -173,6 +173,7 @@ static void test_multi_joiner(data_t *data, int output_count, bool force_joiner)
 
 	available_pipe_mask = BIT(data->n_pipes) - 1;
 	outputs = force_joiner ? data->non_big_joiner_output : data->big_joiner_output;
+	cleanup = 0;
 
 	igt_display_reset(&data->display);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
@@ -183,6 +184,7 @@ static void test_multi_joiner(data_t *data, int output_count, bool force_joiner)
 			master_pipe = setup_pipe(data, output, pipe, available_pipe_mask);
 			if (master_pipe == PIPE_NONE)
 				continue;
+			cleanup++;
 			mode = igt_output_get_mode(output);
 			primary[i] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
@@ -195,7 +197,7 @@ static void test_multi_joiner(data_t *data, int output_count, bool force_joiner)
 		}
 	}
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
-	for (i = 0; i < output_count; i++) {
+	for (i = 0; i < cleanup; i++) {
 		igt_plane_set_fb(primary[i], NULL);
 		igt_remove_fb(data->drm_fd, &fb[i]);
 	}
-- 
2.25.1

