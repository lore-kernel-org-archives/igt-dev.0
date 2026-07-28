Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6574AC54F4C
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 07:23:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF59C10E7CF;
	Tue, 28 Jul 2026 07:23:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="it4SmNL7";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A3010E534
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 07:19:22 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66S701D61832223; Tue, 28 Jul 2026 08:19:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=I
 F43KUsvwReVMCR9hCY+VK0/WcyJVXKt1kaZKhMli/c=; b=it4SmNL72TZeYLA3n
 pi9p6/DkESmXM6gyM81KctSmDcKDoSHZEFYNObJ1OJ9m7N2R18Va0aeP4BUgOrXZ
 p1dD/r60/yptPZNN9Bm2e/i11v4nhXMSr6kOkxM4My81PKz5VrbyqrriXVJGSvfs
 J68InOx3ezI9nbfnsx3IUJD9y9b5HKTiIyiVBvuhRAb4jvjyZJ8gK3pVrSk9RDGN
 GLnzFbvzC1MKmzBFelhQP4PtG8hzwI+D97L18zVWVxHqAh7CHUZVePd6f6vcufg9
 KJsvYB1xkktFLczLP8xHjMHzaq1uFAaEXoeRvuQUwQy0rh1FYCodeQe9fRoHS+nw
 tN6sQ==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fmn7s2f1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2026 08:19:18 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 28 Jul
 2026 08:19:17 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Tue, 28 Jul 2026 09:19:01 +0200
Subject: [PATCH i-g-t v5 06/10] tests/imagination: Add DEV_QUERY static
 data area tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260728-test-imagination-add-support-v5-6-33049f0d1937@imgtec.com>
References: <20260728-test-imagination-add-support-v5-0-33049f0d1937@imgtec.com>
In-Reply-To: <20260728-test-imagination-add-support-v5-0-33049f0d1937@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785223153; l=3674;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=wwbDkeMv/RF8QH3/1p6YYVi4Fg/SXN9/x8mdZKdJLAo=;
 b=i4bb+ASS3+LV1D1T0TOoTxhAPXWmuYt3EeTc8VWrrRGHWLxx90Xg5NuPZAC83yxDXZ2G2b0eP
 NDtM2+Tg1PbCsStixKq7+8ZDBUGvVqgJJvs/2Ga6NcVSarccmkkcWkb
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MiBTYWx0ZWRfX5tgjgc9/I3g2
 BkrH7J+7tuMdg0FmONS5BmyahuJgXgumZw+mMC61VtKzft8tKvee4wPLRUtTxIUvy/5HBitWLpK
 h9dLaXFUtFnPsxxr7kDTO7VPXN6peKk=
X-Proofpoint-GUID: zocA5YlmQfHaNU-CtF4WT9G0EhqRj5z6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MiBTYWx0ZWRfXxlc85N0Cmw7N
 g1EbrEBJ3D+AFEewxyxO5zGRFuDOLpKnrr9OAE6sTXefMRMsIBhBOX28XVB82Op033sx7Hwen7c
 RRkDODItGjKHtoi6lRjCoDTAPjntkCfLUyprNpiYVsAejy6M8rAyZPqEq/aROIEHgFE04JYjaga
 ODOXnusw0PTDHntepBK3k6IztOF8qbAuwHE2Aegu1ndSz+zIfnXGkpP8ZaOz6jRQPlFJpEtp9cm
 M41P1RXe1/l+UuP0t3eiIcb+bnm3mlHGfiOtQ3h+57JBpLgo4pvL/czR1stHB/Lr2KwJZdcfANc
 w9oz1O4bZTMZJMy+cf2t/HQJuTiP8/tfRkYggwC1gLgHucaaOo4/m2Evx6rlmUSAY15kirauMnL
 jWcuociFo+E8ddiaN0INWpE/q3xgOkakDYQX6VGepkSQUaEnGPKfKr6qJTxRYcREEflz1+O1i/7
 qWNkpTnWf2yK2X3eJtA==
X-Authority-Analysis: v=2.4 cv=Fv41OWrq c=1 sm=1 tr=0 ts=6a6857f6 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=QyXUC8HyAAAA:8 a=vFLh4D6E9G8AkuilSroA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: zocA5YlmQfHaNU-CtF4WT9G0EhqRj5z6
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
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_pvr.c                     | 29 +++++++++++++++++++++++++++++
 lib/igt_pvr.h                     |  2 ++
 tests/imagination/pvr_heap_info.c | 39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+)

diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
index 40a68d4e6..c1e68aef1 100644
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

