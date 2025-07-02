Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80717C83F0B
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 13:30:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3027210EA4D;
	Fri,  4 Jul 2025 13:30:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DGFPDAUk";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B1310E764
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 19:03:20 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562CR4YC002176
 for <igt-dev@lists.freedesktop.org>; Wed, 2 Jul 2025 19:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=0TPHHqeWwaf
 gD/wy+wdMm0T79M28epZeyV5c9zSAGPU=; b=DGFPDAUkATM87XY2Yq3x5my5uIz
 f4K+AcXgcRJ1yoSbXVqIVDS6/fsCaZdouz17qePb9/LLxRa7uBpY8FkJ6pqGEonX
 QYYtLMMpDguSAtnkovnkzzOA8HEIoz5zQV/4kt3Huo3Eewo1O2fxD/Nzb4hxcAVc
 P0v4Qd1V+FcGmacJgcaiLueNlUNQsZrPYQ+DW0HXIo2HyOzMlDTmCeP/m6qWqlQV
 qqvKhQA9Wl7t6yoYkzI8guX7ajnrX5Emc6BwhiaL8Fv/Hz94lJ8i7qvonA3jm//J
 1ZqtPFipfkjiACvatRLm/TO6C6X/LhB5v5oJAN2DmXHtXcAJwoAHTLBgX+Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcwrgy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Wed, 02 Jul 2025 19:03:20 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-74913a4f606so4093542b3a.1
 for <igt-dev@lists.freedesktop.org>; Wed, 02 Jul 2025 12:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751482999; x=1752087799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0TPHHqeWwafgD/wy+wdMm0T79M28epZeyV5c9zSAGPU=;
 b=kNy9bO4g5IlaaVlQJSOl5gF9R9fbOMXnmJqc7IXtYzJpfKyKJVEeP602Ep7S68zZVJ
 rqkBvyVqfEZHryRmmkv/7zqRIFyS+9jwtSeOQQCh92N1FwKXbG5dHbLCTI1/AR3PYqOi
 P7cRg+B0J76MQkdqUyftmWoBR7xBnDOAFxNVHCENAev4TfU2Zq+6sHKwYclkBOX0cxQH
 D9xwswgIomRMew0oNiYojUwbOhxhYdo5eKfrYq6RnlwFivsczU5I7mw6LlH0xBjnPSpn
 kwfz50qopfU4QDbWdo+ndl5dtFtDI6WefLl//XkkTMJZmDg0yFpE6pkHI7yb2F9asju7
 phTQ==
X-Gm-Message-State: AOJu0YzBU28mCREF9gvpEtqoyBpjIQp0l7eYtrirC8ZzSZvtTJ6ny3HG
 +oiiZVoa/9gHLi0JcLh9D0D5rAf8orPD0hhJF6GJQwry6Brsyv/xiL0wkefWPrZ19sXtkuHqqgr
 Usq2cdnCrLMlIOJacVXX6xjFj7DQ6u9fdsSfF8uY1xFxJyhG+J+Hi4V7syLS1tOKeSTBR3gHoGv
 gN
X-Gm-Gg: ASbGncvtvGtWQkzTcD0weQKgYzjONivCHqjgcBiYc4a6LllyoK0VGMYbFOgLFX/aUc1
 VQpfAGBB6XM3bPkHuPQIUNy0jWaaB776LsBEQ2e10roppuI9F8mxwXFtF0Jwo8OB4whUYlsWrLW
 0i3ADeko0F2wyOZsaK6IICAyv4A3AwhPT9qjYD2FrTM4sUhn22MQieV9bqcrJmU7G4rxwqFiFIv
 y4gfaUk6YQVOqpg8CR42N2ZmVqfNMIlusqG6UWUz/xLFTCOTEiNhQ/Uy4SRYFjM/Dgx8aq+bfPs
 xWYGpnSNKM0FjzyElqdMoRpwnaFejmBPHQ==
X-Received: by 2002:a05:6a21:69c:b0:1f5:63f9:9eb4 with SMTP id
 adf61e73a8af0-2240c69846dmr1191564637.35.1751482999072; 
 Wed, 02 Jul 2025 12:03:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4IHEqp34Hp57IuuMOJPLXbvbMWusNlgvmZerZp2Ng3NfEcRfq/4k3OMVpkzVtLypMw8T8EA==
X-Received: by 2002:a05:6a21:69c:b0:1f5:63f9:9eb4 with SMTP id
 adf61e73a8af0-2240c69846dmr1191531637.35.1751482998643; 
 Wed, 02 Jul 2025 12:03:18 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af56cffccsm15581393b3a.130.2025.07.02.12.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 12:03:18 -0700 (PDT)
From: Rob Clark <rob.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH i-g-t v2 1/9] tests/msm/msm_mapping: Fix memory leak
Date: Wed,  2 Jul 2025 12:02:41 -0700
Message-ID: <20250702190249.376313-2-rob.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
References: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ieG00TVp-QDByYkWz-ZRT6TleMwSUNyR
X-Proofpoint-ORIG-GUID: ieG00TVp-QDByYkWz-ZRT6TleMwSUNyR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE1NiBTYWx0ZWRfXwn2xUkK/lDI5
 SbbWKmGbkzgzsTE3N2GN1ri29KGe2D1cqymYOkPe0m9TEMY4crEZhlFjfZM/lNFNeZoJDcuIWpj
 J5BPFTzvXf5YlBXH3FQXqnVb9qmRPprFFhsu6bpeXr/yoW7Zl3oPTFTs3tsel3vhUiRIt6kXDHA
 Y9wGAZxzTZLINzk2COjypuwfWWiIGAM5brRA8MWCNGwQzz6evqN7QX4UywsntKPkzro2ARZHL1j
 I/JQCjijL11z38H1kTOSC3gSXW9mK1Skd+CR/IVzRLXSVjxm/uKI9ehsucG/myIx6pIXdJHZPJm
 5ZGUWvK40AUkEC1YxzDS6IAzvgPwXiCxn2/xThdcYX7p9apffB3LjgOAsKfZGaSBiHTPZ7j6F59
 x5DsGVZCBPC/l84EbmUtW7M348o51VuXRmOQSphNmWEN31gVyUQyFCMXSdB6aRpLvB65AH3+
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=68658278 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=YG-Ktf8kLO1V0yi116gA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020156
X-Mailman-Approved-At: Fri, 04 Jul 2025 13:30:46 +0000
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

We shouldn't leak the devcore.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_mapping.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index ac20ca91d613..1749a670e70d 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -215,6 +215,8 @@ do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
 	ret = sscanf(s, "  - iova=%"PRIx64, &fault_addr);
 	igt_fail_on(ret != 1);
 	igt_fail_on(addr != fault_addr);
+
+	free(devcore);
 }
 
 /*
-- 
2.50.0

