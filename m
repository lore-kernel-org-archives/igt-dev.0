Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2522BC8302D
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 18:09:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C919E10E117;
	Mon, 30 Jun 2025 18:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ebIZo26g";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82DD10E117
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:35 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UG0Lhp024769
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=x9KnxqwEJc+HWHtXoNL1S2omVHVW8nAO8o+
 NVbhYku4=; b=ebIZo26gSvRaK8J9/tALzeGEpRnx8JxvJsj/LBZEOwxDfUln/P/
 8c1OQz78XaW86Z8ENTJxOvVgegSJFXBDELuWKLTIcAc43PwlM/2vPhejwWxbRO/m
 zAUNXZZwbyIvELXf+sqboNA1Jasi7ZGaZf+DJImn7957I5+C7KwIp5xsM3koj5Qs
 7LfzFj7AuGZoUTaBpnxxRZslQt4pKfRAmswxOOTWfuyMXbkDIGCcwBU8Dd17pHAR
 UzHopxKHYneQkkpLm/AAtQPYC/LxY7VJ9pkr+Zz2d+X3iFB6WmwTPAondh2DlpxL
 hJHZFiCu6H2jN4bBmNy5UzVY0Sj45qZIm0A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9dqk4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:34 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b2fa1a84568so3601777a12.1
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 11:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751306973; x=1751911773;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x9KnxqwEJc+HWHtXoNL1S2omVHVW8nAO8o+NVbhYku4=;
 b=l3GJyN9T5UAZ4oq/3219QWhajdwOz/o0LaH4yFib/Rq/8/7PNfeIvUlSsKYUEkyWTg
 WjM8o2Dp/sWWS4M/YpFKdCLjSmEM0rzCFTjXs56Lr69MbGXvMu2uXGfQArwDySmIV/kf
 2uCVDrz5frBpwF+TBrr6jWiWrEhB+R8v/r4dYFXWWyN55Ie56yJg9G0V34hr72BzxsEb
 /r7u5ZfopZDaSMI5r0IthoYYTaam2Tm85GfhdNv2wJBeudeJRXf2L3pV1gZTtpdXQXyS
 z2vzj7CmsbBc5D25WvtZw9VubSmZHs9ulhuWHG5YxLl0rIbd9f+UeoRM2sMYdXVPS4GE
 dyiA==
X-Gm-Message-State: AOJu0Yx8zLSBWr3DGCMqp8uK0616GnAqK/ki8WJocBM4KXKfSAHEAmEa
 2lyGMG/T5p4vHfd7DnRNCgXgiDQLZzRsaQ/5xcxPdQRHW/vxCIakRgE1dCXuBULQTCkBZzutmGg
 84Ssh4RMQeUTckvqxhMjZdgObyspjMDx7UmS7RyKvF3F+LdoJ+1poW801N6A3JScovHRXNqu0J7
 GB
X-Gm-Gg: ASbGncvCEIAm9KY8fbSemWUZtdQ3FDTAh4yovhWq2NoWz2k0rzf8A7uBCRNG72Ol09E
 LwCiP/gtvG32oPC1I1nJCjX+ZkWx8eohflAIBTj8Xz1Orb2nvDPo3vMAwAb8plHbIu54ic0nNgI
 Z8Y1AP9lRbmkGT+9qPjhw0mk5nKLcaiX+7W94WmqCTjN6n+JNOcgfSIUfdfnyzD/NZDvZgY8FQ9
 RogJjIGbQBM/Hgixs1vvmFg2j0aI69h1+Y5OZx30A+AnfbJsj/usATo6pUb5lxSysc9Jdwmb/Vo
 O0WI3VDFF++oB9XdL54lFnh1f+cEFAuxvg==
X-Received: by 2002:a17:903:1745:b0:236:10b1:50cb with SMTP id
 d9443c01a7336-23b35545a17mr7443605ad.26.1751306973165; 
 Mon, 30 Jun 2025 11:09:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwlNKVtSGRIyEibiPUrhr02qDBf+iQiBkAjGKzlXHyQ+Lcf8TGWgZRZg1jBJP9hH/yjBSXew==
X-Received: by 2002:a17:903:1745:b0:236:10b1:50cb with SMTP id
 d9443c01a7336-23b35545a17mr7443195ad.26.1751306972629; 
 Mon, 30 Jun 2025 11:09:32 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3c951asm90847765ad.249.2025.06.30.11.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 11:09:32 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH igt 0/9] msm: recovery and mapping updates
Date: Mon, 30 Jun 2025 11:08:54 -0700
Message-ID: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=6862d2de cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=vCXyEyYqIO_xeLtmHscA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: D399XELiuYzT0Wq4wIqFPbW8oaMEvfde
X-Proofpoint-GUID: D399XELiuYzT0Wq4wIqFPbW8oaMEvfde
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE0NyBTYWx0ZWRfX/bum1NCpRjdW
 ehmZAy6GBE7dzMBojU0rfcCnxv5hMl08Qu0LFtLaDcznBIQIX4EqH51cp3QlT+J6/nQz1MthkeE
 DRqxsACeB35hH15m418xZ/KdPZ3W8Zp9CYU8LX4KXNUcuQAWfns3CsalFsrXcsMkMFVrsdk7zms
 04NOXPdt+dOFGIUy8vHvvp2RSVbejSdRjjnyPRUAvGWI687By3vV4aH/B++2nQSpW3DQf8MkME6
 O2kjiZ5FOufTzwrOgit700CQtojjM7azclShMCI7gZdQFzUIHHR8wdJSncWXbMCz+26D/JvTSMx
 L2iHCLfPQ6EjS7kuBAfizJs7+DiI1i6nk5Rbf8XB+mTNXFwJSftNMc5CVYokQwwECj8xP4jXW3R
 X84kWbv4MyyCFwf4dvIvKHZcaqLxjXJhzhxAWvIQEmauRkO90yeVM1b1jh1/gpLUUFbw/eb7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=851
 priorityscore=1501 clxscore=1011 mlxscore=0 lowpriorityscore=0 spamscore=0
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

Mostly updates to address flakes, and updates related to newer kernels.
Plus a few additional sub-tests.

Rob Clark (9):
  drm/recovery: Wait for devcore to become available
  drm/recovery: add iova-fault-stress test
  msm/mapping: update for sparse
  msm/mapping: Handle BO names with spaces
  msm/mapping: Add additional subtests
  msm/mapping: Wait for devcore to become available
  msm/mapping: Handle larger gmem file size
  msm/mapping: Add wait for stall-on-fault to re-arm
  msm/mapping: Free devcore

 tests/msm/msm_mapping.c  | 90 +++++++++++++++++++++++++++++++++++-----
 tests/msm/msm_recovery.c | 39 ++++++++++++-----
 2 files changed, 109 insertions(+), 20 deletions(-)

-- 
2.50.0

