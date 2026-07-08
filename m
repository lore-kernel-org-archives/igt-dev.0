Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3598FC43458
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jul 2026 16:13:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D541D10F193;
	Wed,  8 Jul 2026 16:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kkj1aPCZ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DzYuQfQi";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361C010F1C6
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jul 2026 16:12:34 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 668C39Cg2605301
 for <igt-dev@lists.freedesktop.org>; Wed, 8 Jul 2026 16:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=H+jdjbqbC/3
 QB1jJM1Y8Kku/Fjlf4I53sMsIIiLwjXo=; b=Kkj1aPCZrFn9LEE1771IBWNaWkf
 69RS3USFY0LHD/m0LtcWt+b+1OHtRwSQrGc4PPi7eMyjiDbdJK34eq8fGlYP0htS
 bg7RgjYN69eBLGfonZqbuEkqX6AbTMhY0fFu0Hu7qTokLKwT20MhfU0wtW9Xc/af
 s4MrEnzU1bk44iqRTznV2KHgDkhPJ+syIhbz52KcIItLh3r+Vf7DTZmEvBEGi7RX
 mAcxs/m5SoTJZSs4ovB5nVu5Wx/4cOQ9XhStR1Ju1CvAW0pMU/YPF5XkBYKPgskG
 FGQeTja6i9vfYWo70xWqsgDsAo+Ejgx416qYBBhfaAjZNdUMyAs7E6VlTHQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be5bp5a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Wed, 08 Jul 2026 16:12:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2ccb687f82eso15761715ad.3
 for <igt-dev@lists.freedesktop.org>; Wed, 08 Jul 2026 09:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783527153; x=1784131953;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=H+jdjbqbC/3QB1jJM1Y8Kku/Fjlf4I53sMsIIiLwjXo=;
 b=DzYuQfQiPlsc7LvfH9I9yOOBSbvNCHbaL/liWbiLff/SH4h0UJYyrWD3/K5K4qB44I
 +Cot7g79qxEPZbMFrhdhM29gLRONBWV8sR6BQfiWYbst9y9K5BsBitCALzBOjRFd04WU
 pXkKPoSTSvzWMy2I+xxsEKhPxrAexNVEth6MBaW0ep9bW47bP84rfVh1YTVm3tuXqeNv
 z9FvdaPBqdfnj9iRMOBhptdcMtTMbOTsrwx4XqN5yd5Qw+eNFRSCrRK9MSiIms4Du22T
 WXinW3L5skDXY9LmLk3i4QghOw+DncNiBcm5/4q5xOpj+oSt5yCRrbasaMq7yzMAf3HK
 F3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783527153; x=1784131953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=H+jdjbqbC/3QB1jJM1Y8Kku/Fjlf4I53sMsIIiLwjXo=;
 b=G51MFdLKHNpEskhD0Z11p4rSFFGb5cE2kQWNO/d/PEPF1iufb8dLhsN5vBvMnMVHMA
 DfJHMwEX1J2iOPqUfI50zfUkAep5K3tw2g8AyNXm73Erlwt1IFXElmroa1P3nGGWQnd6
 UCw9VS7kEMqT7QwfL7nEXsK/KTrQ6iXgQrOHKPkn7eavjAX/qWbNSpCD3VUDhbu5JWyn
 KYEjXMmhhRa8/xKmgzfT7WHFex4rDwgeTbapVjdxWN+U+GsywnDUEqVnC4Avuu0eFTOc
 twuXkxRJUMMlyuVO7NWWYWS1U8USjj8GLzSYERLXE4y6nm1cYmUQpJSQF4RuQXURSWbh
 1+3A==
X-Gm-Message-State: AOJu0YydwcUWiC2aJNhcwdWdrDSe1bHKgucB/6FTbi7fOs9+5Q8i/n+g
 v3VhEZWeWWooPrwoI4/RnhkqeadNP5ZJXFAMmQKuUBE6vFk9sYvLWoa/jrhPmhuny+5606YKFpI
 4ASqLkGiVuwZ8/n32K8Txyb5AIHUoUNqKMOEM8u57AHVkmF/UEG05MjCtF1xFQRG933jtYs3B3t
 Mk
