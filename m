Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2EAC4451C
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 14:25:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679EC10F5A4;
	Fri, 17 Jul 2026 14:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="sU8Ky4Yc";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801E710E472
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 14:22:14 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66HE3dBQ3645753
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 15:22:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=3
 iEua2Vv0bwM68B4Kv6yruGBs7ZG5X8AKb6RZthjjHM=; b=sU8Ky4Yc0RTnRia4g
 mxoQQll9KO3fpvM6gjhww50A9HwoPjtzvgXomuPaEj/QCPkDQ6rnvmayD1jpzrlK
 AFZAwiEYCwysOhLGFMoSkSH5M+MJHrGpe6spSOYm/VpB7vbGgfu0H+iBxoI9eKmL
 zUwZgLAJpYhcsKteOwI7rXyPf279S0Eg2/3I5uH/JQI6uMZAWHXXCC0uRgCG7+xK
 HBFt9WJ/0wQTk8ahptmOwn3APLhm1eJ+sHEL/miuoMtvlbD4p8B7YXj5Jp8NQtvw
 sBtyVPVf4IFqRJzyJoK0KVCod9WKOaeKRlvd038a8N20yELPp+183xQkhEAoibfk
 RWcIg==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fbdwsnsyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 15:22:12 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 17 Jul
 2026 15:22:11 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Fri, 17 Jul 2026 16:21:38 +0200
Subject: [PATCH i-g-t v3 06/10] tests/imagination: Add DEV_QUERY static
 data area tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260717-test-imagination-add-support-v3-6-ce69f9ad330c@imgtec.com>
References: <20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com>
In-Reply-To: <20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784298125; l=3613;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=tGofQSlsQIyraQnaYo+rqrdIarBfZjVFMTwxDz/6gu4=;
 b=wjAeGm5VoaTUUxVA1z20hkDoMWA/K4qBAmV1gdhIXu+E/Daa24Zywn78LNaiy9ekxNgGOmrJF
 U5RSL3ISYx0CgYvAPg1gGQUZ9052Vr3YXUMRNpa2ZINTc22MRPBvyQc
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE0NSBTYWx0ZWRfXzSkTwDKwEPNv
 y4+z0Y38bJiw2BNhRnfYiNj2qJMQmHgckyN4RBOJkT7i/1ADZjDKM4OzlXeXun+y2ACO/PHHoTJ
 jhevGc3xNHsNbTtcJlSm2B6mQ4IQSYBpzBiEmogI7KyvsQFRl3ndXEnzOUdb9MvQmtwTlpUNw7u
 jM+eWtZ3++GyvSlCcf7nJehWuGdIk3Y1IV890ZFwRCytkb2cG5seCRNqynfuckxH4x54SA5KKWL
 jQ7bSmTa72F3RczWvwz6+HAEXD/U2bfyNkaKzj28kSNjYeKvnQ04DRZhURyAVGdGqChqvU9qSfJ
 t9WoFOKdhL9CSWhs9NVu4c2zfVbKjDcyLUS0e72lHqrDDPjpOI5pddLCq/KqynAonIMARsf3dyG
 1E2ylkOAQN32FxI/G2SgD3pHmIgMd6sI1br7sBvAk37pILpZHtR8mQP1lXqKWYQF15220iFpok4
 K77Ay08fKOLIQ8DhX6g==
X-Proofpoint-ORIG-GUID: azimICyslHmlc0yXUZ_IjFzstiP7LifQ
X-Proofpoint-GUID: azimICyslHmlc0yXUZ_IjFzstiP7LifQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE0NSBTYWx0ZWRfXwPiuAhydjYOU
 04ts2QBFJ9EE7FM49fkwqSSCkt9xpyFVaRfSUtlOgDwpDscqOhE4hgDOCL5z8zq0kZHwSun0Wq8
 k6CEEHxAefaWCuxyPKDGpCTJVNe96Kg=
X-Authority-Analysis: v=2.4 cv=QbVWeMbv c=1 sm=1 tr=0 ts=6a5a3a94 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=NDabtZqKMSvLAD6k1PcA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
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

From: Donald Robson <donald.robson@imgtec.com>

Add subtest validating static data areas returned by DEV_QUERY.

