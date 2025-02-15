Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F39CC021A6
	for <igt-dev@archiver.kernel.org>; Sat, 15 Feb 2025 00:17:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA9210E114;
	Sat, 15 Feb 2025 00:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Rlv9GDYT";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589F110E03B
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Feb 2025 00:16:59 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51EBhBXB018588;
 Sat, 15 Feb 2025 00:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qDXU3NyUIi1AFG5gPJpuCtQYq2GH7pKIaG0/IiioIk8=; b=Rlv9GDYTl93pMu3D
 lATcdtc44goAFECCHvW3GNV8ePrBwMtZ1pNZvjxR6mB2dc8fEOSu8n6x5kNKqx3W
 eAyMsDbuP4QJ6ZbO+7aL5ekaASK/lTGFC3p5bPXLhVYgYB9mg4NVOWwjV2ecPnvB
 smEaQlwPpGTdwyBw3R0ccuC2B127SmbEUzakYo5sDExAb5xMX2V95AYnvBWFjgEm
 ZGMeXyWnlLs+P3vy5L2OERrWhT3lfQhd23H0tZFnrHqUXEEQXntqQ6QUxZdKOa1V
 9I8mJ9Ggn2YtjzjI+yPGK9z2nQkhgLlomHulWfyvTg9bULKru+thmhQ/ac5Pi5S6
 hISiOw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44t56vhmbe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Feb 2025 00:16:50 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51F0GnQ2029848
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Feb 2025 00:16:49 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 14 Feb 2025 16:16:49 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 14 Feb 2025 16:15:53 -0800
Subject: [PATCH i-g-t v7 3/3] tests/kms_writeback: Add subtest for valid
 clone mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250214-igt-cwb-v7-3-66cac72d0c38@quicinc.com>
References: <20250214-igt-cwb-v7-0-66cac72d0c38@quicinc.com>
In-Reply-To: <20250214-igt-cwb-v7-0-66cac72d0c38@quicinc.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <quic_abhinavk@quicinc.com>, <igt-dev@lists.freedesktop.org>, Alex Hung
 <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>, Karthik B S
 <karthik.b.s@intel.com>, Esha Bharadwaj <quic_ebharadw@quicinc.com>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-f0f05
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739578608; l=5603;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=UaTXiDyPR6a9vSftO2EF+mfxdwPxqOdD6U5RWEA60Ws=;
 b=ms+Qs+DnapSCOmY+2ybpE62SQCqRCf2fnxdPTG7WmQ0vXwu4cRKThqVfQG70+RW5PZCq9ltsm
 arar0KHVJDXDxciHX7FhYlmPjUO6Nm7Vdi46VXmKqWpflSSJE+1NTLY
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: em7UAYGZaAFNTSvYNpE9_58DYz6bpXEe
X-Proofpoint-GUID: em7UAYGZaAFNTSvYNpE9_58DYz6bpXEe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_10,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 mlxlogscore=862 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502150000
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

From: Esha Bharadwaj <quic_ebharadw@quicinc.com>

