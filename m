Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455CCC7115D
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 02:59:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0181B10E328;
	Thu, 29 Aug 2024 02:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="LzHu/2XO";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D665110E328
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 02:59:19 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJM6SN032541;
 Thu, 29 Aug 2024 02:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cK0vF4icw0iY57ckrBT2i7qFbYMzo6H7M0FaxcEn6Sw=; b=LzHu/2XOU45UWnLh
 6QqqDjmghWbE3WA42WmVy/eQykjG+r4h0e4BUG8jnnMD0naxB6p86aQH/e9umD5y
 onTye/AjNkY4Azs4g7Mim9uFYWo9XmdAy42b+NP03HZX4OxUFgYFzG1i2h4KLStB
 enmEHuFuWrkGeJeVHQKNdAgq3MFGuMxRA/bC9vm3jtGw5nYWTkRWgv6zDRuHSHxD
 YhcYroa7oGHxd0MbVZzMjmmjtpmkKmYFn0usJ8x53Iq/90NEtczE28/zMcbHFcOr
 IzMIYNnDxw5Q36FiVi/oljFUwFBaeF1wOfQGv4FYbDiD5KrpXAoQZHdHRVAfVGHw
 WuTJLg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puw3ry8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 02:59:10 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47T2x9ba017338
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 02:59:09 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 28 Aug 2024 19:59:08 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 28 Aug 2024 19:58:49 -0700
Subject: [PATCH 3/5] lib/igt_kms: loosen duplicate check in igt_display_refresh
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240828-igt-cwb-v1-3-48aee421fc97@quicinc.com>
References: <20240828-igt-cwb-v1-0-48aee421fc97@quicinc.com>
In-Reply-To: <20240828-igt-cwb-v1-0-48aee421fc97@quicinc.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: Alex Hung <alex.hung@amd.com>, <quic_abhinavk@quicinc.com>,
 <quic_ebharadw@quicinc.com>, <igt-dev@lists.freedesktop.org>, Jessica Zhang
 <jesszhan@quicinc.com>, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724900347; l=2829;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=VbQJsYe4omvCR+4OzgBiF195c5zDEksdUQ6uJUc1i5Y=;
 b=On0qhk9+D3agUsQAhSgIMRmCru+3ddN8IkiJ3mTQfVZg+8SB66ST/274XZJlPgPdsqBO6YJ6l
 ZXzaIMEBAAoDInIsknEvdqM/TFWk/N0Rm3C7nxSPJT/92vIOPYw1kcv
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: tJ2Vq-mlIDxJKAXzab822nLLKDd1aXrJ
X-Proofpoint-GUID: tJ2Vq-mlIDxJKAXzab822nLLKDd1aXrJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=984 suspectscore=0
 adultscore=0 spamscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408290021
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

From: Jessica Zhang <jesszhan@quicinc.com>

Change the duplicate check in igt_display_refresh() so it allows for
pipes to be shared by encoders that are valid clones of each other.

Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 lib/igt_kms.c | 42 +++++++++++++++++++++++++++++++++---------
 lib/igt_kms.h |  1 +
 2 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index fec8860d0..e28ec2836 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3286,22 +3286,46 @@ int kmstest_get_encoder_idx(drmModeRes *resources, drmModeEncoder *encoder)
 	igt_assert(0);
 }
 
-static void igt_display_refresh(igt_display_t *display)
+bool igt_output_clone_valid(int drm_fd, igt_output_t *target, igt_output_t *clone)
 {
-	igt_output_t *output;
-	int i;
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
 
-	unsigned long pipes_in_use = 0;
+	return ((target_enc->possible_clones & clone_mask) != clone_mask);
+}
+
+static void igt_display_refresh(igt_display_t *display)
+{
+	igt_output_t *output, *clone_output;
+	int i, j;
 
-       /* Check that two outputs aren't trying to use the same pipe */
 	for (i = 0; i < display->n_outputs; i++) {
 		output = &display->outputs[i];
 
-		if (output->pending_pipe != PIPE_NONE) {
-			if (pipes_in_use & (1 << output->pending_pipe))
-				goto report_dup;
+		for (j = i + 1; j < display->n_outputs; j++) {
+			clone_output = &display->outputs[j];
 
-			pipes_in_use |= 1 << output->pending_pipe;
+			/*
+			 * Check that any encoders with duplicated pipes are
+			 * possible clones of each other. If they aren't, report
+			 * the pipe as duplicated
+			 */
+			if (!igt_output_clone_valid(display->drm_fd,
+						output, clone_output))
+				goto report_dup;
 		}
 
 		if (output->force_reprobe)
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 72fe3b3b1..2d272f1fa 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -525,6 +525,7 @@ igt_plane_t *igt_output_get_plane_type_index(igt_output_t *output,
 					     int plane_type, int index);
 igt_output_t *igt_output_from_connector(igt_display_t *display,
     drmModeConnector *connector);
+bool igt_output_clone_valid(int drm_fd, igt_output_t *target, igt_output_t *clone);
 void igt_output_refresh(igt_output_t *output);
 drmModeModeInfo *igt_std_1024_mode_get(int vrefresh);
 void igt_output_set_writeback_fb(igt_output_t *output, struct igt_fb *fb);

-- 
2.34.1

