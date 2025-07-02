Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD95C8303D
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 13:30:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF24410EA49;
	Fri,  4 Jul 2025 13:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mmn+83ce";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F29910E772
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 19:03:29 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562IGXIA020529
 for <igt-dev@lists.freedesktop.org>; Wed, 2 Jul 2025 19:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=gTqMT534P4X
 LkzlEGLj1riKtd1dD0FbfymLHKahsx4g=; b=Mmn+83ceqTbVFqEwTD0V/BaBTTq
 s81lu99n0SZHcwcaBsDUtbcp2w0qn+ZEl7VD664wq/56W2+NdSXqbMOae0LTN1hM
 gx9Fmdg0rkgWQq8VJqPd4KyotGVTHYpNkPVSq075O31pyNbayGPWpLYJQRf+qa2A
 PGudAOIaEIuQJ2+N0eYx8FtLgbGQmU7OuDjvCA61DlSSszUlvWmKMbhbDNLBFJQ1
 yskB0lgtesNHTuTjD82IhOyTmUtxISMgVkUpW6yvhvkEgdS/PHP6cqIOFdPkL5G+
 GfRRJHKCsAqOSIo1N2+DHjlV2WYBjm6rmEJqIas/AAXpRfOBpNPZ5feHZyg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn4dwx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Wed, 02 Jul 2025 19:03:28 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b3216490a11so5669832a12.3
 for <igt-dev@lists.freedesktop.org>; Wed, 02 Jul 2025 12:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751483007; x=1752087807;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gTqMT534P4XLkzlEGLj1riKtd1dD0FbfymLHKahsx4g=;
 b=Y+S5mjGB/OF1JvH96N32kF1mcv6MvwyPcTDGb52+g1sHRALByNxCHzLvdfLxi6KXbm
 yvNh84VpFlAgTkYg4q/h32N+DsZINcl+ndf4/lq1pLJ1lxhaAI/LPaIaV3+3hipwqYEW
 AY6bW50Bgo5JSImXIctJ3+jpxH5C1ly65NAe7IAHukhovMffH+z8i/Swskrbi64Z1qS8
 xk3u0AI/f1yYfI72yYipV8I04+hDyFawa6B3GOotDEkHOAaLiOrp+VDzLGh844M80nMd
 8Va4vEl9bHKp9xu5+in2ARZb+oegversLVoCC3TlnQM060+zqbUzZOEQJKtNjf5tBXDF
 gjGg==
X-Gm-Message-State: AOJu0YwEDCMhb68zav9LwyDBADgnkZPX/fKJ/wYFYrP5ac1jinY7k9eA
 jMRT/tIwOvJvC78hmQQh/dfmmZEGiz0tR7A6WzdB1TpZ0W+DK9U4uBBwZqZQJdtlYgxwd2m835o
 gVroNLz1GIR6qmE0Lrm3BsWyUAS43ljUx4FLy+QMSLHRmtcZvknYpEs8/GS2wqqo3ccTiQyNMVQ
 92
X-Gm-Gg: ASbGncutf3IPRcIqBaBuOQtwn2B8BrgS01ope0lZnTnw2KCjmOnQy68n1D3JZwoft9m
 r/VUQPEuWWeUrd4CCr4NNKXqkofYVgsoL/5E5MWkFdkGdiuVdtLsm/c/9LXEzRLAahDogVBc9zo
 mrJU3lX2j1WxlKXpJtdxHNDkC5MYevya1J0/rVu7280ccQVI+tfHrp2AESW3dAHQe+Rb2gcBl76
 sbkHtL6xyPWytvoLAmIJ2cADK8AXfDKTZ/zgAa5ezcKcSSxmhXK0C6pfS4ZGdo8U4bTRhJJxQny
 r4lEjW0QdlBHAy9Exys9//QtwSdBX3qygA==
X-Received: by 2002:a17:902:db0b:b0:235:ecf2:397 with SMTP id
 d9443c01a7336-23c7968e67emr6108335ad.33.1751483006991; 
 Wed, 02 Jul 2025 12:03:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZXw7dIGLnZLdiveYZjoitXLYn4iAxi0Q8ZfmVwKqfDca6Kssu/5Q0Bf1FkAb8/AOU+yXiQA==
X-Received: by 2002:a17:902:db0b:b0:235:ecf2:397 with SMTP id
 d9443c01a7336-23c7968e67emr6108075ad.33.1751483006598; 
 Wed, 02 Jul 2025 12:03:26 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2e325bsm137064555ad.29.2025.07.02.12.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 12:03:26 -0700 (PDT)
From: Rob Clark <rob.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH i-g-t v2 8/9] tests/msm/msm_mapping: Handle larger gmem file
 size
Date: Wed,  2 Jul 2025 12:02:48 -0700
Message-ID: <20250702190249.376313-9-rob.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
References: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE1NiBTYWx0ZWRfXykysl5YVtXzy
 3CBpPgtcwpAPyOxIn6u5EdTBVOv+qGoh1oCaDtON7lEvHuiDeStXTuTE0WWsa0YPO3LQ1PoI4zH
 ogwROkq7Lb6xKd4jTEIBr3RM83UwH7fs7dI3C+1VrqVTc9Mmh7zGI5+JddvvX6UEtmYq7y5XJL6
 hdL7PsVAW16i6a9KT3DcuKbmkUhVUZqFuPFAMcLC8Wd2YPKnAjMixDU4k6q/xsaVtxsgyIB2HE1
 bGFhzOW0cAEVO+1iHbdbqGD0rDVtgx+0aHTL9u18PER0zP92jVg4kP/9c/o3TXaPyUcfEHfialE
 9RLtATnX+mvfND4b/jc1IAjEFdUdtrGZ2i8B2Ld7NiBAvMxLdQCQOlGSXyVbRgQhoaou6+uD6pd
 uAPnCPvBjbOG+vH0/UvsJfnGC6NMgvDltK6UE+wQZs08sLhLezzU8Da4q7mhhAzKuW1coTPc
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=68658280 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=vubaehVBMwJoC4cWCuwA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: GgwtH7tsl7d5rRRSslFZBUNZhJsAT5dE
X-Proofpoint-GUID: GgwtH7tsl7d5rRRSslFZBUNZhJsAT5dE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=891 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020156
X-Mailman-Approved-At: Fri, 04 Jul 2025 13:30:47 +0000
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

If running on a system with full desktop environment, the file will be
much larger than 0x4000 bytes.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_mapping.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index 1e166570787d..f820467a3ad2 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -123,7 +123,7 @@ endswith(const char *str, const char *end)
 static uint64_t
 get_bo_addr(int drm_fd, const char *name)
 {
-	char buf[0x4000];
+	char buf[0x80000];
 	char *p = buf;
 
 	igt_debugfs_read(drm_fd, "gem", buf);
-- 
2.50.0

