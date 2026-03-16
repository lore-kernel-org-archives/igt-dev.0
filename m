Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EC4EFCBD4
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 08:20:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0597110E319;
	Mon, 16 Mar 2026 08:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lUhGNvJ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ADA010E2F2
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 08:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773649194; x=1805185194;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5XRaH1dOz7yPz0uSUSzJwae2qqzqdCdSThLIj6iT9SI=;
 b=lUhGNvJ7DmVgdL6rlwvRTlfi7wJRyn5BcCGSY3aMcxUu0AsfdqWG9WuV
 z+3qfwyAM/3CIMqMa9Mz33EayRQLKYCS/xkfCE3QEpPCw06PDnmPh7Wqm
 es24sVmxO7I4X2Kdso/SPD1I1ipWp31jKCTHpFdDjwZtcso7kvbaIEXxL
 qLIzox+kp1Hb/CKZq7PhOM0CFQ8iI6VzNKB829L82fkY02dqgc1ePR6+n
 VIoLlXmeDGcfcdS26Ij3J6bJTCWnJrQ70IFtUVnD8XO+quyanye2SMkxN
 5X2k3gMxofJdNm9BIiIhzd+yUj5A9o28BX8eHxyLM9o4sPaPi1/xf0ra8 g==;
X-CSE-ConnectionGUID: CmBlo2abS56cgRpiZb1z1g==
X-CSE-MsgGUID: pwrihHEKQyK9/HrpDUotNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="85359467"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="85359467"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:54 -0700
X-CSE-ConnectionGUID: oaWQFCxaTVmGDiwkhVjO7g==
X-CSE-MsgGUID: 0q8gJXpmQ0eIe+8C5hKKHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="226300767"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:19:53 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, swati2.sharma@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 17/17] tests/kms_rotation_crc: Use CRC stop-on-fail
 assertion and cleanup helper
Date: Mon, 16 Mar 2026 14:10:21 +0530
Message-ID: <20260316084021.419580-18-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316084021.419580-1-sowmiya.s@intel.com>
References: <20260316084021.419580-1-sowmiya.s@intel.com>
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

Replace igt_assert_crc_equal() with igt_assert_crc_equal_stop_on_fail()
to automatically stop CRC collection on mismatch.
Replace manual free+NULL and stop+free patterns with igt_pipe_crc_cleanup()
in cleanup_crtc(), test_multi_plane_rotation() and fixture teardown.
Remove now-redundant igt_pipe_crc_free() call from prepare_crtc().

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_rotation_crc.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 4420053f1..e4139667a 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -284,8 +284,7 @@ static void cleanup_crtc(data_t *data)
 {
 	igt_display_t *display = &data->display;
 
-	igt_pipe_crc_free(data->pipe_crc);
-	data->pipe_crc = NULL;
+	igt_pipe_crc_cleanup(&data->pipe_crc);
 
 	remove_fbs(data);
 
@@ -305,8 +304,6 @@ static void prepare_crtc(data_t *data, igt_output_t *output, igt_crtc_t *crtc,
 	igt_plane_set_rotation(plane, IGT_ROTATION_0);
 
 	/* create the pipe_crc object for this pipe */
-	igt_pipe_crc_free(data->pipe_crc);
-
 	/* defer crtc cleanup + crtc active for later on amd - not valid
 	 * to enable CRTC without a plane active
 	 */
@@ -468,6 +465,7 @@ static void test_single_case(data_t *data, igt_crtc_t *crtc,
 {
 	igt_display_t *display = &data->display;
 	igt_crc_t crc_output;
+	igt_crc_t *ref_crc;
 	int ret;
 
 	igt_debug("Testing case %i on pipe %s, format %s\n", rect,
@@ -502,9 +500,9 @@ static void test_single_case(data_t *data, igt_crtc_t *crtc,
 		igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc,
 								 &crc_output);
 	}
-	igt_assert_crc_equal(
-		&data->crc_rect[data->output_crc_in_use][rect].ref_crc,
-		&crc_output);
+	ref_crc = &data->crc_rect[data->output_crc_in_use][rect].ref_crc;
+
+	igt_assert_crc_equal_stop_on_fail(data->pipe_crc, ref_crc, &crc_output);
 
 	/*
 	 * If flips are requested flip to a different fb and
@@ -533,8 +531,9 @@ static void test_single_case(data_t *data, igt_crtc_t *crtc,
 			igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc,
 									 &crc_output);
 		}
-		igt_assert_crc_equal(&data->crc_rect[data->output_crc_in_use][rect].flip_crc,
-				     &crc_output);
+		ref_crc = &data->crc_rect[data->output_crc_in_use][rect].flip_crc;
+
+		igt_assert_crc_equal_stop_on_fail(data->pipe_crc, ref_crc, &crc_output);
 	}
 }
 
@@ -1068,7 +1067,9 @@ static void test_multi_plane_rotation(data_t *data, igt_crtc_t *crtc)
 						free(str1);
 						free(str2);
 
-						igt_assert_crc_equal(&retcrc_sw, &retcrc_hw);
+						igt_assert_crc_equal_stop_on_fail(data->pipe_crc,
+										  &retcrc_sw,
+										  &retcrc_hw);
 
 						lastroundjformat = multiplaneformatlist[p[1].formatindex];
 						lastroundirotation = planeconfigs[i].rotation;
@@ -1077,8 +1078,7 @@ static void test_multi_plane_rotation(data_t *data, igt_crtc_t *crtc)
 				}
 			}
 		}
-		igt_pipe_crc_stop(data->pipe_crc);
-		igt_pipe_crc_free(data->pipe_crc);
+		igt_pipe_crc_cleanup(&data->pipe_crc);
 
 		igt_plane_set_fb(p[0].plane, NULL);
 		igt_plane_set_fb(p[1].plane, NULL);
@@ -1382,6 +1382,7 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 	}
 
 	igt_fixture() {
+		igt_pipe_crc_cleanup(&data.pipe_crc);
 		igt_display_fini(&data.display);
 		drm_close_driver(data.gfx_fd);
 	}
-- 
2.43.0

