Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2452C02193
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 03:31:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC1510E73E;
	Wed, 29 Jan 2025 03:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="VKD1LX6a";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF58410E73E
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 03:31:16 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T2gtgo023518;
 Wed, 29 Jan 2025 03:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8y63/bgjTthdaSB66Qtd7mt4Ysl/LQXyxcx8YHFH9QU=; b=VKD1LX6aEBbvFcpJ
 lFuQEtRt0yT+vCNX5Zmko74nAlOMTvrtdDmell1z+vkeNOdKbfA3SM9fC9C+Pozj
 /v/lEtLcvqpaudUKQh8G4JcWJcK+GlCT+Jz6Ue80QM/REkoWFSRdMo2aVdHZVqjc
 Q9MrYZZ5KnI5t+EvfiqicJEbh0n5BSMZtxNSBSdWn81rheOdtzs3rQYAfCH9IXkM
 sRYzJmhn8rTZfLzsrkk4E/JcooxQxwCq7Fu568dt4wRee4ldWhBe6TyEaeuD3Wi0
 NqqpQRETSabXgZaEJ5YfmwEgpJad+ryUuE61/ZvjBrkMBHtIwUxOVlxg3SOkoCGJ
 RKlrKg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44eygu9rx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2025 03:31:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50T3V40w006804
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2025 03:31:04 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 Jan 2025 19:31:04 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 28 Jan 2025 19:29:48 -0800
Subject: [PATCH i-g-t v5 2/3] lib/igt_kms: loosen duplicate check in
 igt_display_refresh
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250128-igt-cwb-v5-2-82652cec29a3@quicinc.com>
References: <20250128-igt-cwb-v5-0-82652cec29a3@quicinc.com>
In-Reply-To: <20250128-igt-cwb-v5-0-82652cec29a3@quicinc.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <quic_abhinavk@quicinc.com>, <igt-dev@lists.freedesktop.org>, Alex Hung
 <alex.hung@amd.com>, Esha Bharadwaj <quic_ebharadw@quicinc.com>, "Jessica
 Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738121463; l=3343;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=v/CSgPuBd8VNSvjmyt1N0t2eAtG7buNgNPLYGwL1PNg=;
 b=i2ZGl9Kn+dvX75hxnWoul2uULn3J49FV3LkHSLhsr9Xqf1BBCQBSF54HOCgm2Tv0e+ThkyGfA
 kgx2+MUMacuBvCOcyFMPITdLeVoQPb7tp6PdI4CJN9OdlvGtg13T/p6
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: SpcUQ5SxqwH8Do_NVsnHkgTH7HOMx-dd
X-Proofpoint-ORIG-GUID: SpcUQ5SxqwH8Do_NVsnHkgTH7HOMx-dd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=913 impostorscore=0 clxscore=1011 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501290026
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

Change the duplicate check in igt_display_refresh() so it allows for
pipes to be shared by encoders that are valid clones of each other.

Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 lib/igt_kms.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++---
 lib/igt_kms.h |  1 +
 2 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 4b14c94e226a9a103bc3a3bc26099566a6eb274b..5471f906a98f62aec285bf50d9c48f2ec6c1009e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3339,6 +3339,48 @@ int kmstest_get_encoder_idx(drmModeRes *resources, drmModeEncoder *encoder)
 	igt_assert(0);
 }
 
+bool igt_output_is_valid_clone(int drm_fd, igt_output_t *target, igt_output_t *clone)
+{
+	drmModeEncoder *target_enc;
+	drmModeEncoder *clone_enc;
+	drmModeRes *resources = drmModeGetResources(drm_fd);
+	uint32_t clone_mask;
+
+	if (!target || !clone)
+		return false;
+
+	target_enc = target->config.encoder;
+	clone_enc = clone->config.encoder;
+
+	if (!target_enc || !clone_enc)
+		return false;
+
+	clone_mask = 1 << kmstest_get_encoder_idx(resources, clone_enc);
+
+	return ((target_enc->possible_clones & clone_mask) == clone_mask);
+}
+
+static bool igt_output_has_duplicates(igt_display_t *display, igt_output_t *output,
+				      unsigned long pipes_in_use, int start_idx)
+{
+	igt_output_t *clone_output;
+
+	for (int j = start_idx + 1; j < display->n_outputs; j++) {
+		clone_output = &display->outputs[j];
+
+		/*
+		 * Check that any encoders with duplicated pipes
+		 * are possible clones of each other. If they
+		 * aren't, report the pipe as duplicated
+		 */
+		if ((pipes_in_use & (1 << output->pending_pipe)) &&
+		    !igt_output_is_valid_clone(display->drm_fd, output, clone_output))
+			return true;
+	}
+
+	return false;
+}
+
 static void igt_display_refresh(igt_display_t *display)
 {
 	igt_output_t *output;
@@ -3346,13 +3388,14 @@ static void igt_display_refresh(igt_display_t *display)
 
 	unsigned long pipes_in_use = 0;
 
-       /* Check that two outputs aren't trying to use the same pipe */
+	/* Check that two non-clone outputs aren't trying to use the same pipe */
 	for (i = 0; i < display->n_outputs; i++) {
 		output = &display->outputs[i];
 
 		if (output->pending_pipe != PIPE_NONE) {
-			if (pipes_in_use & (1 << output->pending_pipe))
-				goto report_dup;
+			if (igt_output_has_duplicates(display, output,
+						      pipes_in_use, i))
+					goto report_dup;
 
 			pipes_in_use |= 1 << output->pending_pipe;
 		}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index e4f7b6c62fd536aa4ea3eb3153d8e1935cf560fd..932e5818364ca74cb86b1ba58c5f3ede0b8abf18 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -554,6 +554,7 @@ igt_plane_t *igt_output_get_plane_type_index(igt_output_t *output,
 					     int plane_type, int index);
 igt_output_t *igt_output_from_connector(igt_display_t *display,
     drmModeConnector *connector);
+bool igt_output_is_valid_clone(int drm_fd, igt_output_t *target, igt_output_t *clone);
 void igt_output_refresh(igt_output_t *output);
 drmModeModeInfo *igt_std_1024_mode_get(int vrefresh);
 void igt_output_set_writeback_fb(igt_output_t *output, struct igt_fb *fb);

-- 
2.34.1