X-Gm-Gg: AfdE7cnSSTzleYwuNxSgHRrF0NWtzrWstrZ+phoOSqw9Kr7vapYRlW0Z9z92OtHKiX4
 Wu1xvE/jHWvD6Gk6hOEY8xkZ8Y/eLB/I7fnNFTjnWJWmv4N6D6JXcHRWzs18lJmoXYNe3WgpmjU
 JNOF6NAJnvhY+VQo2cdcLBgLKgjgkbxeQogdNhMOy9b9WbXQ0nAdsJ92TVZ6HuBZZAuwHF7gGEg
 no4ZejQxslrTPR6X8iMCqfZBKO+RtW8lyvh6gX/4RRs5OawuXIizauMMvBik6QJ7SGs2OkKQEwl
 bPyfcHD40kdZ15adlKsnPEmriD+YphqF7yM++ndt3Mrl1UkYGFXl/GzVDf0D9XrzlCJPGuHxmMf
 dLVsqXfC8tb31ro22BKJzg2tauntDLkBruYGoK48wYIwJu8iVmG2v/ad2OQ==
X-Received: by 2002:a17:903:4b4c:b0:2ca:6c8:abd8 with SMTP id
 d9443c01a7336-2ccea2f919dmr31469025ad.12.1783527152930; 
 Wed, 08 Jul 2026 09:12:32 -0700 (PDT)
X-Received: by 2002:a17:903:4b4c:b0:2ca:6c8:abd8 with SMTP id
 d9443c01a7336-2ccea2f919dmr31468805ad.12.1783527152422; 
 Wed, 08 Jul 2026 09:12:32 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9bf8c12sm30438155ad.26.2026.07.08.09.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2026 09:12:31 -0700 (PDT)
From: Rob Clark <rob.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH v2 2/2] tests/msm: Add perfcntrs test
Date: Wed,  8 Jul 2026 09:12:24 -0700
Message-ID: <20260708161224.507091-3-rob.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708161224.507091-1-rob.clark@oss.qualcomm.com>
References: <20260708161224.507091-1-rob.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4e76f1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Hi4UILjZCzWCtySGamAA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1OCBTYWx0ZWRfX3PY9tPltAE+P
 EyxKTrwFjBdyxrHMYYc1EwYhd++QVTJgSDLkMyMnGU5TQXupZ3mC9FttBI0+TvGTU0GbVI3Jqjc
 K5/6m0Qqk0OOMYN14JLsyrpsetbYNvM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1OCBTYWx0ZWRfX4Zq76YwAv2JR
 RxpXCfXqEbki3bL86I8/4wxtajhr5Q8RbpIQZ0Rqew+umkydR2mDjzCLiidnsr3VchhQibMg607
 RrxO9z6TcmtY/oPgprqEc2jz/vbu3k7VBikuynMBAAldVDKynYgBzA8HqOfOPaXVMIqY7DX00s4
 kq0c0N6hydUSoE//qv+W7qFMlH8xJPJZZOGL0hQp1onuNP0NBXWCySxxn43q0G8rMgI2pIGsmsl
 B253HN52xvuQUIJO+hHrjZ0gqEMKeJJJknG+tzayGOQxqiPe33cU9Kl70tNue0Kri43ItrqJ2Ty
 gAzptiNznrY8eBmUUq8YtmeDu0+gE5qiHV8DwgHbHbUOxlhc2HEDCYGL8z0yGtSe6lSeyHa7NpJ
 2pLe4BgA6OdQ/I3v7LpKSgSkLx/Rsd95CKp2nid9Tkk0UTQgvcrX78xbx5+wY6SAHUFROiEjNJH
 JdKmVmlzqYhL8srXMXQ==
