Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808FDC83F09
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 13:30:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1215510EA4A;
	Fri,  4 Jul 2025 13:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IANHaHO3";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD05C10E772
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 19:03:30 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562AGXKC014509
 for <igt-dev@lists.freedesktop.org>; Wed, 2 Jul 2025 19:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=yOxKK6pk6MS
 eBSvknMaULD07OJZv3nVIhMNajSPwiNk=; b=IANHaHO3QMcsRHQzacVQv17TAN/
 1zPNgk3v/T4DTm+W0IXTO2OFRtXnnr524LRvagf1MbU6aoTwXMZsG6VbK8/1mNcf
 xsJ96Z8CBqu7dhxxKWa6s821mRgzxh2PWKZ1ZssaBhodLpAn8mOGGhgRzQURuJaU
 ENZS3W5AZ8SENzLMF24qsRAaQScDvoZU60cXLUxXMu9Qz2yK14NqUc0y0toYGU7n
 UWvQ5ugsndfsfAosi8JHv/Ee5rqnGnH0IauFlLEX4tO8FEOHINWZah8pg4bRgRY8
 7Y8lstJjW7S7r+4mvCDB9uAy0rYzZnlldpfu0UpuhC3+WG5wZ4aZQxJiiqA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxntxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Wed, 02 Jul 2025 19:03:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-235089528a0so1294145ad.1
 for <igt-dev@lists.freedesktop.org>; Wed, 02 Jul 2025 12:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751483008; x=1752087808;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yOxKK6pk6MSeBSvknMaULD07OJZv3nVIhMNajSPwiNk=;
 b=WlMCdAWP/eacQzbxJUzOt/depVEQlLdxAKnm6vfsJ2xYYkhsNYRzQlpsfAEwIG7JPT
 Sswg7kYyS2hfg8FY82eIMnQ70k9q9OjjnmWbebd8HhZrS3ip54WJ6F3zZOh7N1LaUz1E
 RxYmHWtw5/TvF8u5HmC5nM+Xd3LZ37UM9lTh27wfrkuXDVDDb0KxRJzIRaxdhHdxf7lZ
 jxvaUwLN3uWy/U4KBNnmYsfTUGM7CQAAvQTvtLWrMuUihsRlVAbtadV24REUXZiZgVjy
 sYD8W20e1DrlbcIcLhgfXqPO2JvEMl/2HkmluVwMBVO08+cYTnBUj2HVT+xXc0R592n3
 CxoA==
X-Gm-Message-State: AOJu0YyJe01mAwUVg72Cly7kg3nr12HKf5C5AHFWh7JjOVlcTw+jaFZx
 jeL7aRqMdGuSsY+PJDz4R4BQ4ZnhKh/a+9nUYJoSuWfMEAv0RuguG7P21cYYGDCjfYGsNDx5yac
 xDepFNLNz1fMW/Jh4z9L6LCnpv6RHnu2N8wFPYEIXefQrgL5MCIPVFBhPpjWJGnnAuaxbZjiOiP
 mF
X-Gm-Gg: ASbGncsFaIIGSPXEw9u7jlixVFpBdEo5PVIS5ISbL8jDXOPfH1f4KBRlT74njLGTJ9p
 3ajECd8mlnOP2GmerRAotZowMotDZhG9uWB0S1IjU/0yJwpBi6LlLh4dbZFxmMx/YYl3B4Z6bfL
 zi9ZlwJ+UTWUXntOz8c3IvgY+cvEpY8d1QKYBoPvVCqeue97O7NwAzP3HW1Vdag04B7pkbWDO9w
 35670QhH2d6RXq9vlyY+/13KLGVIQzZ7b9HKKeudSWWKd2XKI8tkSw6jy/f4JFeXlOUAcu2teMH
 1sy9yUQjGc6z2BRaqaTDXMzkV3Mq4SErzA==
