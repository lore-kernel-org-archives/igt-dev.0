Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9378CE8D65
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 17:23:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9D710EAE6;
	Fri, 14 Nov 2025 17:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DnoKy1z0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0E110EAE6
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 17:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763140983; x=1794676983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rv/mXEfG4nMai34gXX3c4Qe7YPPQhFo6llVliNqENOM=;
 b=DnoKy1z0R5b2Ww+se6d5x//NZT0ulJ3CKatp1bnxYvQev9tth/19KzMF
 jRabSUG2yUW79smzyGIY1LrXqTbxjZOV+0Eu9MrVEmsdAUV9Nb7F2h9SJ
 nbN5vVJsoVuUWLw+cnaNeQK7Fyzxk2vdyNxlpC8mlp99CcDQBU0Mc9KFH
 HwM5GZuXgNxCyd4UkcShIL/as4+akBCNyokxsQ6nCAucWBEboyS3eJ3Zg
 wQAJ574C2yDJTO4pb5v90icjC1QPOOb68Noi/LT0XPmVS6HSeQwdQ3h01
 ObZXeZA5ER+9azF1mQ7aOk+08e0dsHZfqNyvkV9SfDPlQptFpMkTRS8Dx A==;
X-CSE-ConnectionGUID: tUA4mRmyRPSrDscgzebx9g==
X-CSE-MsgGUID: sQA13AgfQLeqS+QGcOCLKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82871466"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82871466"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 09:23:03 -0800
X-CSE-ConnectionGUID: 8H21LVhRTJqoumFwzL+GDA==
X-CSE-MsgGUID: 38L5KgrrQpquwHn11SRrrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="194981666"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 09:23:01 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com, chaitanya.kumar.borah@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v4 21/23] tests/kms_color: Add Intel plane pipeline tests with LUT1D
 (MULTSEG) and CTM
Date: Fri, 14 Nov 2025 22:59:06 +0530
Message-Id: <20251114172908.1027816-22-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251114172908.1027816-1-swati2.sharma@intel.com>
References: <20251114172908.1027816-1-swati2.sharma@intel.com>
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

For now, Intel plane color pipeline contains 3 colorops:
Pre-csc gamma (1D LUT MULTSEG) --> CTM 3x4 --> Post-csc gamma (1D LUT MULTSEG)

Create subtests to cover different combinations of available
colorops:
  igt@kms_color@plane-lut1d-multseg
  igt@kms_color@plane-ctm3x4
  igt@kms_color@plane-lut1d-multseg-ctm3x4
  igt@kms_color@plane-ctm3x4-lut1d-multseg
  igt@kms_color@plane-lut1d-multseg-lut1d-multseg
  igt@kms_color@plane-lut1d-multseg-ctm3x4-lut1d-multseg

v2: -renamed subtests
    -updated create_unity_lut() logic
    -used CTM 3x4

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color.c | 73 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index a6dabe5ff..624a10c27 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -91,6 +91,11 @@
  * @lut1d-lut1d:		1D LUT --> 1D LUT
  * @lut1d-ctm3x4-lut1d:		1D LUT --> 3X4 CTM --> 1D LUT
  * @lut3d-red-channel-zeroed:	3D LUT
+ * @lut1d-multseg:			1D LUT MULTSEG
+ * @lut1d-multseg-ctm3x4:		1D LUT MULTSEG --> 3X4 CTM
+ * @ctm3x4-lut1d-multseg:		3X4 CTM --> 1D LUT MULTSEG
+ * @lut1d-multseg-lut1d-multseg:	1D LUT MULTSEG --> 1D LUT MULTSEG
+ * @lut1d-multseg-ctm3x4-lut1d-multseg: 1D LUT MULTSEG --> 3X4 CTM --> 1D LUT MULTSEG
  */
 
 IGT_TEST_DESCRIPTION("Test Color Features at Pipe and Plane level");
@@ -748,6 +753,9 @@ static void clear_lut_data(kms_colorop_t *colorops[])
 	for (i = 0; colorops[i]; i++) {
 		if (colorops[i]->type == KMS_COLOROP_CUSTOM_LUT1D)
 				memset(&colorops[i]->lut1d->lut, 0, sizeof(colorops[i]->lut1d->lut));
+
+		if (colorops[i]->multseg_lut1d_info.lut)
+			free(colorops[i]->multseg_lut1d_info.lut);
 	}
 }
 
