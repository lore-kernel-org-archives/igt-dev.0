Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E6CC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 06:29:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A9B10E62E;
	Fri, 19 Apr 2024 06:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XzWdjA5V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C90010FD9F
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 06:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713508156; x=1745044156;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MNF1qiBSgt+QK/9cylriGSSgvXoUbEnEWq2q8EFC0OI=;
 b=XzWdjA5VCDGUNrURkrXHROSSchwlmA7qBcXjatIQX0PDDgsge9Wqhg4X
 OVYwYmTJ/xz4ZsAdnc02RMhxxMOWb+hU9SnyUWVxU9rSB2bjR0BSQY1Ou
 OgSvj990u2bzZCwBmtSx6xIQQk8EXEGNBVJ+Szl2Gq9J6Jt1CvR5UKTp8
 EH/UMaT/aY1qHWL/E6TEUf1thiUIxRxubFYxiBW8cLQ19BTPlgL1pUGTo
 ko8Ycaz6bUZp41jmIaaT3MxIt2s/xxFmifpZcWEaf+CMbZhkI/y2ZKoP+
 uNwn0LE7HIXhnE2p6unqOGSHIzwK+b/n9HHicvKIIZPtFM4XivMjZMRSY w==;
X-CSE-ConnectionGUID: jPqkTiyjQlGOCzxLJ388NA==
X-CSE-MsgGUID: zCutc/b2SMOnRSWGB3sKkQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9637550"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9637550"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 23:29:16 -0700
X-CSE-ConnectionGUID: B38EpVO0Q/CdWgGfWJoVnw==
X-CSE-MsgGUID: IPZhGLe9QtWcXVSUY85Rbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23310770"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 23:29:14 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 2/7] tests/intel/kms_big_joiner: fix crash in multi
 joiner test
Date: Fri, 19 Apr 2024 12:09:56 +0530
Message-Id: <20240419064001.2401850-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240419064001.2401850-1-kunal1.joshi@intel.com>
References: <20240419064001.2401850-1-kunal1.joshi@intel.com>
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