Move the regular writeback dump into its own subtest. Also add a subtest to
dump pairs of cloned non-writeback and writeback encoders if the dump
flag is set or check the writeback output if the dump flag isn't set

Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 tests/kms_writeback.c | 101 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 97 insertions(+), 4 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 1775986fe..27bfadaa2 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -47,6 +47,13 @@
 #include "sw_sync.h"
 
 /**
+ * SUBTEST: dump-writeback
+ * Description: Dump a non-cloned writeback buffer
+ *
+ * SUBTEST: check-valid-clones
+ * Description: Dump all valid clone pairs of writeback and non-writeback
+ *              connectors
+ *
  * SUBTEST: writeback-check-output-XRGB2101010
  * Description: Check XRGB2101010 writeback output with CRC validation
  *
@@ -450,7 +457,7 @@ static void do_single_commit(igt_output_t *output, igt_plane_t *plane, igt_fb_t
 }
 
 static void commit_and_dump_fb(igt_display_t *display, igt_output_t *output, igt_plane_t *plane,
-			        igt_fb_t *input_fb, drmModeModeInfo *mode)
+			       igt_fb_t *input_fb, drmModeModeInfo *mode, char *suffix)
 {
 	cairo_surface_t *fb_surface_out;
 	char filepath_out[PATH_MAX];
@@ -471,7 +478,8 @@ static void commit_and_dump_fb(igt_display_t *display, igt_output_t *output, igt
 	do_single_commit(output, plane, input_fb, &output_fb);
 
 	fb_surface_out = igt_get_cairo_surface(display->drm_fd, &output_fb);
-	snprintf(filepath_out, PATH_MAX, "%s/%s.png", path_name, file_name);
+	snprintf(filepath_out, PATH_MAX, "%s/%s-%s.png", path_name, file_name, suffix);
+
 	status = cairo_surface_write_to_png(fb_surface_out, filepath_out);
 	igt_assert_eq(status, CAIRO_STATUS_SUCCESS);
 	cairo_surface_destroy(fb_surface_out);
@@ -555,6 +563,7 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 	drmModeModeInfo mode;
 	unsigned int fb_id;
 	int ret;
+	char dump_suffix[PATH_MAX];
 
 	memset(&display, 0, sizeof(display));
 
@@ -603,9 +612,93 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 
 		if (data.list_modes)
 			list_writeback_modes(&display);
-		if (data.dump_check)
-			commit_and_dump_fb(&display, output, plane, &input_fb, &mode);
 	}
+
+	/*
+	 * When dump_check is high, the following subtests will be run.
+	 * These tests will be skipped if list_modes flag is high.
+	 */
+	igt_describe("Dump a non-cloned writeback buffer");
+	igt_subtest("dump-writeback") {
+		igt_skip_on(!data.dump_check || data.list_modes);
+		snprintf(dump_suffix, PATH_MAX, "encoder%d", output->id);
+		commit_and_dump_fb(&display, output, plane, &input_fb, &mode, dump_suffix);
+	}
+
+	igt_describe("Dump valid clone pairs of writeback and non-writeback"
+		     " connectors; This test will check the output of each pair"
+		     " if the dump flag isn't set");
+	igt_subtest("check-valid-clones") {
+		igt_output_t *nonwb_output;
+		enum pipe curr_pipe;
+		drmModeModeInfo *nonwb_mode;
+		igt_fb_t clone_fb, output_fb;
+		int num_clones = 0;
+
+		/*
+		 * Drop the dump flag check once calling writeback_sequence() is
+		 * supported
+		 */
+		igt_skip_on(data.list_modes);
+		igt_skip_on_f(!(data.supported_colors & XRGB8888), "DRM_FORMAT_XRGB8888 is unsupported\n");
+		igt_require(fb_id > 0);
+		for_each_output(&display, nonwb_output) {
+			if (nonwb_output->config.connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
+				continue;
+
+			/* Set up non-writeback cloned output */
+			curr_pipe = output->pending_pipe;
+			igt_output_set_pipe(nonwb_output, curr_pipe);
+
+			if (!igt_output_is_valid_clone(display.drm_fd, output, nonwb_output)) {
+				igt_output_set_pipe(nonwb_output, PIPE_NONE);
+				igt_debug("Output %s not a valid clone\n",
+					  nonwb_output->name);
+				igt_output_override_mode(output, &mode);
+				continue;
+			}
+
+			num_clones++;
+
+			nonwb_mode = igt_output_get_mode(nonwb_output);
+			igt_output_override_mode(output, nonwb_mode);
+
+			fb_id = igt_create_fb(display.drm_fd, nonwb_mode->hdisplay,
+				      nonwb_mode->vdisplay,
+				      DRM_FORMAT_XRGB8888,
+				      DRM_FORMAT_MOD_LINEAR,
+				      &clone_fb);
+			igt_assert(fb_id >= 0);
+			fb_id = igt_create_fb(display.drm_fd, nonwb_mode->hdisplay,
+					      nonwb_mode->vdisplay,
+					      DRM_FORMAT_XRGB8888,
+					      DRM_FORMAT_MOD_LINEAR,
+					      &output_fb);
+			igt_assert(fb_id >= 0);
+
+			if (data.dump_check) {
+				snprintf(dump_suffix, PATH_MAX, "encoder%d-encoder%d",
+						output->id, nonwb_output->id);
+				commit_and_dump_fb(&display, output, plane, &clone_fb,
+						nonwb_mode, dump_suffix);
+			} else {
+				igt_fb_t *out_fbs[1] = { &output_fb };
+				writeback_sequence(output, plane, &clone_fb,
+						   out_fbs, 1,
+						   DRM_FORMAT_XRGB8888);
+			}
+
+			igt_output_set_pipe(nonwb_output, PIPE_NONE);
+			igt_output_override_mode(output, &mode);
+			igt_display_commit_atomic(output->display,
+						  DRM_MODE_ATOMIC_ALLOW_MODESET,
+						  NULL);
+			igt_remove_fb(display.drm_fd, &output_fb);
+			igt_remove_fb(display.drm_fd, &clone_fb);
+		}
+		igt_require(num_clones > 0);
+	}
+
 	/*
 	 * When dump_check or list_modes flag is high, then the following subtests will be skipped
 	 * as we do not want to do CRC validation.

-- 
2.48.1

