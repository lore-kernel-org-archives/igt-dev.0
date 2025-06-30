Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC85FC83029
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 18:09:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69ED310E4AD;
	Mon, 30 Jun 2025 18:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnI2gXIU";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F7210E4A8
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:38 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UFB3Se008172
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=j2IrTVpPHGk
 3cmgedXeFGuPk4Zt45xwZrIney2J2rCU=; b=KnI2gXIUmv9NXog4BGOFJqjhovW
 xTTQJz96andPBFSagpXYM3T6QZKhykQG55a8u5rLJKyoZjRUIVz7NrzlarK+fjHr
 4oZHd2kSUZSL94/wzhy1rI6+PygsOORXpmheU3EEca9UsH9zQv7J9PmVTUMbFhC/
 ixgR3jQB81H2fFTSnH7VJ45m2EVsjWz6LhnUThWFwFnqBYpowZjoH7OkhX2X0GNn
 z06tlHWOIboYF8YvfYy8s8W2vsrAjJ55ywroHgco4CSdXPhKM989hKD0dy420RL1
 Y/2v9Qdm7pYFP1YJXAjO3r+7hX0OwIo4iHZnf1C2FfyfzIvcqa8tM2Uc39A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kkfmte16-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:37 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7398d70abbfso7210422b3a.2
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 11:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751306976; x=1751911776;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j2IrTVpPHGk3cmgedXeFGuPk4Zt45xwZrIney2J2rCU=;
 b=aQpLoFfRHfow1FOL05xttKF7CrJ+3BDlO0d4o80Hh8EAcXbd0GUlWWMbPWRsgjhDbK
 q+1iCl+eDJp0g1PFJBsVxx9ps8SDX/dOlK32CZlt8blf1SXIGZMApTe7mudmpRetXI3W
 Y6rD8DSGm3k8KxYd9YHHsOP+M7Jzvsz30xzJ/U2Kx8/ue8nf1xuOj0EA4sWvoNcpT/O5
 Z3nognNyN3+APIe9Y8Vh+pXqGeMx1Yq6bC6T+FJRzhCxSF0mj6n/9/ahvbVP1ruatJt8
 xWCuOSxgUHWTq3s1h0FRJdk4A+TIf2lgmFG0fcxZElvmNwtdDeMuah1shVia27EI+vVI
 MZQQ==
X-Gm-Message-State: AOJu0Yyoyow/Hp8Q8YaGGwIXsvuC8TvreFoyrlDkYV3fTvYswmLWNvtr
 yLSsLrmLgiVWH7WFU375VFJ7VtsnxUjImaUx/TWhbPYTvj65wZZeP1z5Ojr0pBnYUATjmS/JFXp
 76QjFdc8N9LLC9YclY+tIQlXnrhGBrLVFS2mzL0Kv74GonqxBaDOBcyRvtK8yoYD/ko7ZStCcO2
 LX
X-Gm-Gg: ASbGncvG06iCgItIKMqGtzrkJzJLJivCkJQV52khbUQn0uyRDfHezkDBu2cNIHqEusd
 HF8QUQ0GANPMEWSnsm3KSYaRK39AfB6fXZbEjc2ztDo4p3r2qc9VF9YKdrdmgl3RC9mjs1YGz+E
 oRCUIwjvQmMH1TNG6Xd3/inBcVlRxglzQ7rFjqAs5lcIMYVZA69ot1bgT23S+XhhqNUsjUJJ+d9
 YHtlOyfYHqvGvri79F3ZYwAWtHPJZZV/KHn2QQvbXPwNbKVd29Bo+Z14ZRemeOs2q7ECn59H+h1
 tVNCKs0Fv2/BLMGpM+gv5iBTYjqYw7Y1Yg==
X-Received: by 2002:a05:6a00:2e09:b0:748:fcfa:8be2 with SMTP id
 d2e1a72fcca58-74af6e6332cmr17721021b3a.2.1751306975726; 
 Mon, 30 Jun 2025 11:09:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJ3O8y2ECboE6xOGFXRtAZOY7C0DZ9frX12JQWBPnD4Jg6ZmDzwgTEEb4oZkG3IoXABb/yHQ==
