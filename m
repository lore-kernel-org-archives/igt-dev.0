Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9D9C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:44:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216A710E35D;
	Fri,  3 Jul 2026 14:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZGnkBKz5";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fn5ZFmKX";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EEE210E60D
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:40:01 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 663BIahi3054057
 for <igt-dev@lists.freedesktop.org>; Fri, 3 Jul 2026 14:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=DKSGxTSMr5M
 eTtmsERKxkEVsxriYve3ObGxWurWbITA=; b=ZGnkBKz5odkJgPlHMjeAtmfHyVD
 OLasCpSPhjUnsuHic34OQD0UU17N7J5F3j+h75ELt1uVFCCbkgwNfDeRnoEfDv3G
 F+tPKITSmOyPHWbEPWWk3GgVK2lHGjaFoK+yS5pgMlL7ZJwcCKLhX6LZi3l/vkpM
 AM912VTiy0JuQAOqlqmw08Orh0KL5hu2uhvJO+/i0zeyMEfKofy3BojcMlCkFkGe
 BLgq0zhqSuBs7Lonm1ytpZrzDPALA+XFkmaObcI92nuZHIlCDDGxgPxctelTm6nE
 coyGaq0JjiDRtdRWLI71otvyzB8ADmidnFIRMQ6E/nHsZ4TOEg1yvJHTb4A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j01uuf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 03 Jul 2026 14:40:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2c354050c34so8102215ad.3
 for <igt-dev@lists.freedesktop.org>; Fri, 03 Jul 2026 07:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783089600; x=1783694400;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DKSGxTSMr5MeTtmsERKxkEVsxriYve3ObGxWurWbITA=;
 b=Fn5ZFmKXSGmPfAspK5OgPHwWCfLMy5lCuLL78OtIuWyEQYBhvI4z97A1wjIDtOHVZD
 ug1zfh73ISyloe86sJj28F2qSnm+gcg+d4nBlPw6yVG5zcm79Bi3t+SCUovqxi+sF76i
 ZyWwzavV/BmJM+V5RmXanpyCdymEPnMgJG3xePpYCnJ4i1PN/R38A4jhKPsMP3eLLNtA
 3PAZ22bxtrXdGN5huxRHU3ZszLClMpAp8K/bFikSabp3JUIv8KMLSQ8ItnZty088gw8L
 iUdNpbOdz4m+bYYQiVQIHFrSVu2gGgCLOmpUITt2aktNKK2xqf51wybwzD8suc+mAD6m
 wGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783089600; x=1783694400;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DKSGxTSMr5MeTtmsERKxkEVsxriYve3ObGxWurWbITA=;
 b=gE80FoW5AE6Pz4Y0QOcLNU3o59ZFN4uU9YWg6SZWqh+wQIzE56feSwQSP+GaxZbx+l
 xM30nER5ap2OPSl5bmG6FgoCBE5HATmAv+FLGohEB9WXNgCkm+nS98EfjVDzJJBltije
 9FzJFHhhRC/tcIthGtKLOHMJVA8KiCHL34m6q7O0TMUx2fSj7kbizgcw3nZcjT1rlMD2
 fnbnXscKIYeM5ElB5BjljGc931+qvKtsMIgaCILGuDLDGHVyhiKE54NtJqO4RgDa+dno
 bTrQuiwf3t+l1QIYbwCbsyB9R0UdpmEuNIiEj8wVHg9nEZ97oyet+Xp3qqBaPM+T1mkF
 8i1w==
X-Gm-Message-State: AOJu0YyuPRRS4e9e4XQAyGJzphjpBj/EFSo1aNRJiGqXqOh/P2iOpNMz
 LTZ/9i6+FSek7rGBrp/yWpgz5dRHbimuC1gCyUva8nlCOEPYNYrnZTXaHpADqjz9vTk2O6U/9ZL
 GybRz210QWiTqrrdMSJwvCpnrkzt+d0EWq1JKG4URiLseqpv+/ZhV8rpJg8eC/lT3BjsnOrpl4e
 TM
