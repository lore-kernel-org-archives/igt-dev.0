Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF4FC83029
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 18:09:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4642D10E4B3;
	Mon, 30 Jun 2025 18:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqoOWmsD";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C62210E117
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:37 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UFwTvX024724
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=pgz4s8FJQk7
 kyDkHVj6kgwKaok/lpGZglyQVNF6QRKk=; b=dqoOWmsDWAp1rfH3+FNhn80Sv77
 UN/4u/+tncg4SHZlio+EyKS1EnvtTGwBIM7DS7lffQTsAciOcE5ynhq/ejFeOIN5
 Gjn1m+7kmznY96d9/UbGIOXSHUeDQFD2/T+Tjaw91nHwsMOJ66iKTU6aDGaIE4Kn
 fd2oxSpkgoEdqETwHGnWUtUbOc5jojuI34UK9MH22E7t2XfINKm5L0s2+aZG9X12
 q6iqZ7KK835q9vNQ1wUXaqJF9s6lFh4EULRhM3VsC2EIEcpqkseB3Xq3wNVLuEGD
 svitUH3ue0D61QB+dHXPrGViU++N/3tZSxoVaC7LIUWqLKLD9ZzZsASE1ig==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9dqk5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-235196dfc50so42140935ad.1
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 11:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751306975; x=1751911775;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pgz4s8FJQk7kyDkHVj6kgwKaok/lpGZglyQVNF6QRKk=;
 b=CSuPsNdKCtKf4FLVC8HKAvsv3n4j3EvsyLqfcHaYB3edeO0CsngyyVrOr2/hbE1KzG
 VeLyYzJAITY6cSP1lvEoyNH7Vq3L0zFhe2HykvifQYlrvu/U4q8KZjMd0gYhlVOQomDg
 h2DBDt2v6wRXIVZ4FM7iBsWoqXxFaMHTNmu/tolFsgpjXg/NjqPl624O2KVy9RbZn7tf
 ksAYkBfiH4elV/qXKdFkCt/nmJV5K+hGLfmGyz/mCNotpqNGz3fRtUTit/ehl+w4X3Ui
 sjU6/9mCODMG3jJrUIG7aurcTpqkEVnETAL3kvFuoh8dgjDOmyPneFulIXCdlbizusy2
 F15g==
X-Gm-Message-State: AOJu0Yy7CDU36BVFUzd+QX+eYvj7jQXjVlD6UyznJrGE6x7Gg09tUUn2
 jblSV7JK0uXWdeoCMKqxgFStDkwnFw3zXd3D6jMSkTaSNMx56rmmj4+m5wlOE0Jxb9Gp8mPDcem
 5FZ5TJibxVhMmpaOd4cKS87bJmign9M6Oz4iP0EGflH0YXsIvSXdtluTMc0jcubmL6+5VUlbnkw
 PP
X-Gm-Gg: ASbGncvQ3WPHiaEg33+jCGkFJxycr7SJMUVdJen1kuiOi7jkVbDFXF/lk0V1IksuynE
 6/4HxmzDO2JGCzAhLS5zL+r5hBoFVr361YFzo3C65p5H2uIR2w1A0F2Q3SBFr/70U91dNM9yTW4
 Dhi2NJSbwL2/Yppqpkx0/0j9oZF2JE0rD/pvtSs/c5+DVrrzrq9qxRg3DQBbbWZhvqUWKrrBGPY
 Sw1Ls2b5URXbizeAMHYemA4c6iZxmbC3OnZplx9S2uzns1oFUHKGFUBstWphgIcMowD8W92fGvU
 Cek5vAEY0AT+2L77bHNlVCpMbbu7oeUuzA==
X-Received: by 2002:a17:903:240d:b0:235:e5aa:f51a with SMTP id
 d9443c01a7336-23b3549bdfbmr7769425ad.7.1751306974635; 
 Mon, 30 Jun 2025 11:09:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/HKW7Hch1kkUtIXV6Hh9HwuHielf7LI9DqpO00Dg/BmI2Q/6TQF178R7NkczStcugG8DNwA==
X-Received: by 2002:a17:903:240d:b0:235:e5aa:f51a with SMTP id
 d9443c01a7336-23b3549bdfbmr7769095ad.7.1751306974203; 
 Mon, 30 Jun 2025 11:09:34 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3bbf9esm86891455ad.191.2025.06.30.11.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 11:09:33 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH igt 1/9] drm/recovery: Wait for devcore to become available
Date: Mon, 30 Jun 2025 11:08:55 -0700
Message-ID: <20250630180903.77990-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=6862d2e0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=wbXP5UgKaa9MPXhy6qkA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: Ew9zp2gAx0ea8Ys2ceOmCTpo88yKhZn0
X-Proofpoint-GUID: Ew9zp2gAx0ea8Ys2ceOmCTpo88yKhZn0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE0NyBTYWx0ZWRfX+eZgokd0d0mQ
 WNMZWJU7oAukmLyhfjegg+HJSIYN6nr1+79qTffc03IAy1A4D1cmmGks4YVvxf6eyd+KOonw/qs
 7EdB4HKyUg67xmOsOs5BMnbF/zYQCDOY6qD6W6M0Z3MnfBjS5hmiRV8TjgBYyG+8oPtcOPeP257
 snNx36nXwsr33rOq1ksNeimEDgB1MPj66ulw8i+ou/RE2JPH9ioPhvFRaj5kqDPrH5+AJj6ZOTx
 Q9DX2q2cgFWZZMeuxenjDe0U3ryF6OiXltFbyaq3rhHOkAc5djfTHquCtA4DwoGPUYUnW7Yavzh
 toqFQndrZuQTOGATdoVoQ43HwD+HmsQPWnLT4+D96E5kAEIizLYNAiTUSHTk+YjrVK/dUuQR/ZK
 78J25llkHTcFqGx0xbUkGOQp/bEXw5PquHVRzdICbGnkX7exkL6q0XVAyw60cNYmfwI7Qsb1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=926
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506300147
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
 tests/msm/msm_recovery.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/msm/msm_recovery.c b/tests/msm/msm_recovery.c
index fbe26e687ed3..433392079bd4 100644
--- a/tests/msm/msm_recovery.c
+++ b/tests/msm/msm_recovery.c
@@ -44,8 +44,12 @@ read_and_clear_devcore(void)
 	glob_t glob_buf = {0};
 	int ret, fd;
 
-	ret = glob("/sys/class/devcoredump/devcd*/data", GLOB_NOSORT, NULL, &glob_buf);
-	if ((ret == GLOB_NOMATCH) || !glob_buf.gl_pathc)
+	/* The devcore shows up asynchronously, so it might not be
+	 * immediately available:
+	 */
+	if (!igt_wait(glob("/sys/class/devcoredump/devcd*/data",
+			   GLOB_NOSORT, NULL, &glob_buf) != GLOB_NOMATCH,
+		      1000, 100))
 		return;
 
 	fd = open(glob_buf.gl_pathv[0], O_RDWR);
-- 
2.50.0