Signed-off-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
---
 lib/igt_pvr.c                     | 29 +++++++++++++++++++++++++++++
 lib/igt_pvr.h                     |  2 ++
 tests/imagination/pvr_heap_info.c | 39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+)

diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
index a26b4edad..70fc71388 100644
--- a/lib/igt_pvr.c
+++ b/lib/igt_pvr.c
@@ -135,3 +135,32 @@ igt_pvr_get_heap_info(int fd, uint32_t *array_len_out)
 	return heaps;
 }
 
+/**
+ * igt_pvr_get_static_data_areas:
+ * @fd: The file descriptor of the DRM device.
+ * @array_len_out: Pointer to store the number of static data areas.
+ *
+ * Function to get information about the device static data areas.
+ *
+ * Returns: An array of drm_pvr_static_data_area structures. The caller is responsible
+ * for freeing the array.
+ */
+struct drm_pvr_static_data_area *
+igt_pvr_get_static_data_areas(int fd, uint32_t *array_len_out)
+{
+	struct drm_pvr_static_data_area *sdas =
+		calloc(DRM_PVR_STATIC_DATA_AREA_YUV_CSC + 1, sizeof(*sdas));
+	struct drm_pvr_dev_query_static_data_areas sdas_get = {
+		.static_data_areas =
+			DRM_PVR_OBJ_ARRAY(DRM_PVR_STATIC_DATA_AREA_YUV_CSC + 1,
+					  sdas),
+	};
+
+	igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET,
+				sizeof(sdas_get), &sdas_get, 0);
+
+	if (array_len_out)
+		*array_len_out = sdas_get.static_data_areas.count;
+
+	return sdas;
+}
diff --git a/lib/igt_pvr.h b/lib/igt_pvr.h
index ca09f39e1..19909480b 100644
--- a/lib/igt_pvr.h
+++ b/lib/igt_pvr.h
@@ -18,5 +18,7 @@ igt_pvr_ioctl_dev_query(int fd, enum drm_pvr_dev_query type, uint64_t size,
 			void *pointer, int expect_err);
 struct drm_pvr_heap *
 igt_pvr_get_heap_info(int fd, uint32_t *array_len_out);
+struct drm_pvr_static_data_area *
+igt_pvr_get_static_data_areas(int fd, uint32_t *array_len_out);
 
 #endif /* IGT_PVR_H */
diff --git a/tests/imagination/pvr_heap_info.c b/tests/imagination/pvr_heap_info.c
index 7d953044e..fa8591a97 100644
--- a/tests/imagination/pvr_heap_info.c
+++ b/tests/imagination/pvr_heap_info.c
@@ -123,6 +123,45 @@ int igt_main()
 		free(heaps);
 	}
 
+	igt_describe("Test validity of static data areas");
+	igt_subtest("heap-info-static-data-areas-valid")
+	{
+		uint32_t heaps_count = 0;
+		struct drm_pvr_heap *heaps =
+			igt_pvr_get_heap_info(fd, &heaps_count);
+
+		uint32_t sda_count = 0;
+		struct drm_pvr_static_data_area *static_data_areas =
+			igt_pvr_get_static_data_areas(fd, &sda_count);
+
+		igt_assert(heaps);
+		igt_assert(static_data_areas);
+
+		for (uint32_t i = 0; i < sda_count; i++) {
+			const uint64_t start_offset = static_data_areas[i].offset;
+			const uint64_t end_offset =
+				start_offset + static_data_areas[i].size;
+			const struct drm_pvr_heap *const heap =
+				&heaps[static_data_areas[i].location_heap_id];
+
+			igt_assert_lte(static_data_areas[i].area_usage,
+				       DRM_PVR_STATIC_DATA_AREA_YUV_CSC);
+			igt_assert_lt(static_data_areas[i].location_heap_id,
+				      DRM_PVR_HEAP_COUNT);
+
+			if (!static_data_areas[i].size)
+				/* Not present for device. */
+				continue;
+
+			/* Ensure reported range is inside the heap. */
+			igt_assert_lte_u64(start_offset, heap->size);
+			igt_assert_lte_u64(end_offset, heap->size);
+		}
+
+		free(heaps);
+		free(static_data_areas);
+	}
+
 	igt_fixture()
 	{
 		drm_close_driver(fd);

-- 
2.43.0