X-Received: by 2002:a05:6a00:2e09:b0:748:fcfa:8be2 with SMTP id
 d2e1a72fcca58-74af6e6332cmr17720994b3a.2.1751306975323; 
 Mon, 30 Jun 2025 11:09:35 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af541e64asm9844647b3a.63.2025.06.30.11.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 11:09:35 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH igt 2/9] drm/recovery: add iova-fault-stress test
Date: Mon, 30 Jun 2025 11:08:56 -0700
Message-ID: <20250630180903.77990-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1Vy07KqQJMbCqVqrEhiuXVK0Z297Wrya
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE0NyBTYWx0ZWRfXxAoscEwn2yfe
 VYqSst5fQlKsDomiKnb6lvTumGo6FuIavee+L1GBf8l8plJCUQxAb9ujLATuDF7sjKiswSQYZX2
 Fh2Ck0FuVC1Z+eVCsJL6IaoD56aoihGiulQY/8GL/xeKGdbFiFztk9W+bgLZq+YdcPabLn8ju0C
 wJH9ZFnXF/I350NTPKROsMycbS+6KIb5syMn3EIl3wZFuaB3ZudK+qGCJv5mXwJIjey8Py5n2Vx
 Q58SClATWSxYICnJuOs1o3Ct7GUeNDftxHmZZa/Ajm8Blv6z7w/3yadIYbJI0cnQTQQ4EGDlQKX
 /ciXYIchm3TId4fO8DwazaNaQiF/0TPPyG1E3JXQjj/h+iqGAbz2ozac3AErSbnw1N2zRk7qKPH
 QiTKX/nAs32MINGXUNAtTMQpR/NnLyQFhlUG5emfTIwMZv7QGWzRYu/CtcEs4Q7qMOtdAdby
X-Authority-Analysis: v=2.4 cv=L9sdQ/T8 c=1 sm=1 tr=0 ts=6862d2e1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=636ExQzhtIBJ3iDFxPcA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 1Vy07KqQJMbCqVqrEhiuXVK0Z297Wrya
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300147
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

From: Rob Clark <robdclark@chromium.org>

Add a test which triggers many faults to test robustness.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_recovery.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/tests/msm/msm_recovery.c b/tests/msm/msm_recovery.c
index 433392079bd4..8a83a6f24c41 100644
--- a/tests/msm/msm_recovery.c
+++ b/tests/msm/msm_recovery.c
@@ -195,6 +195,23 @@ do_parallel_test(struct msm_pipe *pipe, int child)
 	igt_msm_cmd_free(cmd);
 }
 
+static void
+do_fault_test(struct msm_pipe *pipe, bool stress)
+{
+	struct msm_cmd *cmd =
+		igt_msm_cmd_new(pipe, 0x10000);
+	unsigned cnt = stress ? 0x10000/16 : 1;
+
+	for (unsigned i = 0; i < cnt; i++) {
+		msm_cmd_pkt7(cmd, CP_MEM_WRITE, 3);
+		msm_cmd_emit(cmd, 0xdeaddead);           /* ADDR_LO */
+		msm_cmd_emit(cmd, 0x1);                  /* ADDR_HI */
+		msm_cmd_emit(cmd, 0x123);                /* VAL */
+	}
+
+	igt_wait_and_close(igt_msm_cmd_submit(cmd));
+}
+
 /*
  * Tests for drm/msm hangcheck, recovery, and fault handling
  */
@@ -242,18 +259,16 @@ igt_main
 
 	igt_describe("Test iova fault handling");
 	igt_subtest("iova-fault") {
-		struct msm_cmd *cmd;
-
 		igt_require(dev->gen >= 6);
 
-		cmd = igt_msm_cmd_new(pipe, 0x1000);
+		do_fault_test(pipe, false);
+	}
 
-		msm_cmd_pkt7(cmd, CP_MEM_WRITE, 3);
-		msm_cmd_emit(cmd, 0xdeaddead);           /* ADDR_LO */
-		msm_cmd_emit(cmd, 0x1);                  /* ADDR_HI */
-		msm_cmd_emit(cmd, 0x123);                /* VAL */
+	igt_describe("Test iova fault handling (stress)");
+	igt_subtest("iova-fault-stress") {
+		igt_require(dev->gen >= 6);
 
-		igt_wait_and_close(igt_msm_cmd_submit(cmd));
+		do_fault_test(pipe, true);
 	}
 
 	igt_fixture {
-- 
2.50.0

