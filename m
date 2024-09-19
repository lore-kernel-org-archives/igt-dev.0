Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5BDCF3962
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 17:27:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9FC10E732;
	Thu, 19 Sep 2024 17:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Lppcu1lW";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258F710E732
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 17:27:18 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48J9ECqm007564;
 Thu, 19 Sep 2024 17:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 O8Uk+6yt80kPlW6EuObedcNVz2u7BGKBDLc/NmDYVlk=; b=Lppcu1lWxaD8QUgd
 8fNriqDDHFuuK7hfy0EN4lW6WfvgYfE75jtlAKD7hxm4KC1r7ZjlK9jfY5X1Ptwl
 eh9j5YOPjda2aaLEmIqt/q65cvO4gZRQWzb2XqhQkhgSiAhsEt9ByjrTxZrr+yVz
 zW27d7kdYpDVxlG9jp1lNUpIsOEHQq7uZCfQW7brXcRK4Q3ipeUXlp7Rnyl7MxP1
 ARNxC61b1M2xN1FtqIyqwPdPt9nsROogYxBhcxllJYHTjkk1SxijyU1+UqwFPf4O
 uZAxL8Wlezxf0gUfve2PPoXfqG0aunKUQeobQ0gndEy3SkdpMJQhk3zhygu9Gg15
 B2kZpA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4gnx7hr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2024 17:27:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48JHR5eZ004152
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2024 17:27:05 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Sep 2024 10:27:04 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Thu, 19 Sep 2024 10:26:52 -0700
Subject: [PATCH i-g-t v3 3/3] tests/kms_writeback: Add dump for valid clone
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240919-igt-cwb-v3-3-2bb3161f1f96@quicinc.com>
References: <20240919-igt-cwb-v3-0-2bb3161f1f96@quicinc.com>
In-Reply-To: <20240919-igt-cwb-v3-0-2bb3161f1f96@quicinc.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: Alex Hung <alex.hung@amd.com>, <quic_abhinavk@quicinc.com>,
 <quic_ebharadw@quicinc.com>, <igt-dev@lists.freedesktop.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726766824; l=4961;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=APewaLmUc71Lw9srS42PTTAUz5qordOGhWd0d520ny4=;
 b=MgjPEdTxHoieXJxQCgahwVBL16ooINDlrtH0eT0/roGTGOeXTNThjY2iPqz0mY8nE3mtw+yUL
 65cBOzOSKRlCAGUxbOhOPx430knkmsvKl+ArsRjbRKYdiCIDvh534oE
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Qh3uODR-XJDYb0EvZtLz1jUH-0EUtkOJ
X-Proofpoint-ORIG-GUID: Qh3uODR-XJDYb0EvZtLz1jUH-0EUtkOJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=938 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409190116
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

Move the regular writeback dump into its own subtest and add a subtest to
dump pairs of cloned non-writeback and writeback encoders

Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 tests/kms_writeback.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 79 insertions(+), 4 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 4155961a0..3719b50c8 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -47,6 +47,13 @@
 #include "sw_sync.h"
 
 /**
+ * SUBTEST: dump-writeback
+ * Description: Dump a non-cloned writeback buffer
+ *
+ * SUBTEST: dump-valid-clones
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
 
@@ -603,9 +612,75 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 
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
+	igt_describe("Dump valid clone pairs of writeback and non-writeback connectors");
+	igt_subtest("dump-valid-clones") {
+		igt_output_t *nonwb_output;
+		enum pipe curr_pipe;
+		drmModeModeInfo *nonwb_mode;
+		igt_fb_t clone_fb;
+
+		/*
+		 * Drop the dump flag check once calling writeback_sequence() is
+		 * supported
+		 */
+		igt_skip_on(!data.dump_check || data.list_modes);
+		igt_skip_on_f(!(data.supported_colors & XRGB8888), "DRM_FORMAT_XRGB8888 is unsupported\n");
+		igt_require(fb_id > 0);
+		for_each_output(&display, nonwb_output) {
+			if ((nonwb_output->config.connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
+					|| igt_output_clone_valid(display.drm_fd, output, nonwb_output))
+				continue;
+
+			/* Set up non-writeback cloned output */
+			curr_pipe = output->pending_pipe;
+			nonwb_mode = igt_output_get_mode(nonwb_output);
+
+			igt_output_set_pipe(nonwb_output, curr_pipe);
+			igt_output_override_mode(output, nonwb_mode);
+
+			fb_id = igt_create_fb(display.drm_fd, nonwb_mode->hdisplay,
+				      nonwb_mode->vdisplay,
+				      DRM_FORMAT_XRGB8888,
+				      DRM_FORMAT_MOD_LINEAR,
+				      &clone_fb);
+			igt_assert(fb_id >= 0);
+
+			/*
+			 * Currently, only dump the resulting frame. This is
+			 * because the igt_fb_get_fnv1a_crc() is unable to
+			 * calculate CRCs for non-32 bit aligned resolutions.
+			 *
+			 * Once there is a workaround for this issue, this can
+			 * be changed to:
+			 *    if (dump_check flag set)
+			 *        commit_and_dump_fb()
+			 *    else
+			 *        writeback_sequence()
+			 */
+			snprintf(dump_suffix, PATH_MAX, "encoder%d-encoder%d",
+					output->id, nonwb_output->id);
+			commit_and_dump_fb(&display, output, plane, &clone_fb,
+					nonwb_mode, dump_suffix);
+			igt_output_set_pipe(nonwb_output, PIPE_NONE);
+			igt_remove_fb(display.drm_fd, &clone_fb);
+		}
+
+		igt_output_override_mode(output, NULL);
+	}
+
 	/*
 	 * When dump_check or list_modes flag is high, then the following subtests will be skipped
 	 * as we do not want to do CRC validation.

-- 
2.34.1

