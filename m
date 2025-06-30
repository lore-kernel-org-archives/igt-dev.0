Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A81C8302D
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 18:09:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9384110E4B6;
	Mon, 30 Jun 2025 18:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oDC+4khs";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9E010E4B3
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:42 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UG4JmM000314
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=IJiSwEtwyhG
 HJ8M0kjstv8lfE+Iqb2Bj/fqH+PX+6CY=; b=oDC+4khsKjw4F7pN8vKdhaZTVBr
 kO+z1hPQkTTgpmHrBsobY4kPL2HB70BfPVGBkpwPjnAenmfQyzr64xdG520wCjP5
 KL8FaqkCg2u8O2s3a8sDF8gfVmWKSmlQCXYIC/sjQY7u9H5b4RW3MirKm3mXIQsG
 r35uM8NWEE1pUavChNGDO7dwyRxn34zp3ob4eTbW5kwHodWL8oHTc2Q7FnfgFLhU
 AcbMVNJngwNlCc+Nh0YAfrZ3dY8scU6LQRhbB84/2BSiSwzbFS8E7Es7Y+SAkGqU
 RmvaGimQJ1zBQJgZeH9xFamHaGRFJhEZDkmQ7cq04ZFJTtZsXoRfqiEG88Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm5rap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-31220ecc586so4250586a91.2
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 11:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751306980; x=1751911780;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IJiSwEtwyhGHJ8M0kjstv8lfE+Iqb2Bj/fqH+PX+6CY=;
 b=bUdP0ZnhKe0n6SbqUVVSYA7jU/TfZPjAxODzNOOUnCF4+LZ1EyWRlxgxnfVHh6Y4ww
 SNwqmHxbtp1ILcX7HWYRBu9mlVlyjcA6UzEizySwQZzLLC0ljksySIf6RyBcQ1TbGfto
 4O6otZfF/4ZWn6T4TVmxKeH5xzx6uNUf8ne4VyWcNqweUQNEixFlCOg0gr0GL+VDEcbt
 MOMLJ0dpvDpMsN8ETHJIDCIUi+81LyLoDF8ww7r46zdkc8Gox5HMpLoxAEqx+L58bkwt
 HBbMf1JkIOiO9RNOI03wxz946UC6uccla5h38Uwjcr1di/F1hdXk7XV/QeeoQRhFsalv
 UdYg==
X-Gm-Message-State: AOJu0YwXa+Kr8HKGT5ddSTdtGO98Ei/g2isCOzdC62fQBGm2H5vCLed0
 EB8NIxI/K8wvHFW2ukcfA+Jv5ig9NwM1COqL8shBd2LIkmMWMxY9eQzkvy5rv/ZzmCeACa24PJP
 CM8qOGzenyTp0knJYaVOhHak//Ex229OkbfWcqjxzlBXm/U2HGa25RSGq91Cm3j/Rwc4D/HNs1q
 DL
X-Gm-Gg: ASbGncsZoXfF6I9VLormDbeKv9mtynygTZNJPNtNYEQI7WUfTlu25z1sv6jmxd9fvRR
 EhUcjPZFn3RLIRFDEXNSLzWc4XRwzdEV9Hkt5MHPbkn240Wbsm8H8C/2ZWmytKNGQ1xhfL/mrLu
 /YbAI9z0RYy7A7F7bYplTWsQD5Me036FAq6JuqZcJh6YSh7kVCa70pqU1frjbPa874hzhYKW9oA
 djRI65eWxC2+tdVKb/WitmpnA4ZK45lrOYs4xL/ZIYIq+xk1NBWrX5UvdcVYkGNSRt6eWuoTrbN
 ux+imbsI8u+sRAip7NmgmR4fFSgdMIVHUQ==
X-Received: by 2002:a17:90b:2e04:b0:315:aa28:9501 with SMTP id
 98e67ed59e1d1-318c92fc24dmr22258533a91.24.1751306980194; 
 Mon, 30 Jun 2025 11:09:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtiTNscH74VIL8AiO98nrken82aK/te3q39Fjh+6FmeGfvmFe0oZZxxX0DMuutqqN00TSBpg==