X-Proofpoint-ORIG-GUID: 5LH4a0u0lO66w44ABYh3_pqP5iqDzny8
X-Proofpoint-GUID: 5LH4a0u0lO66w44ABYh3_pqP5iqDzny8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080158
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

Add tests for new PERFCNTR_CONFIG ioctl.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/meson.build     |   1 +
 tests/msm/msm_perfcntrs.c | 196 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 197 insertions(+)
 create mode 100644 tests/msm/msm_perfcntrs.c

diff --git a/tests/msm/meson.build b/tests/msm/meson.build
index 2ba5b4db2279..0a7f35662c03 100644
--- a/tests/msm/meson.build
+++ b/tests/msm/meson.build
@@ -1,6 +1,7 @@
 msm_progs = [
 	'msm_bo',
 	'msm_mapping',
+	'msm_perfcntrs',
 	'msm_recovery',
 	'msm_shrink',
 	'msm_submit',
diff --git a/tests/msm/msm_perfcntrs.c b/tests/msm/msm_perfcntrs.c
new file mode 100644
index 000000000000..42f77456939e
--- /dev/null
+++ b/tests/msm/msm_perfcntrs.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <errno.h>
+
+#include "igt.h"
+#include "igt_core.h"
+#include "igt_msm.h"
+#include "msm_drm.h"
+
+static int
+__configure_counters(struct msm_device *dev, bool global, unsigned nr_groups,
+		     const char **groups, unsigned count)
+{
+	uint32_t countables[count];
+	struct drm_msm_perfcntr_group group[nr_groups];
+	struct drm_msm_perfcntr_config req = {
+		.flags = global ? MSM_PERFCNTR_STREAM : 0,
+		.nr_groups = nr_groups,
+		.groups = VOID2U64(group),
+		.period = global ? NSEC_PER_SEC : 0,
+		.bufsz_shift = global ? 10 : 0,
+		.group_stride = sizeof(struct drm_msm_perfcntr_group),
+	};
+
+	memset(group, 0, sizeof(group));
+	/* selecting countable 0 for each counter is fine: */
+	memset(countables, 0, sizeof(countables));
+
+	for (unsigned i = 0; i < nr_groups; i++) {
+		strcpy(group[i].group_name, groups[i]);
+		group[i].nr_countables = count;
+		group[i].countables = global ? VOID2U64(countables) : 0;
+	}
+
+	return drmIoctl(dev->fd, DRM_IOCTL_MSM_PERFCNTR_CONFIG, &req);
+}
+
+static int
+configure_counters(struct msm_device *dev, bool global, unsigned count)
+{
+	/* CP group is present on all gens.. SP would be another good candidate */
+	const char *groups[] = {"CP"};
+	return __configure_counters(dev, global, 1, groups, count);
+}
+
+static unsigned
+get_available_counters(struct msm_device *dev, bool global)
+{
+	for (unsigned i = 0; ; i++) {
+		int ret = configure_counters(dev, global, i + 1);
+		igt_warn("%u: ret=%d\n", i, ret);
+		if (ret < 0)
+			return i;
+		if (global)
+			close(ret);
+	}
+}
+
+
+int igt_main()
+{
+	/* device instance for global counter collection: */
+	struct msm_device *dev_global = NULL;
+	/* device instances for local counter reservation: */
+	struct msm_device *dev_local_1 = NULL;
+	struct msm_device *dev_local_2 = NULL;
+	unsigned num_counters;
+
+	igt_fixture() {
+		dev_global = igt_msm_dev_open();
+		dev_local_1 = igt_msm_dev_open();
+		dev_local_2 = igt_msm_dev_open();
+
+		num_counters = get_available_counters(dev_global, true);
+		igt_info("num_counters=%u\n", num_counters);
+	}
+
+	igt_describe("Multiple process should be able to reserve the same "
+		     "counters for local counter collection");
+	igt_subtest("perfcntrs-local-coexist") {
+		igt_require(num_counters > 0);
+
+		igt_assert_eq(0, configure_counters(dev_local_1, false, num_counters));
+		igt_assert_eq(0, configure_counters(dev_local_2, false, num_counters));
+
+		/* release the reservations: */
+		configure_counters(dev_local_1, false, 0);
+		configure_counters(dev_local_2, false, 0);
+	}
+
+	igt_describe("non-conflict global and local counters");
+	igt_subtest("perfcntrs-non-conflict-global-local") {
+		int num_local = num_counters - 2;
+		int stream_fd;
+
+		igt_require(num_counters > 2);
+
+		igt_assert_eq(0, configure_counters(dev_local_1, false, num_local));
+		igt_assert_eq(0, configure_counters(dev_local_2, false, num_local));
+
+		stream_fd = configure_counters(dev_global, true, 2);
+		igt_assert_lte(0, stream_fd);
+		close(stream_fd);
+
+		/* release the reservations: */
+		configure_counters(dev_local_1, false, 0);
+		configure_counters(dev_local_2, false, 0);
+	}
+
+	igt_describe("conflict, local first");
+	igt_subtest("conflict-local-first") {
+		int num_local = num_counters - 1;
+		int stream_fd;
+
+		igt_require(num_counters > 2);
+
+		igt_assert_eq(0, configure_counters(dev_local_1, false, num_local));
+		igt_assert_eq(0, configure_counters(dev_local_2, false, num_local));
+
+		stream_fd = configure_counters(dev_global, true, 2);
+		igt_assert_lt(stream_fd, 0);
+
+		/* release the reservation for dev_local_1: */
+		configure_counters(dev_local_1, false, 0);
+
+		/* should still fail: */
+		stream_fd = configure_counters(dev_global, true, 2);
+		igt_assert_lt(stream_fd, 0);
+
+		/* release the reservation for dev_local_2: */
+		configure_counters(dev_local_2, false, 0);
+
+		/* now should succeed: */
+		stream_fd = configure_counters(dev_global, true, 2);
+		igt_assert_lte(0, stream_fd);
+		close(stream_fd);
+	}
+
+	igt_describe("conflict, global first");
+	igt_subtest("conflict-global-first") {
+		int num_local = num_counters - 1;
+		int stream_fd;
+
+		igt_require(num_counters > 2);
+
+		stream_fd = configure_counters(dev_global, true, 2);
+		igt_assert_lte(0, stream_fd);
+
+		/* Should fail because two counters already allocated for global collection: */
+		igt_assert_neq(0, configure_counters(dev_local_1, false, num_local));
+
+		/* release global counters: */
+		close(stream_fd);
+
+		/* Now reservation should succeed: */
+		igt_assert_eq(0, configure_counters(dev_local_1, false, num_local));
+
+		/* release the reservations: */
+		configure_counters(dev_local_1, false, 0);
+	}
+
+	igt_describe("multiple groups");
+	igt_subtest("multiple-groups") {
+		const char *groups[] = {"CP", "SP"};
+
+		igt_require(num_counters > 0);
+
+		igt_assert_eq(0,
+			__configure_counters(dev_local_1, false, ARRAY_SIZE(groups), groups, 1));
+
+		/* release the reservations: */
+		configure_counters(dev_local_1, false, 0);
+	}
+
+	igt_describe("duplicate groups");
+	igt_subtest("duplicate-groups") {
+		const char *groups[] = {"CP", "CP"};
+
+		igt_require(num_counters > 0);
+
+		igt_assert_neq(0,
+			__configure_counters(dev_local_1, false, ARRAY_SIZE(groups), groups, 1));
+
+		/* release the reservations: */
+		configure_counters(dev_local_1, false, 0);
+	}
+
+	igt_fixture() {
+		igt_msm_dev_close(dev_global);
+		igt_msm_dev_close(dev_local_1);
+		igt_msm_dev_close(dev_local_2);
+	}
+}
-- 
2.55.0