X-Gm-Gg: AfdE7ckulgKLs5MD/NQ8dmEQ6LoGfgUpGUYD55vzptnGTxVvDoYT4AzpUThYtdaRYOK
 hY4YgsfjUX4IHfbr9jZdGD7vuJnY01HqSccCtBMyZjW5L0ovKE+L596kaG+YdTJazzbeo5rRUAl
 omDqdOBb3YyM3QvLCtIjuF+K0A1Izmz+ua6GLcHtLL/u3FI/M4qHaMZXOo0YzjYXCxt9yuaQVCD
 3SSDrIIACj62hizE4pxjwehXRenH3dr5RAScriJFXoeYUalVc0Dilsb6i4yrv0tzRZijAVTDC2W
 lqy9ekFA+4yC87JAg5KTdcsc20iz0B0JHyVj07kaTCpn8Uq4O0HUz94XFFq25Q9wNyZwP/OXunI
 W3p3hSz/hZgjtbrn7MAi1Sf9BzIGHoXcplaaoaA3GnGXx2tpGAiakngSqEA==
X-Received: by 2002:a17:902:e889:b0:2ca:6c8:abde with SMTP id
 d9443c01a7336-2ca7e73a009mr115472155ad.18.1783089599804; 
 Fri, 03 Jul 2026 07:39:59 -0700 (PDT)
X-Received: by 2002:a17:902:e889:b0:2ca:6c8:abde with SMTP id
 d9443c01a7336-2ca7e73a009mr115471765ad.18.1783089599180; 
 Fri, 03 Jul 2026 07:39:59 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad6f260a1sm10641455ad.11.2026.07.03.07.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 07:39:58 -0700 (PDT)
From: Rob Clark <rob.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH 2/2] tests/msm: Add perfcntrs test
Date: Fri,  3 Jul 2026 07:39:49 -0700
Message-ID: <20260703143949.280272-3-rob.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703143949.280272-1-rob.clark@oss.qualcomm.com>
References: <20260703143949.280272-1-rob.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 128yrYeIxFE6IANaJBbgHKaEJwyq14WL
X-Proofpoint-ORIG-GUID: 128yrYeIxFE6IANaJBbgHKaEJwyq14WL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE0NCBTYWx0ZWRfX/s6FwYf3k3jH
 /cKudBsQp+2zslta7bbVn9xLZuRggkOWuT6Obvs2//LYsYflDV/o89vBm2wTsr9TL0K6sHyBW6u
 4zG2PbezSXu60cuBdH/tIM2TC9jXjIQ=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a47c9c0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=3E6hofp49naa_ZeJr-cA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE0NCBTYWx0ZWRfX5l6XNMdLyBrj
 iW17K6ctHL0wC4qP4xfgENklw1ff664Hllp89fXluwezXK40AKaax7Om5VLRPjDyQffVI+1AFeI
 g576GE0rALNWruHj+lD4xKOQ5OvYel8VgDOt3NKY51rMrnuqhNfHYxhhgCH7d6fcEwB/x1BRrOx
 jsmLw9tfu9uJjWevrTYQUicrWXedqXQCJ2jlrdx4kIHFIAAavlgKdtgdDM78PM8Wb9YFi/AqLYw
 UXa8BiVWfbdA2PjE8KavO5S6J1vQld+SEckj32hOA6oyjLqVxXiWfg1e0f11mWfl/Aa2zhqek5O
 JDegF+AtFegtw70kBx+6qaBcYasKAvlT+rpmbwI9osooyDsP4nyy8pmu8+rn+HcZxW3X3MvzJ0h
 3hMxS6ubpeBRH41r+IEG9N8CJ4kXH6kD/+JRuq+bTuG/2Lg8F8HYj411rkMjGgKVsDI63bpln/I
 A16pb6HqtqSFQgO0PZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030144
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
 tests/msm/msm_perfcntrs.c | 194 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 195 insertions(+)
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
index 000000000000..7dab92b5c6bc
--- /dev/null
+++ b/tests/msm/msm_perfcntrs.c
@@ -0,0 +1,194 @@
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
+	uint32_t countables[count] = {};   /* selecting countable 0 for each counter is fine */
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
2.54.0