X-Received: by 2002:a17:902:d683:b0:215:58be:3349 with SMTP id
 d9443c01a7336-23c793d0aafmr6362715ad.14.1751483008196; 
 Wed, 02 Jul 2025 12:03:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyaWlExVheMgjEW/YF4CVY6gNhIUwl29Jm+XSpgsBDV5XaVbkW0QCxnh5MMAB5goe4O3xGTg==
X-Received: by 2002:a17:902:d683:b0:215:58be:3349 with SMTP id
 d9443c01a7336-23c793d0aafmr6362425ad.14.1751483007694; 
 Wed, 02 Jul 2025 12:03:27 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb39bcbcsm133694125ad.134.2025.07.02.12.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 12:03:27 -0700 (PDT)
From: Rob Clark <rob.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH i-g-t v2 9/9] tests/msm/msm_mapping: Add wait for
 stall-on-fault to re-arm
Date: Wed,  2 Jul 2025 12:02:49 -0700
Message-ID: <20250702190249.376313-10-rob.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
References: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE1NiBTYWx0ZWRfX/51b5teNji7F
 M7g8xIQeqy6h3cZsfQcZhL90Wv4QVfZMuTj36phCQuLgOF6fIAYYYj3b+djbvGBiE5TU0zX0jll
 z5+yW1qxgN1Jjdn1xoZisc2EF95xeHlATPts37N8gAacDI+pZnm7g6tVmppxLu4FI98ReEExhKo
 rdKAuZ6cguv9WLw0sqZNU2UGMkFatC0KDAndrp/JgV+A3NUV+ajC5AKzkl8iCS4qifcP3+GKgg0
 CfKpdNW1qgA7M3SnxvsDZhjFthb2NlEdTYnP/3F5k/c7+Mqya3xRCSx3phVbZBZlxQ8mVUtgODB
 9iVf2HDYTZyoK8Of3Wg4eGs30O7h7ykzqRfHm7oKlczeRGT176UpAf6uBRszMcB0dH+auwo2s4W
 E/mhRAB1SXce7/4WhzKE53rAK5LuSFctbW29mN+EIhcUhJHfZuO3ehqGBx3G31BrwG/xgiFn
X-Proofpoint-GUID: hDvf9ZcVJoIfJE3y28oBWYHyHG6CzulR
X-Proofpoint-ORIG-GUID: hDvf9ZcVJoIfJE3y28oBWYHyHG6CzulR
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68658281 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=myMhhWgJnj-yCtkpNQ4A:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

Newer msm driver disable stall-on-fault for a grace period, to avoid
a flood of faults causing instability with memory translations that
the hw attempts with the translation stalled.  Fortunately it adds a
debugfs file so we can know how long we need to wait for stall-on-
fault to be re-enabled.

See: https://lore.kernel.org/all/20250520-msm-gpu-fault-fixes-next-v7-0-96cd1cc9ae05@gmail.com/

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_mapping.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index f820467a3ad2..d224a413cbf2 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -74,6 +74,30 @@ get_and_clear_devcore(int timeout_ms)
 	return buf;
 }
 
+static void
+wait_for_stall_on_fault(int drm_fd)
+{
+	char buf[64] = "\0";
+
+	do {
+		int us;
+
+		igt_debugfs_read(drm_fd, "stall_reenable_time_us", buf);
+		if (!strlen(buf)) {
+			/* Not supported on older kernels: */
+			return;
+		}
+
+		us = atoi(buf);
+		if (!us) {
+			/* Done waiting: */
+			return;
+		}
+
+		usleep(us);
+	} while (true);
+}
+
 /*
  * Helper to find named buffer address
  */
@@ -227,6 +251,11 @@ do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
 	igt_fail_on(addr != fault_addr);
 
 	free(devcore);
+
+	/* Wait for stall-on-fault to re-enable, otherwise the next sub-test
+	 * would not generate a devcore:
+	 */
+	wait_for_stall_on_fault(pipe->dev->fd);
 }
 
 /*
-- 
2.50.0

