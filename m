Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3870AC02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 23:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB70E10ED46;
	Fri, 14 Feb 2025 23:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="WbffGm37";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722CB10ED46
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 23:59:35 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51EHJBqg008278;
 Fri, 14 Feb 2025 23:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Yw+2x2hEglgGYEViLHt288
 VjsvqIL4O054ojPTcAXnY=; b=WbffGm37/qGpj9K9reayQ/6jyXXI9wslQqEFTx
 nOT9feYDkrvVkicI//RCJ5nbUSd8twoqDiQM2X4iG37+UiyNXW9RhanUoxCNavyD
 eMpadCZGz9fsEN/p3QfEMjibGienQhrFuszT7kW3OHZD9qAewCZBTiQv2NdLINIe
 D/CtSZJQeFz5i6gbkLaFPkO8NfQkReQ/fSdbxDGyQqGCk22NE4FbEPj/Awu0J4yl
 BHuHP1V3RfgM1Nkk5XgFNkRLMD/bYFDu3kha7djdWrZLXq8c7Ec2+ajB4gt+qMVp
 GnrRY/idZXwQKMacnRLLG79kumJNQ3/EBebRaELckOYFKzLg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qewhfhu6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2025 23:59:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51ENxOgK005875
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2025 23:59:24 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 14 Feb 2025 15:59:24 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 14 Feb 2025 15:59:01 -0800
Subject: [PATCH i-g-t v2] tests/kms_color: Disable CTM at the end of CTM tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250214-disable-cwb-v2-1-d01f7a100748@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAMTYr2cC/22NwQ6CMBBEf4Xs2TW0WEBP/ofhUJYtbKIUW0QN4
 d9tOHt8M5k3K0QOwhEu2QqBF4nixwT6kAENduwZpUsMOtcm1+qEnUTb3hnp3WKlO6tqQ7agEtJ
 iCuzks9tuINjjDE2KB4mzD9/9Y1F7+Ve3KFRYGudMVbM718X1+RKSkY7kH9Bs2/YD7v1kTa8AA
 AA=
X-Change-ID: 20250214-disable-cwb-72da185ca3c6
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <quic_abhinavk@quicinc.com>, <igt-dev@lists.freedesktop.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-f0f05
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739577564; l=1275;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=/c1m+8ZGvaJg1csLQ6WCAvHMdczVqbrlOsL2Or4Az/w=;
 b=oQuEidY+g+svaqTEQEc2g+o1e5AmesVt0VYo8yTo+krdWAuW43batoX/H90nrkBeMc+rb+6ou
 gZ7HxcdCV72DFt1V19RJQLXM+jpAocj0ldEw5k5A+AQUJljT2xmDKpP
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: cyxQl3R6TTqwGPBjjKN3Z77-Q7H9-y4B
X-Proofpoint-GUID: cyxQl3R6TTqwGPBjjKN3Z77-Q7H9-y4B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_10,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=883 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502140166
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

Currently, test_pipe_ctm() enables CTM on the primary pipe but doesn't
disable CTM after it finishes running the tests.

This can cause resource-availability issues in drivers where CTM-related
hardware resources are shared between pipes.

To avoid this, explicitly disable CTM on the primary pipe at the end of
test_pipe_ctm()

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
Changes in v2:
- Add igt-dev to email list
- Link to v1: https://lore.kernel.org/r/20250214-disable-cwb-v1-1-65ff578ef983@quicinc.com
---
 tests/kms_color.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 4b71d3dd3..83e64229f 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -599,6 +599,7 @@ static bool test_pipe_ctm(data_t *data,
 	 */
 	ret &= igt_skip_crc_compare || igt_check_crc_equal(&crc_software, &crc_hardware);
 
+	disable_ctm(primary->pipe);
 	igt_plane_set_fb(primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit(&data->display);

---
base-commit: 7187a77fa2c4f1e0ea355cbc719dcd1f270148a8
change-id: 20250214-disable-cwb-72da185ca3c6

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

