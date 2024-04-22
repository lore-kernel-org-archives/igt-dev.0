Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AB0C04FF6
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 05:24:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506D3112780;
	Mon, 22 Apr 2024 05:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R3scf6KY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB6611277E
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 05:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713763447; x=1745299447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xdd9ftMIJbe/vrWB5X9YKVnQ6pEAQdV+8mbqtIe4mLo=;
 b=R3scf6KYnt8G+nbBsqww75YA/5xBos160GYdHaaTQW+3wJwCoXSUY7O/
 EiIwKqL2LQH+N3F3hGCEzqxKILisSuEssw4o6j6SUpp0bcTw/E6v5bCbF
 f6kj5cwDROzG+2SNoupwX8BjEd7L99l1xZqSNVjO+oPJWcoje9qWVHGEK
 73J8yAdDfHjZ+JOaRig0dydyKEOm3Yqcj/WLLTBkuQ8InKYMAsWK1u9zk
 inJ0CuaWBuA8jE74Ugo/WLXzy3CE+CIFD/IObxY+eztMnfCLGFHlDDhiP
 hUWWKTcBBGdfRQUdydlThB31uOJad/t7pTRoehPX7O7tfhj7TcSmrG8od A==;
X-CSE-ConnectionGUID: R160bqipT/K0dpAWqGudAw==
X-CSE-MsgGUID: 1YEpi2VITLKnEWn4NymrXQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="9113789"
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="9113789"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2024 22:24:07 -0700
X-CSE-ConnectionGUID: 49sFa4+UQH6SV8IgiFplrQ==
X-CSE-MsgGUID: KLY4/ig0TKe7Wj9YFn4X6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; d="scan'208";a="23981119"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2024 22:24:05 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 2/7] tests/intel/kms_big_joiner: fix crash in multi
 joiner test
Date: Mon, 22 Apr 2024 11:04:49 +0530
Message-Id: <20240422053454.2523989-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240422053454.2523989-1-kunal1.joshi@intel.com>
References: <20240422053454.2523989-1-kunal1.joshi@intel.com>
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
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
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

