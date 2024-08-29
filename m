Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6D7C7115E
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 02:59:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CCC10E314;
	Thu, 29 Aug 2024 02:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="FRSp++mH";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D261010E326
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 02:59:19 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJMBLe020257;
 Thu, 29 Aug 2024 02:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +f7mEk1JhhMqMtEXty3lEBxyYVmNEbghue3WsxNPgzk=; b=FRSp++mHAZwoNj+l
 yCrvcq7se5HgqfzpX95+SWONWOIasrsPfaLI6Tw5fxnRa5S5Rm8CjYnUPU29/7KY
 5xQTn4U/pZitLEj4KWJiU9X3cHW0ooyJ+YivQ8AvpLeuDe5DfY7C4M2bVqKUukTz
 LxwmVWOxUxkhCpRiEB309QxjBhmIp2wUanb32oHQ67NUqJe65muqVwLi1pFADOGg
 d3yuiqqzDL+M1L2ok88cUeO7RRYX6Cfn7eoQ3JOOBncGqvenGh8PcbBU00UipEXA
 J6mxP2uv8Rfe3avGXEVMUBB/i7WaJy8L+6H04UciEfZS//8x1FV6JC6fOTkjtiJz
 Z8Y4fQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419q2xuqb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 02:59:09 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47T2x8Pv017330
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 02:59:08 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 28 Aug 2024 19:59:08 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 28 Aug 2024 19:58:47 -0700
Subject: [PATCH 1/5] tests/kms_writeback: clear writeback properties in
 teardown path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240828-igt-cwb-v1-1-48aee421fc97@quicinc.com>
References: <20240828-igt-cwb-v1-0-48aee421fc97@quicinc.com>
In-Reply-To: <20240828-igt-cwb-v1-0-48aee421fc97@quicinc.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: Alex Hung <alex.hung@amd.com>, <quic_abhinavk@quicinc.com>,
 <quic_ebharadw@quicinc.com>, <igt-dev@lists.freedesktop.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724900347; l=2165;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=qZxzhsuAr51GRgnjPNHFZTvVkVkf51y6Z8QJL+qzWO4=;
 b=jSCwpYppX3z+OblSXRBT98/2305QwW3ibELNoBJaF323cOW0+4A2J5n+sTckHlY0pAhQGbImt
 MUaaEQoeoE+D9zszgzOa2w/G6W7hroBCsZ9hMi/GzkGl9jlWTs8ViBM
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: TNSdByPTa2f2iaC9aUAGIQPerDWm4otX
X-Proofpoint-GUID: TNSdByPTa2f2iaC9aUAGIQPerDWm4otX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 mlxlogscore=864 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290021
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

Drop the WRITEBACK_FB_ID property check and refactor detach_crtc() so
that it properly clears all writeback-related properties before calling
a NULL commit.

The current WRITEBACK_FB_ID check in detach_crtc() will always return 0
due to the return value being hardcoded to 0 in the framework [1].
Because of this, detach_crtc() will never call the NULL commit to clean
up the atomic state.

Since the NULL commit is failing for cases where the WRITEBACK_FB_ID and
OUT_FENCE_PTR haven't been cleared by a non-NULL commit, let's
explicitly clear these properties before calling the NULL commit.

[1] https://elixir.bootlin.com/linux/v6.10.6/source/drivers/gpu/drm/drm_atomic_uapi.c#L853

Fixes: 7c3ceb08b ("tests/kms_writeback: Add helper method to detach pipe from output when test finishes")
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 tests/kms_writeback.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index e1d31bb93..4155961a0 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -213,15 +213,11 @@ static igt_output_t *kms_writeback_get_output(igt_display_t *display)
 	return NULL;
 }
 
-static uint64_t get_writeback_fb_id(igt_output_t *output)
+static void cleanup_writeback(igt_display_t *display, igt_output_t *output)
 {
-	return igt_output_get_prop(output, IGT_CONNECTOR_WRITEBACK_FB_ID);
-}
-
-static void detach_crtc(igt_display_t *display, igt_output_t *output)
-{
-	if (get_writeback_fb_id(output) == 0)
-		return;
+	igt_output_set_prop_value(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR,
+			to_user_pointer(NULL));
+	igt_output_set_writeback_fb(output, NULL);
 
 	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit2(display, COMMIT_ATOMIC);
@@ -726,7 +722,7 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 	}
 
 	igt_fixture {
-		detach_crtc(&display, output);
+		cleanup_writeback(&display, output);
 		igt_remove_fb(display.drm_fd, &input_fb);
 		igt_remove_fb(display.drm_fd, &input_fb_10bit);
 		igt_display_fini(&display);

-- 
2.34.1

