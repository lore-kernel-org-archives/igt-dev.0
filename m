Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB37DC83029
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 18:09:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE4B10E4B4;
	Mon, 30 Jun 2025 18:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bMFGamEv";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D5810E4A8
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:39 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UEl5Od032540
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=isUN5GZLBzn
 +dp1fRJTXJzKqfql8MsFBJoHLS/tVce8=; b=bMFGamEv5MDesp9rZSoK9Wub2Ri
 00QkqrdVcdUmALd+A+i1cS3Ncpl9mJtgQquuSktpiXJZ1A4v4S+hExoK2Pyu6cYS
 jCJ8cffPByKpO8SqLfzvi1O+iOJ7bdsr9nTjHBhf57VVzIKFXOznbkYKkHV4gZ/E
 i98Qv0x3JjMo4kZOsU4hcwbr8SmBWIPuIawps+e3VO1RCgcZ+Eau5ESSBCq0gD46
 fxLZz58TcfX3m+fHaj6EbJTsWtGQcQVqG+wpGs5hsrQYyGyy9Vd0cS07hlb6zNMy
 nlv7R5O3KRWq0IW9FDzRn20R6Xou1rszEJvLfEI1fkqAgduGYUFeNSGnkjA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k5wyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b31f112c90aso3739712a12.0
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 11:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751306978; x=1751911778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=isUN5GZLBzn+dp1fRJTXJzKqfql8MsFBJoHLS/tVce8=;
 b=HXofqj2M95eU/j3d43Z5cimJpvUMP8I6eD8u/3x853iMJOQ9ap/spTGAV+hbDkkLU4
 /Epp+9eqXc8Lb9vxDi/B63qcnEBmOB95fLyHNrp9CACq7pUMnAi06eVOhDd7mgyCMhQr
 zAcJPVuivr3OwCNjj6RPRZVRIiEAJ1uGArOCdS4A36xJuBPkIwTuLjumAgSanxP6Vza9
 Y1aaOKnEQQjDm1Kq5nFHoqw+mFF/DN/EF9NR31XibZcNl0MOCHVFUKyceFGp+aR9kdmF
 OJj0qjFAJTOYEUkt6L6GQczK0WEfOUoxs5oev3zEbaYPPXYb5MxXWzVx/jNGfME26Kgc
 5/Rw==
X-Gm-Message-State: AOJu0Yx68NXzKUADGoas8tmPGLpITuX3hrC8EsiqY/Ws8Wzl+WTixGu7
 OB948t7u5yDamyrDviPekwfqQXu8q1rmh2d7w5QjWIwLnVJPuuX+W9cWaf8b+z9YeV2Sfxh43eu
 RO/LKtOF73l2D/c3q14XHfuR8jrzZYabRbztGEVZPRucPddTxxjpT1kr41/1I69scENXLTUQp4q
 Ky
X-Gm-Gg: ASbGncu0xbvwhKCezxiDWHLIYeRrGk4oFgayFDkoZv5cMRMyBzS0z1acu1XnJZ+YVpl
 EEahWSknmr9iuIaKfPOD2S5G8QZ7W1RLrnT7ZXcakFTFr4BhZ6PjGxymVuiCyza+34HRZxxNHKS
 k/Pf4ypMXEABAxzkVx+gknzAkvMAj7cqj211vslqe9E8gBngt/4jvUH+0f9oKnsT0gPC1SfvrkD
 kY7Xr4WbrEfT3P6ibbhavvfjOFplyabRF124zNlimuybsPja64UJtAYRrpzbs0ejLjlJZsyICel
 Nzjt/maxANXrr+ewx9pIK0hIoyahdkDzcg==
X-Received: by 2002:a05:6a21:6da6:b0:1f3:20be:c18a with SMTP id
 adf61e73a8af0-222c99b9436mr744554637.10.1751306978182; 
 Mon, 30 Jun 2025 11:09:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPRgqubDncr8uyKq1wIxnVAjzcUH26P2qJtukqllyYHhkKLyMS99NCl8+0uSyNFrV1ry74rg==
X-Received: by 2002:a05:6a21:6da6:b0:1f3:20be:c18a with SMTP id
 adf61e73a8af0-222c99b9436mr744511637.10.1751306977635; 
 Mon, 30 Jun 2025 11:09:37 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af541e5c1sm9763251b3a.70.2025.06.30.11.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 11:09:37 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH igt 4/9] msm/mapping: Handle BO names with spaces
Date: Mon, 30 Jun 2025 11:08:58 -0700
Message-ID: <20250630180903.77990-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=6862d2e3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=LsNcMMtZqy-lO6dUSW4A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE0NyBTYWx0ZWRfX9O+htR6hd62N
 1rMF7yLxHLD6qNg7dfxWhuBnqkXeG/r6WMc6zS+JIbEOpCm2rjQgyIMrt+bUkpvvHKbOrcZx1QT
 El6csFNkgEVB3umvG4Te6gGoAeogKqmIlHzRsvmrY6tkLFRcNhSaJCXJB6S2tFIAuiFbNV8sZcY
 +scszFz/Ui8UMHEUreduJOLLvDhBg4UE/hGFHqifbR8eZSNB9yUouMqDmQ6BLLi+nFAlM6/nHrK
 VglQrvPm2ZF/CuD1w+kkOKvuy5wA7GHr6rG4u1tyzvAfnq2X6nzcdhv0IjjgTJ7b4MfN0Xchz3q
 HQ3b6CO+naB20um4i/Ji2NPmpBrn4YjOX/xmr3ZEqqYQp2GvblYQTbvWD8CozB9X9uhbBFwmsvx
 BlxTg0EjJXsSVqqS5sK2So89dgbNFg7R/VPUh0lx5pbdOlBnKW8uuIwTZIlmP2tv6DrKUCb5
X-Proofpoint-ORIG-GUID: Cm3wFnlUVj8vNTfYCEGJbbo6H8yKq2nx
X-Proofpoint-GUID: Cm3wFnlUVj8vNTfYCEGJbbo6H8yKq2nx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=791 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1011 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
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

Instead of trimming at the first space, scan from the end of the string
until we reach the first non-space char.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_mapping.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index f536db82aba2..5afbcd081fc7 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -101,13 +101,14 @@ endswith(const char *str, const char *end)
 
 	/* Trim trailing whitespace: */
 	if (p) {
-		char *c = p;
-		while (c) {
+		char *c = p + strlen(p) - 1;
+		while (c > p ) {
 			if (isspace(*c)) {
 				*c = '\0';
+			} else {
 				break;
 			}
-			c++;
+			c--;
 		}
 	}
 
-- 
2.50.0

