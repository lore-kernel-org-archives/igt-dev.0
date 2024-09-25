Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AE9CCF9F0
	for <igt-dev@archiver.kernel.org>; Wed, 25 Sep 2024 20:37:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A983610E71F;
	Wed, 25 Sep 2024 20:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="QROA7x/e";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6C210E879
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Sep 2024 20:37:55 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48PH5LW1021482;
 Wed, 25 Sep 2024 20:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +f7mEk1JhhMqMtEXty3lEBxyYVmNEbghue3WsxNPgzk=; b=QROA7x/eu32FG7Y4
 sE451TU3vyk/jOJKrPza3uSNbwGBovCo46DBuVYCiXYhtbnUnFxm2EoqSBKW2ZSE
 cQF68+9qzvWNurxUPRF4xsQhIjFwXzGDVwNKRZPP3Z0QLEv0fg9iz2X8WcA6M7NT
 oMvQ8zAbAYq/vC5ln9OcAFG6w+90ev4OXF9HiZdUBkA6SZtgCVOdptLn5otiZnAb
 3yn3DASPRrmrACe6LUjr9gPfsQwEvgCzAfEOOe6jwjsOH5ztBdsAQj/A6xPIoDvX
 xWPoYMj8rLV+UYvaouXtkNtRJdmQUJ2HSJBYSqVdehtPx9HkhT+iTValv6j3wN6G
 l63pFA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqakn0jm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Sep 2024 20:37:45 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48PKbiL6021654
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Sep 2024 20:37:44 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Sep 2024 13:37:44 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 25 Sep 2024 13:37:18 -0700
Subject: [PATCH i-g-t v4 1/4] tests/kms_writeback: clear writeback
 properties in teardown path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240925-igt-cwb-v4-1-e516cd1e888e@quicinc.com>
References: <20240925-igt-cwb-v4-0-e516cd1e888e@quicinc.com>
In-Reply-To: <20240925-igt-cwb-v4-0-e516cd1e888e@quicinc.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: Alex Hung <alex.hung@amd.com>, <quic_abhinavk@quicinc.com>,
 <igt-dev@lists.freedesktop.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727296663; l=2165;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=qZxzhsuAr51GRgnjPNHFZTvVkVkf51y6Z8QJL+qzWO4=;
 b=lI+7xLDMZw6sW5kfKzAn+DzdD9rq2Mql3WqO74pQTG0a19oliIhVaIr+iXaDQ8I3hM8GsleRj
 ZwawYFAYuE3DvGJbYW5rUek4VkbwS/xrPVkDk1CRYxHAUEjrmUzjgfU
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: J_qmwU3RKODD1dgtgY5gxt3GiFyHMpTh
X-Proofpoint-GUID: J_qmwU3RKODD1dgtgY5gxt3GiFyHMpTh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 mlxlogscore=867
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250146
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

