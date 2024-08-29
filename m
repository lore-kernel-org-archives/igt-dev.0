Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15040C77B7A
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 03:06:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA5F10E34B;
	Thu, 29 Aug 2024 03:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="pkU4x1aK";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BCD10E148
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 03:06:00 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJO3uc017448;
 Thu, 29 Aug 2024 03:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JH4JChANyJMrWZxAg0aLJdl8HvpnKFSlQfo5N1+FhUs=; b=pkU4x1aK1yxGRaOj
 OngHPdZ9CLHcbqQDIeRCAAs7+8bL/pv4dCZPyQJvKs5HQPO/gTiu59+ynNrxj2eM
 Ic/NOAwanBZamljVoFW9DHySPfbcjmmo5cI1cgp9nVmi0UCCpunj92Vk6L+NJYzy
 jBGoV5Rxe3TCcVc6GYJgRN23nK7wTFiJf/zlhG6w68BPucWIje4BuWwzRMhPYv49
 rgSuypR6vDHT9dkOByuHcsydQqfdygBQBNraz4x8T8eSMPvXuu97ZgyKYnZKqxhV
 tKkgnuj4Q8khOBqfwHFaiHn+EQmO3TUXBDL/1+ELR24UfcQi9qYuJxTOSGDFvqJq
 zrGrDA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv13qhp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 03:05:52 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47T35p6i002555
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 03:05:51 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 28 Aug 2024 20:05:51 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 28 Aug 2024 20:05:35 -0700
Subject: [PATCH v2 4/5] tests/kms_writeback: Disable all outputs after
 igt_display_require()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240828-igt-cwb-v2-4-7b255c730c55@quicinc.com>
References: <20240828-igt-cwb-v2-0-7b255c730c55@quicinc.com>
In-Reply-To: <20240828-igt-cwb-v2-0-7b255c730c55@quicinc.com>
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: Alex Hung <alex.hung@amd.com>, <quic_abhinavk@quicinc.com>,
 <quic_ebharadw@quicinc.com>, <igt-dev@lists.freedesktop.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724900750; l=1218;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=uoijK1rdXjBnfIow4TYfAVPujlEKtcLVWiUB6zcWIVg=;
 b=TR2Dejuy7S3GmNwqIderjuoBkpULiNVbuUyMpYaXoqc5TUJnWf+WYSQggIQR0I5e1xDL568NS
 ygeYaoCFVpTD67t0uUdkms/GMBVfdFuexa1Ram20hptXjl9k52iSWHA
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ZNUO3u8s0CoFnTKiowQCnUJlHRqxmM0v
X-Proofpoint-ORIG-GUID: ZNUO3u8s0CoFnTKiowQCnUJlHRqxmM0v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290022
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

In cases where the custom mode set by the `-c` flag is the same as the
primary display mode, a modeset will not occur in the driver despite the
outputs being changed.

Since the writeback connector is stealing the primary display without
changing the display mode, the CRTC would only register that the
connectors have changed and not that the mode is changed. This would
cause the encoder mode set to be skipped [1].

Force a modeset to happen by disabling all outputs after
igt_display_require().

[1] https://elixir.bootlin.com/linux/v6.10.6/source/drivers/gpu/drm/drm_atomic_helper.c#L1379

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 tests/kms_writeback.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 4155961a0..97abb88fe 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -571,6 +571,7 @@ igt_main_args("b:c:f:dl", long_options, help_str, opt_handler, NULL)
 		igt_require_f(!ret, "error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
 
 		igt_display_require(&display, display.drm_fd);
+		igt_modeset_disable_all_outputs(&display);
 
 		igt_require(display.is_atomic);
 

-- 
2.34.1

