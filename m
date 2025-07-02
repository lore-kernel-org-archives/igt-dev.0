Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC88C8303D
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 13:30:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C889F10EA3F;
	Fri,  4 Jul 2025 13:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YPexs63C";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B980D10E764
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 19:03:22 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562FmVrJ025086
 for <igt-dev@lists.freedesktop.org>; Wed, 2 Jul 2025 19:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=8zWjMM3vTvg
 rkjTYr2fejrs2ZdcqMCLb/nSokNAjbQc=; b=YPexs63CoxrF6YUK3sVamLlUlsi
 BfIio/Xv2nofln8QZiYvraQifMdCN/74+pK2Ym/CrtBkJGgHFQ8+Gr5KNtAdLz/S
 ihdCMsel6JYdJaqOsla1kkV20HRAEyuqRR7k16Qg4RPsgNEwB3K7HbJpVzSt5Eht
 m0nWf0bMMWyoFpUUWao3a4c9P0c3v1JFxCtwtV2zYJjUkM+W3lmH9/yZW6xTvvJi
 H8sAxRRuwkCB5I0Ralv0H1Np2c4BQnPHY1t2l0pfkykFz0Qw3ZbsHFivo1Zx0kag
 lWsBsyqKl+KTGVSTqWjJTpVjjUbeviEQRwVZlV1PoVMKFfmhBOj6/jrvNuA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8025jhy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Wed, 02 Jul 2025 19:03:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2363bb41664so1584365ad.0
 for <igt-dev@lists.freedesktop.org>; Wed, 02 Jul 2025 12:03:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751483000; x=1752087800;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8zWjMM3vTvgrkjTYr2fejrs2ZdcqMCLb/nSokNAjbQc=;
 b=t6f8NvKiqHdqiRITtE8LllKqnOz9GP9nQxeW6PSr9GBeQNF1aFLnMPVY6dU4eGCi48
 oKyIYAcIQk+kyVBgbl7FsDC/yEEBnh0ukDX3cISwhs4wnSPCz7ylAEsVqSKWiMdo75y4
 DyqE8jYRmS/aQvc/8r0Od1X4g8aqPdLbxzJaJsl49gudL7Ox3VFb7zDpjMOj5PkKUZYa
 4i5xT4o2YKf6X6lAazayUyyDI65P+tNrAUrOSOhD7ct1oGpmCbY/YJKZ4RHXioGpromP
 FTbxRwVTUBQ6UUolDBZ/45gaC/9+PWneAgiF9sqY5dwpnPm49HsCzAXaUDCm3pU/IF4I
 9QHQ==
X-Gm-Message-State: AOJu0Yxo7LQnDYLGASiUXnlrvkIP1dHty6cXZM393oSe7luZn9+pdrTy
 h1joDyvW805AFc0XGZDr+L30OaMoO3eLtsEGHNR7+2lVyZ+VOrvUmaEbK5Yh9luaT0D5T6mNbu8
 rFwtS9t41b5mMkQqhYhQWwcSUDHu2Jg+JCymDdgOXzFqii4ohVaLldmF3po65XMEmFJoPf1NNt+
 v3
X-Gm-Gg: ASbGncvFGaC1ABtCt8QS4QoZ6FKDg5tub5xmTr287ALrfGv3YhnFRoTgSA3YjE0f2My
 jIBlwtBhvOCtyHRBGaZt5YX9did/OjAWeN7bifyt/KYB62qAzgt853lh/w1wvOw2KyTUpN2xu6P
 g8Z/yVBgFRJ5C59/gi5fi07NxrJeQ0pqAxQZVTWMLF3IYbuVS+uu0lMiA/KVuXjnQcYHSJz8Zx8
 3iZiqK9klqLtiIMJcs3ED1V/EfK+dFYhoitgjQprohVA8nO294DcUhinJhuz+fEIsNKMrNbyMdO
 1pD07v3n6aFYsUIcdW759YWKe31I9nz+Vw==
X-Received: by 2002:a17:903:31c2:b0:235:e94b:62dd with SMTP id
 d9443c01a7336-23c793f0b20mr8643635ad.12.1751483000292; 
 Wed, 02 Jul 2025 12:03:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGIViSrY5Xq1XMHCu9BSAtE0RQhXUpkJt/6iEGJjkGtqZjQvrnJcfYnvJF9HqL7P+iJ9a5og==
X-Received: by 2002:a17:903:31c2:b0:235:e94b:62dd with SMTP id
 d9443c01a7336-23c793f0b20mr8643325ad.12.1751482999813; 
 Wed, 02 Jul 2025 12:03:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2f1c40sm137079185ad.67.2025.07.02.12.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 12:03:19 -0700 (PDT)
From: Rob Clark <rob.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH i-g-t v2 2/9] tests/msm/msm_recovery: Wait for devcore
Date: Wed,  2 Jul 2025 12:02:42 -0700
Message-ID: <20250702190249.376313-3-rob.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
References: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RpqO5DO_suasbjxwxFJ3ns0jme4hqP5z
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68658279 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=wbXP5UgKaa9MPXhy6qkA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: RpqO5DO_suasbjxwxFJ3ns0jme4hqP5z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE1NiBTYWx0ZWRfXzGxLNLvC43hn
 FJ8Scf2qj0yL+3jXcwoHX2ZDB0wcgFlPStmEA/esvbcWatPQpg715N6lrclOfXZeqrf8RLCOvG4
 AyqQmuJLDfnZjpm5jxEDkTYTXeDj95BnBbgi9OIqfwLflZmll3gnJ3obezsaK8RUzcd80FbHG+k
 0y91heeUxzjsmEEk7PkWnnBBjyPMRAK5AMCUQfVUp+CXzZn6V96weeLH/JhCEsLKKNE4c/OpQBh
 hcChQCVWvL8BIg3kPym61b6HolKXILwT4fdDC5gtriWvbkKB5NKfDb7By3s06xxExfavM3FHYFu
 4EIwyZcaRzKSqdUSq/97NQmt1U9kTfIGWtzoKvbubC1snQeXxqheGl14D23Dr1GWPdhZkajbScD
 cMNJobX53s3P+LeYMUXOEhYYnS3riGclhdUGsG/aLldctO+aDx88xyRcSe0VspDg/mx2Fxe3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=907 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020156
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