X-Received: by 2002:a17:90b:2e04:b0:315:aa28:9501 with SMTP id
 98e67ed59e1d1-318c92fc24dmr22258492a91.24.1751306979692; 
 Mon, 30 Jun 2025 11:09:39 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f5437e97sm13461953a91.40.2025.06.30.11.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 11:09:39 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH igt 6/9] msm/mapping: Wait for devcore to become available
Date: Mon, 30 Jun 2025 11:09:00 -0700
Message-ID: <20250630180903.77990-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6862d2e5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=wbXP5UgKaa9MPXhy6qkA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: zdXJgtGguEMz_Et5FZt9CJU0ZuUVg6k_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE0NiBTYWx0ZWRfX19L3/zJmijML
 H9NhwFAJIZicJTeDYbr6kT1TsLLYn47GanUZ+auBKy7nGAZmQArU9aPPudmE4UBGtHWux3bpLEy
 2OZ0B0eH0c7foZAQEqFpTRq04z91EfWiYhgHr0eq9aGIJMczO18jAi2MjWTvburpmtbV5PLwJAx
 zLlzhg3vrn8qV+knzeQAIXfjDHMBKlpbFYxrCr6Vue/v0whaN8isyO/9u3Ks6s9Uvgf7dOaLRme
 MpMUAJyKCgsXr6qbOSLkimuf3Xdamh6YOv2ufceDHx0LLCeUMQeQucCcg91oJsjml2+ebDtl6m8
 fukz4RwK8eqiZwxdBv3UvNHrWxEyWSlX6NDzNexKhzEmf6T12A49R71h+Of9TmTsiijz7cxtFXK
 M6y4dPCBMZy+UZVoEXgpmyi4vwGkz6dnDoy8jkdjzvsTyucMmvH3RJGoz0HA4/OiMPH0SSVz
X-Proofpoint-GUID: zdXJgtGguEMz_Et5FZt9CJU0ZuUVg6k_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300146
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

From: Rob Clark <rob.clark@oss.qualcomm.com>

The devcore could take some time to show up, so add a igt_wait() with
timeout so we don't fail the test if the devcore is not immediately
available.

This addresses a source of flakeyness.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_mapping.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index 846385bb5206..03a9e814c931 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -42,14 +42,18 @@
  */
 
 static char *
-get_and_clear_devcore(void)
+get_and_clear_devcore(int timeout_ms)
 {
 	glob_t glob_buf = {0};
 	char *buf = NULL;
-	int ret, fd;
+	int fd;
 
-	ret = glob("/sys/class/devcoredump/devcd*/data", GLOB_NOSORT, NULL, &glob_buf);
-	if ((ret == GLOB_NOMATCH) || !glob_buf.gl_pathc)
+	/* The devcore shows up asynchronously, so it might not be
+	 * immediately available:
+	 */
+	if (!igt_wait(glob("/sys/class/devcoredump/devcd*/data",
+			   GLOB_NOSORT, NULL, &glob_buf) != GLOB_NOMATCH,
+		      timeout_ms, 100))
 		return NULL;
 
 	fd = open(glob_buf.gl_pathv[0], O_RDWR);
@@ -175,7 +179,7 @@ do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
 	int fence_fd, ret;
 
 	/* Clear any existing devcore's: */
-	while ((devcore = get_and_clear_devcore())) {
+	while ((devcore = get_and_clear_devcore(0))) {
 		free(devcore);
 	}
 
@@ -208,7 +212,7 @@ do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
 	/* And now we should have gotten a devcore from the iova fault
 	 * triggered by the read or write:
 	 */
-	devcore = get_and_clear_devcore();
+	devcore = get_and_clear_devcore(1000);
 	igt_fail_on(!devcore);
 
 	/* Make sure the devcore is from iova fault: */
-- 
2.50.0