@@ -784,6 +792,32 @@ static void prepare_lut_data(data_t *data, kms_colorop_t *colorops[])
 
 			memcpy(colorops[i]->lut1d->lut, lut_32, size * sizeof(struct drm_color_lut32));
 			free_lut(lut);
+		} else if (colorops[i]->type == KMS_COLOROP_MULTSEG_LUT1D) {
+			uint64_t hwlut_caps = 0;
+			segment_data_t *segment_info;
+
+			hwlut_caps = igt_colorop_get_prop(&data->display, colorops[i]->colorop, IGT_COLOROP_HW_CAPS);
+			segment_info = get_segment_data(data->drm_fd, hwlut_caps);
+
+			igt_info("Lut size (%s): %d\n", colorops[i]->name, segment_info->entries_count);
+
+			colorops[i]->multseg_lut1d_info.lut_size = segment_info->entries_count;
+			colorops[i]->multseg_lut1d_info.lut =
+				malloc(sizeof(struct drm_color_lut32) * colorops[i]->multseg_lut1d_info.lut_size);
+			igt_assert(colorops[i]->multseg_lut1d_info.lut);
+
+			switch (colorops[i]->multseg_lut1d_info.lut_type) {
+			case KMS_COLOROP_MULTSEG_LUT1D_ZERO:
+				create_zero_lut(segment_info, colorops[i]->multseg_lut1d_info.lut);
+				break;
+			case KMS_COLOROP_MULTSEG_LUT1D_LINEAR:
+				create_unity_lut(segment_info, colorops[i]->multseg_lut1d_info.lut);
+				break;
+			case KMS_COLOROP_MULTSEG_LUT1D_MAX:
+			default:
+				create_max_lut(segment_info, colorops[i]->multseg_lut1d_info.lut);
+			}
+			clear_segment_data(segment_info);
 		}
 	}
 }
@@ -1379,6 +1413,20 @@ run_tests_for_pipe(data_t *data)
 			},
 			.name = "3dlut passing only green channel (RGB order)",
 			.transform = &igt_color_3dlut_17_12_rgb,									      };
+		kms_colorop_t lut1d_multseg_linear = {
+			.type = KMS_COLOROP_MULTSEG_LUT1D,
+			.name = "Pre/Post CSC GAMMA (linear LUT)",
+			.multseg_lut1d_info = {
+				.lut_type = KMS_COLOROP_MULTSEG_LUT1D_LINEAR,
+			},
+		};
+		kms_colorop_t lut1d_multseg_max = {
+			.type = KMS_COLOROP_MULTSEG_LUT1D,
+			.name = "Pre/Post CSC GAMMA (max LUT)",
+			.multseg_lut1d_info = {
+				.lut_type = KMS_COLOROP_MULTSEG_LUT1D_MAX,
+			},
+		};
 		kms_colorop_t ctm_3x4 = {
 			.type = KMS_COLOROP_CTM_3X4,
 			.name = "CTM 3X4 (red to blue)",
@@ -1425,6 +1473,31 @@ run_tests_for_pipe(data_t *data)
 			  .exp_colors = colors_only_green,
 			  .colorops = { &lut3d, NULL },
 			},
+			{ .name = "lut1d-multseg",
+			  .fb_colors = colors_rgb,
+			  .exp_colors = colors_rgb,
+			  .colorops = { &lut1d_multseg_max, NULL },
+			},
+			{ .name = "lut1d-multseg-ctm3x4",
+			  .fb_colors = colors_rgb,
+			  .exp_colors = colors_red_to_blue,
+			  .colorops = { &lut1d_multseg_max, &ctm_3x4, NULL },
+			},
+			{ .name = "ctm3x4-lut1d-multseg",
+			  .fb_colors = colors_rgb,
+			  .exp_colors = colors_red_to_blue,
+			  .colorops = { &ctm_3x4, &lut1d_multseg_max, NULL },
+			},
+			{ .name = "lut1d-multseg-lut1d-multseg",
+			  .fb_colors = colors_rgb,
+			  .exp_colors = colors_rgb,
+			  .colorops = { &lut1d_multseg_linear, &lut1d_multseg_max, NULL },
+			},
+			{ .name = "lut1d-multseg-ctm3x4-lut1d-multseg",
+			  .fb_colors = colors_rgb,
+			  .exp_colors = colors_red_to_blue,
+			  .colorops = { &lut1d_multseg_linear, &ctm_3x4, &lut1d_multseg_max, NULL },
+			},
 		};
 
 		igt_fixture {
-- 
2.25.1

